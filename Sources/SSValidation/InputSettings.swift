//
//  InputSettings.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import Foundation

public struct InputSettings {
    let initialValue: String?
    let dropFirst: Bool
    let allowedTextRegex: String?
    let validator: Validator<String>

    public init(
        initialValue: String? = nil,
        dropFirst: Bool = true,
        allowedTextRegex: String? = nil,
        validator: Validator<String> = .notEmpty()
    ) {
        self.initialValue = initialValue
        self.dropFirst = dropFirst
        self.allowedTextRegex = allowedTextRegex
        self.validator = validator
    }
}
