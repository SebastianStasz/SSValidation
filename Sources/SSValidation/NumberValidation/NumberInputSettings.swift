//
//  NumberInputSettings.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation
import UIKit

struct NumberInputSettings: InputSettings {
    typealias Result = Double

    let dropFirst: Bool
    let canBeEmpty: Bool
    let minValue: Double?
    let maxValue: Double?
    let keyboardType: UIKeyboardType

    var shouldDropFirst: Int {
        dropFirst ? 1 : 0
    }

    init() {
        dropFirst = true
        canBeEmpty = false
        minValue = nil
        maxValue = nil
        keyboardType = .decimalPad
    }

    init(dropFirst: Bool = true,
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
