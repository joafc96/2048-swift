//
//  2048Engine.swift
//  2048
//
//  Created by qbuser on 10/12/22.
//

import Foundation

class TwoZeroFourEightEngine<T: Evolvable> {
        
    private var board: Array<Array<T?>>
    private let dimension: Int
    
    init(dimension: Int) {
        self.dimension = dimension
        self.board = Array<Array<T?>>(repeating: Array(repeating: nil, count: dimension), count: dimension)
    }
    
    // MARK: - Left Configurations
    private func moveLeft() {
        
        var actions = [MoveAction<T>]()
        
        for row in 0..<self.dimension {
            var prevEntrySeenColIndex: Int?
            for col in 0..<self.dimension {
                
                if let currentEntry = self.board[row][col] {
                    if let prevColIndex = prevEntrySeenColIndex {
                        // An entry was seen and was stored previously
                        if currentEntry == self.board[row][prevColIndex] {
                            let currentCoordinate = Coordinate(x: row, y: col)
                            let prevCoordinate = Coordinate(x: row, y: prevColIndex)
                            let leftmostCoordinate  = getLeftMostCooridnateFrom(prevCoordinate)
                            
                            // Merge
                            if let evolved = currentEntry.evolve() {
                                // Create a MoveAction.Merge that have sources [row][temp] and [row][col] and ends up in [row][leftmost]
                            }
                
                            // Update board
                            self.board[row][leftmostCoordinate.y] = self.board[row][col]?.evolve()
                            self.board[row][prevColIndex] = nil
                            
                            // If we are on the leftmost edge, we don't want to set this to
                            // nil because we just set it to the evolved value
                            if leftmostCoordinate.y != prevColIndex {
                                self.board[row][prevColIndex] = nil
                            }
                            
                            // set the previously seen col index to nil as it is now merged and moved
                            prevEntrySeenColIndex = nil
                        } else {
                            // No merge. Try to Move the piece from tempCol left instead
                            let prevCoordinate = Coordinate(x: row, y: prevColIndex)
                            if let moveAction = moveTileAsFarLeftAsPossibleFromCurrent(prevCoordinate) {
                                actions.append(moveAction)
                            }
                            
                            if col == self.dimension - 1 {
                                // No more pieces to try to merge with. Just move the last piece left
                                let curCoordinate = Coordinate(x: row, y: col)
                                if let moveAction = moveTileAsFarLeftAsPossibleFromCurrent(curCoordinate) {
                                    actions.append(moveAction)
                                }
                            } else {
                                // Whatever was prev seen col index, did not result in a merge. Trying again with the current col.
                                prevEntrySeenColIndex = col
                            }
                        }
                    } else {
                        //
                        if col == self.dimension - 1 {
                            // Currently on the right edge. No need to store this to check for merging. Can just move it to th leftmost
                            let curCoordinate = Coordinate(x: row, y: col)
                            if let moveAction = moveTileAsFarLeftAsPossibleFromCurrent(curCoordinate) {
                                actions.append(moveAction)
                            }
                            
                        } else {
                            prevEntrySeenColIndex = col
                        }
                    }
                    
                } else {
                    // No entry
                    if let prevEntryCol = prevEntrySeenColIndex {
                        if col == self.dimension - 1 {
                            // Currently at the right edge, so check if any previous value was seen or stored and if yes move it to the left
                            let prevCoordinate = Coordinate(x: row, y: prevEntryCol)
                            if let moveAction = moveTileAsFarLeftAsPossibleFromCurrent(prevCoordinate) {
                                actions.append(moveAction)
                            }
                        }
                    }
                }
            }
            // Reassign it as nil to start a fresh row
            prevEntrySeenColIndex = nil
        }
        
    }
    
    func moveTileAsFarLeftAsPossibleFromCurrent(_ coordinate: Coordinate)  -> MoveAction<T>? {
        var action: MoveAction<T>? = nil
        
        // current coordinate values
        let currentRow = coordinate.x
        let currentCol = coordinate.y
        
        // leftmost coordinate & column
        let leftmostCoordinate  = getLeftMostCooridnateFrom(coordinate)
        let leftmostCol = leftmostCoordinate.y
     
        if leftmostCol != currentCol {
            action = MoveAction.Move(from: coordinate, to: leftmostCoordinate)
            
            // update board
            self.board[currentRow][leftmostCol] = self.board[currentRow][currentCol]
            self.board[currentRow][currentCol] = nil
        }
        return action
    }
    
    func getLeftMostCooridnateFrom(_ coordinate: Coordinate) -> Coordinate {
        var leftmostCol = coordinate.y
        let currentRow = coordinate.x
        while (leftmostCol > 0 && self.board[currentRow][leftmostCol] == nil) {
            leftmostCol -= 1
        }
        
        return Coordinate(x: currentRow, y: leftmostCol)
    }
    
}
