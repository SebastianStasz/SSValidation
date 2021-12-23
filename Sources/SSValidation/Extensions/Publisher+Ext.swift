//
//  Publisher+Ext.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Combine
import Foundation

extension Publisher {
    func delayValidation() -> AnyPublisher<Self.Output, Self.Failure> {
        self.delay(for: .microseconds(100), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
