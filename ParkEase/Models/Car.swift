//
//  Model.swift
//  ParkEase
//
//  Created by Сергей Поляков on 24.04.2023.
//

import Foundation

struct Car {
    let model: String
    let serie: String
    let weight: Double
    let width: Double
    let height: Double
    let wheelbase: Double
    let groundClearance: Double
    
    static func getCar() -> [Car] {
        [
            Car(model: "Nissan", serie: "Alemra Clasic", weight: <#T##Double#>, width: 1710, height: 1440, wheelbase: <#T##Double#>, groundClearance: 165)
            
            ]
    }
}
