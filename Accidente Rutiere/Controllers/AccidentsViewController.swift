//
//  ViewController.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 28/02/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import UIKit
import RealmSwift

class AccidentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var allAccidents: [Accident] = [Accident]()
    
    @IBAction func pressedAddButton(_ sender: AnyObject) {
        let addAccidentViewController = storyboard?.instantiateViewController(withIdentifier: "addAccident") as! AddAccidentsViewController
        present(addAccidentViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allAccidents.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let accident = allAccidents[indexPath.row]
        
        let accidentCell = tableView.dequeueReusableCell(withIdentifier: "accidentCell") as! AccidentsTableViewCell
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let dateResult = formatter.string(from: accident.Data)
        
        accidentCell.accidentLabel.text = "Accident din data " + dateResult
        
        return accidentCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedAccident = allAccidents[indexPath.row]
        
        let accidentDetailViewController = storyboard?.instantiateViewController(withIdentifier: "accidentDetail") as! AccidentDetailViewController
        accidentDetailViewController.accident = selectedAccident
        
        present(accidentDetailViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let realm = try! Realm()
        allAccidents = Array(realm.objects(Accident.self).sorted(byKeyPath: "Data").reversed())
        tableView.reloadData()
    }


}

