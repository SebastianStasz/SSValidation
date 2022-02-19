//
//  SSTextField.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 24/12/2021.
//

import SwiftUI

public struct SSTextField<ViewModel: InputVM>: View {
    public typealias Input = ViewModel.InputField

    @StateObject private var viewModel = ViewModel()
    @Binding private var input: Input

    private let title: String
    private let prompt: Text?

    public init(title: String,
                input: Binding<Input>,
                prompt: String? = nil) {
        self._input = input
        self.title = title
        self.prompt = prompt != nil ? Text(prompt!) : nil
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            TextField(title, text: $viewModel.textField, prompt: prompt)

            Text(viewModel.message ?? "")
                .font(.footnote)
                .foregroundColor(.red)
                .accessibility(identifier: "validation_message_id")
        }
        .asInputView(viewModel: viewModel, input: $input)
    }
}


// MARK: - Preview

//struct BaseTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        let input = Input<NumberInputSettings>()
//        let textInput = Input<TextInputSettings>()
//
//        Group {
//            SSTextField<NumberInputVM>(title: "Number input", input: .constant(input))
//            SSTextField<TextInputVM>(title: "Text input", input: .constant(textInput))
//        }
//        .previewLayout(.sizeThatFits)
//    }
//}
