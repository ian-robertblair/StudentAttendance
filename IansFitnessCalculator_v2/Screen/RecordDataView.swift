//
//  RecordDataView.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/5/10.
//

import SwiftUI

struct RecordDataView: View {
    @Environment(\.modelContext) private var context
    @State private var records: [FitnessRecord] = []
    var body: some View {
        VStack {
            HeaderView(title: "Records")
            List {
                ForEach(records) { record in
                    HStack {
                        Text("\(record.recordDate.formatted(date: .abbreviated, time: .omitted))")
                        Spacer()
                        VStack {
                            Text("weight: \(record.weight)")
                            Text("height: \(record.height)")
                        }
                        VStack {
                            Text("waist: \(record.waist)")
                            Text("neck: \(record.neck)")
                            if record.hip > 0 {
                                Text("hip: ")
                            }
                        }
                    }
                }
                .onDelete(perform: deleteRecord)
            }
        }//VStack
        .onAppear {
            records = DataController.records
        }
        .ignoresSafeArea()
    }
    
    private func deleteRecord(indexSet: IndexSet) {
        indexSet.forEach { index in
            let record = records[index]
            context.delete(record)
        }
    }
    
    
}

#Preview {
    RecordDataView()
        .modelContainer(DataController.previewContainer)
}

