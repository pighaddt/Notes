//
//  ViewController.swift
//  Notes
//
//  Created by 游舜宇 on 2021/8/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var items : [String] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let nameObject = UserDefaults.standard.object(forKey: "UserEntry")
        
        if let tempObject = nameObject as? [String]{
            
            items = tempObject
            
        }
        
        tableView.reloadData()
        
    }

     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            items.remove(at: indexPath.row)
            tableView.reloadData()
            UserDefaults.standard.setValue(items, forKey:"UserEntry")
        }
    }
}

