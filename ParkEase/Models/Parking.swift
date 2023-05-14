//
//  Parking.swift
//  ParkEase
//
//  Created by Andrey Machulin on 30.04.2023.
//

struct Parking {
    let maxWeight: Double
    let maxWidth: Double
    let maxHeight: Double
    let minClearance: Double
    //массив автомобилей, припаркованных на парковке
    let parkedCars: [Car]
    
    init(parkedCars: [Car], maxWeight: Double, maxWidth: Double, maxHeight: Double, minClearance: Double) {
        self.maxWeight = maxWeight
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.minClearance = minClearance
        self.parkedCars = []
    }
    
    // Метод, который проверяет, соответствует ли автомобиль техническим ограничениям парковки
       func carFitsRequirements(car: Car) -> Bool {
           return car.weight <= maxWeight && car.width <= maxHeight && car.height <= maxHeight && car.groundClearance >= minClearance
       }
    
}
