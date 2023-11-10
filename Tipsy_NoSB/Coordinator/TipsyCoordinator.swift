//
//  TipsyCoordinator.swift
//  Tipsy_NoSB
//
//  Created by Raúl Pavón on 17/02/22.
//

import Foundation

import UIKit

class TipsyCoordinator {
    var navigationController: UINavigationController
    private let factory = TipsyFactoryImp()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tipsyViewController = factory.makeTipsyViewController(tipsyCoordinator: self)
        navigationController.setViewControllers([tipsyViewController], animated: false)
    }
    
    func openResult(tip: Tip) {
        let resultViewController = factory.makeResultViewController(tip: tip)
        navigationController.pushViewController(resultViewController, animated: true)
    }
}
