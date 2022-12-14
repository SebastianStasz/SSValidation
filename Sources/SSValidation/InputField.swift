//
//  InputField.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 19/03/2022.
//

import SwiftUI

public struct InputField<T>: View {
    @ObservedObject private var viewModel: InputVM<T>
    @FocusState private var isFocued: Bool

    private let title: String
    private let prompt: Text?
    private let mapValue: ((T) -> String)?
    private let isMultiline: Bool
    private let isSecure: Bool
    private let keyboardType: UIKeyboardType

    public init(
        _ title: String,
        viewModel: InputVM<T>,
        prompt: Text,
        mapValue: ((T) -> String)? = nil,
        isMultiline: Bool = false,
        isSecure: Bool = false,
        keyboardType: UIKeyboardType? = nil
    ) {
        self.title = title
        self.viewModel = viewModel
        self.prompt = prompt
        self.mapValue = mapValue
        self.isMultiline = isMultiline
        self.isSecure = isSecure
        self.keyboardType = keyboardType ?? viewModel.defaultKeyboardType
    }

    public var body: some View {
        textField
            .focused($isFocued)
            .keyboardType(keyboardType)
            .onChange(of: viewModel.textInput, perform: viewModel.textChanged)
            .onChange(of: isFocued, perform: focusChanged)
    }

    @ViewBuilder
    private var textField: some View {
        if isSecure {
            SecureField(title, text: textFieldValue, prompt: prompt)
        } else {
            TextField(title, text: textFieldValue, prompt: prompt, axis: isMultiline ? .vertical : .horizontal)
        }
    }

    private var textFieldValue: Binding<String> {
        Binding(
            get: { getStringForTextField() },
            set: { viewModel.textInput = $0 }
        )
    }

    private func getStringForTextField() -> String {
        if !isFocued, let mapInput = mapValue, let value = viewModel.resultValue {
            return mapInput(value)
        }
        return viewModel.textInput
    }

    private func focusChanged(_ isFocued: Bool) {
        viewModel.textInput = viewModel.textInput.trim
    }
}

extension InputField {
    public init(
        _ title: String,
        viewModel: InputVM<T>,
        prompt: String? = nil,
        mapValue: ((T) -> String)? = nil,
        isMultiline: Bool = false,
        isSecure: Bool = false,
        keyboardType: UIKeyboardType? = nil
    ) {
        self.title = title
        self.viewModel = viewModel
        self.mapValue = mapValue
        self.isMultiline = isMultiline
        self.isSecure = isSecure
        self.keyboardType = keyboardType ?? viewModel.defaultKeyboardType

        if let prompt = prompt {
            self.prompt = Text(prompt)
        } else {
            self.prompt = nil
        }
    }
}

// MARK: - Preview

struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        InputField("Text", viewModel: DoubleInputVM())
    }
}
