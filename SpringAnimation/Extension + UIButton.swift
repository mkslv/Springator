//
//  Extension + UIButton.swift
//  AnimationApp
//
//  Created by brubru on 06.11.2023.
//


import UIKit

extension UIButton {
	func pulsate() {
		let pulse = CASpringAnimation(keyPath: "transform.scale")
		pulse.duration = 0.6
		pulse.fromValue = 0.95
		pulse.toValue = 1
		pulse.autoreverses = true
		pulse.repeatCount = 2
		pulse.initialVelocity = 0.5
		pulse.damping = 1
		
		layer.add(pulse, forKey: nil)
	}
}
