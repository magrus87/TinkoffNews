//
//  NewsListViewController.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import UIKit

class NewsListViewController: ModuleTransition {
    var interactor: NewsListInteractorInput?
    var router: NewsListRouterInput?
    
    private let viewModel = NewsListViewModel()

    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        view.backgroundColor = .white
        
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsPreviewCell.self, forCellReuseIdentifier: NewsPreviewCellDefaults.cellID)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        view.addSubview(tableView)
        
        view.updateConstraintsIfNeeded()
    }
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc private dynamic func refreshData(_ sender: UIControl) {
        interactor?.getAllNews()
    }
}

//----------------------------------------------------
// MARK: - NewsListViewInput
//----------------------------------------------------
extension NewsListViewController: NewsListViewInput {
    func setupInitialState() {
        interactor?.fetchNews()
    }
    
    func endRefresh() {
        refreshControl.endRefreshing()
    }
}

//----------------------------------------------------
// MARK: - UITableViewDataSource
//----------------------------------------------------
extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsPreviewCellDefaults.cellID,
                                                 for: indexPath)
        cell.textLabel?.text = viewModel.newsPreview(index: indexPath.row)
        return cell
    }
}

//----------------------------------------------------
// MARK: - UITableViewDelegate
//----------------------------------------------------
extension NewsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

