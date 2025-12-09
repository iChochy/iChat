//
//  MessageListView.swift
//  iChat
//
//  Created by Lion on 2025/4/30.
//

import SwiftData
import SwiftUI

// MARK: - Message List View
struct SessionDetailView: View {
    @Environment(\.modelContext) private var modelContext
    let messages: [ChatMessage]

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(messages) { message in
                        ChatMessageView(message: message).id(message.id)
                    }
                }
                .padding()
            }.onChange(of: messages.count) { oldValue, newValue in
                if oldValue < newValue {
                    scrollView(
                        proxy: proxy,
                        message: messages.last,
                        anchor: .bottom
                    )
                }
            }.onAppear {
                scrollView(
                    proxy: proxy,
                    message: messages.last,
                    anchor: .bottom
                )
            }
            .scrollClipDisabled()
            .padding()
            .toolbar {
                if messages.count > 0 {
                    TOCMessageView(messages: messages, proxy: proxy)
                }
            }
        }
    }

    private func scrollView(
        proxy: ScrollViewProxy,
        message: ChatMessage?,
        anchor: UnitPoint
    ) {
        guard let msg = message else {
            return
        }
        withAnimation{
            proxy.scrollTo(msg.id, anchor: anchor)
        }
    }

}
