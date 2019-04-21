//
//  UrgenteViewController.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 21/04/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import Foundation
import UIKit

class UrgenteViewController: UIViewController {
    
    
    @IBAction func emergencyPressed(_ sender: Any) {
        
        guard let number = URL(string: "tel://112") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func tractarePressed(_ sender: Any) {
        
        guard let number = URL(string: "tel://0742333400") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func cityInsurancePressed(_ sender: Any) {
        
        guard let number = URL(string: "tel://0212070001") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func groupamaPressed(_ sender: Any) {
        
        guard let number = URL(string: "tel://0212070001") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func generaliPressed(_ sender: Any) {
        
        guard let number = URL(string: "tel://0212070001") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
}
