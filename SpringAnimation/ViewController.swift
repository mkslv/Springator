//
//  ViewController.swift
//  AnimationApp
//
//  Created by brubru on 06.11.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

	@IBOutlet weak var coreAnimationView: UIView!
	@IBOutlet weak var springAnimationView: SpringView!
	
	private var animationStarted = false

	@IBAction func runCoreAnimation(_ sender: UIButton) {
		UIView.animate(
			withDuration: 0.5,
			delay: 0,
			options: [.autoreverse, .repeat]) { [unowned self] in
				if !animationStarted {
					coreAnimationView.frame.origin.x -= 40
					animationStarted.toggle()
				}
			}
		
		sender.pulsate()
	}
	
	@IBAction func runSpringAnimation(_ sender: SpringButton) {
		springAnimationView.animation = "pop"
		springAnimationView.curve = "easeIn"
		springAnimationView.force = 2
		springAnimationView.duration = 1
		springAnimationView.delay = 0.3
		
		springAnimationView.animate()
	}
}

