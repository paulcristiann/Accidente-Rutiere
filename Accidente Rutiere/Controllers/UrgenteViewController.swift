//
//  UrgenteViewController.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 21/04/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class UrgenteViewController: UIViewController, SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
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
    
    @IBAction func cityInsuranceWebsite(_ sender: Any) {
        // check if website exists
        guard let url = URL(string: "https://www.cityinsurance.ro") else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
    @IBAction func groupamaPressed(_ sender: Any) {
        
        guard let number = URL(string: "tel://0212070001") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func groupamaWebsite(_ sender: Any) {
        // check if website exists
        guard let url = URL(string: "https://www.groupama.ro") else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
    @IBAction func generaliPressed(_ sender: Any) {
        
        guard let number = URL(string: "tel://0212070001") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func generaliWebsite(_ sender: Any) {
        // check if website exists
        guard let url = URL(string: "https://www.groupama.ro") else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
}
