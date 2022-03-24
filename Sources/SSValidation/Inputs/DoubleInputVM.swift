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

    public init(with settings: InputSettings) {
        super.init(settings: settings)

        CombineLatest($validationState, $allowedText)
            .map { $0.0.isValid ? Double($0.1.replacingCommaWithDot) : nil }
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

    public func setValue(to value: Double?) {
        setText(value?.asString)
    }

    override func isValueAllowed(_ value: String) -> Bool {
        value.isEmpty || (value.replacingCommaWithDot.asDouble.notNil && fulfillRequirements(value))
    }
}
