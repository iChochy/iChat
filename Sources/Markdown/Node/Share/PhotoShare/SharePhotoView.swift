//
//  PhotoShareView.swift
//  iChat
//
//  Created by OSX on 2025/12/14.
//

import SwiftUI


struct SharePhotoView: View {
    let photo: SharePhoto

    var body: some View {
        ShareLink(
            item: photo,
            preview: SharePreview(
                photo.name,
                image: photo
            )) {
                Image(systemName: "square.and.arrow.up")
            }
    }
}
