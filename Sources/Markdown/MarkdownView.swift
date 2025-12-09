//
//  MarkdownView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//

import SwiftUI
import Markdown

// Markdown 渲染视图
struct MarkdownView: View {
    let markdown: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            let document = Document(parsing: markdown)
            ForEach(Array(document.children.enumerated()), id: \.offset) {
                _,
                node in
                MarkdownNodeView(node: node)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
