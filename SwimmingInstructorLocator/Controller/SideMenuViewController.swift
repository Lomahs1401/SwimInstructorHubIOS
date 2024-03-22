//
//  SideMenuViewController.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 22/03/2024.
//

import UIKit

class SideMenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.imageView?.image = UIImage(systemName: "person.circle")
            cell.textLabel?.text = "Profile"
        case 1:
            cell.imageView?.image = UIImage(systemName: "gear.circle")
            cell.textLabel?.text = "Setting"
        case 2:
            cell.imageView?.image = UIImage(systemName: "link.circle")
            cell.textLabel?.text = "Community"
        default:
            break
        }
        return cell
    }
}

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
