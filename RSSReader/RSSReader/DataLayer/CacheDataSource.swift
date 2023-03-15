//
//  CacheDataSource.swift
//  RSSReader
//
//  Created by Drayl on 2023/3/12.
//

import Foundation

struct CacheDataSource {
    
    func getFeeds() throws -> [Feed] {
        guard let feedJsonArray = UserDefaults.standard.object(forKey: "Feeds") as? [[String: AnyObject]] else {
            return []
        }
        

        return try feedJsonArray.map { feedJson in
            let jsonData = try JSONSerialization.data(withJSONObject: feedJson, options: .prettyPrinted)
            return try JSONDecoder().decode(Feed.self, from: jsonData)
        }
    }
    
    func save(feed: Feed) throws {
        var feedJsonArray = UserDefaults.standard.object(forKey: "Feeds") as? [[String: AnyObject]] ?? []
        
        let jsonData = try JSONEncoder().encode(feed)
        guard let feedJson = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: AnyObject] else {
            return
        }
        
        feedJsonArray.append(feedJson)
        
        UserDefaults.standard.set(feedJsonArray, forKey: "Feeds")
    }
    
    func getFeed(for url: String) throws -> Feed? {
        guard let json = UserDefaults.standard.object(forKey: url) as? Dictionary<String, AnyObject> else {
            return nil
        }
        
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        return try JSONDecoder().decode(Feed.self, from: jsonData)
    }
}
