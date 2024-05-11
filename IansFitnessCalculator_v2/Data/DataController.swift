//
//  DataController.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/5/6.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
class DataController {
    static let ProductionContainer: ModelContainer =  {
        do {
            let container = try ModelContainer(for: FitnessRecord.self, configurations: .init(isStoredInMemoryOnly: false))
           
            return container
        } catch {
            fatalError("Failed to create production model container.")
        }
    }()
    
    static let previewContainer: ModelContainer =  {
        do {
            let container = try ModelContainer(for: FitnessRecord.self, configurations: .init(isStoredInMemoryOnly: true))
            let context = container.mainContext
            let newFitnessRecoreds = [
                FitnessRecord(weight: 110, height: 193, waist: 110, hip: 0, neck: 55, isMetric: true),
                FitnessRecord(recordDate: Date.now.addingTimeInterval(TimeInterval(-604800)), weight: 111, height: 193, waist: 110, hip: 0, neck: 55, isMetric: true),
                FitnessRecord(recordDate: Date.now.addingTimeInterval(TimeInterval(-(604800*2))), weight: 112, height: 193, waist: 110, hip: 0, neck: 55, isMetric: true),
                FitnessRecord(recordDate: Date.now.addingTimeInterval(TimeInterval(-(604800*3))), weight: 113, height: 193, waist: 110, hip: 0, neck: 55, isMetric: true),
                FitnessRecord(recordDate: Date.now.addingTimeInterval(TimeInterval(-(604800*4))), weight: 114, height: 193, waist: 110, hip: 0, neck: 55, isMetric: true)
            ]
            
            newFitnessRecoreds.forEach { record in
                context.insert(record)
            }
            //let newRecord = FitnessRecord(weight: 110, height: 193, waist: 110, hip: 0, neck: 55, isMetric: true)
            //context.insert(newRecord)
            try? context.save()
            return container
        } catch {
            fatalError("Failed to create preview model container.")
        }
    }()
    
    static var records: [FitnessRecord] {
        do {
            let fetchDescriptor = FetchDescriptor<FitnessRecord>(sortBy: [SortDescriptor(\.recordDate, order: .reverse)])
            return try DataController.previewContainer.mainContext.fetch(fetchDescriptor)
        } catch {
            return []
        }
    }
}
