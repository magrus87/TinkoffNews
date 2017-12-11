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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.updateConstraintsIfNeeded()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        
    }
}

//----------------------------------------------------
// MARK: - NewContentViewInput
//----------------------------------------------------
extension NewContentViewController: NewContentViewInput {
    func setupInitialState() {
        
    }
    
    
}
