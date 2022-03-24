//
//  Validator+String.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 20/03/2022.
//

import Foundation
import SSUtils

public extension Validator where Source == String {

    static func notEmpty(_ errorMessage: @autoclosure @escaping () -> String = ValidationMessage.empty) -> Validator {
        Validator { $0.isEmpty ? .invalid(msg: errorMessage()) : .valid }
    }

    static func isEqual(to comparedText: String, caseSensitive: Bool = false, errorMessage: @autoclosure @escaping () -> String) -> Validator {
        Validator { $0.isEqualLocalizedCompare(to: comparedText, caseSensitive: caseSensitive) ? .invalid(msg: errorMessage()) : .valid }
    }

    static func isNotEqual(to comparedTexts: [String], caseSensitive: Bool = false, errorMessage: @autoclosure @escaping () -> String) -> Validator {
        Validator { comparedTexts.containsLocalizedCompare(to: $0, caseSensitive: caseSensitive) ? .invalid(msg: errorMessage()) : .valid }
    }

    static func matches(regex: String, errorMessage: @autoclosure @escaping () -> String = ValidationMessage.invalid) -> Validator {
        Validator { !$0.matches(regex) ? .invalid(msg: errorMessage()) : .valid }
    }

    static func minLength(_ minLength: Int, errorMessage: @escaping (Int) -> String = ValidationMessage.tooShort) -> Validator {
        Validator { $0.count < minLength ? .invalid(msg: errorMessage(minLength)) : .valid }
    }

    static func maxLength(_ maxLength: Int, errorMessage: @escaping (Int) -> String = ValidationMessage.tooLong) -> Validator {
        Validator { $0.count > maxLength ? .invalid(msg: errorMessage(maxLength)) : .valid }
    }

    static func lengthBetween(
        _ range: ClosedRange<Int>,
        tooShortMessage: @escaping (Int) -> String = ValidationMessage.tooShort,
        tooLongMessage: @escaping (Int) -> String = ValidationMessage.tooLong
    ) -> Validator {
        minLength(range.lowerBound, errorMessage: tooShortMessage)
            .and(maxLength(range.upperBound, errorMessage: tooLongMessage))
    }
}
