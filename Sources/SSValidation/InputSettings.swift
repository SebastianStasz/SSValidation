//
//  InputSettings.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import Foundation

public struct InputSettings {
    let initialText: String?
    let dropFirst: Bool
    let allowedTextRegex: String?
    let validator: Validator<String>

    public init(
        initialText: String? = nil,
        dropFirst: Bool = true,
        allowedTextRegex: String? = nil,
        validator: Validator<String> = .notEmpty()
    ) {
        self.initialText = initialText
        self.dropFirst = dropFirst
        self.allowedTextRegex = allowedTextRegex
        self.validator = validator
    }
}
