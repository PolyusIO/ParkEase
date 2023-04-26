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
    let image: String
    
    static func getCar() -> [Car] {
        [
            Car(
                model: "Nissan",
                serie: "Alemra Clasic",
                weight: 1700,
                width: 1710,
                height: 1440,
                wheelbase: 2535,
                groundClearance: 165,
                image: "NISSAN"
            ),
            Car(
                model: "Audi",
                serie: "RS 5",
                weight: 2210,
                width: 1866,
                height: 1372,
                wheelbase: 2766,
                groundClearance: 120,
                image: "AUDI"
            ),
            Car(
                model: "BMW",
                serie: "Serie 3",
                weight: 1880,
                width: 1817,
                height: 1421,
                wheelbase: 2760,
                groundClearance: 143,
                image: "BMW"
            ),
            Car(
                model: "Porsche",
                serie: "Cayenne",
                weight: 2810,
                width: 1939,
                height: 1707,
                wheelbase: 2895,
                groundClearance: 245,
                image: "PORSCHE"
            ),
            Car(
                model: "Land Rover",
                serie: "Range Rover Sport",
                weight: 2750,
                width: 2073,
                height: 1803,
                wheelbase: 2923,
                groundClearance: 200,
                image: "LAND ROVER"
            )
        ]
    }
}
