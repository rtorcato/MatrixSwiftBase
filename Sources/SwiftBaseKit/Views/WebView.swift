//
//  WebView.swift
//  AppleCore
//
//  Created by Richard Torcato on 2022-09-30.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {

    let request: URLRequest
    @Binding var isLoading: Bool
    @Binding var error: Error?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIView(context: Context) -> WKWebView {
       let view = WKWebView()
       // isLoading = true
        view.load(request)
        view.navigationDelegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
        var webView: WebView
        
        init(_ webView: WebView) {
            self.webView = webView
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            self.webView.isLoading = true
            self.webView.error = nil
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            self.webView.error = error
            self.webView.isLoading = false
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.webView.isLoading = false
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "https://www.apple.com")!), isLoading: .constant(false), error: .constant(nil))
    }
}
