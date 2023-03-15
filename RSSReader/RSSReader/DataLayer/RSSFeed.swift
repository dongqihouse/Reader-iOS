//
//  RSSFeeder.swift
//  RSSReader
//
//  Created by Drayl on 2023/3/11.
//

import Foundation

struct Feed {
    struct Item {
        var title = ""
        var summary = ""
        var link = ""
    }
    
    var title = ""
    var subtitle = ""
    var updated = ""
    var items = [Item()]
}

extension Feed: Codable {
    
}

extension Feed.Item: Codable {
    
}

extension Feed: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    static func == (lhs: Feed, rhs: Feed) -> Bool {
        lhs.title == rhs.title
    }
    
}

extension Feed.Item: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}



extension AtomFeed {
    func toFeed() -> Feed {
        return Feed(title: title ?? "",
                    subtitle: subtitle?.value ?? "",
                    updated: updated?.formatted() ?? "",
                    items: entries!.map {
            return Feed.Item(title: $0.title ?? "", summary: $0.summary?.value ?? "", link: $0.links!.first!.attributes!.href ?? "")
            
        })
    }
}

extension RSSFeed {
    func toFeed() -> Feed {
        return Feed(title: title ?? "",
                    subtitle: description ?? "",
                    updated: pubDate?.formatted() ?? "",
                    items: items!.map {
            return Feed.Item(title: $0.title ?? "", summary: $0.description ?? "", link: $0.link ?? "")
            
        })
    }
}

