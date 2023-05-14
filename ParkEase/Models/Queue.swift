//
//  WaitingListModel.swift
//  ParkEase
//
//  Created by Сергей Поляков on 26.04.2023.
//

import Foundation

struct Queue {
    let dispatchTime: DispatchTime
    let operationTime: Int
    let timeToCompletion: Int
    let isYouCar: Bool
}
