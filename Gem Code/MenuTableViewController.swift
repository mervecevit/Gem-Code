//
//  MenuTableViewController.swift
//  Gem Code
//
//  Created by Emre Özdil on 03/12/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.tableView.isScrollEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as UITableViewCell

         //Configure the cell...
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 32)
        
        if indexPath.item == 0 {
            cell.textLabel?.text = "TRAINING"
        } else if indexPath.item == 1 {
            cell.textLabel?.text = "FIRST STEP"
        } else {
            cell.textLabel?.text = "CONTROL STRUCTURES"
        }
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (self.view.frame.height - ((self.navigationController?.navigationBar.frame.height) ?? 0))/3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        stageType = indexPath.item
        if indexPath.item == 0 {
            let layout = UICollectionViewFlowLayout()
            self.navigationController?.pushViewController(EpisodeViewController(collectionViewLayout: layout), animated: true)
        } else if indexPath.item == 1 {
            let layout = UICollectionViewFlowLayout()
            self.navigationController?.pushViewController(EpisodeViewController(collectionViewLayout: layout), animated: true)
        } else {
            let layout = UICollectionViewFlowLayout()
            self.navigationController?.pushViewController(EpisodeViewController(collectionViewLayout: layout), animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
