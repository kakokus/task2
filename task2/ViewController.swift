//
//  ViewController.swift
//  task2
//
//  Created by Maxim on 28.12.21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeuereusableCellWithIdentifier(cellReuseIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = countries[indexPath.row]
        
        return cell
    }
    

    let cellReuseIdentifier = "cell"
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var countries: [String] = []
        
        for code in NSLocale.isoCountryCodes {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Not found: \(code)"
            countries.append(name)
        }
        
        print(countries)
        
        tableView.frame = CGRect(x: 0, y: 50, width: 320, height: 200)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseidentifier: cellReuseIdentifier)
        
        self.view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("you tapped \(indexPath.row)")
    }
    

    
    
}

