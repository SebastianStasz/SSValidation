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
    private let settings: InputSettings

    @Published public private(set) var validationState: ValidationState = .valid
    @Published public private(set) var validationMessage: String?
    @Published public internal(set) var resultValue: T?
    @Published private(set) var allowedText = ""
    @Published var textInput: String

    init(settings: InputSettings = .init()) {
        self.settings = settings
        textInput = settings.initialValue ?? ""
        textChanged(to: textInput)

        $allowedText
            .map { settings.validator.performValidation(on: $0.trim) }
            .assign(to: &$validationState)

        $validationState
            .dropFirst(settings.dropFirst)
            .removeDuplicates()
            .map { $0.validationMessage }
            .assign(to: &$validationMessage)
    }

    public func result() -> Driver<T?> {
        $resultValue.asDriver
    }

    func textChanged(to newText: String) {
        if isValueAllowed(newText) {
            allowedText = newText
        } else {
            textInput = allowedText
        }
    }

    func fulfillRequirements(_ text: String) -> Bool {
        guard let regex = settings.allowedTextRegex else { return true }
        return text.matches(regex)
    }

    func isValueAllowed(_ value: String) -> Bool {
        true
    }
}

#if DEBUG
extension InputVM {
    func setAllowedText(to text: String) {
        allowedText = text
    }
}
#endif
