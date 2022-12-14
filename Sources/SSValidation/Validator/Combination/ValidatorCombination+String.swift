//
//  ValidatorCombination+String.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 20/03/2022.
//

import Foundation

public extension Validator where Source == String {

    func andInt(_ otherValidation: Validator<Int>) -> Validator {
        and(otherValidation, byMapping: { Int($0) }, errorMessage: ValidationMessage.invalid)
    }

    func andDouble(_ otherValidation: Validator<Double>) -> Validator {
        and(otherValidation, byMapping: { Double($0.replacingCommaWithDot) }, errorMessage: ValidationMessage.invalid)
    }
}
