//
//  ContentViewModel.swift
//  pirateCompass
//
//  Created by Кристина Игоревна on 27.04.2025.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var angle: Double = 0
    @Published var flag: Bool = false
    @Published var rotation: Double = 0
    private var randomCount = 0
    
    func angleChange() {
        if !flag { angle += 5 }
        if flag { angle -= 5 }
        if angle >= 360{ angle -= 360 }
    }
    
    func degreeShift()  {
        randomCount = Int.random(in: 0...300)
        for _ in 0..<randomCount { angleChange() }
    }
}
