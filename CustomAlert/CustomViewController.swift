//
//  CustomViewController.swift
//  CustomAlert
//
//  Created by Jigar Shah on 4/5/18.
//  Copyright © 2018 Rakesh. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {

    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var messageLabel: UILabel!
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var tableViewHeightConstraint: NSLayoutConstraint!

    fileprivate var items = [(String, Bool)]()

    var alertController: UIAlertController!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ItemCell")
        tableView.rowHeight = 44
    }

    func updateUI(image: String, message: String, items: [(String, Bool)]) {
        imageView?.image = UIImage(named: image)
        messageLabel?.text = message
        self.items = items
        tableViewHeightConstraint?.constant = 44.0 * CGFloat(items.count)
        tableView?.reloadData()
    }

}

// MARK: - UITableViewDataSource
extension CustomViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
            as? ItemTableViewCell else {
                return UITableViewCell()
        }
        cell.updateUI(item: items[indexPath.row])
        return cell
    }

}

extension CustomViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) as? ItemTableViewCell {
            cell.`switch`.setOn(!cell.`switch`.isOn, animated: true)
        }
        // To dismiss alert controller
        /*alertController.dismiss(animated: true) {
            // You can call your delegate or send notifications from here..
            // You can also do the same before dismissing the controller.
        }*/
    }

}
