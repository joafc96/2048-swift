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
        XCTAssert(getLeftMostColFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate(x: 0, y: 3)).y == 0, "getLeftMostColFrom.testLeftMostColFromGivenCoordinateOfAnEmptyBoardisZero: leftmost coordinate of given coorinate (0, 3) of an empty board should be zero.")
        XCTAssert(getLeftMostColFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate(x: 1, y: 2)).y == 0, "getLeftMostColFrom.testLeftMostColFromGivenCoordinateOfAnEmptyBoardisZero: leftmost coordinate of given coorinate (1, 2) of an empty board should be zero.")
        XCTAssert(getLeftMostColFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate(x: 2, y: 1)).y == 0, "getLeftMostColFrom.testLeftMostColFromGivenCoordinateOfAnEmptyBoardisZero: leftmost coordinate of given coorinate (2, 1) of an empty board should be zero.")
        XCTAssert(getLeftMostColFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate(x: 3, y: 0)).y == 0, "getLeftMostColFrom.testLeftMostColFromGivenCoordinateOfAnEmptyBoardisZero: leftmost coordinate of given coorinate (3, 0) of an empty board should be zero.")
    }
    
    func getLeftMostColFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate) -> Coordinate{
        return engine.getLeftMostCoordinateFrom(coordinate)
    }
    
    func testMoveLeft() {
        engine.board[0][2] = TileValue.Two
        engine.board[0][3] = TileValue.Two
        engine.moveLeft()
        XCTAssert(engine.board[0][3] == nil)
        XCTAssert(engine.board[0][0] == TileValue.Four)
    }
    
    
    func testMoveRight() {
        engine.board[0][1] = TileValue.Two
        engine.board[0][0] = TileValue.Two
        engine.moveRight()

        engine.printBoard()

        XCTAssert(engine.board[0][0] == nil)
        XCTAssert(engine.board[0][3] == TileValue.Four)
    }
    
    
    func testTopMostFromGivenCoordinateOfAnEmptyBoardisZero() {
        XCTAssert(getTopMostFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate(x: 3, y: 3)).x == 0)
    }
    
    func getTopMostFromGivenCoordinateOfAnEmptyWith(coordinate: Coordinate) -> Coordinate{
        return engine.getTopMostCoordinateFrom(coordinate)
    }
    
    func testMoveUp() {
        engine.board[2][1] = TileValue.Two
        engine.board[3][1] = TileValue.Two
        engine.moveUp()

        engine.printBoard()

        XCTAssert(engine.board[3][1] == nil)
        XCTAssert(engine.board[0][1] == TileValue.Four)
    }
    
    

    override func tearDownWithError() throws {
        engine = nil
    }

}
