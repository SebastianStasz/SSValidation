//
//  InputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Combine
import Foundation
import SSUtils

public class InputVM: ObservableObject {
    var cancellables: Set<AnyCancellable> = []

    @Published private var validationMessage: ValidationMessage?
    @Published var textInput = ""

    @Published public private(set) var message: String?
    public var settings: InputSettings

    public init(settings: InputSettings = .init()) {
        self.settings = settings

        $textInput
            .dropFirst(settings.shouldDropFirst)
            .sink { [weak self] allowedText in
                self?.validationMessage = self?.validateValue(allowedText)
            }
            .store(in: &cancellables)

        $validationMessage
            .map { $0?.message }
            .assign(to: &$message)
    }

    func isValueAllowed(_ value: String) -> Bool {
        true
    }

    private func validateValue(_ value: String) -> ValidationMessage? {
        if !settings.canBeEmpty && value.isEmpty {
            return .empty
        }
        return nil
    }
}
