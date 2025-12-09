//
//  HeadingView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//
import SwiftUI
import Markdown

// 引用块视图
struct ThematicBreakView: View {
    let thematicBreak: ThematicBreak

    var body: some View {
        Divider()
            .padding(.vertical, 8)
    }
}
