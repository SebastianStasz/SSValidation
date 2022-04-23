//
//  IntInputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Combine
import Foundation
import SSUtils
import UIKit

public class IntInputVM: InputVM<Int> {

    public init(with settings: InputSettings) {
        super.init(settings: settings)

        CombineLatest($validationState, $allowedText)
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

    public func setValue(to value: Int?) {
        setText(value?.asString)
    }

    override func isValueAllowed(_ value: String) -> Bool {
        value.isEmpty || (value.asInt.notNil && fulfillRequirements(value))
    }

    override var defaultKeyboardType: UIKeyboardType {
        .numberPad
    }
}
