//
//  HeadingView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//
import SwiftUI
import Markdown

// 引用块视图
struct BlockQuoteView: View {
    let blockQuote: BlockQuote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(Array(blockQuote.children.enumerated()), id: \.offset) { _, child in
                if let paragraph = child as? Paragraph {
                    ParagraphView(paragraph: paragraph)
                } else if let nestedQuote = child as? BlockQuote {
                    BlockQuoteView(blockQuote: nestedQuote)
                        .padding(.leading, 16)
                }
            }
        }
        .padding(.leading, 16)
        .padding(.vertical, 8)
        .overlay(
            Rectangle()
                .fill(Color.blue.opacity(0.5))
                .frame(width: 4),
            alignment: .leading
        )
    }
}
