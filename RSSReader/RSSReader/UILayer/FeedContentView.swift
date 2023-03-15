//
//  FeedContentView.swift
//  RSSReader
//
//  Created by Drayl on 2023/3/12.
//

import SwiftUI
import WebKit

struct FeedContentView: View {
    var url: String
    var body: some View {
        WebView(url: url)
            .navigationBarTitle("详情页")
    }
}

struct FeedContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedContentView(url: "")
    }
}


struct WebView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: self.url) else { return }
        uiView.load(URLRequest(url: url))
    }
}






