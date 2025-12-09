//
//  TOCToolbarItemView.swift
//  iChat
//
//  Created by Lion on 2025/6/8.
//

import SwiftUI

struct TOCMessageView: View {
    @State private var showingPopover = false
    let messages: [ChatMessage]
    let proxy: ScrollViewProxy

    var body: some View {
        Button {
            showingPopover.toggle()
        } label: {
            Label("TOC", systemImage: "list.bullet")
        }
        .popover(
            isPresented: $showingPopover,
            arrowEdge: .bottom
        ) {
            GroupBox {
                if messages.count == 1 {
                    HStack {
                        Spacer()
                        Text("---")
                        Spacer()
                    }.frame(width: 200)
                }
                ForEach(messages) { item in
                    if !item.content.isEmpty {
                        CustomButtonView(
                            showingPopover: $showingPopover,
                            message: item
                        ) {
                            scrollToMessage(message: item)
                        }
                    }
                }
            } label: {
                Text("TOC").font(.title3)
            }.padding(.vertical)
        }
    }

    func scrollToMessage(message: ChatMessage) {
        withAnimation {
            proxy.scrollTo(message.id, anchor: .top)
        }
    }

}
