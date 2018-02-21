//
//  AddItemVC.swift
//  toDoCoreData
//
//  Created by N Manisha Reddy on 2/13/18.
//  Copyright © 2018 N Manisha Reddy. All rights reserved.
//

import UIKit
import CoreData
class AddItemVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var isImp: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addButton(_ sender: Any) {
      let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        let task = Works(context: context!)
        task.name = textField.text
        task.isImportant = isImp.isOn
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        navigationController?.popViewController(animated: true)
        
    }
   

}
