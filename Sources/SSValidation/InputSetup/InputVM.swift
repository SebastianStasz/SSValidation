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
    public var textValidator: Validator<String>
    public var resultValidator: Validator<T>

    @Published public private(set) var validationState: ValidationState = .valid
    @Published public private(set) var validationMessage: String?
    @Published public internal(set) var resultValue: T?
    @Published var textInput = ""

    public init(
        textValidator: Validator<String> = .notEmpty(),
        resultValidator: Validator<T> = .alwaysValid()
    ) {
        self.textValidator = textValidator
        self.resultValidator = resultValidator
        bind()
    }

    private func bind() {
        $textInput
            .dropFirst(1)
            .compactMap { [weak self] allowedText in
                self?.textValidator.performValidation(on: allowedText)
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
