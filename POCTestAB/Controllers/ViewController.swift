//
//  ViewController.swift
//  POCTestAB
//
//  Created by João on 18/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.setTitle(RemoteConfigValues.titleButton.get(), for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: RemoteConfigValues.appPrimaryColor.get())
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        AnalyticsManager.shared.trackEvent(HomeAnalyticsEvent.button(title))
    }
}
