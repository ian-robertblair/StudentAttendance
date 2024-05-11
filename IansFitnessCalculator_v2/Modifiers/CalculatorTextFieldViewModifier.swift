//
//  CalculatorTextFieldViewModifier.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/4/30.
//

import Foundation
import SwiftUI


struct CalculatorTextFieldViewModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(width: 55)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 2)
                )
        }
        
        
    }

