//
//  NewContentViewController.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import UIKit

class NewContentViewController: ModuleTransition {
    var interactor: NewContentInteractorInput?
    var router: NewContentRouterInput?
    
    private let webView: UIWebView = {
        let webView = UIWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = false
        view.activityIndicatorViewStyle = .gray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView.startAnimating()
        
        view.addSubview(webView)
        view.addSubview(activityIndicatorView)

        view.updateConstraintsIfNeeded()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        activityIndicatorView.topAnchor.constraint(equalTo: webView.safeAreaLayoutGuide.topAnchor).isActive = true
        activityIndicatorView.leadingAnchor.constraint(equalTo: webView.leadingAnchor).isActive = true
        activityIndicatorView.trailingAnchor.constraint(equalTo: webView.trailingAnchor).isActive = true
        activityIndicatorView.bottomAnchor.constraint(equalTo: webView.bottomAnchor).isActive = true
    }
}

//----------------------------------------------------
// MARK: - NewContentViewInput
//----------------------------------------------------
extension NewContentViewController: NewContentViewInput {
    func setupInitialState(newID: Int) {
        interactor?.getNew(id: newID)
    }
    
    func showNewContent(content: String) {
        webView.loadHTMLString(content, baseURL: nil)
        activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = true
    }
}
