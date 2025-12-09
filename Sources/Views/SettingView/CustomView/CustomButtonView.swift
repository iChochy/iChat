//
//  CustomButtonView.swift
//  iChat
//
//  Created by Lion on 2025/5/23.
//

import SwiftUI

struct CustomButtonView: View {
    @Binding var showingPopover:Bool
    let message: ChatMessage    
    var scrollView : () -> Void
    @State var isHover = false
    var body: some View {
        Button {
            showingPopover.toggle()
            scrollView()
        } label: {
            HStack{
                Text(getPlainText(message: message))
                    .font(.headline)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .padding(message.role == .assistant ?  .leading: .trailing)
                Spacer()
            }.frame(width: 200)
        }.padding(5)
            .buttonStyle(.plain)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(
                        isHover ? Color.accentColor.opacity(0.8) : Color.clear
                    )
            )
            .foregroundColor(isHover ? .white : .primary)
            .onHover { hover in
                isHover = hover
            }
    }
    
    private func getPlainText(message: ChatMessage )-> String{
        let content = try? String(AttributedString(markdown: message.content).characters)
        guard let msg = content else {
            return "---"
        }
        return String(msg.prefix(50))
    }

}
