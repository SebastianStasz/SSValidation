//
//  NumberInputSettings.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import UIKit

public struct NumberInputSettings: InputSettings {
    public typealias Result = Double

    public let initText: String
    public let dropFirst: Bool
    public let canBeEmpty: Bool
    public let minValue: Double?
    public let maxValue: Double?
    public let keyboardType: UIKeyboardType

    public init(initText: String = "",
                dropFirst: Bool = true,
                canBeEmpty: Bool = false,
                minValue: Double? = nil,
                maxValue: Double? = nil,
                keyboardType: UIKeyboardType = .decimalPad) {
        self.initText = initText
        self.dropFirst = dropFirst
        self.canBeEmpty = canBeEmpty
        self.minValue = minValue
        self.maxValue = maxValue
        self.keyboardType = keyboardType
    }

    public init() {
        self.init(dropFirst: true)
    }
}
