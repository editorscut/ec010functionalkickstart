//
//  ViewController.swift
//  Test
//
//  Created by Daniel Steinberg on 1/13/20.
//  Copyright © 2020 Dim Sum Thinking. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let line1 = line(m: 3, b: 4)
        print(line1(5))
        let line2 = Line(m: 5, b: 4)
        print(line2.yForX(5))
        print(line2(5))
        let fivePlus = sum(5)
        print(fivePlus(3))
        let sum = Sum()
        print(sum(5, 3))
    }
    
    func line(m slope: Int, b yIntercept: Int) -> (Int) -> Int {
        {x in slope * x + yIntercept}
    }
    
    func sum(_ x: Int) -> (Int) -> Int {
        {y in x + y}
    }
    
    struct Sum {
        func callAsFunction(_ x: Int, _ y: Int) -> Int {
            x + y
        }
    }
    
    struct Line {
        let m: Int
        let b: Int
        
        func yForX(_ x: Int) -> Int {
            m * x + b
        }
        
        func callAsFunction(_ x: Int) -> Int {
            m * x + b
        }
    }
    
    
}

