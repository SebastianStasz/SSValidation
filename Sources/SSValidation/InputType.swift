//
//  InputType.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Foundation
import SSUtils

public enum InputType {
    case integer
    case double
    case text(regex: String? = nil)

    func isValueAllowed(_ value: String) -> Bool {
        switch self {
        case .integer:
            return value.asInt.notNil
        case .double:
            return value.replacingCommaWithDot.asDouble.notNil
        case .text(let regex):
            return fulfillRequirements(value, regex: regex)
        }
    }

    private func fulfillRequirements(_ text: String, regex: String?) -> Bool {
        guard let regex = regex else { return true }
        return text.range(of: regex, options: .regularExpression) != nil
    }
}
