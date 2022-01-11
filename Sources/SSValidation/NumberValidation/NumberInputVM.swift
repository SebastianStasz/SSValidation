//
//  NumberInputVM.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation
import SSUtils

public final class NumberInputVM: InputVM {
    public typealias Settings = NumberInputSettings

    @Published public var text = ""
    @Published public private(set) var message: String?
    public var input = Input<Settings>()

    public init() {
        let newText = $text
            .removeDuplicates()
            .scan("") { old, new in
                (new.isEmpty || new.replacingOccurrences(of: ",", with: ".").asDouble.notNil) ? new : old
            }
            .delayValidation()

        newText.assign(to: &$text)

        newText
            .map { $0.replacingOccurrences(of: ",", with: ".") }
            .map(validate)
            .dropFirst(settings.shouldDropFirst)
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
        input.value = value
        if let minValue = settings.minValue, value < minValue {
            return ValidationMessage.tooSmall(minValue).message
        } else if let maxValue = settings.maxValue, value > maxValue {
            return ValidationMessage.tooBig(maxValue).message
        }
        return nil
    }
}
