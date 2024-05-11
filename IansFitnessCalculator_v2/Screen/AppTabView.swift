//
//  AppTabView.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/4/28.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            CalculatorView()
                .tabItem { Image(systemName: "plus.rectangle.on.rectangle") }
            ChartView()
                .tabItem { Image(systemName: "chart.line.downtrend.xyaxis") }
            PictureView()
                .tabItem { Image(systemName: "photo.stack") }
            RecordDataView()
                .tabItem { Image(systemName: "list.bullet") }
        }
        .tint(.blue)
    }
}

#Preview {
    AppTabView()
        .modelContainer(DataController.previewContainer)
}
