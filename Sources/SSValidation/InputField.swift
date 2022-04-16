//
//  InputField.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import SwiftUI

public struct InputField<T>: View {
    @ObservedObject private var viewModel: InputVM<T>
    @FocusState private var isFocued: Bool

    private let title: String
    private let prompt: Text?

    public init(_ title: String, viewModel: InputVM<T>, prompt: String? = nil) {
        self.title = title
        self.viewModel = viewModel

        if let prompt = prompt {
            self.prompt = Text(prompt)
        } else {
            self.prompt = nil
        }
    }

    public var body: some View {
        TextField(title, text: $viewModel.textInput, prompt: prompt)
            .keyboardType(viewModel.keyboardType)
            .focused($isFocued)
            .onChange(of: viewModel.textInput, perform: viewModel.textChanged(to:))
            .onChange(of: isFocued, perform: focusChanged)
    }

    private func focusChanged(_ isFocued: Bool) {
        if !isFocued {
            viewModel.textInput = viewModel.textInput.trim
        }
    }
}

// MARK: - Preview

struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        InputField("Text", viewModel: DoubleInputVM())
    }
}
