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
                        Image(systemName: "homekit")
                        Text("首页")
                    }
                Text("FirstView")
                    .tabItem {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
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
