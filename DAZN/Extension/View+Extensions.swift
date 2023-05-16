//
//  View+Extensions.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 16/05/2023.
//

import Foundation
import SwiftUI

extension View {
    func titleViewStyle() -> some View {
        modifier(BaseRowViewModifier.TitleViewModifier())
    }
    
    func subtitleViewStyle() -> some View {
        modifier(BaseRowViewModifier.SubtitleViewModifier())
    }
    
    func dateViewStyle() -> some View {
        modifier(BaseRowViewModifier.DateViewModifier())
    }
    
    func imageViewStyle() -> some View {
        modifier(BaseRowViewModifier.ImageViewModifier())
    }
    
    func navigationViewStyle(text: BaseNavigationViewModifier.NavigationText) -> some View {
        modifier(BaseNavigationViewModifier.NavigationViewModifier(text: text))
    }
}
