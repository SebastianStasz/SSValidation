//
//  TextInputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 20/03/2022.
//

import Combine
import Foundation
import SSUtils

public class TextInputVM: InputVM<String> {

    public init(with settings: InputSettings) {
        super.init(settings: settings)

        CombineLatest($validationState, $allowedText)
            .map {
                let text = $0.1.trim
                return $0.0.isValid ? (text.isEmpty ? nil : text) : nil
            }
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

    public func setText(to text: String?) {
        setText(text)
    }

    override func isValueAllowed(_ value: String) -> Bool {
        value.isEmpty || fulfillRequirements(value)
    }
}
