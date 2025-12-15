//
//  ShareData.swift
//  iUploader
//
//  Created by Lion on 2025/3/21.
//

import CoreTransferable
import SwiftUI
import UniformTypeIdentifiers

struct ShareFile: Transferable {
    let data: Data?
    let name: String

    static var transferRepresentation: some TransferRepresentation {
        
        FileRepresentation(exportedContentType: .png) { item in
            guard let data = item.data else {
                fatalError()
            }
            // 动态创建临时文件
            let tempURL = FileManager.default.temporaryDirectory
                .appendingPathComponent(item.name)
                .appendingPathExtension("png")

            // 将 Data 写入临时文件（如果文件已存在，先删除）
            if FileManager.default.fileExists(atPath: tempURL.path) {
                try? FileManager.default.removeItem(at: tempURL)
            }
            try data.write(to: tempURL)

            // 返回 SentTransferredFile，系统会处理传输和清理
            return SentTransferredFile(tempURL)
        }
    }
}
