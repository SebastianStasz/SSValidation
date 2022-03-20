//
//  Validator+String.swift
//  
//
//  Created by sebastianstaszczyk on 20/03/2022.
//

import Foundation

public extension Validator where Source == String {

    static func notEmpty(_ message: @autoclosure @escaping () -> String = ValidationMessage.empty.message) -> Validator {
        Validator { $0.isEmpty ? .invalid(msg: message()) : .valid }
    }
}
