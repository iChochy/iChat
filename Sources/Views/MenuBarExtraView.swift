//
//  MenuBarExtraView.swift
//  iChat
//
//  Created by Lion on 2025/6/5.
//

import SwiftUI

struct MenuBarExtraView: View {
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        Button("Chat") {
//            openChatWindow()
            openWindow(id: "Chat")
            NSApp.activate(ignoringOtherApps: true)
            
        }.keyboardShortcut("N")
        Button("Setting..") {
            openWindow(id: "Settings")
            NSApp.activate(ignoringOtherApps: true)
        }.keyboardShortcut(",")
        Divider()
        Button("About"){
            NSApp.orderFrontStandardAboutPanel(nil)
        }
        Button("Quit") {
            NSApp.terminate(nil)
        }.keyboardShortcut("Q")
    }

    func openChatWindow() {
        let existingWindow = NSApp.windows.first { window in
            window.identifier?.rawValue.hasPrefix("Chat") == true
        }
        if let window = existingWindow {
            if window.isMiniaturized {
                window.deminiaturize(nil)
            } else {
                window.makeKeyAndOrderFront(nil)
            }
        } else {
            openWindow(id: "Chat")
        }
        NSApp.activate(ignoringOtherApps: true)
    }

}

