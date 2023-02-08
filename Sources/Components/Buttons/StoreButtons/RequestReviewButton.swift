//
//  SwiftUIView.swift
//  
//
//  Created by Richard Torcato on 2023-01-31.
//

import SwiftUI
import StoreKit

struct RequestReviewButton: View {
    @Environment (\.requestReview) var requestReview
    let label: String
    
    var body: some View {
        Button (label){
            DispatchQueue.main.async {
                 requestReview()
            }
        }
    }
}

struct RequestReviewButton_Previews: PreviewProvider {
    static var previews: some View {
        RequestReviewButton(label:"Request Review")
    }
}

