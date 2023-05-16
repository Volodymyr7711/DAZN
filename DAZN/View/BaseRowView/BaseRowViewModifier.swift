//
//  BaseRowViewModifier.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 16/05/2023.
//

import Foundation
import SwiftUI

class BaseRowViewModifier {
    
    enum Constants {
        static let titleFontSize: CGFloat = 12.0
        static let subtitleFontSize: CGFloat = 11.0
        static let dateFontSize: CGFloat = 10.0
        static let lineLimit: Int = 0
        static let width: CGFloat = 140.0
        static let height: CGFloat = 140.0
        static let scaleEffect: CGFloat = 1.0
        static let cornerRadius: CGFloat = 30.0
    }

    struct TitleViewModifier: ViewModifier {
        @Environment(\.colorScheme) var colorScheme

        func body(content: Content) -> some View {
            content
                .lineLimit(Constants.lineLimit)
                .font(.system(size: Constants.titleFontSize))
                .fontWidth(.standard)
                .fontWeight(.bold)
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
        }
    }
    
    struct SubtitleViewModifier: ViewModifier {
        @Environment(\.colorScheme) var colorScheme

        func body(content: Content) -> some View {
            content
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                .lineLimit(Constants.lineLimit)
                .font(.system(size: Constants.subtitleFontSize))
                .fontWidth(.standard)
                .fontWeight(.light)
        }
    }
    
    struct DateViewModifier: ViewModifier {
        @Environment(\.colorScheme) var colorScheme

        func body(content: Content) -> some View {
            content
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                .fontWeight(.ultraLight)
                .lineLimit(Constants.lineLimit)
                .font(.system(size: Constants.dateFontSize))
        }
    }
    
    struct ImageViewModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(
                    width: Constants.width,
                    height: Constants.height,
                    alignment: .leading
                )
                .scaleEffect(Constants.scaleEffect)
                .cornerRadius(Constants.cornerRadius)
        }
    }
}
