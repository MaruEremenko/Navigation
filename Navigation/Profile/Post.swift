//
//  Post.swift
//  Navigation
//
//  Created by Maru Eremenko on 06.04.2023.
//

import Foundation

struct Post {
    let author: String
    var description: String
    let image: String
    var likes: Int
    var views: Int
}

extension Post {
    static func getArray() -> [Post] {
        [
            Post(
                author: "Hipster Tom",
                description: "Hi, everyone!",
                image: "logo",
                likes: 2,
                views: 2
            ),
            Post(
                author: "Hipster Tom",
                description: "My avatar image",
                image: "Tom",
                likes: 5,
                views: 5
            ),
            Post(
                author: "Hipster Tom",
                description: "Love my cat Goirno",
                image: "Cat1",
                likes: 7,
                views: 7
            ),
            Post(
                author: "Hipster Tom",
                description: "Love my cat Richard",
                image: "Cat2",
                likes: 7,
                views: 7
            )
        ]
    }
}
