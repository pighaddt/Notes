//
//  SecondViewController.swift
//  Notes
//
//  Created by 游舜宇 on 2021/8/14.
//

import Foundation
import UIKit

class SecondViewController : UIViewController, UITextFieldDelegate{
    @IBOutlet weak var edit_text: UITextField!
    @IBOutlet weak var edit_info: UILabel!
    
    @IBAction func btn_save(_ sender: Any) {
        var items : [String]
        let nameObject = UserDefaults.standard.object(forKey: "UserEntry")
        if edit_text.text != "" {
            
            if let tempItems = nameObject as? [String] {
                items = tempItems
                items.append(edit_text.text!)
                print(items)
            }else{
                items = [edit_text.text!]
            }
            UserDefaults.standard.setValue(items, forKey: "UserEntry")
            edit_text.text = ""
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
