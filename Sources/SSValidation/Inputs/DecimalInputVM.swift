//
//  DecimalInputVM.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 16/04/2022.
//

import Combine
import Foundation
import SSUtils
import UIKit

public class DecimalInputVM: InputVM<Decimal> {

    public init(with settings: InputSettings) {
        super.init(settings: settings)

        CombineLatest($validationState, $allowedText)
            .map { $0.0.isValid ? Decimal(string: $0.1.replacingCommaWithDot) : nil }
            .assign(to: &$resultValue)
    }

    public convenience init(
        initialValue: String? = nil,
        validator: Validator<String> = .notEmpty(),
        allowedTextRegex: String? = nil,
        dropFirstValidationMessage: Bool = true,
        validationDelay: DispatchQueue.SchedulerTimeType.Stride = .seconds(1)
    ) {
        self.init(with: .init(initialValue: initialValue, validator: validator, allowedTextRegex: allowedTextRegex, dropFirstValidationMessage: dropFirstValidationMessage, validationDelay: validationDelay))
    }

    public func setValue(to value: Decimal?) {
        setText(value?.asString)
    }

    override func isValueAllowed(_ value: String) -> Bool {
        value.isEmpty || (value.replacingCommaWithDot.asDouble.notNil && fulfillRequirements(value))
    }
}

