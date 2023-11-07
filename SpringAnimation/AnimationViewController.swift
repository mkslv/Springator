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
    
    private let colorView: SpringView = {
        let view = SpringView(frame: CGRect(x: UIScreen.main.bounds.width / 10, y: UIScreen.main.bounds.height / 6, width: UIScreen.main.bounds.width * 8/10, height: UIScreen.main.bounds.height / 6))
        view.backgroundColor = UIColor.systemGray // сделать градиент
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let infoLabel: SpringLabel = {
        let label = SpringLabel(frame: CGRect(x: UIScreen.main.bounds.width / 10, y: UIScreen.main.bounds.height * 2.25 / 6 , width: UIScreen.main.bounds.width * 8/10, height: UIScreen.main.bounds.height / 6))
        label.text = """
        preset:
        curve:
        force:
        duration:
        delay:
        """
        label.numberOfLines = 5
        
        return label
    }()
    
    private let aminationButton: SpringButton = {
        let button = SpringButton(frame: CGRect(
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
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @objc
    func buttonTapped() {
        print(#function)
    }

}

// MARK: - Setup View
private extension AnimationViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubviews()
        
//        setupLayout()
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


// MARK: - Layout
private extension AnimationViewController {
    func setupLayout() {

    }
}
