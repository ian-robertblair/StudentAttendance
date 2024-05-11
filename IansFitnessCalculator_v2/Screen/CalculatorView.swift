//
//  CalculatorView.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/4/28.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject private var vm = CalculatorViewModel()
    @State private var records: [FitnessRecord] = [] //DEBUG
    @Environment(\.modelContext) private var context
    var body: some View {
        VStack {
            //TitleBar
            HeaderView(title: "Calculator")
            Text("Number of records: \(records.count)")
            //VStack
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Picker("sex", selection: $vm.isMale) {
                            Text("Male").tag(true)
                            Text("Female").tag(false)
                        }
                        Spacer()
                        TextField("age", text: $vm.age)
                            .modifier(CalculatorTextFieldViewModifier())
                        Spacer()
                    }
                    .padding()
                    Picker("metric", selection: $vm.isMetric) {
                        Text("Metric").tag(true)
                        Text("Standard").tag(false)
                    }
                    Text(vm.isMetric ? "Enter in centimeters:" : "Enter in inches:")
                    HStack {
                        Spacer()
                        TextField("height", text: $vm.height)
                            .modifier(CalculatorTextFieldViewModifier())
                        Spacer()
                        TextField("weight", text: $vm.weight)
                            .modifier(CalculatorTextFieldViewModifier())
                        Spacer()
                    }
                    .padding()
                    HStack {
                        Spacer()
                        TextField("neck", text: $vm.neck)
                            .modifier(CalculatorTextFieldViewModifier())
                        Spacer()
                        TextField("waist", text: $vm.waist)
                            .modifier(CalculatorTextFieldViewModifier())
                        Spacer()
                        if !vm.isMale {
                            TextField("hip", text: $vm.hip)
                                .modifier(CalculatorTextFieldViewModifier())
                            Spacer()
                        }
                    }
                    .padding()
                    
                }
                .keyboardType(.numberPad)
                .padding(.top, 10)
            .padding()
                
                Button {
                    print("calculated: \(vm.isCalculated)")
                    if !vm.isCalculated {
                        vm.isCalculated = true
                        vm.calculate()
                    } else {
                        print("saving record")
                        if let weightInt = Int(vm.weight), let heightInt = Int(vm.height), let neckInt = Int(vm.neck), let waistInt = Int(vm.waist) {
                           
                            context.insert(FitnessRecord(weight: weightInt, height: heightInt, waist: waistInt, hip: Int(vm.hip) ?? 0, neck: neckInt, isMetric: vm.isMetric))
                            let result: ()? = try? context.save()
                            print("save result: \(result.debugDescription)")
                            vm.isCalculated = false
                            vm.clear()
                            records = DataController.records //Debug
                        }
                        
                    }
                } label: {
                    Text(vm.isCalculated ? "Save" : "Calculate" )
                        .font(.title)
                }
                .disabled(vm.height.isEmpty || vm.weight.isEmpty || vm.neck.isEmpty || vm.waist.isEmpty)
                .buttonStyle(BorderedProminentButtonStyle())
                .padding()
                if vm.isCalculated {
                    Button {
                        vm.isCalculated = false
                        vm.clear()
                    } label: {
                        Text("Clear")
                    }
                }
                
                if !vm.bodyFat.isEmpty {
                    //Body Fat
                    BodyFatBMRView(bodyFat: vm.bodyFat, bmrLow: vm.bmrLow, bmrMedium: vm.bmrMedium, bmrHigh: vm.bmrHigh, bmrVeryHigh: vm.bmrVeryHigh, weightLossLow: vm.weightLossLow, weightLossMedium: vm.weightLossMedium, weightLossHigh: vm.weightLossHigh, weightLossVeryHigh: vm.weightLossVeryHigh)
                } //If
            }
        }
        .onAppear {
            records = DataController.records //Debug
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CalculatorView()
        .modelContainer(DataController.previewContainer)
}
