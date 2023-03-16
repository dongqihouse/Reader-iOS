//
//  UIImage+Icon.swift
//  RSSReader
//
//  Created by Drayl on 2023/3/16.
//

import SwiftUI

extension String {
    static var icon: String {
        return "p\(Int.random(in: 1...30))"
    }
}

extension Image {
    static func icon() -> some View {
        return Image("p\(Int.random(in: 1...30))")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
    }
}
