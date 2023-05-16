//
//  BackButtonView.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 15/05/2023.
//

import SwiftUI

struct BackButtonView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode

    let label: String

    // MARK: - BODY
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            AVPlayerHelper.shared.pause()
        }) {
            HStack {
                Images.backButton
                Text(label)
            }
            .foregroundColor(Color.white)
        }
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let label: String = Strings.textPlaceholdder
        BackButtonView(label: label)
            .previewLayout(.sizeThatFits)
            .padding(40)
    }
}
