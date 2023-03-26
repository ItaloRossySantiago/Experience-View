//
//  Coordinator.swift
//  Experience View
//
//  Created by Italo Rossy on 13/03/23.
//

import Foundation
import UIKit


protocol Coordinator {
    var navigationController : UINavigationController { get }
    func  start ()
    init (navigationController: UINavigationController)
}

