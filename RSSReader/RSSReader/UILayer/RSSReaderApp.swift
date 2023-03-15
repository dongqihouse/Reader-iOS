//
//  RSSReaderApp.swift
//  RSSReader
//
//  Created by Drayl on 2023/3/10.
//

import SwiftUI

@main
struct RSSReaderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HomeViewModel())
        }
    }
}
