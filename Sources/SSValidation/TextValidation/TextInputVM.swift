//
//  TextInputVM.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 27/12/2021.
//

import Foundation

public final class TextInputVM: InputVM {
    public typealias Settings = TextInputSettings

    @Published public var text = ""
    @Published public private(set) var message: String?
    public var input = Input<Settings>()

    public init() {
        $text
            .dropFirst(settings.shouldDropFirst)
            .removeDuplicates()
            .map(validate)
            .assign(to: &$message)
    }

    private func validate(_ text: String) -> String? {
        input.value = nil
        if !settings.canBeEmpty && text.isEmpty {
            return ValidationMessage.empty.message
        }
        guard fulfillRequirements(text) else {
            return ValidationMessage.invalid.message
        }
        input.value = text
        if let minLength = settings.minLength, text.count < minLength {
            return ValidationMessage.tooShort(minLength).message
        } else if let maxLength = settings.maxLength, text.count > maxLength {
            return ValidationMessage.tooLong(maxLength).message
        }
        return nil
    }

    private func fulfillRequirements(_ text: String) -> Bool {
        guard let regex = settings.regex else { return true }
        return text.range(of: regex, options: .regularExpression) != nil
    }
}
