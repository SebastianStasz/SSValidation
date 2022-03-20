//
//  TextInputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 20/03/2022.
//

import Foundation
import SSUtils

public class TextInputVM: InputVM<String> {

    override func isValueAllowed(_ value: String) -> Bool {
        resultValue = fulfillRequirements(value, regex: nil) ? value : nil
        return value.isEmpty || resultValue.notNil
    }

    private func fulfillRequirements(_ text: String, regex: String?) -> Bool {
        guard let regex = regex else { return true }
        return text.range(of: regex, options: .regularExpression) != nil
    }
}
