//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Илья Дубровский on 04.09.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var firstButton = Button(title: "First Button")
    private lazy var secondButton = Button(title: "Second Button. Second Button. Second Button. Second Button. Second Button.")
    private lazy var thirdButton: UIButton = {
        let button = Button(title: "Third Button.")
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(firstButton)
        self.view.addSubview(secondButton)
        self.view.addSubview(thirdButton)
        setConstraints()
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            self.firstButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.firstButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.secondButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.secondButton.topAnchor.constraint(equalTo: self.firstButton.bottomAnchor, constant: 20),
            self.secondButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.thirdButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.thirdButton.topAnchor.constraint(equalTo: self.secondButton.bottomAnchor, constant: 20)
        ])
    }

    @objc
    func actionButton() {
        let vc = ModalViewController()
        present(vc, animated: true)
    }
}

class Button: UIButton {

    private var animator = UIViewPropertyAnimator()

    init(title: String) {
        super.init(frame: .zero)
        var configuration = UIButton.Configuration.filled()
        configuration.title = title
        configuration.cornerStyle = .capsule
        configuration.baseForegroundColor = UIColor.white
        configuration.baseBackgroundColor = UIColor.systemBlue
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 10, bottom: 14, trailing: 10)
        configuration.imagePlacement = .trailing
        configuration.titleLineBreakMode = .byWordWrapping
        self.translatesAutoresizingMaskIntoConstraints = false
        self.configuration = configuration
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {
            self.transform = .init(scaleX: 0.90, y: 0.90)
        })
        animator.startAnimation()
        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {
            self.transform = .identity
        })
        animator.startAnimation()
    }
}

class ModalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
}
