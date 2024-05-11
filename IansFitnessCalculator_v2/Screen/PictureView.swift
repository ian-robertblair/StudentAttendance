//
//  PictureView.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/4/28.
//

import SwiftUI

struct PictureView: View {
    @StateObject private var vm = PictureViewModel()
    @State private var showAddEntryView: Bool = false
    var body: some View {
        VStack {
            HeaderView(title: "Pictures")
            ScrollView {
                ForEach(vm.entries) { entry in
                    VStack {
                        entry.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                        Text("\(entry.date.formatted(date: .long, time: .omitted))")
                        Text(entry.caption)
                    }
                }
                VStack {
                    Button {
                        showAddEntryView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                    }
                    .tint(.blue)
                    .padding()

                }
            }
            Spacer()
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showAddEntryView, content: {
            AddEntryView(pictureViewModel: vm)
        })
    }
}

#Preview {
    PictureView()
        .modelContainer(DataController.previewContainer)
}
