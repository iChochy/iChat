//
//  ChatReasoning.swift
//  iChat
//
//  Created by Lion on 2025/5/30.
//

import SwiftUI

// 内容 View
struct ChatOperationView: View {
    @Environment(\.modelContext) private var modelContext
    var message: ChatMessage
    @State private var isCopied = false

    var body: some View {
        Text(
            "\(message.timestamp, style: .date) \(message.timestamp, style: .time)"
        )
        .font(.caption)
        .foregroundColor(.gray)
        HStack {
            ShareLink(item: message.content) {
                Image(systemName: "square.and.arrow.up")
                    .frame(width: 15,height: 15)
            }
            Button {
                copyMessage()
                isCopied = true
                DispatchQueue.main.asyncAfter(deadline: .now()+1){
                    isCopied = false
                }
            } label: {
                Image(systemName: isCopied ? "checkmark" : "doc.on.doc")
                    .frame(width: 15,height: 15)
                    .foregroundColor(isCopied ? .green : Color.primary)
            }
            Button {
                deleteMessage()
            } label: {
                Image(systemName: "trash")
                    .frame(width: 15,height: 15)
            }
        }
        .buttonBorderShape(.circle)
        HStack {
            Spacer()
        }
    }

    private func copyMessage() {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(message.content, forType: .string)
    }

    private func deleteMessage() {
        withAnimation {
            modelContext.delete(message)
            try? modelContext.save()
        }
    }

}
