//
//  InputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Combine
import Foundation
import SSUtils

public class InputVM: ObservableObject {
    var cancellables: Set<AnyCancellable> = []

    @Published var textInput = ""
    @Published public internal(set) var validationMessage: String?

    public init() {
        $textInput.sink { text in
            print(text)
        }
        .store(in: &cancellables)
    }

    func isValueAllowed(_ value: String) -> Bool {
        true
    }
}
