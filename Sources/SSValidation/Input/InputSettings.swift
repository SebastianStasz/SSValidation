//
//  InputSettings.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import UIKit

public protocol InputSettings {
    associatedtype Result: Equatable

    var keyboardType: UIKeyboardType { get }

    init(dropFirst: Bool,
         canBeEmpty: Bool,
         minValue: Double?,
         maxValue: Double?,
         keyboardType: UIKeyboardType
    )

    init()
}
