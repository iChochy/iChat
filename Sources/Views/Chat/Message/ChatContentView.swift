//
//  ChatReasoning.swift
//  iChat
//
//  Created by Lion on 2025/5/30.
//

import SwiftUI
import MDV

// 内容 View
struct ChatContentView: View {
    var message: ChatMessage

    var body: some View {
        HStack {
            switch message.role {
            case .system:
                Text(message.content)
                    .fixedSize(horizontal: false, vertical: true)
                    .background(messageBackgroundColor)
                    .foregroundStyle(messageForegroundColor)
                    .cornerRadius(20)
            case .user:
                Text(message.content)
                    .padding(10)
                    .padding(.horizontal, 5)
                    .fixedSize(horizontal: false, vertical: true)
                    .background(messageBackgroundColor)
                    .foregroundStyle(messageForegroundColor)
                    .cornerRadius(20)
            case .assistant:
                MDView(message.content)
            }
        }
    }

    // 根据角色决定背景色
    private var messageBackgroundColor: Color {
        switch message.role {
        case .user: return Color.accentColor
        case .assistant: return Color.gray.opacity(0.3)
        case .system: return Color.orange.opacity(0.3)
        }
    }

    // 根据角色决定前景色
    private var messageForegroundColor: Color {
        switch message.role {
        case .user: return .white
        default: return .primary  // 自动适应浅色/深色模式
        }
    }

}
