//
//  HeadingView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//
import SwiftUI
import Markdown

// 有序列表视图
struct OrderedListView: View {
    let list: OrderedList
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(Array(list.listItems.enumerated()), id: \.offset) { index, item in
                ListItemView(item: item, ordered: true, index: index + 1)
            }
        }
        .padding(.leading, 16)
    }
}
