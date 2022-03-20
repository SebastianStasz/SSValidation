//
//  DoubleInputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Foundation
import SSUtils

public class DoubleInputVM: InputVM {
    @Published public private(set) var result: Double?

    override func isValueAllowed(_ value: String) -> Bool {
        result = value.replacingCommaWithDot.asDouble
        return value.isEmpty || result.notNil
    }
}
