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

    public init(validator: Validator<String>) {
        super.init(textValidator: validator)

        Publishers.CombineLatest($validationState, $textInput)
            .map { $0.0.isValid ? $0.1 : nil }
            .assign(to: &$resultValue)
    }

    override func isValueAllowed(_ value: String) -> Bool {
        value.isEmpty || fulfillRequirements(value, regex: nil)
    }

    private func fulfillRequirements(_ text: String, regex: String?) -> Bool {
        guard let regex = regex else { return true }
        return text.range(of: regex, options: .regularExpression) != nil
    }
}
