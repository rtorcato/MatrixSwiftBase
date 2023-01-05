//
//  DismissButton.swift
//  DropWallet
//
//  Created by Richard Torcato on 2023-01-04.
//

import SwiftUI

struct DismissButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "xmark")
        }
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            DismissButton().padding()
                .foregroundColor(.white)
        }.background(Color.red)
    }
}
