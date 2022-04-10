//
//  SpotsListViewController.swift
//  Snacktacular
//
//  Created by Derek Marble on 3/31/22.
//

import UIKit

class SpotsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortSegmentedControl: UISegmentedControl!
    
    var spots: Spots!

    override func viewDidLoad() {
        super.viewDidLoad()
        spots = Spots()
        tableView.delegate = self
        tableView.dataSource = self
        configureSegmentedControl()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        spots.loadData {
            self.sortBasedOnSegmentPressed()
            self.tableView.reloadData()
        }
    }
    

    
    func configureSegmentedControl() {
        //set font colors for segmented control
        let orangeFontColor = [NSAttributedString.Key.foregroundColor : UIColor(named: "PrimaryColor") ?? UIColor.orange]
        let whiteFontColor = [NSAttributedString.Key.foregroundColor : UIColor.white]
        sortSegmentedControl.setTitleTextAttributes(orangeFontColor, for: .selected)
        sortSegmentedControl.setTitleTextAttributes(whiteFontColor, for: .normal)
        
        //add white border to segmented control
        sortSegmentedControl.layer.borderColor = UIColor.white.cgColor
        sortSegmentedControl.layer.borderWidth = 1.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! SpotDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.spot = spots.spotArray[selectedIndexPath.row]
        }
    }
    
    func sortBasedOnSegmentPressed() {
        switch sortSegmentedControl.selectedSegmentIndex {
        case 0: //A-Z
            spots.spotArray.sort(by: {$0.name < $1.name})
        case 1: //closest
            print("TODO")
        case 2: //averageRating
            print("TODO")
        default:
            print("Check segmented control for an error!")
        }
        tableView.reloadData()
        
    }

    @IBAction func sortSegmentPressed(_ sender: UISegmentedControl) {
        sortBasedOnSegmentPressed()
    }
}
extension SpotsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spots.spotArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SpotTableViewCell
        cell.nameLabel?.text = spots.spotArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
