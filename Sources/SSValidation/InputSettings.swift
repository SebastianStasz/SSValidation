//
//  InputSettings.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 21/03/2022.
//

import Foundation

public struct InputSettings {
    let initialValue: String?
    let validator: Validator<String>
    let allowedTextRegex: String?
    let dropFirstValidationMessage: Bool
    let validationDelay: DispatchQueue.SchedulerTimeType.Stride

    public init(
        initialValue: String? = nil,
        validator: Validator<String> = .notEmpty(),
        allowedTextRegex: String? = nil,
        dropFirstValidationMessage: Bool = true,
        validationDelay: DispatchQueue.SchedulerTimeType.Stride = .seconds(1)
    ) {
        self.initialValue = initialValue
        self.validator = validator
        self.allowedTextRegex = allowedTextRegex
        self.dropFirstValidationMessage = dropFirstValidationMessage
        self.validationDelay = validationDelay
    }
}

extension InputSettings {
    var dropFirst: Int {
        dropFirstValidationMessage ? 1 : 0
    }
}
