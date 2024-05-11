//
//  IansFitnessCalculator_v2App.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/4/28.
//

import SwiftUI
import SwiftData

@main
struct IansFitnessCalculator_v2App: App {
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .modelContainer(DataController.previewContainer)
        }
    }
}

/*
 
 Tasks:
    - Find a new blue color
    - Add a slider to shift calories (save setting in user defaults
 
 
 */
