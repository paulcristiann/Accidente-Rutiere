//
//  AccidentDetailViewController.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 18/04/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import UIKit

class AccidentDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var accident: Accident!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let dateResult = formatter.string(from: accident.Data)
        nameLabel.text = "Accident auto din " + dateResult
        descriptionLabel.text = accident.Descriere
        
    }
    
    @IBAction func pressedClose(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}


