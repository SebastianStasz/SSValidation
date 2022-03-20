//
//  DoubleInputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Combine
import Foundation
import SSUtils

public class DoubleInputVM: InputVM<Double> {

    public override init(
        textValidator: Validator<String> = .notEmpty(),
        resultValidator: Validator<Double> = .alwaysValid()
    ) {
        super.init(textValidator: textValidator, resultValidator: resultValidator)

        Publishers.CombineLatest($validationState, $textInput)
            .map { $0.0.isValid ? Double($0.1) : nil }
            .assign(to: &$resultValue)
    }

    override func isValueAllowed(_ value: String) -> Bool {
        value.isEmpty || value.replacingCommaWithDot.asDouble.notNil
    }
}
