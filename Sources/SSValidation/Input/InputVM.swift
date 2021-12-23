//
//  InputVM.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation

protocol InputVM: ObservableObject {
    associatedtype Settings: InputSettings
    typealias InputField = Input<Settings>

    var text: String { get set }
    var message: String? { get }
    var input: InputField { get set }

    init()
}

extension InputVM {
    var settings: Settings {
        get { input.settings }
        set { input.settings = newValue }
    }

    var value: Settings.Result? {
        input.value
    }
}
