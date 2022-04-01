//
//  InputSettings.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import Foundation
import UIKit

public struct InputSettings {
    let initialValue: String?
    let dropFirstValidationMessage: Bool
    let allowedTextRegex: String?
    let validator: Validator<String>
    let keyboardType: UIKeyboardType?

    public init(
        initialValue: String? = nil,
        dropFirstValidationMessage: Bool = true,
        allowedTextRegex: String? = nil,
        validator: Validator<String> = .notEmpty(),
        keyboardType: UIKeyboardType? = nil
    ) {
        self.initialValue = initialValue
        self.dropFirstValidationMessage = dropFirstValidationMessage
        self.allowedTextRegex = allowedTextRegex
        self.validator = validator
        self.keyboardType = keyboardType
    }
}

extension InputSettings {
    var dropFirst: Int {
        dropFirstValidationMessage ? 1 : 0
    }
}
