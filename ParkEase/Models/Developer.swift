//
//  User.swift
//  ParkEase
//
//  Created by Andrey Machulin on 29.04.2023.
//

//Авторы приложения
struct Developer {
    let name: String
    let surname: String
    let charpter: String
    let age: Int
    let photo: String
    let githubLink: String
    let bio: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getTeam() -> [Developer] {
        [
            Developer(
                name: "Андрей",
                surname: "Мачулин",
                charpter: "Models",
                age: 38,
                photo: "Andrey",
                githubLink: "GorizontX",
                bio: """
                    Привет, меня зовут Андрей. Мне 38 лет, сейчас я живу в Барселоне и учусь на 32 потоке.
                    """
            ),
            Developer(
                name: "Сергей",
                surname: "Поляков",
                charpter: "Waiting List",
                age: 39,
                photo: "Sergey",
                githubLink: "PolyusIO",
                bio: ""
            ),
            Developer(
                name: "Артемий",
                surname: "Дериглазов",
                charpter: "Login Page",
                age: 21,
                photo: "Artemy",
                githubLink: "artemyderik",
                bio: ""
            )
        ]
    }
}
