//
//  ContentView.swift
//  RSSReader
//
//  Created by Drayl on 2023/3/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("首页")
                    }
                Text("FirstView")
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("设置")
                    }
            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
