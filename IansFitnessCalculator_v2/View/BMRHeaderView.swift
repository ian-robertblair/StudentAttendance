//
//  BMRHeaderView.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/5/4.
//

import SwiftUI

struct BMRHeaderView: View {
    var body: some View {
        HStack {
            Text("Activity")
                .foregroundStyle(.white)
                .frame(width: 180, height: 50)
                .background(.blue)
               
            Text("Calories")
                .foregroundStyle(.white)
                .frame(width: 70, height: 50)
                .background(.blue)
                
            Text("Weight Loss")
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .frame(width: 65, height: 50)
                .background(.blue)
        }
    }
}

#Preview {
    BMRHeaderView()
}
