//
//  IntInputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Foundation
import SSUtils

public class IntInputVM: InputVM<Int> {

    override func isValueAllowed(_ value: String) -> Bool {
        resultValue = value.asInt
        return value.isEmpty || resultValue.notNil
    }
}
