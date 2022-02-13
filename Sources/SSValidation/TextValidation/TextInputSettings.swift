//
//  TextInputSettings.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 27/12/2021.
//

import UIKit

public struct TextInputSettings: InputSettings {
    public typealias Result = String

    public let initText: String
    public let dropFirst: Bool
    public let canBeEmpty: Bool
    public let minLength: Int?
    public let maxLength: Int?
    public let regex: String?
    public let keyboardType: UIKeyboardType

    public init(initText: String = "",
                dropFirst: Bool = true,
                canBeEmpty: Bool = false,
                minLength: Int? = nil,
                maxLength: Int? = nil,
                regex: String? = nil,
                keyboardType: UIKeyboardType = .default) {
        self.initText = initText
        self.dropFirst = dropFirst
        self.canBeEmpty = canBeEmpty
        self.minLength = minLength
        self.maxLength = maxLength
        self.regex = regex
        self.keyboardType = keyboardType
    }

    public init() {
        self.init(keyboardType: .default)
    }
}
