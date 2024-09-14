//
//  InputVM.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 19/03/2022.
//

import Combine
import Foundation
import SSUtils
import UIKit

public class InputVM<T>: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let settings: InputSettings

    @Published public private(set) var validationState: ValidationState = .unknown
    @Published public private(set) var validationMessage: String?
    @Published public internal(set) var resultValue: T?
    @Published private(set) var allowedText = ""
    @Published public internal(set) var textInput: String

    init(settings: InputSettings = .init()) {
        self.settings = settings
        textInput = settings.initialValue ?? ""
        textChanged(to: textInput)

        $allowedText
            .map { settings.validator.performValidation(on: $0.trim) }
            .assign(to: &$validationState)

        let firstValidation = $validationState
            .dropFirst(settings.dropFirst)
            .debounce(for: settings.validationDelay, scheduler: DispatchQueue.main)
            .first()

        let validationState = $validationState
            .dropFirst(settings.dropFirst + 1)

        Publishers.Merge(firstValidation, validationState)
            .map { $0.validationMessage }
            .assign(to: &$validationMessage)
    }

    public func result() -> Driver<T?> where T: Equatable {
        $resultValue.removeDuplicates().asDriver()
    }

    public func assignResult<Object: CombineHelper>(to keyPath: ReferenceWritableKeyPath<Object, T?>, on object: Object) where T: Equatable {
        result().weakAssign(to: keyPath, on: object)
    }

    public var isValid: Driver<Bool> {
        $validationState.map { $0.isValid }.asDriver()
    }

    public func setText(_ text: String?) {
        textInput = text ?? ""
    }

    func textChanged(to newText: String) {
        let resultText = newText.trim
        if isValueAllowed(resultText) {
            allowedText = resultText
            textInput = newText.trimLeadingSpaces
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
