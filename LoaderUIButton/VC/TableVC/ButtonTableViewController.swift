//
//  ButtonTableViewController.swift
//  LoaderUIButton
//
//  Created by Sabari on 12/04/20.
//  Copyright © 2020 Sabari. All rights reserved.
//

import UIKit

class ButtonTableViewController: UITableViewController {
    
    var CustomButList = ["LoadMaterialIndicator",
                            "RNLoadingIndicator",
                            "TransitionLoader"
                        ]
    
    @IBOutlet weak var butTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

     
//        self.butTableView.reloadData()
//        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CustomButList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! ButtonCell

        cell.lbl.text = CustomButList[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ButtonId\(indexPath.row)")
          self.navigationController?.pushViewController(nextViewController, animated: true)

    }
}


class ButtonCell: UITableViewCell {
    
    @IBOutlet weak var lbl:UILabel!
}
