//
//  Validator+Int.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 20/03/2022.
//

import Foundation

public extension Validator where Source == Int {

    static func notLessThan(_ value: Int, errorMessage: @escaping (String) -> String = ValidationMessage.tooSmall) -> Validator {
        Validator { $0 < value ? .invalid(msg: errorMessage(value.asString)) : .valid }
    }

    static func notGreaterThan(_ value: Int, errorMessage: @escaping (String) -> String = ValidationMessage.tooBig) -> Validator {
        Validator { $0 > value ? .invalid(msg: errorMessage(value.asString)) : .valid }
    }

    static func valueBetween(
        _ range: ClosedRange<Int>,
        tooSmallMessage: @escaping (String) -> String = ValidationMessage.tooSmall,
        tooBigMessage: @escaping (String) -> String = ValidationMessage.tooBig
    ) -> Validator {
        notLessThan(range.lowerBound, errorMessage: tooSmallMessage)
            .and(.notGreaterThan(range.upperBound, errorMessage: tooBigMessage))
    }
}
