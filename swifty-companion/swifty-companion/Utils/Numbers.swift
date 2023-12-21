//
//  Numbers.swift
//  swifty-companion
//
//  Created by Celine Dine on 21/12/2023.
//

import Foundation

func getPercentageFromLevel(level: Double) -> Double {
    let decimalPart = level.truncatingRemainder(dividingBy: 1)
    let percentage = decimalPart * 100
    
    return percentage
}
