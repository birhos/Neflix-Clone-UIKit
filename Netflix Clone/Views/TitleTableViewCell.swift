//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Haydar Demir on 30.09.2022.
//

import UIKit
import SDWebImage

class TitleTableViewCell: UITableViewCell {
    enum Identifier: String {
        case custom = "TitleTableViewCell"
    }
    
    private let playTitleButton: UIButton = {
        let value = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        value.setImage(image, for: .normal)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.tintColor = .white
        return value
    }()
    
    private let titleLabel: UILabel = {
        let value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    private let titlesPosterUIImageView: UIImageView = {
        let value = UIImageView()
        value.contentMode = .scaleAspectFill
        value.translatesAutoresizingMaskIntoConstraints = false
        value.clipsToBounds = true
        return value
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func addSubviews() {
        contentView.addSubview(playTitleButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(titlesPosterUIImageView)
    }
    
    fileprivate func setupConstraints() {
        let titlesPosterUIImageViewConstraints = [
            titlesPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlesPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlesPosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUIImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let playTitleButtonConstraints = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titlesPosterUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playTitleButtonConstraints)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else { return }
        titlesPosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
}
