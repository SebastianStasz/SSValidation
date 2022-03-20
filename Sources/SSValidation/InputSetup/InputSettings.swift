//
//  InputSettings.swift
//
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Foundation

public class InputSettings {
    public var dropFirst: Bool
    public var canBeEmpty: Bool

    public init(
        dropFirst: Bool = true,
        canBeEmpty: Bool = false
    ) {
        self.dropFirst = dropFirst
        self.canBeEmpty = canBeEmpty
    }

    var shouldDropFirst: Int {
        dropFirst ? 1 : 0
    }
}
