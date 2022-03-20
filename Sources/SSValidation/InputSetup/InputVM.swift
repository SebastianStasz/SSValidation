//
//  InputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Combine
import Foundation
import SSUtils

public class InputVM<T>: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    public var validator: Validator<String>

    @Published public private(set) var validationState: ValidationState = .valid
    @Published public private(set) var validationMessage: String?
    @Published public internal(set)var resultValue: T?
    @Published var textInput = ""

    public init(validator: Validator<String> = .notEmpty()) {
        self.validator = validator

        $textInput
            .dropFirst(1)
            .compactMap { [weak self] allowedText in
                self?.validator.performValidation(on: allowedText)
            }
            .assign(to: &$validationState)

        $validationState
            .map { $0.validationMessage }
            .assign(to: &$validationMessage)
    }

    public func result() -> Driver<T?> {
        $resultValue.asDriver
    }

    func isValueAllowed(_ value: String) -> Bool {
        true
    }
}
