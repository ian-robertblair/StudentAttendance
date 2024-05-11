//
//  ChartView.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/4/28.
//

import SwiftUI
import Charts

struct ChartView: View {
    @Environment(\.modelContext) private var context
    @State private var records: [FitnessRecord] = []
    var body: some View {
        VStack {
            HeaderView(title: "Charts")
            Text("Number of records: \(records.count)")
            Chart(records) { record in
                LineMark(x: .value("day", record.recordDate), y: .value("weight", record.weight))
            }
            .frame(height: 300)
            
            Spacer()
        }
        .onAppear {
            records = DataController.records
        }
        .ignoresSafeArea()
       
    }
}

#Preview {
    ChartView()
        .modelContainer(DataController.previewContainer)
}
