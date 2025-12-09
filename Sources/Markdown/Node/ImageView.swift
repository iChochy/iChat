//
//  ImageView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//

import SwiftUI
import Markdown

// 图片视图
struct ImageView: View {
    let image: Markdown.Image
    @State private var nsImage: NSImage?
    @State private var isLoading = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let nsImage = nsImage {
                SwiftUI.Image(nsImage: nsImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                    .cornerRadius(8)
            } else if isLoading {
                ProgressView()
                    .frame(height: 100)
            } else {
                HStack {
                    SwiftUI.Image(systemName: "photo")
                    Text(image.title ?? image.source ?? "图片")
                        .foregroundColor(.secondary)
                }
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }
            
            if let title = image.title, !title.isEmpty {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
            }
        }
        .onAppear {
            loadImage()
        }
    }
    
    func loadImage() {
        guard let source = image.source else { return }
        
        // 如果是 URL
        if source.hasPrefix("http://") || source.hasPrefix("https://") {
            isLoading = true
            guard let url = URL(string: source) else {
                isLoading = false
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, _, _ in
                DispatchQueue.main.async {
                    isLoading = false
                    if let data = data, let image = NSImage(data: data) {
                        nsImage = image
                    }
                }
            }.resume()
        } else {
            // 如果是本地文件路径
            if let image = NSImage(contentsOfFile: source) {
                nsImage = image
            }
        }
    }
}
