//
//  AddToWalletButton.swift
//  DropWallet
//
//  Created by Richard Torcato on 2023-01-31.
//

import SwiftUI
import PassKit

struct AddToWalletButton: View {
    var body: some View {
        
        //            if (!self.isLoading){
        //
        //            }
        AddPassToWalletButton {
            print("add pass")
        }
        //        ProgressView()
    }
}

struct AddToWalletButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToWalletButton()
    }
}
