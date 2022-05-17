//
//  PostFormView.swift
//  Planty
//
//  Created by renaka agusta on 13/05/22.
//

import SwiftUI
import MarkupEditor

@available(iOS 15.0, *)
extension PostFormView: MarkupDelegate {
    func markupDidLoad(_ view: MarkupWKWebView, handler: (()->Void)?) {
        markupEnv.observedWebView.selectedWebView = view
    }
}

@available(iOS 15.0, *)
struct PostFormView: View {
    
    private let markupEnv = MarkupEnv(style: .compact)
    private let showSubToolbar = ShowSubToolbar()
    private var selectedWebView: MarkupWKWebView? { markupEnv.observedWebView.selectedWebView }
    @State private var demoContent: String = "<p>Hello world</p>"
    
    var body: some View {
        VStack(spacing: 0) {
            MarkupToolbar(markupDelegate: self)
                .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
            Divider()
            MarkupWebView(markupDelegate: self, boundContent: $demoContent)
                .overlay(
                    SubToolbar(markupDelegate: self),
                    alignment: .topLeading)
        }
        .environmentObject(markupEnv)
        .environmentObject(showSubToolbar)
        .environmentObject(markupEnv.toolbarPreference)
        .environmentObject(markupEnv.selectionState)
        .environmentObject(markupEnv.observedWebView)
        
    }
}

struct PostFormView_Previews: PreviewProvider {
    static var previews: some View {
        PostFormView()
    }
}
