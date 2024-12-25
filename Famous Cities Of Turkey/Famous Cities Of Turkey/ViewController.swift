//
//  ViewController.swift
//  Famous Cities Of Turkey
//
//  Created by Kadir Duraklı on 12.07.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cityNames : [String] = []
    var cityImages : [UIImage] = []

    var chosenCityName : String = ""
    var chosenCityImage : UIImage? = nil
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        cityNames.append("izmir")
        cityNames.append("istanbul")
        cityNames.append("antalya")
        
        cityImages.append(UIImage(named: "izmir")!)
        cityImages.append(UIImage(named: "istanbul")!)
        cityImages.append(UIImage(named: "antalya")!)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = cityNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenCityName = cityNames[indexPath.row]
        chosenCityImage = cityImages[indexPath.row]
        performSegue(withIdentifier: "todetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "todetailsVC" {
            print("sa")
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedCityName = chosenCityName
            destinationVC.selectedCityImage = chosenCityImage
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cityNames.remove(at: indexPath.row)
            cityImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

