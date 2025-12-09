//
//  MarkdownNodeView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//

import SwiftUI
import Markdown

// 渲染单个 Markdown 节点
struct MarkdownNodeView: View {
    let node: any Markup
    
    var body: some View {
        Group {
            if let heading = node as? Heading {
                HeadingView(heading: heading)
            } else if let paragraph = node as? Paragraph {
                ParagraphView(paragraph: paragraph)
            } else if let list = node as? UnorderedList {
                UnorderedListView(list: list)
            } else if let list = node as? OrderedList {
                OrderedListView(list: list)
            } else if let codeBlock = node as? CodeBlock {
                CodeBlockView(codeBlock: codeBlock)
            } else if let blockQuote = node as? BlockQuote {
                BlockQuoteView(blockQuote: blockQuote)
            } else if let thematicBreak = node as? ThematicBreak {
                ThematicBreakView(thematicBreak:thematicBreak)
            } else if let table = node as? Markdown.Table {
                TableView(table: table)
            }
        }
    }
}
