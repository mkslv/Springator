//
//  Animation.swift
//  SpringAnimation
//
//  Created by Max Kiselyov on 11/6/23.
//

import Foundation

struct Animation {
    var preset: String
    var curve: String
    var force: Double
    var delay: Double
    var duration: Double
    
    
    // FIXME: надо сделать метод который берет рандомные значения из Анимейшн лайбрари
    static func getValues() -> Animation {
        Animation(
            preset: "pop",
            curve: "easeInt",
            force: 1,
            delay: 0,
            duration: 0.7
        )
    }
}
