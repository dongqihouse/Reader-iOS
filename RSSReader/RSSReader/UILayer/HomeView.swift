//
//  HomeView.swift
//  RSSReader
//
//  Created by Drayl on 2023/3/10.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            HomeContentView(viewModel: viewModel)
                .navigationBarTitle("Home")
                .navigationBarItems(trailing:
                                        Button {
                    viewModel.isShowAddView = true
                } label: {
                    Image(systemName: "folder.fill.badge.plus")
                })
        }
        .alert("添加新的订阅源", isPresented: $viewModel.isShowAddView) {
            TextField("地址", text: $viewModel.rssUrl)
            Button("取消", role: .cancel, action: {})
            Button {
                Task { @MainActor in
                    await viewModel.AddFeed()
                }
            } label: {
                Text("确认")
            }

        }
    }
}

struct HomeContentView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        List(viewModel.feeds, id: \.self) { item in
            NavigationLink {
                FeedsView(feeds: item.items)
            } label: {
                ItemView(title: item.title,subTitle: item.subtitle , imageName: "star.fill", color: .brown)
            } 
        }
    }
    
    struct ItemView: View {
        var title: String
        var subTitle: String
        var imageName: String
        var color: Color
        
        var body: some View {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(color)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                    Text(subTitle)
                        .lineLimit(2)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                
            }
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
