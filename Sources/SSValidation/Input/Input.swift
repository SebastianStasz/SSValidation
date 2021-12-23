//
//  Input.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation

struct Input<Settings: InputSettings> {
    typealias Value = Settings.Result

    var value: Value?
    var settings: Settings

    init(value: Value? = nil, settings: Settings = .init()) {
        self.value = value
        self.settings = settings
    }
}
