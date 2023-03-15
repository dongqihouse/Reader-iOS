//
//  NetworkDataSource.swift
//  RSSReader
//
//  Created by Drayl on 2023/3/12.
//

import Foundation

struct NetworkDataSource {
    func getFeed(for url: String) async throws -> Feed {
        return try await withCheckedThrowingContinuation { continuation in
            let feedURL = URL(string: url)!
            let parser = FeedParser(URL: feedURL)
            
            // Parse asynchronously, not to block the UI.
            parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
                // Do your thing, then back to the Main thread
                DispatchQueue.main.async {
                    // ..and update the UI
                    switch result {
                    case .success(let feed):
                        switch feed {
                        case .atom(let atom):                            
                            continuation.resume(returning: atom.toFeed())
                        case .rss(let rss):
                            continuation.resume(returning: rss.toFeed())
                        default:
                            () //TODO:
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
}
