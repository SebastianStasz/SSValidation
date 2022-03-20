//
//  DoubleInputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Foundation
import SSUtils

public class DoubleInputVM: InputVM {
    @Published private var resultValue: Double?

    override func isValueAllowed(_ value: String) -> Bool {
        resultValue = value.replacingCommaWithDot.asDouble
        return value.isEmpty || resultValue.notNil
    }

    public func result() -> Driver<Double?> {
        $resultValue.asDriver
    }
}
