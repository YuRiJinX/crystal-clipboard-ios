//
//  RootViewController.swift
//  CrystalClipboard
//
//  Created by Justin Mazzocchi on 8/21/17.
//  Copyright © 2017 Justin Mazzocchi. All rights reserved.
//

import UIKit
import ReactiveSwift

class RootViewController: UIViewController {
    
    // MARK: Private stored properties
    
    private let viewModel = RootViewModel()
    
    // MARK: Private constants
    
    private static let transitionDuration: TimeInterval = 0.5
    
    // MARK: Fileprivate stored properties
    
    fileprivate var currentViewController: UINavigationController?
    
    // MARK: UIViewController internal overridden computed properties
    
    override var childForStatusBarStyle: UIViewController? {
        return currentViewController?.visibleViewController ?? super.childForStatusBarStyle
    }
    
    // MARK: UIViewController internal overridden methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reactive.transition <~ viewModel.transitionTo
    }
}

fileprivate extension RootViewController {
    
    // MARK: Fileprivate methods
    
    fileprivate func navigationControllerForTransition(_ transition: TransitionType) -> UINavigationController {
        let storyboard = UIStoryboard(name: transition.storyboardName)
        let controller = storyboard.instantiateViewController(withIdentifier: transition.controllerIdentifier)
        if var modeledViewController = controller as? _ViewModelSettable {
            modeledViewController._viewModel = transition.viewModel
        }
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.view.frame = view.bounds
        
        return navigationController
    }
    
    fileprivate func performTransition(fromViewController: UINavigationController?, toViewController: UINavigationController) {
        currentViewController = toViewController
        fromViewController?.willMove(toParent: nil)
        addChild(toViewController)
        if let fromViewController = fromViewController {
            transition(from: fromViewController,
                       to: toViewController,
                       duration: RootViewController.transitionDuration,
                       options: UIView.AnimationOptions.transitionCrossDissolve,
                       animations: nil) { _ in
                        fromViewController.removeFromParent()
                        toViewController.didMove(toParent: self)
            }
        } else {
            view.addSubview(toViewController.view)
            toViewController.didMove(toParent: self)
        }
    }
}

// MARK: Fileprivate reactive extensions

fileprivate extension Reactive where Base: RootViewController {
    fileprivate var transition: BindingTarget<TransitionType> {
        return makeBindingTarget {
            let toViewController = $0.navigationControllerForTransition($1)
            $0.performTransition(fromViewController: $0.currentViewController, toViewController: toViewController)
        }
    }
}
