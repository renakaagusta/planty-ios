//
//  WebView.swift
//  Planty
//
//  Created by renaka agusta on 19/05/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  @State var text: String
   
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
   
  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.loadHTMLString(text, baseURL: nil)
  }
}
