//
//  Validator+Common.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 22/04/2022.
//

import Foundation

public extension Validator where Source == String {

    static func email(errorMessage: @autoclosure @escaping () -> String) -> Validator {
        .notEmpty().and(.matches(regex: Regex.email, errorMessage: errorMessage()))
    }
}
