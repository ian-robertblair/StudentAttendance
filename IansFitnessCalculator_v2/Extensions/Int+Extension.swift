//
//  Int+Extension.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/5/1.
//

import Foundation

extension Double {
    var lengthConversion: Double {
        return (self / 2.54)
    }
    
    var heightConversion: Double {
        return (self * 2.20462262 )
    }
}
