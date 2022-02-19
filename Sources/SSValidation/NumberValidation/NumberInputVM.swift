//
//  NumberInputVM.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Combine
import Foundation
import SSUtils

public final class NumberInputVM: InputVM {
    public typealias Settings = NumberInputSettings
    public let onReceiveText = PassthroughSubject<String, Never>()

    @Published public var textField = ""
    @Published public private(set) var message: String?
    public var input = Input<Settings>()

    public init() {
        let newText = onReceiveText
            .removeDuplicates()
            .scan("") { old, new in
                let newText = new.replacingCommaWithDot
                return (new.isEmpty || newText.asDouble.notNil) ? new : old
            }

        newText.assign(to: &$textField)

        newText
            .dropFirst(settings.shouldDropFirst)
            .map { [weak self] text in
                self?.validate(text)
            }
            .assign(to: &$message)
    }

    private func validate(_ text: String) -> String? {
        input.value = nil
        if !settings.canBeEmpty && text.isEmpty {
            return ValidationMessage.empty.message
        }
        guard let value = text.asDouble else {
            return ValidationMessage.invalid.message
        }
        if let minValue = settings.minValue, value < minValue {
            return ValidationMessage.tooSmall(minValue).message
        } else if let maxValue = settings.maxValue, value > maxValue {
            return ValidationMessage.tooBig(maxValue).message
        }
        input.value = value
        return nil
    }
}
