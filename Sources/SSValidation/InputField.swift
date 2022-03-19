//
//  InputField.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import SwiftUI

public struct InputField: View {
    @ObservedObject private var viewModel: InputVM
    @State private var text = ""

    private let title: String
    private let prompt: Text?

    public init(_ title: String, viewModel: InputVM, prompt: String? = nil) {
        self.title = title
        self.viewModel = viewModel

        if let prompt = prompt {
            self.prompt = Text(prompt)
        } else {
            self.prompt = nil
        }
    }

    public var body: some View {
        TextField(title, text: $text, prompt: prompt)
            .onChange(of: text, perform: textChanged(to:))
    }

    private func textChanged(to newText: String) {
        if viewModel.isValueAllowed(newText) {
            viewModel.textInput = newText
        } else {
            text = viewModel.textInput
        }
    }
}

// MARK: - Preview

struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        InputField("Text", viewModel: InputVM(type: .text()))
    }
}
