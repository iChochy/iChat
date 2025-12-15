//
//  HeadingView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//
import SwiftUI
import Markdown

// 标题视图
struct HeadingView: View {
    let heading: Heading

    var body: some View {
        Text(heading.plainText)
            .font(fontForLevel(heading.level))
            .fontWeight(.bold)
            .padding(.vertical, 4)
    }

    func fontForLevel(_ level: Int) -> Font {
        switch level {
        case 1: return .title
        case 2: return .title2
        case 3: return .title3
        case 4: return .headline
        default: return .body
        }
    }
}
