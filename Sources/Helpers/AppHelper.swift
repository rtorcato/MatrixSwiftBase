//
//  AppHelper.swift
//  AppleCore
//
//  Created by Richard Torcato on 2022-09-06.
//

import Foundation
import SwiftUI
#if canImport(UIKit)
    import UIKit
#endif

public final class AppHelper {
    
    //    public static let instance = AppHelper() // Singleton
    //
    //    init() {
    //
    //    }
    
    static var isMacOS: Bool {
#if os(iOS)
        return true
#else
        return false
#endif
    }
    
    static var isDebug: Bool {
#if DEBUG
        return true
#else
        return false
#endif
    }
    
#if os(iOS)
    static var hasDynamicIsland: Bool {
        UIDevice.current.name == "iPhone 14 Pro" || UIDevice.current.name == "iPhone 14 Pro Max"
    }
#endif
    
#if os(iOS)
    static var deviceName: String{
        return UIDevice.current.name
    }
#endif
    
    
    public static var appVersion: String {
        (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "_error"
    }
    public static var buildVersion: String {
        (Bundle.main.infoDictionary?["CFBundleVersion"] as? String) ?? "_error"
    }
    
#if os(iOS)
    public static func isUsingSplitView()->Bool{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{return false}
        return screen.windows.first?.frame.size != screen.screen.bounds.size
    }
#endif
    
#if os(iOS)
    public static let deviceType: UIUserInterfaceIdiom = UIDevice.current.userInterfaceIdiom
#endif
    
    // MacOS Data....
    #if os(iOS) && os(macOS)
    public static var screen: CGRect{
#if os(iOS)
        return UIScreen.main.bounds
#else
        return NSScreen.main!.visibleFrame
#endif
    }
    #endif
    
    // hides the tab bar default appearance
#if os(iOS)
    public static func hideTabBarAppearance() {
        UITabBar.appearance().isHidden = true
    }
#endif
    
#if os(iOS)
    public static func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
#endif
    
    public func performHeavyTask() async {
        // Wait for 5 seconds
        try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
    }
    
    public static func getDeviceToken(){
        //
    }
#if os(iOS)
    public static func getFirstWindowRootViewController() -> UIViewController? {
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return nil
        }
        guard let firstWindow = firstScene.windows.first else {
            return nil
        }
        let viewController = firstWindow.rootViewController
        return viewController
    }
    #endif
}
