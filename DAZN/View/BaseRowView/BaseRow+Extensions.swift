//
//  BaseRow+Extensions.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 15/05/2023.
//

import Foundation
import SwiftUI

extension BaseRow {
    // Setup title label
    var titleView: some View {
        Text(title)
            .titleViewStyle()
    }

    // Setup subtitle label
    var subtitleView: some View {
        Text(subtitle)
            .subtitleViewStyle()
    }

    // Setup imageView label using AsyncImage
    var imageView: some View {
        AsyncImage(
            url: URL(string: "\(image)")) { image in
                image
                    .imageStyle()
            } placeholder: {
                Color.gray
                    .placeholderStyle()
            }
            .imageViewStyle()
    }

    // Setup dateView with proper format
    var dateView: some View {
        Text(date.getFormattedDate())
            .dateViewStyle()
    }
}
