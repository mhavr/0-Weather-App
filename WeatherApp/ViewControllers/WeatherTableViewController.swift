//
//  WeatherTableViewController.swift
//  WeatherApp
//
//  Created by Максим Гаврилюк on 03.06.2021.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    var currentCity: String = ""
    var citiesArray = [City(city: "Lviv", isFavourite: false),
                       City(city: "Poltava", isFavourite: false)]
    

    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!
    @IBAction func addBarButtonItemClicked(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "City"
        
        let plusImage = UIImage(systemName: "plus")
        addBarButtonItem.image = plusImage
        addBarButtonItem.title = nil

        navigationItem.leftBarButtonItem = editButtonItem
        view.layoutSubviews()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return citiesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! WeatherCityTableViewCell
        let objects = citiesArray[indexPath.row]
        cell.cityLabel.text = objects.city
        return cell
    }
    @IBAction func unWindSegueToMainScreen(segue:UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        
        let sourceVC = segue.source as! SecondTableViewController
        let newCity = sourceVC.newCity
        
        let newIndexPath = IndexPath(row: citiesArray.count, section: 0)
        
        
        citiesArray.append(newCity)
        tableView.insertRows(at: [newIndexPath], with: .fade)
        
        
        
    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let share = shareCoordinate(at: indexPath)
        let favour = isFavourite(at: indexPath)
        return UISwipeActionsConfiguration(actions: [share,favour])
    }
    // MARK: Function for swipe
        // SHARE FUNCTION
    
    func shareCoordinate(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Share") { [weak self] (action, view, completion) in
            guard let self = self else { return }
            let object = self.citiesArray[indexPath.row]
            self.currentCity = object.city
            self.performSegue(withIdentifier: "shareSwipe", sender: nil)
            
            
            }
        
        action.backgroundColor = .blue
        action.image = UIImage(systemName:"arrowshape.turn.up.forward.circle.fill")
        
        return action
    }
        // FAVOURITE FUNCTION
    
    
    func isFavourite(at indexPath: IndexPath) -> UIContextualAction {
        var favourite = self.citiesArray[indexPath.row]
        
        let action = UIContextualAction(style: .normal, title: "Favourite") { (action, view, completion) in
            
            favourite.isFavourite = !favourite.isFavourite
            self.citiesArray[indexPath.row] = favourite
            completion(true)
        }
        action.backgroundColor = favourite.isFavourite ? .red : .black
        action.image = UIImage(systemName: "heart.fill")
        
        return action
    }
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */





    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newCity = segue.destination as? ViewController {
            newCity.currentCitySwipe = currentCity
      
        }
        
        
        }
    
    }
