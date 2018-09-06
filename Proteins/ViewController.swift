//
//  ViewController.swift
//  Proteins
//
//  Created by Luis NIETO MUNOZ on 9/4/18.
//  Copyright © 2018 Luis NIETO MUNOZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
 
    @IBOutlet weak var LingandTableView: UITableView!
    var ligands: [String] = []
    var filteredData: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LingandTableView.dequeueReusableCell(withIdentifier: "Lig") as! LigandTableViewCell
        cell.nameText = filteredData[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? ligands : ligands.filter {(item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        LingandTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let bundlePath = Bundle.main.path(forResource: "ligands", ofType: "bundle"),
            let bundle = Bundle(path: bundlePath) {
            let filePath = bundle.url(forResource: "ligands", withExtension: "txt")
            do {
                let data = try String(contentsOf: filePath!)
                print(data)
                let splittedData = data.split(separator: "\n")
                for value in splittedData {
                    ligands.append(String(value))
                }
            } catch {
                print("not found")
            }
        } else {
            print("not found")
        }
        
        filteredData =  ligands
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

