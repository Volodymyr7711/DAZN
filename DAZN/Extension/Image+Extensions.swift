//
//  Image+Extensions.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 16/05/2023.
//

import Foundation
import SwiftUI

extension Image {
    func imageStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 140, height: 140, alignment: .leading)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}
