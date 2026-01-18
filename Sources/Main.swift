//
//  iChat.swift
//  iChat
//
//  Created by Lion on 2025/4/1.
//

import SwiftData
import SwiftUI

@main
struct Main: App {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("appearance") var appearance = AppearanceEnum.system
    @AppStorage("isInserted") var isInserted = true
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ChatSession.self,
            ChatMessage.self,
            AIProvider.self,
            AIModel.self,
            Assistant.self
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )
        do {
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        
        Window("iChat", id: "Chat") {
            //            AssistantView()
                        MainView()
                .onAppear(perform: {
                    NSApp.appearance = appearance.name
                }).onChange(
                    of: appearance,
                    {
                        NSApp.appearance = appearance.name
                    }
                )
                .frame(minWidth: 800, minHeight: 500)
        }.modelContainer(sharedModelContainer)
        

        MenuBarExtra(isInserted: $isInserted) {
            MenuBarExtraView()
        } label: {
            Image("Status").renderingMode(.original)
        }

        Window("Settings", id: "Settings") {  // 给窗口一个标题和 ID
            SettingsView()
                .onAppear(perform: {
                    NSApp.appearance = appearance.name
                }).onChange(
                    of: appearance,
                    {
                        NSApp.appearance = appearance.name
                    }
                )
                .frame(minWidth: 600, minHeight: 400)  // 可以设置最小尺寸
        }.modelContainer(sharedModelContainer)
        
        Window("Assistant", id: "Assistant") {  // 给窗口一个标题和 ID
            AssistantView()
                .onAppear(perform: {
                    NSApp.appearance = appearance.name
                }).onChange(
                    of: appearance,
                    {
                        NSApp.appearance = appearance.name
                    }
                )
                .frame(minWidth: 400, minHeight: 400)  // 可以设置最小尺寸
        }.modelContainer(sharedModelContainer)
    }

}
