//
//  PhotoShareView.swift
//  iChat
//
//  Created by OSX on 2025/12/14.
//

import SwiftUI

struct ShareButtonView: View {
    let document: ImageDocument

    @State private var showSavePanel = false

    var body: some View {
        Button {
            showSavePanel = true
        } label: {
                Image(systemName: "square.and.arrow.down")
        }
        .fileExporter(
            isPresented: $showSavePanel,
            document: document,
            contentType: .png,
            defaultFilename: document.name
        ) { result in
            switch result {
            case .success(let url):
                print("成功导出到: \(url)")
            case .failure(let error):
                print("导出失败: \(error)")
            }
        }
    }
}
