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
    private let isSecure: Bool
    private let keyboardType: UIKeyboardType

    public init(
        _ title: String,
        viewModel: InputVM<T>,
        prompt: String? = nil,
        isSecure: Bool = false,
        keyboardType: UIKeyboardType? = nil
    ) {
        self.title = title
        self.viewModel = viewModel
        self.isSecure = isSecure
        self.keyboardType = keyboardType ?? viewModel.defaultKeyboardType

        if let prompt = prompt {
            self.prompt = Text(prompt)
        } else {
            self.prompt = nil
        }
    }

    public var body: some View {
        Group {
            if isSecure {
                SecureField(title, text: $viewModel.textInput, prompt: prompt)
            } else {
                TextField(title, text: $viewModel.textInput, prompt: prompt)
            }
        }
        .keyboardType(keyboardType)
        .focused($isFocued)
        .onSubmit(of: .text, didSubmit)
        .onChange(of: viewModel.textInput, perform: viewModel.textChanged(to:))
        .onChange(of: isFocued, perform: focusChanged)
    }

    private func didSubmit() {
        if viewModel.validationState.isValid {
            isFocued = false
        } else {
            viewModel.textChanged(to: viewModel.textInput)
            isFocued = true
        }
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
