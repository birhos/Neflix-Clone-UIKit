//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Haydar Demir on 30.09.2022.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    private let webView: WKWebView = {
        let value = WKWebView()
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    private let titleLabel: UILabel = {
        let value = UILabel()
        value.text = "Harry Potter"
        value.font = .systemFont(ofSize: 22, weight: .bold)
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    private let overviewLabel: UILabel = {
        let value = UILabel()
        value.text = "This is the best movie ever to watch as a kid!"
        value.numberOfLines = 0
        value.font = .systemFont(ofSize: 18, weight: .regular)
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    private let downloadButton: UIButton = {
        let value = UIButton()
        value.backgroundColor = .red
        value.setTitle("Download", for: .normal)
        value.setTitleColor(.white, for: .normal)
        value.layer.cornerRadius = 8
        value.layer.masksToBounds = true
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        addSubviews()
        setupConstraints()
    }
    
    fileprivate func addSubviews() {
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(downloadButton)
    }
    
    fileprivate func setupConstraints() {
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        
        let overviewLabelConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25),
            downloadButton.widthAnchor.constraint(equalToConstant: 140),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overviewLabelConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    public func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else { return }
        webView.load(URLRequest(url: url))
    }
}
