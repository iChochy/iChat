//
//  TableView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//

import Markdown
import SwiftUI

// 表格视图
struct TableView: View {
    let table: Markdown.Table

    var body: some View {
        VStack(spacing: 0) {
            // 表格头部
            TableHeadView(
                head: table.head,
                columnAlignments: table.columnAlignments
            )
            // 表格内容
            ForEach(Array(table.body.rows.enumerated()), id: \.offset) {
                _,
                row in
                TableRowView(
                    row: row,
                    isHeader: false,
                    columnAlignments: table.columnAlignments
                )
                Divider()
            }

        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .padding(.vertical, 8)
    }
}

// 表格头部视图
struct TableHeadView: View {
    let head: Markdown.Table.Head
    let columnAlignments: [Markdown.Table.ColumnAlignment?]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(head.cells.enumerated()), id: \.offset) {
                index,
                cell in
                TableCellView(
                    cell: cell,
                    isHeader: true,
                    alignment: columnAlignments.indices.contains(index)
                        ? columnAlignments[index] : nil
                )

            }
        }
        .background(Color.gray.opacity(0.1))
    }
}

// 表格行视图
struct TableRowView: View {
    let row: Markdown.Table.Row
    let isHeader: Bool
    let columnAlignments: [Markdown.Table.ColumnAlignment?]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(row.cells.enumerated()), id: \.offset) {
                index,
                cell in
                TableCellView(
                    cell: cell,
                    isHeader: isHeader,
                    alignment: columnAlignments.indices.contains(index)
                        ? columnAlignments[index] : nil
                )
            }
        }
        .background(isHeader ? Color.gray.opacity(0.1) : Color.clear)
    }
}

// 表格单元格视图
struct TableCellView: View {
    let cell: Markdown.Table.Cell
    let isHeader: Bool
    let alignment: Markdown.Table.ColumnAlignment?

    var body: some View {
        VStack(alignment: textAlignment, spacing: 4) {
            Text(attributedString(for: cell))
                .frame(
                    maxWidth: .infinity,
                    alignment: Alignment(
                        horizontal: textAlignment,
                        vertical: .center
                    )
                )
        }
        .font(isHeader ? .body.bold() : .body)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
    }

    var textAlignment: HorizontalAlignment {
        switch alignment {
        case .left: return .leading
        case .center: return .center
        case .right: return .trailing
        default: return .leading
        }
    }

    func attributedString(for markup: any Markup) -> AttributedString {
        var result = AttributedString()
        for child in markup.children {
            if let text = child as? Markdown.Text {
                result += AttributedString(text.string)
            } else if let strong = child as? Strong {
                var boldText = AttributedString(strong.plainText)
                boldText.font = .body.bold()
                result += boldText
            } else if let emphasis = child as? Emphasis {
                var italicText = AttributedString(emphasis.plainText)
                italicText.font = .body.italic()
                result += italicText
            } else if let code = child as? InlineCode {
                var codeText = AttributedString(code.code)
                codeText.font = .system(.body, design: .monospaced)
                codeText.backgroundColor = Color.gray.opacity(0.2)
                result += codeText
            } else if child.childCount > 0 {
                result += attributedString(for: child)
            }
        }

        return result
    }
}
