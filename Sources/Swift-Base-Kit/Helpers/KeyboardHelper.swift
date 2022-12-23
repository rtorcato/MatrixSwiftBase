//
//  KeyboardHelper.swift
//  AppleCore
//
//  Created by Richard Torcato on 2022-12-12.
//

import SwiftUI

public struct KeyboardHelper {
    
//    static let shared = KeyboardHelper() // Singleton
    
    public static func closeKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
