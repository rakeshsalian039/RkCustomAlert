//
//  ViewController.swift
//  CustomAlert
//
//  Created by Jigar Shah on 4/5/18.
//  Copyright © 2018 Rakesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func showCustomisedAlertCOntroller() {
        customizeViewController()
    }

    func customizeViewController() {
        // Reference: https://viblo.asia/p/customize-uialertcontroller-QpmlenRD5rd

        // If your alert view uses title and message, color of your custom content view should be clear color to match alert view style or use other methods to use your own color as a background.
        let alertController = UIAlertController(title: "\nCustom Alert View", message: "\nThis is a customised UIAlertController. You can have this alert with or without title and message.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Default Action", style: .default, handler: nil)
        alertController.addAction(okAction)
        let ok1Action = UIAlertAction(title: "Cancel Action", style: .cancel, handler: nil)
        alertController.addAction(ok1Action)
        let ok2Action = UIAlertAction(title: "Destructive Action", style: .destructive, handler: nil)
        alertController.addAction(ok2Action)

        // Note: Changing backround color may cause alert actions to look wierd.
        // Use custom buttons in your custom content view instead of alert view's actions.

        // Background color (translucent)
        /*let backgroundView = alertController.view.subviews.last?.subviews.last
         // Need to clip layer with corner radius or else edges will not be clipped and seen out side of your alert view.
         backgroundView?.layer.cornerRadius = 16.0
         backgroundView?.backgroundColor = .red
         backgroundView?.tintColor = .white*/

        // Background color (not translucent)
        /*let subview = (alertController.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
         subview.backgroundColor = UIColor.red
         alertController.view.tintColor = UIColor.yellow*/

        // Create custom content viewController
        let contentViewController = CustomViewController()
        contentViewController.alertController = alertController
        contentViewController.preferredContentSize = contentViewController.view.bounds.size
        alertController.setValue(contentViewController, forKey: "contentViewController")
        contentViewController.updateUI(image: "bham", message: "Ohh Yeah!!",
                                       items: [
                                        ("good", false),
                                        ("Sexy", false),
                                        ("nice", false),
                                        ("fatang", false),
                                        ("jhakass", true),
                                        ("mahol", true)
            ])
        present(alertController, animated: true, completion: nil)
    }

}

