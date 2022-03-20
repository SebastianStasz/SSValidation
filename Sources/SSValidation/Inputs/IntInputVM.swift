//
//  IntInputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Foundation
import SSUtils

public class IntInputVM: InputVM {
    @Published public private(set) var result: Int?

    override func isValueAllowed(_ value: String) -> Bool {
        result = value.asInt
        return value.isEmpty || result.notNil
    }
}
