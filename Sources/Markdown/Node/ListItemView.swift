//
//  Untitled.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//

import SwiftUI
import Markdown

// 列表项视图
struct ListItemView: View {
    let item: ListItem
    let ordered: Bool
    let index: Int
    @State private var isChecked: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            // 复选框或列表标记
            if let checkbox = item.checkbox {
                Button(action: {
                    isChecked.toggle()
                }) {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .foregroundColor(isChecked ? .blue : .secondary)
                }
                .buttonStyle(.plain)
                .onAppear {
                    isChecked = (checkbox == .checked)
                }
            } else if ordered {
                Text("\(index).")
                    .frame(minWidth: 20, alignment: .trailing)
            } else {
                Text("•")
                    .frame(minWidth: 20, alignment: .center)
            }
            
            // 列表项内容
            VStack(alignment: .leading, spacing: 4) {
                ForEach(Array(item.children.enumerated()), id: \.offset) { _, child in
                    if let paragraph = child as? Paragraph {
                        ParagraphView(paragraph: paragraph)
                    } else if let nestedList = child as? UnorderedList {
                        UnorderedListView(list: nestedList)
                    } else if let nestedList = child as? OrderedList {
                        OrderedListView(list: nestedList)
                    }
                }
            }
        }
    }
}
