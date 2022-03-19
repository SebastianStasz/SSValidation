//
//  InputField.swift
//  SSValidation
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import SwiftUI

public struct InputField: View {
    @State private var text = ""
    @ObservedObject private var viewModel: InputVM
    private let title: String

    public init(_ title: String, viewModel: InputVM) {
        self.title = title
        self.viewModel = viewModel
    }

    public var body: some View {
        TextField(title, text: $text)
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
