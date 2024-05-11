//
//  HeaderView.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/4/28.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    var body: some View {
        VStack {
            Spacer()
            Text(title)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    HeaderView(title: "Calculator")
}
