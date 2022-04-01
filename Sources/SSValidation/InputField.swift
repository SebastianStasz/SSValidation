//
//  InputField.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import SwiftUI

public struct InputField<T>: View {
    @ObservedObject private var viewModel: InputVM<T>

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
            .onChange(of: viewModel.textInput, perform: viewModel.textChanged(to:))
    }
}

// MARK: - Preview

struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        InputField("Text", viewModel: DoubleInputVM())
    }
}
