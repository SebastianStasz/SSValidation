//
//  Validator+String.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 20/03/2022.
//

import Foundation

public extension Validator where Source == String {

    static func notEmpty(_ message: @autoclosure @escaping () -> String = ValidationMessage.empty) -> Validator {
        Validator { $0.isEmpty ? .invalid(msg: message()) : .valid }
    }

    static func isEqual(to comparedText: String, errorMessage: @autoclosure @escaping () -> String) -> Validator {
        Validator { $0 != comparedText ? .invalid(msg: errorMessage()) : .valid }
    }

    static func matches(regex: String, errorMessage: @autoclosure @escaping () -> String = ValidationMessage.invalid) -> Validator {
        Validator { !NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: $0) ? .invalid(msg: errorMessage()) : .valid }
    }

    static func minLength(_ minLength: Int, tooShortMessage: @escaping (Int) -> String = ValidationMessage.tooShort) -> Validator {
        Validator { $0.count < minLength ? .invalid(msg: tooShortMessage(minLength)) : .valid }
    }

    static func maxLength(_ maxLength: Int, tooLongMessage: @escaping (Int) -> String = ValidationMessage.tooLong) -> Validator {
        Validator { $0.count > maxLength ? .invalid(msg: tooLongMessage(maxLength)) : .valid }
    }

    static func lengthBetween(
        _ range: ClosedRange<Int>,
        tooShortMessage: @escaping (Int) -> String = ValidationMessage.tooShort,
        tooLongMessage: @escaping (Int) -> String = ValidationMessage.tooLong
    ) -> Validator {
        minLength(range.lowerBound, tooShortMessage: tooShortMessage)
            .and(maxLength(range.upperBound, tooLongMessage: tooLongMessage))
    }
}
