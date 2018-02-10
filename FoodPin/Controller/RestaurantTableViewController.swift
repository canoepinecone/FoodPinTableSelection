//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 24/8/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei",isVisited: false),Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isVisited: false),Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isVisited: false),Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isVisited: false),Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong",image: "forkeerestaurant", isVisited: false),Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image:"posatelier", isVisited: false),Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isVisited: false),Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image:"haighschocolate", isVisited: false),Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso", isVisited: false),Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isVisited: false),Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isVisited: false),Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location:"New York", image: "grahamavenuemeats", isVisited: false),Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York",image: "wafflewolf", isVisited: false),Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isVisited: false),Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isVisited: false),Restaurant(name: "Confessional", type: "Spanish", location: "New York", image:"confessional", isVisited: false), Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isVisited: false), Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isVisited: false), Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isVisited: false),Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen", isVisited: false)
                ]
    // MARK: - View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.locationLabel.text = restaurants[indexPath.row].location
        
        // Solution to Exercise #1
        // cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        
        // Solution to Exercise #2
        // Use the isHidden property to control the appearance of the heart icon
        cell.heartImageView.isHidden = restaurants[indexPath.row].isVisited ? false : true
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // Create an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//        
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//        
//        // Add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        
//        // Add Call action
//        let callActionHandler = { (action:UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//        
//        // Solution to exercise #1
//        // ---
//        // Determine the action tile by examining the status of restaurantIsVisited[indexPath.row]
//        // If it is set to true, we set the title "Undo Check in".
//        
//        /*let checkActionTitle = (restaurantIsVisited[indexPath.row]) ? "Undo Check in" : "Check in"
//        
//        // Check-in action
//        let checkInAction = UIAlertAction(title: checkActionTitle, style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
//            
//            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
//
//            self.restaurantIsVisited[indexPath.row] = (self.restaurantIsVisited[indexPath.row]) ? false : true
//
//            // Solution to exercise #1
//            // ---
//            // Toggle the accessoryType and the value of restaurantIsVisited[indexPath.row]
//            // If the value of self.restaurantIsVisited[indexPath.row] is true, we set the accessory type to .none.
//            
//            // cell?.accessoryType = (self.restaurantIsVisited[indexPath.row]) ? .none : .checkmark
//            
//            // Solution to exercise #2
//            // ---
//            // Use the isHidden property to control the appearance of the heart icon
//            
//            cell.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
//            
//        })
//        optionMenu.addAction(checkInAction)*/
//        
//        // Display the menu
//        present(optionMenu, animated: true, completion: nil)
//        
//        // Deselect the row
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, sourceView, completionHandler) in
            
            self.restaurants.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var visited = restaurants[indexPath.row].isVisited
        
        let checkInAction = UIContextualAction(style: .normal, title: "") {
            (action, sourceView, completionHandler) in
            
            visited = !visited
            self.restaurants[indexPath.row].isVisited = visited
            self.tableView.reloadData()
            completionHandler(true)
        }
        checkInAction.backgroundColor = UIColor.green
        checkInAction.image = visited ? UIImage(named: "undo") : UIImage(named: "tick")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
        
        return swipeConfiguration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
}
