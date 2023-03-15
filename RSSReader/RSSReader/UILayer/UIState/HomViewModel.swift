//
//  HomViewModel.swift
//  RSSReader
//
//  Created by Drayl on 2023/3/11.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var isShowAddView: Bool = false
    @Published var rssUrl: String = ""
    @Published var feeds: [Feed] = []
    
    let rssRespository = RSSRepository()
    var feedsCancellable: AnyCancellable? 
    
    init() {
        Task { @MainActor in
            do {
                try await rssRespository.getFeeds()
            } catch {
                Logger.error(message: error.localizedDescription)
            }
        }
        
        feedsCancellable = rssRespository.feeds
            .receive(on: DispatchQueue.main)
            .sink { feeds in
            self.feeds = feeds
        }
    }
    
    @MainActor
    func AddFeed() async {
        // TODO: 检查Url正确性
        
        isShowAddView = false
        do {
            try await rssRespository.getFeed(for: rssUrl)
        } catch {
            Logger.error(message: error.localizedDescription)
        }
    }
    
    
    deinit {
        print("ViewModel deinit")
    }
    
}
