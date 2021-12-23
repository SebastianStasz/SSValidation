//
//  NumberInputSettings.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation
import UIKit

public struct NumberInputSettings: InputSettings {
    public typealias Result = Double

    public let dropFirst: Bool
    public let canBeEmpty: Bool
    public let minValue: Double?
    public let maxValue: Double?
    public let keyboardType: UIKeyboardType

    var shouldDropFirst: Int {
        dropFirst ? 1 : 0
    }

    public init() {
        dropFirst = true
        canBeEmpty = false
        minValue = nil
        maxValue = nil
        keyboardType = .decimalPad
    }

    public init(dropFirst: Bool = true,
                canBeEmpty: Bool = false,
                minValue: Double? = nil,
                maxValue: Double? = nil,
                keyboardType: UIKeyboardType = .decimalPad
    ) {
        self.dropFirst = dropFirst
        self.canBeEmpty = canBeEmpty
        self.minValue = minValue
        self.maxValue = maxValue
        self.keyboardType = keyboardType
    }
}
