//
//  ViewController.swift
//  SpringAnimation
//
//  Created by Max Kiselyov on 11/6/23.
//

import UIKit
import SpringAnimation

final class AnimationViewController: UIViewController {
    // MARK: - Properties
    private let model = AnimationLibrary.shared
    private lazy var nextParams = getValues()
    private lazy var colorView = createColorView()
    private lazy var infoLabel = createInfoLabel()
    private lazy var aminationButton = createAnimationButton()
    
    private var cycleCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // FIXME: DRY principles!
        colorView.frame = CGRect(
            x: UIScreen.main.bounds.width / 10,
            y: UIScreen.main.bounds.height / 6,
            width: UIScreen.main.bounds.width * 8/10,
            height: UIScreen.main.bounds.height / 6
        )
        infoLabel.frame = CGRect(
            x: UIScreen.main.bounds.width / 10,
            y: UIScreen.main.bounds.height * 2.25 / 6 , 
            width: UIScreen.main.bounds.width * 8/10, 
            height: UIScreen.main.bounds.height / 3
        )
        aminationButton.frame = CGRect(
            x: UIScreen.main.bounds.width / 10,
            y: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 5 , 
            width: UIScreen.main.bounds.width * 8/10, 
            height: UIScreen.main.bounds.height / 15
        )
        aminationButton.layer.cornerRadius = aminationButton.frame.height/2
    }

    @objc
    func buttonTapped() {
        setupAnimationParams()

        colorView.animate()
        
        nextParams = getValues()
        infoLabel.animation = "zoomOut"
        infoLabel.animate()
        setupLabelParams(for: infoLabel)
        infoLabel.animation = "zoomIn"
        infoLabel.animate()
    }
}

// MARK: - Setup View
private extension AnimationViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubviews()
    }
}

// MARK: - Settings
private extension AnimationViewController {
    func addSubviews() {
        [colorView, infoLabel, aminationButton].forEach { subView in
            view.addSubview(subView)
        }
    }
}

// MARK: - Layout and elements
private extension AnimationViewController {
    func createColorView() -> SpringView {
        let view = SpringView(frame: CGRect(  // FIXME: DRY principles!
            x: UIScreen.main.bounds.width / 10,
            y: UIScreen.main.bounds.height / 6,
            width: UIScreen.main.bounds.width * 8/10,
            height: UIScreen.main.bounds.height / 6
        ))
        view.backgroundColor = UIColor.systemGray // сделать градиент
        view.layer.cornerRadius = 10
        return view
    }
    
    func createInfoLabel() -> SpringLabel {
        let label = SpringLabel(frame: CGRect( // FIXME: DRY principles!
            x: UIScreen.main.bounds.width / 10,
            y: UIScreen.main.bounds.height * 2.25 / 6 ,
            width: UIScreen.main.bounds.width * 8/10,
            height: UIScreen.main.bounds.height / 3
        ))
        label.numberOfLines = 0
        label.duration = 1
        setupLabelParams(for: label)
        return label
    }
    
    func setupLabelParams(for object: SpringLabel) {
        object.text = """
        preset: \(nextParams.preset)
        curve: \(nextParams.curve)
        force: \(nextParams.force.formatted())
        duration: \(nextParams.duration.formatted())
        delay: \(nextParams.delay.formatted())
        """
    }
    
    func setupAnimationParams() {
        colorView.animation = nextParams.preset
        colorView.curve = nextParams.curve
        colorView.force = nextParams.force
        colorView.duration = nextParams.duration
        colorView.delay = nextParams.delay
    }
    
    func createAnimationButton() -> SpringButton {
        let button = SpringButton(frame: CGRect( // FIXME: DRY principles!
            x: UIScreen.main.bounds.width / 10,
            y: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 5 ,
            width: UIScreen.main.bounds.width * 8/10,
            height: UIScreen.main.bounds.height / 15
        ))
        button.layer.cornerRadius = button.frame.height/2
        button.setTitle("Animate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.white.withAlphaComponent(0.5), for: .highlighted)
        button.backgroundColor = .systemGray
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }
}

// MARK: - Busines logic
private extension AnimationViewController {
    func getValues() -> (preset: String, curve: String, force: CGFloat, duration: CGFloat, delay: CGFloat){
        // send preset
        let preset = model.presetList[cycleCounter]
        let curve = model.curveList[cycleCounter]
        let force = CGFloat.random(in: 1.0...5.0)
        let duration = CGFloat.random(in: 0.5...5.0)
        let delay = CGFloat.random(in: 0.9...1.1)
        
        // update counter
        if cycleCounter < model.presetList.count-1 {
            cycleCounter += 1
        } else {
            cycleCounter = 0
        }
        
        return (preset, curve, force, duration, delay)
    }
}
