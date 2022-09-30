//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by Haydar Demir on 29.09.2022.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    // MARK: - Data Variables
    
    enum Identifier: String {
        case custom = "TitleCollectionViewCell"
    }
    
    // MARK: - UI Components
    
    private let posterImageView: UIImageView = {
        let value = UIImageView()
        return value
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    fileprivate func addSubviews() {
        contentView.addSubview(posterImageView)
    }
    
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else { return }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
