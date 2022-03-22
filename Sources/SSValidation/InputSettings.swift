//
//  InputSettings.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import Foundation

public struct InputSettings {
    let initialValue: String?
    let dropFirstValidationMessage: Bool
    let allowedTextRegex: String?
    let validator: Validator<String>

    public init(
        initialValue: String? = nil,
        dropFirstValidationMessage: Bool = true,
        allowedTextRegex: String? = nil,
        validator: Validator<String> = .notEmpty()
    ) {
        self.initialValue = initialValue
        self.dropFirstValidationMessage = dropFirstValidationMessage
        self.allowedTextRegex = allowedTextRegex
        self.validator = validator
    }
}

extension InputSettings {
    var dropFirst: Int {
        dropFirstValidationMessage ? 1 : 0
    }
}
