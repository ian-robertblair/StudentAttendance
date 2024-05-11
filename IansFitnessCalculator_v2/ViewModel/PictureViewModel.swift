//
//  PictureViewModel.swift
//  IansFitnessCalculator_v2
//
//  Created by ian robert blair on 2024/5/5.
//

import Foundation
import SwiftUI
import PhotosUI

@MainActor
final class PictureViewModel: ObservableObject {
    @Published var entries: [PictureEntry] = []
}

struct PictureEntry: Identifiable {
    let id: UUID = UUID()
    let image: Image
    let caption: String
    let date: Date
}
