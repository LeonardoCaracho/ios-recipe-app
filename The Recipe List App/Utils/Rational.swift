//
//  Rational.swift
//  The Recipe List App
//
//  Created by Leonardo Caracho on 09/03/23.
//

import Foundation

struct Rational {
    static func greatestCommonDividor(_ a:Int, _ b:Int) -> Int {
        if a == 0 { return b }
        if b == 0 { return a }
        
        return greatestCommonDividor(b, a % b)
    }
}
