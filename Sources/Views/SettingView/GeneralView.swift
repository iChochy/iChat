//
//  GeneralView.swift
//  iChat
//
//  Created by Lion on 2025/5/19.
//

import SwiftUI

struct GeneralView: View {
    let title = "General"
    let icon = "gear"
    @AppStorage("fontSize") var fontSize = 15.0
    @AppStorage("nicknames") var nickname =
        Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    @AppStorage("language") var language = LanguageEnum.auto
    @AppStorage("appearance") var appearance = AppearanceEnum.system
    @AppStorage("isInserted") var isInserted = true

    var body: some View {
        ScrollView {
            Form {
                VStack(alignment: .leading, spacing: 15) {
                    GroupBox {
                        Section(
                            "Open menu bar icon?"
                        ) {
                            Picker("MenuBar", selection: $isInserted) {
                                Text("Open").tag(true)
                                Text("Close").tag(false)
                            }.pickerStyle(.segmented).padding()
                        }
                        Divider()
                        Section(
                            "Select app appearance?"
                        ) {
                            Picker("Appearance", selection: $appearance) {
                                ForEach(AppearanceEnum.allCases) { item in
                                    Text(item.rawValue)
                                }
                            }.pickerStyle(.segmented).padding()

                        }
                    } label: {
                        Label("App Settings", systemImage: "gearshape")
                            .font(.title2)
                    }

                    GroupBox {
                        Section("What should we call you?") {

                            TextField(
                                "Nickname",
                                text: $nickname,
                                prompt: Text("What should we call you?")
                            ).padding()
                                .frame(maxWidth: 200)

                        }
                        Divider()
                        Section(
                            "Select the language for AI response?"
                        ) {
                            Picker("Language", selection: $language) {
                                ForEach(LanguageEnum.allCases) { item in
                                    Text(item.rawValue)
                                }
                            }.pickerStyle(.segmented).padding()
                        }
                    } label: {
                        Label(
                            "AI Settings",
                            systemImage: "bubble.left.and.bubble.right"
                        ).font(.title2)
                    }
                }
            }.padding()
                .textFieldStyle(.roundedBorder)
                .navigationTitle("General")
        }
    }
}
