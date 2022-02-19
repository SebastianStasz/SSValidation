//
//  NumberInputSettings.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import UIKit

public struct NumberInputSettings: InputSettings {
    public typealias InputVM = NumberInputVM
    public typealias Result = Double

    public var dropFirst: Bool
    public var canBeEmpty: Bool
    public var minValue: Double?
    public var maxValue: Double?
    public var keyboardType: UIKeyboardType

    public init(dropFirst: Bool = true,
                canBeEmpty: Bool = false,
                minValue: Double? = nil,
                maxValue: Double? = nil,
                keyboardType: UIKeyboardType = .decimalPad) {
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
