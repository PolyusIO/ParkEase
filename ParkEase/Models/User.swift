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
    let person: Person
    let car: [Car]
    
    static func getUserData() -> User {
        User(
            login: "andrey",
            password: "4",
            parkKey: "2",
            person: Person.getPerson(),
            car: []
        )
    }
}

//Авторы приложения
struct Person {
    let name: String
    let surname: String
    let age: Int
    let photo: String
    let gitGubLink: String
    let bio: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Андрей",
            surname: "Мачулин",
            age: 38,
            photo: "Andrey",
            gitGubLink: "GorizontX",
            bio: """
            Привет, меня зовут Андрей. Мне 38 лет, сейчас я живу в Барселоне и учусь на 32 потоке.
            """
        )
    }
}
