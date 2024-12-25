//
//  detailsVC.swift
//  Famous Cities Of Turkey
//
//  Created by Kadir Duraklı on 12.07.2024.
//

import UIKit

class detailsVC: UIViewController {
    
    var selectedCityName : String = ""
    var selectedCityImage : UIImage? = nil

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cityNameLabel.text = selectedCityName
        cityImageView.image = selectedCityImage
    }
    
}
