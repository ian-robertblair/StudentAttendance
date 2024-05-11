//
//  BodyFatBMRView.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/5/9.
//

import SwiftUI

struct BodyFatBMRView: View {
    let bodyFat: String
    let bmrLow: String
    let bmrMedium: String
    let bmrHigh: String
    let bmrVeryHigh: String
    let weightLossLow: String
    let weightLossMedium: String
    let weightLossHigh: String
    let weightLossVeryHigh: String
    var body: some View {
        //Body Fat
        HStack (alignment: .bottom) {
            Text("Body Fat: ")
                .font(.title2)
                
            Text("\(bodyFat)%")
                //.font(.system(size: 40))
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
        
               
        }
        .padding(.top, 40)
       
        //BMR Chart
        VStack {
            //Header
            BMRHeaderView()
            
            HStack {
                Text("Sedentary: little or no exercise.")
                    .frame(width: 180)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.vertical)
               
                    Text(bmrLow)
                        .frame(width: 70)
                    Text(weightLossLow)
                        .frame(width: 65)
                        .foregroundStyle(.green)
            }
            HStack {
                Text("You exercise lightly (1-3 days per week).")
                    .frame(width: 180)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.vertical)
               
                Text(bmrMedium)
                        .frame(width: 70)
                Text(weightLossMedium)
                        .frame(width: 65)
                        .foregroundStyle(.green)
            }
            HStack {
                Text("You exercise moderately (3-5 days per week).")
                    .frame(width: 180)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.vertical)
               
                Text(bmrHigh)
                        .frame(width: 70)
                Text(weightLossHigh)
                        .frame(width: 65)
                        .foregroundStyle(.green)
            }
            HStack {
                Text("You exercise heavily (6-7 days per week).")
                    .frame(width: 180)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.vertical)
               
                Text(bmrVeryHigh)
                        .frame(width: 70)
                Text(weightLossVeryHigh)
                        .frame(width: 65)
                        .foregroundStyle(.green)
            }
            HStack {
                
            }
            .frame(height: 40)
            
        }//VStack
        .padding()
    }
}

#Preview {
    BodyFatBMRView(bodyFat: "25", bmrLow: "3120", bmrMedium: "3632", bmrHigh: "3904", bmrVeryHigh: "4102", weightLossLow: "2620", weightLossMedium: "3132", weightLossHigh: "3404", weightLossVeryHigh: "3602")
}
