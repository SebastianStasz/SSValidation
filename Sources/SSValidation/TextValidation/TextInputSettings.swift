//
//  TextInputSettings.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 27/12/2021.
//

import UIKit

public struct TextInputSettings: InputSettings {
    public typealias Result = String

    public var initText: String
    public var dropFirst: Bool
    public var canBeEmpty: Bool
    public var minLength: Int?
    public var maxLength: Int?
    public var regex: String?
    public var keyboardType: UIKeyboardType

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
