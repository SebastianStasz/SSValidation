//
//  InputViewModifier.swift
//  SSValidation
//
//  Created by Sebastian Staszczyk on 24/12/2021.
//

import SwiftUI

private struct InputViewModifier<ViewModel: InputVM>: ViewModifier {
    typealias Input = ViewModel.InputField

    @ObservedObject var viewModel: ViewModel
    @Binding var input: Input

    func body(content: Content) -> some View {
        content
            .keyboardType(viewModel.settings.keyboardType)
            .onAppear(perform: onAppear)
            .onChange(of: viewModel.value) { input.value = $0 }
    }

    private func onAppear() {
        viewModel.settings = input.settings
        viewModel.text = input.settings.initText
    }
}

public extension View {
    func asInputView<ViewModel: InputVM>(viewModel: ViewModel, input: Binding<ViewModel.InputField>) -> some View {
        modifier(InputViewModifier(viewModel: viewModel, input: input))
    }
}
