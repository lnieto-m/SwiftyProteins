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
    var filteredData: [String]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LingandTableView.dequeueReusableCell(withIdentifier: "Lig") as! LigandTableViewCell
        cell.nameText = filteredData[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? LingandList.List : LingandList.List.filter {(item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        LingandTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredData =  LingandList.List
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

