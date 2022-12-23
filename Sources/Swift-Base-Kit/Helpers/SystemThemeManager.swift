//
//  SystemThemeManager.swift
//  AppleCore
//
//  Created by Richard Torcato on 2022-09-30.
//

import Foundation
#if os(iOS)
    import UIKit
#endif

#if os(macOS)
    import AppKit
#endif



class SystemThemeManager {
    static let shared = SystemThemeManager()
    
    private init() {}
    
    func handleTheme (darkMode: Bool, system: Bool){

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            // Handle System
            if (system){
//                UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
#if os(iOS)
                UIApplication.keyWindow?.overrideUserInterfaceStyle = .unspecified
               
                #endif
#if os(macOS)
                #endif
                
            }else{
//                UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
#if os(iOS)
                UIApplication.keyWindow?.overrideUserInterfaceStyle = darkMode ? .dark : .light
#endif
#if os(macOS)
//                NSApplication.window.self.
                #endif
            }
        }

    }
}
