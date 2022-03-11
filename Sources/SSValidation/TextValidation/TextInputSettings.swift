//
//  TextInputSettings.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 27/12/2021.
//

import UIKit

public struct TextInputSettings: InputSettings {
    public typealias Result = String

    public var dropFirst: Bool
    public var canBeEmpty: Bool
    public var minLength: Int?
    public var maxLength: Int?
    public var regex: String?
    public var blocked: BlockedText
    public var keyboardType: UIKeyboardType

    public init(dropFirst: Bool = true,
                canBeEmpty: Bool = false,
                minLength: Int? = nil,
                maxLength: Int? = nil,
                regex: String? = nil,
                blocked: BlockedText = .none,
                keyboardType: UIKeyboardType = .default) {
        self.dropFirst = dropFirst
        self.canBeEmpty = canBeEmpty
        self.minLength = minLength
        self.maxLength = maxLength
        self.regex = regex
        self.blocked = blocked
        self.keyboardType = keyboardType
    }

    public init() {
        self.init(keyboardType: .default)
    }
}

public struct BlockedText: Equatable {
    public var values: [String] = []
    public let message: String

    public init(values: [String] = [], message: String) {
        self.values = values
        self.message = message
    }

    public static let none = BlockedText(message: "")
}
