//
//  Validator+Double.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 20/03/2022.
//

import Foundation

public extension Validator where Source == Double {

    static func notLessThan(_ value: Double, errorMessage: @escaping (String) -> String = ValidationMessage.tooSmall) -> Validator {
        Validator { $0 < value ? .invalid(msg: errorMessage(value.asString)) : .valid }
    }

    static func notGreaterThan(_ value: Double, errorMessage: @escaping (String) -> String = ValidationMessage.tooBig) -> Validator {
        Validator { $0 > value ? .invalid(msg: errorMessage(value.asString)) : .valid }
    }

    static func valueBetween(
        _ range: ClosedRange<Double>,
        tooSmallMessage: @escaping (String) -> String = ValidationMessage.tooSmall,
        tooBigMessage: @escaping (String) -> String = ValidationMessage.tooBig
    ) -> Validator {
        notLessThan(range.lowerBound, errorMessage: tooSmallMessage)
            .and(.notGreaterThan(range.upperBound, errorMessage: tooBigMessage))
    }
}
