//
//  ValidationState.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 20/03/2022.
//

import Foundation

public enum ValidationState: Equatable {
    case unknown
    case valid
    case invalid(msg: String)
}

public extension ValidationState {
    var isValid: Bool {
        switch self {
        case .unknown:
            return false
        case .valid:
            return true
        case .invalid:
            return false
        }
    }

    var isNotValid: Bool {
        !isValid
    }

    var validationMessage: String? {
        guard case let .invalid(msg) = self else { return nil }
        return msg
    }
}
