//
//  Validator+Combination.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 20/03/2022.
//

import Foundation

public extension Validator {

    func and(_ otherValidation: Validator<Source>) -> Validator<Source> {
        Validator { value in
            let firstResult = self.performValidation(on: value)
            if firstResult.isNotValid { return firstResult }
            return otherValidation.performValidation(on: value)
        }
    }

    func and<OtherType>(
        _ otherValidation: Validator<OtherType>,
        byMapping mapper: @escaping (Source) -> OtherType?,
        errorMessage: @autoclosure @escaping () -> String
    ) -> Validator {
        and(Validator { source in
            guard let target = mapper(source) else { return .invalid(msg: errorMessage()) }
            return otherValidation.performValidation(on: target)
        })
    }
}
