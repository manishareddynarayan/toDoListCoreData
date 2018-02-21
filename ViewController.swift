//
//  ViewController.swift
//  toDoCoreData
//
//  Created by N Manisha Reddy on 2/13/18.
//  Copyright © 2018 N Manisha Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var tasks:[Works] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //What this functions job is?
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = tasks[indexPath.row]
        
        if task.isImportant {
            cell.textLabel?.text = "👍🏻\(task.name!)"
        }
        else {
            cell.textLabel?.text = "👎🏻\(task.name!)"
        }
        return cell
    }
    func fetchData()
    {
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        do {
            tasks = try context!.fetch(Works.fetchRequest())
            
        } catch  {
            print("fetch failed")
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context?.delete(task)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
           do {
                tasks = try context!.fetch(Works.fetchRequest())
                
            } catch  {
                print("fetch failed")
            } 

            tableView.reloadData()

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

