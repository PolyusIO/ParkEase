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
    
    static func getUserData() -> User {
        User(
            login: "andrey",
            password: "1",
            parkKey: "03789",
            person: Person.getPerson()
        )
    }
}

//Авторы приложения
struct Person {
    let name: String
    let surname: String
    let age: Int
    let photo: String
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
            bio: """
            Привет, меня зовут Андрей. Мне 38 лет, сейчас я живу в Барселоне и учусь на 32 потоке.
            """
        )
    }
}
