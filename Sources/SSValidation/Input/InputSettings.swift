//
//  InputSettings.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import UIKit

public protocol InputSettings: Equatable {
    associatedtype Result: Equatable

    var initText: String { get set }
    var dropFirst: Bool { get set }
    var canBeEmpty: Bool { get set }
    var keyboardType: UIKeyboardType { get set }

    init()
}

extension InputSettings {
    var shouldDropFirst: Int {
        dropFirst ? 1 : 0
    }
}
