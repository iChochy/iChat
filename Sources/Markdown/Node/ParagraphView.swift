//
//  HeadingView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//
import SwiftUI
import Markdown

// 段落视图
struct ParagraphView: View {
    let paragraph: Paragraph
    
    var body: some View {
        let content = contentView(for: paragraph)
        content.padding(.vertical, 2)
    }
    
    @ViewBuilder
    func contentView(for paragraph: Paragraph) -> some View {
        // 检查是否包含图片
        if hasImage(in: paragraph) {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(Array(paragraph.children.enumerated()), id: \.offset) { _, child in
                    if let image = child as? Markdown.Image {
                        ImageView(image: image)
                    } else {
                        Text(attributedString(for: child))
                    }
                }
            }
        } else {
            Text(attributedString(for: paragraph))
        }
    }
    
    func hasImage(in markup: any Markup) -> Bool {
        for child in markup.children {
            if child is Markdown.Image {
                return true
            }
        }
        return false
    }
    
    func attributedString(for markup: any Markup) -> AttributedString {
        var result = AttributedString()
        
        for child in markup.children {
            if let text = child as? Markdown.Text {
                result += AttributedString(text.string)
            } else if let strong = child as? Strong {
                var boldText = attributedString(for: strong)
                boldText.font = .body.bold()
                result += boldText
            } else if let emphasis = child as? Emphasis {
                var italicText = attributedString(for: emphasis)
                italicText.font = .body.italic()
                result += italicText
            } else if let code = child as? InlineCode {
                var codeText = AttributedString(code.code)
                codeText.font = .system(.body, design: .monospaced)
                codeText.backgroundColor = Color.gray.opacity(0.2)
                result += codeText
            } else if let link = child as? Markdown.Link {
                var linkText = AttributedString(link.plainText)
                linkText.foregroundColor = Color.blue
                linkText.underlineStyle = .single
                if let url = link.destination {
                    linkText.link = URL(string: url)
                }
                result += linkText
            } else if let strikethrough = child as? Strikethrough {
                var strikeText = AttributedString(strikethrough.plainText)
                strikeText.strikethroughStyle = .single
                result += strikeText
            } else if child.childCount > 0 {
                result += attributedString(for: child)
            }
        }
        
        return result
    }
}
