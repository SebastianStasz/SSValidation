//
//  ValidationMessage.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation

public enum ValidationMessage {
    case empty
    case invalid
    case tooSmall(Double)
    case tooBig(Double)
    case tooShort(Int)
    case tooLong(Int)

    public var message: String {
        switch self {
        case .empty:
            return "Value can not be empty."
        case .invalid:
            return "Value is invalid."
        case let .tooSmall(minValue):
            return "Value must be at least \(minValue.asString)."
        case let .tooBig(maxValue):
            return "Value can not be bigger than \(maxValue.asString)."
        case let .tooShort(minLength):
            return "Text must have at least \(minLength) characters."
        case let .tooLong(maxLength):
            return "Text can have maximum \(maxLength) characters."
        }
    }
}
