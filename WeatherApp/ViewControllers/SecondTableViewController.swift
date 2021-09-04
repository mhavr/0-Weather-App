//
//  SecondTableViewController.swift
//  WeatherApp
//
//  Created by Максим Гаврилюк on 21.06.2021.
//

import UIKit

class SecondTableViewController: UITableViewController {
    var newCity = City(city: "", isFavourite: false)
    
    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        }
    @IBOutlet weak var addButtonOutlet: UIBarButtonItem!

    @IBOutlet weak var cityTextField: UITextField!
        override func viewDidLoad() {
            super.viewDidLoad()
        self.addButtonOutlet.title = "Save"
        self.addButtonOutlet.style = .done
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        var newNameCity = cityTextField.text ?? ""
        var newIsFavourite = false
        
        self.newCity = City(city: newNameCity, isFavourite: newIsFavourite)
    }
    
    
    
    
    
}
