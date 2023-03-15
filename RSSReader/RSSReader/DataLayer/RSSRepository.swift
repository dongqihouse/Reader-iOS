//
//  RSSRepository.swift
//  RSSReader
//
//  Created by Drayl on 2023/3/10.
//

import Foundation
import Combine
@_exported import FeedKit

//protocol RSSRepository {}

class RSSRepository {
    
    var feeds = CurrentValueSubject<[Feed], Never>([])
    
    
    let cacheDataSource = CacheDataSource()
    let networkDataSource = NetworkDataSource()
    
    @discardableResult
    func getFeeds() async throws -> [Feed] {
        let localFeeds = try cacheDataSource.getFeeds()
        feeds.send(Array(Set(localFeeds)))
        return localFeeds
    }
    
    @discardableResult
    func getFeed(for url: String) async throws -> Feed {
        
        do {
            let feed = try await networkDataSource.getFeed(for: url)
            
            try cacheDataSource.save(feed: feed)
            
            var tempFeeds = feeds.value
            tempFeeds.append(feed)
            feeds.send(tempFeeds)
            
            return feed
            
        } catch {
            throw error
        }
    }
}

