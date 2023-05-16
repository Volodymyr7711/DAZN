//
//  Color+Extensions.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 16/05/2023.
//

import Foundation
import SwiftUI

extension Color {
    func placeholderStyle() -> some View {
        self
            .frame(width: 128, height: 128)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}
