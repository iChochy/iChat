//
//  ImageView.swift
//  iMenu
//
//  Created by OSX on 2025/12/3.
//

import Markdown
import SwiftUI
import UniformTypeIdentifiers

// 图片视图
struct ImageView: View {
    let image: Markdown.Image
    @State private var imgageData: Data?
    @State private var isLoading = false
    @State private var showSavePanel = false

    let shareName = "Share"

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 5) {
                Text((image.title ?? image.plainText).capitalized)
                Spacer()
                if let data = imgageData, let nsImage = NSImage(data: data) {

                    let document = ImageDocument(data: data, name: shareName)
                    ShareButtonView(document: document)

                    let photo = SharePhoto(
                        image: Image(nsImage: nsImage),
                        name: shareName
                    )
                    SharePhotoView(photo: photo)
                }
            }.font(.body.bold())
                .buttonStyle(.plain)
                .foregroundColor(.secondary)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.gray.opacity(0.15))
            if let data = imgageData, let nsImage = NSImage(data: data) {
                Image(nsImage: nsImage)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 4)
            } else if isLoading {
                ProgressView()
                    .frame(height: 100)
            } else {
                HStack {
                    Image(systemName: "photo")
                    Text(image.source ?? image.plainText)
                        .foregroundColor(.secondary)
                }
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
            }
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .onAppear {
            loadImage()
        }
    }

    func loadImage() {
        guard let source = image.source else { return }
        // 如果是 URL
        if source.hasPrefix("http://") || source.hasPrefix("https://") {
            guard let url = URL(string: source) else { return }
            isLoading = true
            URLSession.shared.dataTask(with: url) { data, _, _ in
                DispatchQueue.main.async {
                    isLoading = false
                    if let data = data {
                        imgageData = data
                    }
                }
            }.resume()
        } else {
            let fileURL = URL(fileURLWithPath: source)
            do {
                let data = try Data(contentsOf: fileURL)
                imgageData = data
            } catch {
                print("加载文件失败: \(error.localizedDescription)")
            }
        }
    }
}
