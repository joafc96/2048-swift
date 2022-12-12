//
//  ViewController.swift
//  2048
//
//  Created by joe on 07/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        
        view.backgroundColor = .systemPink
        let tile01 = Tile(value: TileValue(score: 2), position: Coordinate(x: 0, y: 1))
        
        let tile12 = Tile(value: TileValue(score: 2), position: Coordinate(x: 1, y: 2))
        


    }


}

