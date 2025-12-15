//
//  ShareData.swift
//  iUploader
//
//  Created by Lion on 2025/3/21.
//

import CoreTransferable
import UniformTypeIdentifiers

struct ShareData: Transferable {
    let data: Data
    let name: String

    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(exportedContentType: .png) { item in
            item.data
        }
        .suggestedFileName(\.name)
    }
}
