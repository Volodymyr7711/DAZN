//
//  BaseCell.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 15/05/2023.
//

import SwiftUI

struct BaseRow: View {
    // MARK: - PROPERTIES
    /// Title label
    var title: String
    /// Subtitle label
    var subtitle: String
    /// Image of event
    var image: String
    /// Date of specific event
    var date: String

    init(event: BaseModel) {
        self.title = event.title
        self.subtitle = event.subtitle
        self.image = event.imageUrl
        self.date = event.date
    }
    
    init(schedule: ScheduleModel) {
        self.title = schedule.title
        self.subtitle = schedule.subtitle
        self.image = schedule.imageUrl
        self.date = schedule.date
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                imageView
                    .padding(.top)
                VStack(alignment: .leading, spacing: 5) {
                    titleView
                        .padding(.top)
                    subtitleView
                        .padding(.bottom)
                    dateView
                        .padding(.top)
                }
            }
        }
    }
}

struct EventCell_Previews: PreviewProvider {
     static var title: String = "ManCity vs Chelsea"
     static var subtitle: String = "Dazn live"
     static var image: String = "defaultImage"
     static var date: String = "2012-23-5"

    static var previews: some View {
        BaseRow(
            event:
                BaseModel(
                    id: "1",
                    title: title,
                    subtitle: subtitle,
                    date: date,
                    imageUrl: image,
                    videoUrl: ""
                )
        )
    }
}
