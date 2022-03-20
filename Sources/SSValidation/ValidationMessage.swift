//
//  ValidationMessage.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation

public struct ValidationMessage {

//        case let .tooSmall(minValue):
//            return "Value must be at least \(minValue.asString)."
//        case let .tooBig(maxValue):
//            return "Value can not be bigger than \(maxValue.asString)."
//        }
//    }

    public static let empty = "Field can not be empty."
    public static let invalid = "Text is invalid."

    public static func tooShort(_ minLength: Int) -> String {
        "Text must have at least \(minLength.asString) characters."
    }

    public static func tooLong(_ maxLength: Int) -> String {
        "Text can have maximum \(maxLength.asString) characters."
    }
}
