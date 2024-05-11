//
//  AddEntryView.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/5/5.
//

import SwiftUI
import PhotosUI

struct AddEntryView: View {
    let pictureViewModel: PictureViewModel
    @State private var photo: PhotosPickerItem?
    @State private var selected: Image = Image(systemName: "person.crop.rectangle.badge.plus")
    @State private var placeholder: Image = Image(systemName: "person.crop.rectangle.badge.plus")
    @State private var caption: String = ""
    @State private var postDate: Date = Date.now
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            
            PhotosPicker(selection: $photo, matching: .images) {
                                //Text("Pick Photo")
                selected
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            TextField("weight", text: $caption)
                .padding()
                .frame(width: 200, height: 60)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 2)
                )
            Button {
                pictureViewModel.entries.append(PictureEntry(image: selected, caption: caption, date: postDate))
                dismiss()
            } label: {
                Text("Save")
                    .font(.title)
               
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .padding()

            
            
        }
        .onChange(of: photo) { _, _ in
            Task {
                if let loaded = try? await photo?.loadTransferable(type: Image.self) {
                    selected = loaded
                }
            }
        }
    }
}

#Preview {
    AddEntryView(pictureViewModel: PictureViewModel())
        .modelContainer(DataController.previewContainer)
}
