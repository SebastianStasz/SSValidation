//
//  NumberInputVM.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation
import SSUtils

final class NumberInputVM: InputVM {
    typealias Settings = NumberInputSettings

    @Published var text = ""
    @Published private(set) var message: String?
    var input = Input<Settings>()

    init() {
        let newText = $text
            .removeDuplicates()
            .map { $0.replacingOccurrences(of: ",", with: ".") }
            .scan("") { old, new in
                (new.isEmpty || new.asDouble.notNil) ? new : old
            }
            .delayValidation()

        newText.assign(to: &$text)

        newText
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
