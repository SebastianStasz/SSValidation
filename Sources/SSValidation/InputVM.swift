//
//  InputVM.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Combine
import Foundation

public class InputVM: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let type: InputType

    @Published var textInput = ""
    @Published public private(set) var validationMessage: String?

    public init(type: InputType) {
        self.type = type

        $textInput.sink { text in
            print(text)
        }
        .store(in: &cancellables)
    }

    func isValueAllowed(_ value: String) -> Bool {
        value.isEmpty ? true : type.isValueAllowed(value)
    }
}
