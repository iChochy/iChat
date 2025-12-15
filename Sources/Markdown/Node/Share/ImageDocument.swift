//
//  ImageDocument.swift
//  iChat
//
//  Created by OSX on 2025/12/15.
//

import SwiftUI
import UniformTypeIdentifiers

struct ImageDocument: FileDocument {

    var data: Data
    var name: String
    init(data:Data,name:String) {
        self.data = data
        self.name = name
    }
    
    static var readableContentTypes: [UTType] = [.png, .jpeg]
    init(configuration: ReadConfiguration) throws {
        fatalError()
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: data)
    }
}
