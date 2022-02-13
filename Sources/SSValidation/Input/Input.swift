//
//  Input.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation

public struct Input<Settings: InputSettings>: Equatable {
    public typealias Value = Settings.Result

    public internal(set) var value: Value?
    public var settings: Settings

    public init(settings: Settings = .init()) {
        self.settings = settings
    }
}
