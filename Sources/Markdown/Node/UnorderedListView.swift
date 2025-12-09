//
//  HeadingView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//
import SwiftUI
import Markdown

// 无序列表视图
struct UnorderedListView: View {
    let list: UnorderedList
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(Array(list.listItems.enumerated()), id: \.offset) { _, item in
                ListItemView(item: item, ordered: false, index: 0)
            }
        }
        .padding(.leading, 16)
    }
}
