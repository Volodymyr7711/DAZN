//
//  DAZNTests.swift
//  DAZNTests
//
//  Created by Volodymyr Mendyk on 12/05/2023.
//

import XCTest
@testable import DAZN

final class DAZNTests: XCTestCase {
    func testScheduleJson() {
        // Given
        let json = """
        {
        "id":"1",
        "title":"Liverpool v Porto",
        "subtitle":"UEFA Champions League",
        "date":"2023-05-16T03:20:27.224Z",
        "imageUrl":"https://firebasestorage.googleapis.com/v0/b/dazn-recruitment/o/310176837169_image-header_pDach_1554579780000.jpeg?alt=media&token=1777d26b-d051-4b5f-87a8-7633d3d6dd20"
        }
        """.data(using: .utf8)!

        // When
        let schedule = try! JSONDecoder().decode(ScheduleModel.self, from: json)

        // Then
        XCTAssertNotNil(schedule)
    }

    func testEventJson() {
        // Given
        let json = """
        {
        "id":"1",
        "title":"Liverpool v Porto",
        "subtitle":"UEFA Champions League",
        "date":"2023-05-16T03:20:27.224Z",
        "imageUrl":"https://firebasestorage.googleapis.com/v0/b/dazn-recruitment/o/310176837169_image-header_pDach_1554579780000.jpeg?alt=media&token=1777d26b-d051-4b5f-87a8-7633d3d6dd20",
        "videoUrl":"https://firebasestorage.googleapis.com/v0/b/dazn-recruitment/o/promo.mp4?alt=media"
        }
        """.data(using: .utf8)!
        
        // When
        let schedule = try! JSONDecoder().decode(BaseModel.self, from: json)

        // Then
        XCTAssertNotNil(schedule)
    }
    
    func testInvalidDate() throws {
        // Given
        let dateString = "2023-05-20"
        
        // When
        let formattedDate = dateString.getFormattedDate()
        
        // Then
        XCTAssertEqual(formattedDate, "Invalid date string")
    }
    
    func testGetFormattedDate() {
        // Today
        let todayString = "2023-05-17T09:30:00.000Z"
        XCTAssertEqual(todayString.getFormattedDate(), "Today, 11:30")
        
        // Yesterday
        let yesterdayString = "2023-05-16T14:45:00.000Z"
        XCTAssertEqual(yesterdayString.getFormattedDate(), "Yesterday, 16:45")
        
        // Tomorrow
        let tomorrowString = "2023-05-18T18:15:00.000Z"
        XCTAssertEqual(tomorrowString.getFormattedDate(), "Tomorrow, 20:15")
    }
}
