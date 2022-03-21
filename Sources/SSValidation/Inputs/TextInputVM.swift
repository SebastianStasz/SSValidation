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

        Publishers.CombineLatest($validationState, $textInput)
            .map { $0.0.isValid ? $0.1.trim : nil }
            .assign(to: &$resultValue)
    }

    convenience public init(
        dropFirst: Bool = true,
        allowedTextRegex: String? = nil,
        validator: Validator<String> = .notEmpty()
    ) {
        self.init(with: .init(dropFirst: dropFirst, allowedTextRegex: allowedTextRegex, validator: validator))
    }

    override func isValueAllowed(_ value: String) -> Bool {
        value.isEmpty || fulfillRequirements(value)
    }
}
