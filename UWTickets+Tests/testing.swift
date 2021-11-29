//
//  testing.swift
//  UWTickets+Tests
//
//  Created by Paresh on 11/19/21.
//

import Foundation
import XCTest
import Firebase
@testable import UWTickets_

class testStuff: XCTestCase {
    
//    func getAveragePrice(listings: [Listing]) -> Double {
//        var totalPrice = 0.00
//        for listing in listings {
//            var toAdd = Double(listing.askingPrice)
//            totalPrice += toAdd
//        }
//        return totalPrice / Double(listings.count)
//    }
//

    func testaverage() {

        let mockMarketplaceData = [
            Listing(id:"1", sellername: "sampleuser1", game: "Northwestern", logo: "NorthwesternLogo", askingPrice: "40.00"),
            Listing(id:"2", sellername: "sampleuser2", game: "Northwestern", logo: "NorthwesternLogo", askingPrice: "50.00"),
            Listing(id:"3", sellername: "sampleuser3", game: "Northwestern", logo: "NorthwesternLogo", askingPrice: "35.00"),
            Listing(id:"4", sellername: "sampleuser4", game: "Nebraska", logo: "NebraskaLogo", askingPrice: "65.00"),
            Listing(id:"5", sellername: "sampleuser5", game: "Northwestern", logo: "NorthwesternLogo", askingPrice: "40.00"),
            Listing(id:"6", sellername: "sampleuser6", game: "Northwestern", logo: "NorthwesternLogo", askingPrice: "45.00"),
            Listing(id:"7", sellername: "sampleuser7", game: "Nebraska", logo: "NebraskaLogo", askingPrice: "55.00"),
            Listing(id:"8", sellername: "sampleuser8", game: "Nebraska", logo: "NebraskaLogo", askingPrice: "60.00"),
            Listing(id:"9", sellername: "sampleuser9", game: "Nebraska", logo: "NebraskaLogo", askingPrice: "50.00"),
            Listing(id:"10", sellername: "sampleuser10", game: "Nebraska", logo: "NebraskaLogo", askingPrice: "59.00")
        ]

        XCTAssertEqual(getAveragePrice(listings: mockMarketplaceData), 49.9)
    }
//
//    func testNebraskaAverage() {
//
//        let mockMarketplaceData = [
//            Listing(id:1, sellername: "sampleuser4", game: "Nebraska", logo: "NebraskaLogo", listed: Date(), askingPrice: 65.00),
//            Listing(id:2, sellername: "sampleuser7", game: "Nebraska", logo: "NebraskaLogo", listed: Date(), askingPrice: 55.00),
//            Listing(id:3, sellername: "sampleuser8", game: "Nebraska", logo: "NebraskaLogo", listed: Date(), askingPrice: 60.00),
//            Listing(id:4, sellername: "sampleuser9", game: "Nebraska", logo: "NebraskaLogo", listed: Date(), askingPrice: 50.00),
//            Listing(id:5, sellername: "sampleuser10", game: "Nebraska", logo: "NebraskaLogo", listed: Date(), askingPrice: 59.00)
//        ]
//
//        XCTAssertEqual(getAveragePrice(listings: mockMarketplaceData), 57.8)
//    }
    
    
}
