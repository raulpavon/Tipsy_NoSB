//
//  TipsyFactory.swift
//  Tipsy_NoSB
//
//  Created by Raúl Pavón on 17/02/22.
//

import Foundation
import UIKit

protocol TipsyFactory {
    func makeTipsyViewController(tipsyCoordinator: TipsyCoordinator) -> TipsyViewController
    func makeResultViewController(tip: Tip) -> ResultViewController
}

class TipsyFactoryImp: TipsyFactory {
    func makeTipsyViewController(tipsyCoordinator: TipsyCoordinator) -> TipsyViewController {
        let tipsyViewController = TipsyViewController(factory: self, tipsyCoordinator: tipsyCoordinator)
        return tipsyViewController
    }
    
    func makeResultViewController(tip: Tip) -> ResultViewController {
        let resultViewController = ResultViewController(tip: <#T##Tip#>)
        return resultViewController
    }
}
