//
//  HeroHeaderUIView.swift
//  Netflix Clone
//
//  Created by Haydar Demir on 23.09.2022.
//

import UIKit
import SDWebImage

class HeroHeaderUIView: UIView {
    // MARK: - UI Components
    
    private let downloadButton: UIButton = {
        let value = UIButton()
        value.buttonStyle(title: "Download")
        return value
    }()
    
    private let playButton: UIButton = {
        let value = UIButton()
        value.buttonStyle(title: "Play")
        return value
    }()
    
    private let heroImageView: UIImageView = {
        let value = UIImageView()
        value.contentMode = .scaleAspectFill
        value.clipsToBounds = true
        return value
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor,
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    // MARK: - UI Configure
    
    func addSubviews() {
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
    }
    
    private func setupConstraints() {
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120),
        ]
        
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else { return }
        heroImageView.sd_setImage(with: url, completed: nil)
    }
}

fileprivate extension UIButton {
    func buttonStyle(title: String) {
        self.layer.borderColor = UIColor.white.cgColor
        self.setTitle(title, for: .normal)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
