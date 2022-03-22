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

    public init(with settings: InputSettings) {
        super.init(settings: settings)

        Publishers.CombineLatest($validationState, $allowedText)
            .map { $0.0.isValid ? Int($0.1) : nil }
            .assign(to: &$resultValue)
    }

    public convenience init(
        initialValue: String? = nil,
        dropFirstValidationMessage: Bool = true,
        allowedTextRegex: String? = nil,
        validator: Validator<String> = .notEmpty()
    ) {
        self.init(with: .init(initialValue: initialValue, dropFirstValidationMessage: dropFirstValidationMessage, allowedTextRegex: allowedTextRegex, validator: validator))
    }

    override func isValueAllowed(_ value: String) -> Bool {
        value.isEmpty || (value.asInt.notNil && fulfillRequirements(value))
    }
}
