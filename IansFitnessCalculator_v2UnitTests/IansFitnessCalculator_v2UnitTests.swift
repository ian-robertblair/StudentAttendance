//
//  IansFitnessCalculator_v2UnitTests.swift
//  IansFitnessCalculator_v2UnitTests
//
//  Created by ian robert blair on 2024/4/29.
//

import XCTest


final class IansFitnessCalculator_v2UnitTests: XCTestCase {
    let bmrLowRate = 1.2
    let bmrMediumRate = 1.4
    let bmrHighRate = 1.6
    let bmrVeryHighRate = 1.8

    @MainActor func test_calculate_male_bmrLow_from_metric() {
        //Mifflin-St Jeor Equation
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "190"
        calculatorViewModel.weight = "120"
        calculatorViewModel.neck = "45"
        calculatorViewModel.waist = "110"
        calculatorViewModel.isMale = true
        calculatorViewModel.isMetric = true
        calculatorViewModel.calculate()
        let weight = Double(calculatorViewModel.weight)!
        let height = Double(calculatorViewModel.height)!
        let age = Double(calculatorViewModel.age)!
        let bmr = (10.0 * weight) + (6.25 * height) - (5.0 * age) + 5.0
        let bmrLow = bmr * bmrLowRate
        let bmrLowInt = Int(bmrLow)
        XCTAssertEqual(Int(calculatorViewModel.bmrLow)!, bmrLowInt)
    }
    
    @MainActor func test_calculate_male_bmrMediumfrom_metric() {
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "190"
        calculatorViewModel.weight = "120"
        calculatorViewModel.neck = "45"
        calculatorViewModel.waist = "110"
        calculatorViewModel.isMale = true
        calculatorViewModel.isMetric = true
        calculatorViewModel.calculate()
        let weight = Double(calculatorViewModel.weight)!
        let height = Double(calculatorViewModel.height)!
        let age = Double(calculatorViewModel.age)!
        let bmr = (10.0 * weight) + (6.25 * height) - (5.0 * age) + 5.0
        let bmrMedium = bmr * bmrMediumRate
        let bmrMediumInt = Int(bmrMedium)
        XCTAssertEqual(Int(calculatorViewModel.bmrMedium)!, bmrMediumInt)
    }
    
    @MainActor func test_calculate_male_bmrHigh_from_metric() {
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "190"
        calculatorViewModel.weight = "120"
        calculatorViewModel.neck = "45"
        calculatorViewModel.waist = "110"
        calculatorViewModel.isMale = true
        calculatorViewModel.isMetric = true
        calculatorViewModel.calculate()
        let weight = Double(calculatorViewModel.weight)!
        let height = Double(calculatorViewModel.height)!
        let age = Double(calculatorViewModel.age)!
        let bmr = (10.0 * weight) + (6.25 * height) - (5.0 * age) + 5.0
        let bmrHigh = bmr * bmrHighRate
        let bmrHighInt = Int(bmrHigh)
        XCTAssertEqual(Int(calculatorViewModel.bmrHigh)!, bmrHighInt)
    }

    @MainActor func test_calculate_male__bmrVeryHigh_from_metric() {
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "190"
        calculatorViewModel.weight = "120"
        calculatorViewModel.neck = "45"
        calculatorViewModel.waist = "110"
        calculatorViewModel.isMale = true
        calculatorViewModel.isMetric = true
        calculatorViewModel.calculate()
        let weight = Double(calculatorViewModel.weight)!
        let height = Double(calculatorViewModel.height)!
        let age = Double(calculatorViewModel.age)!
        let bmr = (10.0 * weight) + (6.25 * height) - (5.0 * age) + 5.0
        let bmrVeryHigh = bmr * bmrVeryHighRate
        let bmrVeryHighInt = Int(bmrVeryHigh)
        XCTAssertEqual(Int(calculatorViewModel.bmrVeryHigh)!, bmrVeryHighInt)
    }

    @MainActor func test_calculate_male_bodyFat_from_metric() {
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "190"
        calculatorViewModel.weight = "120"
        calculatorViewModel.neck = "45"
        calculatorViewModel.waist = "110"
        calculatorViewModel.isMale = true
        calculatorViewModel.isMetric = true
        calculatorViewModel.calculate()
        
        let waistNeckLog = log10(Double(calculatorViewModel.waist)! - Double(calculatorViewModel.neck)!)
        let heightLog = log10(Double(calculatorViewModel.height)!)
        let denominator = 1.0324 - 0.19077 * waistNeckLog + 0.15456 * heightLog
        let dividedFrom = 495 / denominator
        let result = dividedFrom - 450.0
        
        XCTAssertEqual(Int(calculatorViewModel.bodyFat)!, Int(result))
    }
    
    @MainActor func test_calculate_male_bodyFat_from_standard() {
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "190"
        calculatorViewModel.weight = "120"
        calculatorViewModel.neck = "45"
        calculatorViewModel.waist = "110"
        calculatorViewModel.isMale = true
        calculatorViewModel.isMetric = false
        
        let waistNeckLog = log10(Double(calculatorViewModel.waist)! - Double(calculatorViewModel.neck)!)
        let heightLog = log10(Double(calculatorViewModel.height)!)
        let denominator = 1.0324 - 0.19077 * waistNeckLog + 0.15456 * heightLog
        let dividedFrom = 495 / denominator
        let result = dividedFrom - 450.0
        //XCTAssertEqual(Double(calculatorViewModel.bodyFat)!, result)
    }
    
    @MainActor func test_calculate_female_bmrLow_from_metric() {
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "150"
        calculatorViewModel.weight = "60"
        calculatorViewModel.neck = "22"
        calculatorViewModel.waist = "55"
        calculatorViewModel.hip = "70"
        calculatorViewModel.isMale = false
        calculatorViewModel.isMetric = true
        XCTAssertEqual(calculatorViewModel.bmrLow, "3123")
    }
    
    @MainActor func test_calculate_female_bmrMediumfrom_metric() {
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "150"
        calculatorViewModel.weight = "60"
        calculatorViewModel.neck = "22"
        calculatorViewModel.waist = "55"
        calculatorViewModel.hip = "70"
        calculatorViewModel.isMale = false
        calculatorViewModel.isMetric = true
        XCTAssertEqual(calculatorViewModel.bmrMedium, "3123")
    }
    
    @MainActor func test_calculate_female_bmrHigh_from_metric() {
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "150"
        calculatorViewModel.weight = "60"
        calculatorViewModel.neck = "22"
        calculatorViewModel.waist = "55"
        calculatorViewModel.hip = "70"
        calculatorViewModel.isMale = false
        calculatorViewModel.isMetric = true
        XCTAssertEqual(calculatorViewModel.bmrHigh, "3123")
    }

    @MainActor func test_calculate_female__bmrVeryHigh_from_metric() {
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "150"
        calculatorViewModel.weight = "60"
        calculatorViewModel.neck = "22"
        calculatorViewModel.waist = "55"
        calculatorViewModel.hip = "70"
        calculatorViewModel.isMale = false
        calculatorViewModel.isMetric = true
        XCTAssertEqual(calculatorViewModel.bmrVeryHigh, "3123")
    }

    @MainActor func test_calculate_female_bodyFat_from_metric() {
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "150"
        calculatorViewModel.weight = "60"
        calculatorViewModel.neck = "22"
        calculatorViewModel.waist = "55"
        calculatorViewModel.hip = "70"
        calculatorViewModel.isMale = false
        calculatorViewModel.isMetric = true
        calculatorViewModel.calculate()
        let waistNeckLog = log10(Double(calculatorViewModel.waist)! + Double(calculatorViewModel.hip)!  - Double(calculatorViewModel.neck)!)
        let heightLog = log10(Double(calculatorViewModel.height)!)
        let denominator = 1.29579 - 0.35004 * waistNeckLog + 0.22100 * heightLog
        let dividedFrom = 495 / denominator
        let result = dividedFrom - 450.0
        XCTAssertEqual(Int(calculatorViewModel.bodyFat)!, Int(result))
    }
    
    @MainActor func test_calculate_female_bodyFat_from_standard() {
        let calculatorViewModel = CalculatorViewModel()
        calculatorViewModel.age = "40"
        calculatorViewModel.height = "150"
        calculatorViewModel.weight = "60"
        calculatorViewModel.neck = "22"
        calculatorViewModel.waist = "55"
        calculatorViewModel.hip = "70"
        calculatorViewModel.isMale = false
        calculatorViewModel.isMetric = false
        
        let waistNeckLog = log10(Double(calculatorViewModel.waist)! - Double(calculatorViewModel.neck)!)
        let heightLog = log10(Double(calculatorViewModel.height)!)
        let denominator = 1.29579 - 0.35004 * waistNeckLog + 0.22100 * heightLog
        let dividedFrom = 495 / denominator
        let result = dividedFrom - 450.0
        //XCTAssertEqual(Int(calculatorViewModel.bodyFat)!, Int(result))
    }

}
