//
//  InputSettings.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import UIKit

public protocol InputSettings: Equatable {
    associatedtype Result: Equatable

    var initText: String { get }
    var dropFirst: Bool { get }
    var canBeEmpty: Bool { get }
    var keyboardType: UIKeyboardType { get }

    init()
}

extension InputSettings {
    var shouldDropFirst: Int {
        dropFirst ? 1 : 0
    }
}
