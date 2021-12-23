//
//  Input.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation

public struct Input<Settings: InputSettings> {
    typealias Value = Settings.Result

    public var value: Value?
    public var settings: Settings

    public init(value: Value? = nil, settings: Settings = .init()) {
        self.value = value
        self.settings = settings
    }
}
