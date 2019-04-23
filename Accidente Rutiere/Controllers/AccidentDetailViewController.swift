//
//  AccidentDetailViewController.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 18/04/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import UIKit
import MapKit

class AccidentDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var numeSoferLabel: UILabel!
    
    @IBOutlet weak var telefonSoferLabel: UILabel!
    
    @IBOutlet weak var locAccidentMap: MKMapView!
    
    var accident: Accident!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.isUserInteractionEnabled = false
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let dateResult = formatter.string(from: accident.Data)
        nameLabel.text = "Accident auto din " + dateResult
        if( accident.NumeSofer == ""){
            
            numeSoferLabel.text = "Necompletat"
            
        }else{
            numeSoferLabel.text = accident.NumeSofer
        }
        if( accident.TelefonSofer == "")
        {
            telefonSoferLabel.text = "Necompletat"
        }else{
            telefonSoferLabel.text = accident.TelefonSofer
        }
        
        let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(accident.Latitude), longitude: CLLocationDegrees(accident.Longitude))
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.locAccidentMap.setRegion(region, animated: true)
        
        let pin = customPin(pinTitle: "Locul accidentului", location: location)
        self.locAccidentMap.addAnnotation(pin)
        print(location)
        
        if(accident.Descriere == "")
        {
            descriptionLabel.text = "Descrierea nu a fost adaugată"
        }else{
            descriptionLabel.text = accident.Descriere
        }
        
        
    }
    
    
    @IBAction func showPhotos(_ sender: Any) {
        
        if(accident.ImagesData.count == 0)
        {
            let alert = UIAlertController(title: "Nu exista poze atașate", message: "Nu au fost atașate poze", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        else{
            
            var images = [UIImage()]
            for imageData in accident.ImagesData{
                
                let image = UIImage(data: imageData)
                images.append(image!)
                
            }
            
            let imagesViewController = storyboard?.instantiateViewController(withIdentifier: "slideshow") as! ImagesSlideshowViewController
            imagesViewController.images = images
            
            present(imagesViewController, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func pressedClose(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}


