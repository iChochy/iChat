//
//  ChatReasoning.swift
//  iChat
//
//  Created by Lion on 2025/5/30.
//

import SwiftUI

// 推理 View
struct ChatReasoningView: View {
    var message: ChatMessage

    var body: some View {
        VStack {
            GroupBox {
                HStack {
                    Button(action: {
                        withAnimation {
                            message.isExpanded.toggle()
                        }
                    }) {
                        HStack {
                            Image(
                                systemName: message.isExpanded
                                    ? "chevron.down" : "chevron.right"
                            ).frame(width: 5)
                            Text("Thinking ......")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                if message.isExpanded {
                    ScrollView {
                        MarkdownView(markdown: message.reasoning)
                    }.frame(maxHeight: 80)
                }
            }
        }.frame(maxWidth: 400)
    }

}
