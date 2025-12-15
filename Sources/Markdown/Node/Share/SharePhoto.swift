//
//  ShareData.swift
//  iUploader
//
//  Created by Lion on 2025/3/21.
//

import SwiftUI

struct SharePhoto: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation { item in
            guard let image = item.image else {
                fatalError()
            }
            return image
        }.suggestedFileName { item in
            item.name
        }
        
        
//        ProxyRepresentation(exporting: \.image).suggestedFileName(\.name)
        
//        ProxyRepresentation(exporting: \.image)
//            .suggestedFileName { item in
//                item.name
//            }
//

    }
    public var image: Image?
    public var name: String
}
