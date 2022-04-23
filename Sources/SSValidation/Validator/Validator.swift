//
//  Validator.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 20/03/2022.
//

import Foundation

public struct Validator<Source> {
    private let validator: (Source) -> ValidationState

    public init(_ validator: @escaping (Source) -> ValidationState) {
        self.validator = validator
    }
}

extension Validator {
    public func performValidation(on object: Source) -> ValidationState {
        return validator(object)
    }

    public static var alwaysValid: Validator {
        Validator { _ in .valid }
    }
}
