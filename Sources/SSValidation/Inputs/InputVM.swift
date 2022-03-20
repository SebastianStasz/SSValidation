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

    let dropFirst: Bool
    let allowedTextRegex: String?
    let validator: Validator<String>

    @Published public private(set) var validationState: ValidationState = .valid
    @Published public private(set) var validationMessage: String?
    @Published public internal(set) var resultValue: T?
    @Published var textInput = ""

    public init(
        dropFirst: Bool = true,
        allowedTextRegex: String? = nil,
        validator: Validator<String> = .notEmpty()
    ) {
        self.dropFirst = dropFirst
        self.allowedTextRegex = allowedTextRegex
        self.validator = validator

        $textInput
            .dropFirst(dropFirst ? 1 : 0)
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

    func fulfillRequirements(_ text: String) -> Bool {
        guard let regex = allowedTextRegex else { return true }
        return text.matches(regex)
    }

    func isValueAllowed(_ value: String) -> Bool {
        true
    }
}
