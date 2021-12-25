//
//  SampleInputView.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import SwiftUI

struct SampleInputView<ViewModel: InputVM>: View {
    typealias Input = ViewModel.InputField

    @StateObject private var viewModel = ViewModel()
    @Binding private var input: Input

    private let title: String
    private let prompt: Text?

    init(title: String,
         input: Binding<Input>,
         prompt: String? = nil
    ) {
        self._input = input
        self.title = title
        self.prompt = prompt != nil ? Text(prompt!) : nil
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            TextField(title, text: $viewModel.text, prompt: prompt)

            Text(viewModel.message ?? "")
                .font(.footnote)
                .foregroundColor(.red)
                .opacity(0.8)
        }
        .asInputView(viewModel: viewModel, input: $input)
    }
}


// MARK: - Preview

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        let input = Input<NumberInputSettings>()
        SampleInputView<NumberInputVM>(title: "Number input", input: .constant(input))
            .previewLayout(.sizeThatFits)
    }
}
