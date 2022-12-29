//
//  SwiftUIView.swift
//  
//
//  Created by Richard Torcato on 2022-12-27.
//

import SwiftUI

struct FormWrapper: View {
    enum FocusedField {
        case int, dec
    }
    @State private var intNumberString = ""
    @State private var decNumberString = ""
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        VStack{
            TextField("Enter Integer Number", text: $intNumberString)
                .focused($focusedField, equals: .int)
                .numbersOnly($intNumberString)
            TextField("Enter Decimal Number", text: $decNumberString)
                .focused($focusedField, equals: .dec)
                .numbersOnly($decNumberString, includeDecimal: true)
            Spacer()
        }
        .textFieldStyle(.roundedBorder)
        .frame(width: 200)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Spacer()
            }
            ToolbarItem(placement: .keyboard) {
                Button {
                    focusedField = nil
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
            }
        }
        .onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
        }
    }
}

struct FormWrapper_Previews: PreviewProvider {
    static var previews: some View {
        FormWrapper()
    }
}
