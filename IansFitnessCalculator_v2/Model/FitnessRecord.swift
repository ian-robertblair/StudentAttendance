//
//  FitnessRecord.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/5/6.
//

import Foundation
import SwiftUI
import SwiftData

@Model
final class FitnessRecord {
    var id: UUID
    var recordDate: Date
    var weight: Int
    var height: Int
    var waist: Int
    var hip: Int
    var neck: Int
    var isMetric: Bool
    
    init(id: UUID = UUID(), recordDate: Date = Date.now, weight: Int, height: Int, waist: Int, hip: Int, neck: Int, isMetric: Bool) {
        self.id = id
        self.recordDate = recordDate
        self.weight = weight
        self.height = height
        self.waist = waist
        self.hip = hip
        self.neck = neck
        self.isMetric = isMetric
    }
}
