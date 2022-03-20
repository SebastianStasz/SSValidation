//
//  IntInputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Combine
import Foundation
import SSUtils

public class IntInputVM: InputVM<Int> {

    public override init(
        dropFirst: Bool = true,
        allowedTextRegex: String? = nil,
        validator: Validator<String> = .notEmpty()
    ) {
        super.init(dropFirst: dropFirst, allowedTextRegex: allowedTextRegex, validator: validator)

        Publishers.CombineLatest($validationState, $textInput)
            .map { $0.0.isValid ? Int($0.1) : nil }
            .assign(to: &$resultValue)
    }

    override func isValueAllowed(_ value: String) -> Bool {
        value.isEmpty || (value.asInt.notNil && fulfillRequirements(value))
    }
}
