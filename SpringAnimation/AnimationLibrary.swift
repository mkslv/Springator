//
//  AnimationLibrary.swift
//  SpringAnimationExp
//
//  Created by Max Kiselyov on 11/7/23.
//

import Foundation
import SpringAnimation

final class AnimationLibrary {
    static let shared = AnimationLibrary() // singleton
    
    private init() {} // lock initialization
    
    let presetList: Array<String> =  AnimationPreset.allCases.map { $0.rawValue }.shuffled()
    let curveList: Array<String> = AnimationCurve.allCases.map { $0.rawValue }.shuffled()
    
    
}

