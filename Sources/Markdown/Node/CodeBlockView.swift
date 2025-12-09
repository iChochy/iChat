import Markdown
//
//  HeadingView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//
import SwiftUI

// 代码块视图
struct CodeBlockView: View {
    let codeBlock: CodeBlock
    @State private var isCopied = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 代码块头部
            HStack {
                Text((codeBlock.language ?? "").capitalized)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                Spacer()
                Button(action: {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(
                        codeBlock.code,
                        forType: .string
                    )
                    isCopied = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        isCopied = false
                    }
                }) {
                    Image(systemName: isCopied ? "checkmark" : "doc.on.doc")
                        .frame(width: 15, height: 15)
                        .foregroundColor(isCopied ? .green : .secondary)
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 10)
            }
            .background(Color.gray.opacity(0.15))

            // 代码内容
            ScrollView(.horizontal, showsIndicators: false) {
                Text(codeBlock.code)
                    .font(.system(.body, design: .monospaced))
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color.gray.opacity(0.1))
        }
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}
