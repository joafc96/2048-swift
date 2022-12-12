//
//  _048Tests.swift
//  2048Tests
//
//  Created by qbuser on 12/12/22.
//

import XCTest
@testable import TwoZeroFourEight

final class TwoZeroFourEightTests: XCTestCase {
    
    var engine: TwoZeroFourEightEngine<TileValue>!
    let dimensions = 4

    override func setUpWithError() throws {
        engine = TwoZeroFourEightEngine<TileValue>(dimension: dimensions)
    }

    func testLeftMostColFromGivenCoordinateOfAnEmptyBoardisZero() {
        XCTAssert(getLeftMostColFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate(x: 0, y: 3)) == 0, "getLeftMostColFrom.testLeftMostColFromGivenCoordinateOfAnEmptyBoardisZero: leftmost coordinate of given coorinate (0, 3) of an empty board should be zero.")
        XCTAssert(getLeftMostColFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate(x: 1, y: 2)) == 0, "getLeftMostColFrom.testLeftMostColFromGivenCoordinateOfAnEmptyBoardisZero: leftmost coordinate of given coorinate (1, 2) of an empty board should be zero.")
        XCTAssert(getLeftMostColFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate(x: 2, y: 1)) == 0, "getLeftMostColFrom.testLeftMostColFromGivenCoordinateOfAnEmptyBoardisZero: leftmost coordinate of given coorinate (2, 1) of an empty board should be zero.")
        XCTAssert(getLeftMostColFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate(x: 3, y: 0)) == 0, "getLeftMostColFrom.testLeftMostColFromGivenCoordinateOfAnEmptyBoardisZero: leftmost coordinate of given coorinate (3, 0) of an empty board should be zero.")
    }
    
    func getLeftMostColFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate) -> Int{
        return engine.getLeftMostColFrom(start: Coordinate(x: 0, y: 2))
    }
    

    override func tearDownWithError() throws {
        engine = nil
    }

}
