//
//  EventView.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 12/05/2023.
//

import Foundation
import SwiftUI

struct EventView: View {
    // MARK: - PROPERTIES
    @StateObject private var viewModel = EventViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(viewModel.sortedEventByDate, id: \.id) { event in
                NavigationLink(
                    destination:
                        VideoPlayerView(
                            videoURL: event.videoUrl,
                            navigationTitle: event.title
                        )
                ) {
                    BaseRow(event: event)
                }
            }
            .navigationViewStyle(text: .events)
            .onAppear {
                viewModel.startFetching(withInterval: 30, repeats: true)
                viewModel.fetchEvents()
            }
            .onDisappear {
                viewModel.stopFetching()
            }
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
