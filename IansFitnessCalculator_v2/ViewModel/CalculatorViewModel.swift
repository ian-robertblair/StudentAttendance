//
//  CalculatorViewModel.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/4/28.
//

import Foundation
import SwiftUI

@MainActor
final class CalculatorViewModel: ObservableObject {
    @Published var isMetric: Bool
    @Published var isMale: Bool
    @Published var age: String
    @Published var height: String
    @Published var weight: String
    @Published var neck: String
    @Published var waist: String
    @Published var hip: String
    @Published var bmrLow: String
    @Published var weightLossLow: String
    @Published var bmrMedium: String
    @Published var weightLossMedium: String
    @Published var bmrHigh: String
    @Published var weightLossHigh: String
    @Published var bmrVeryHigh: String
    @Published var weightLossVeryHigh: String
    @Published var bodyFat: String
    @Published var isCalculated: Bool
    let bmrLowRate = 1.2
    let bmrMediumRate = 1.4
    let bmrHighRate = 1.6
    let bmrVeryHighRate = 1.8
    let weighLoss = 500
    
    init(isMetric: Bool = true, isMale:Bool = true, age: String = "", height: String = "", weight: String = "", neck: String = "", waist: String = "", hip: String = "", bmrLow: String = "", bmrMedium: String = "", bmrHigh: String = "", bmrVeryHigh: String = "", bodyFat: String = "", isCalculated: Bool = false, weightLossLow: String = "", weightLossMedium: String = "", weightLossHigh: String = "", weightLossVeryHigh: String = "") {
        self.isMetric = isMetric
        self.isMale = isMale
        self.age = age
        self.height = height
        self.weight = weight
        self.neck = neck
        self.waist = waist
        self.hip = hip
        self.bmrLow = bmrLow
        self.bmrMedium = bmrMedium
        self.bmrHigh = bmrHigh
        self.bmrVeryHigh = bmrVeryHigh
        self.bodyFat = bodyFat
        self.isCalculated = isCalculated
        self.weightLossLow = weightLossLow
        self.weightLossMedium = weightLossMedium
        self.weightLossHigh = weightLossHigh
        self.weightLossVeryHigh = weightLossVeryHigh
    }
    
    func clear() {
    isMetric = true
    isMale = true
    age = ""
    height = ""
    weight = ""
    neck = ""
    waist = ""
    hip = ""
    bmrLow = ""
    bmrMedium = ""
    bmrHigh = ""
    bmrVeryHigh = ""
    bodyFat = ""
    isCalculated = false
    }
    
    func calculate() {
        //TODO: - Calculate BMR and BodyFat - throw error if invalid values
        print("calculate \(Date.now.formatted(date: .abbreviated, time: .shortened))")
        print("is male: \(isMale), metric: \(isMetric)")
        if isMale {
            if let weightDouble = Double(weight), let ageDouble = Double(age), let heightDouble = Double(height), let neckDouble = Double(neck), let waistDouble = Double(waist) {
                if !isMetric {
                    
                } else {
                    print("is Male and metric")
                    //Calculate Body Fat for Males - Metric
                    let waistNeckLog = log10(waistDouble - neckDouble)
                    let heightLog = log10(heightDouble)
                    let denominator = 1.0324 - 0.19077 * waistNeckLog + 0.15456 * heightLog
                    let dividedFrom = 495 / denominator
                    let bodyFatDouble = dividedFrom - 450.0
                    let bodyFatInt = Int(bodyFatDouble)
                    self.bodyFat = String(bodyFatInt)
                    
                    //Calculate BMR for Males - Metric
                    let bmr = (10.0 * weightDouble) + (6.25 * heightDouble) - (5.0 * ageDouble) + 5.0
                    let bmrLowDouble = bmr * bmrLowRate
                    let bmrMediumDouble = bmr * bmrMediumRate
                    let bmrHighDouble = bmr * bmrHighRate
                    let bmrVeryHighDouble = bmr * bmrVeryHighRate
                    let bmrLowInt = Int(bmrLowDouble)
                    let bmrMedInt = Int(bmrMediumDouble)
                    let bmrHighInt = Int(bmrHighDouble)
                    let bmrVeryHighInt = Int(bmrVeryHighDouble)
                    self.bmrLow = String(bmrLowInt)
                    self.weightLossLow = String(bmrLowInt - weighLoss)
                    self.bmrMedium = String(bmrMedInt)
                    self.weightLossMedium = String(bmrMedInt - weighLoss)
                    self.bmrHigh = String(bmrHighInt)
                    self.weightLossHigh = String(bmrHighInt - weighLoss)
                    self.bmrVeryHigh = String(bmrVeryHighInt)
                    self.weightLossVeryHigh = String(bmrVeryHighInt - weighLoss)
                    print(self.bodyFat)
                    print(self.bmrLow)
                    
                }
            }
            
        } else {
            if let heightDouble = Double(height), let neckDouble = Double(neck), let waistDouble = Double(waist), let hipDouble = Double(hip) {
                if !isMetric {
                    
                } else {
                    //Calculate Body Fat for Females - Metric
                    let waistHipNeckLog = log10(waistDouble + hipDouble - neckDouble)
                    let heightLog = log10(heightDouble)
                    let denom = 1.29579 - 0.35004 * waistHipNeckLog + 0.22100 * heightLog
                    let dividedFrom = 495 / denom
                    let bodyFatDouble = dividedFrom - 450.0
                    let bodyFatInt = Int(bodyFatDouble)
                    self.bodyFat = String(bodyFatInt)
                }
            }
        }
    }
    
    func save() {
        
    }
}
