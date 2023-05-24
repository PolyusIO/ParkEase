//
//  User.swift
//  ParkEase
//
//  Created by Andrey Machulin on 29.04.2023.
//

//Пользователь приложения

struct User {
    let login: String
    let password: String
    let parkKey: String
    let car: [Car]
    
    static func getUserData() -> User {
        User(
            login: "andrey",
            password: "4",
            parkKey: "2",
            car: []
        )
    }
    static func getUsers() -> [User] {
        [
            User(login: "alex", password: "pass", parkKey: "8", car: [])
        ]
    }
}

