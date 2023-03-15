//
//  FeedsView.swift
//  RSSReader
//
//  Created by Drayl on 2023/3/12.
//

import SwiftUI

struct FeedsView: View {
    var feeds: [Feed.Item] = []
    
    var body: some View {
        List(feeds, id: \.self) { item in
            NavigationLink(destination: FeedContentView(url: item.link)) {
                Text(item.summary)
            }
        }
        .navigationBarTitle("订阅列表页", displayMode: .inline)
        
    }
}

struct FeedsView_Previews: PreviewProvider {
    static var previews: some View {
        FeedsView()
    }
}
