//
//  MainViewController.swift
//  AdjustColor
//
//  Created by Dmitrii Galatskii on 19.05.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func returnNewColor(_ color: UIColor)
}

final class MainViewController: UIViewController {
    
    //MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBottomColorToGradientBlack()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = self.view.backgroundColor
        settingsVC.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func returnNewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
