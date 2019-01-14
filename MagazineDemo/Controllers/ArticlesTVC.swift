//
//  ArticlesTVC.swift
//  MagazineDemo
//
//  Created by Asaf h on 1/14/19.
//  Copyright © 2019 A h. All rights reserved.
//

import UIKit

class ArticlesTVC: UITableViewController {
    
    var articlesDB:Articles? {
    didSet {
        tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articlesDB != nil ? articlesDB!.data.count : 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        let article = articlesDB!.data[indexPath.row]
        cell.article = article
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController:ArticlePresentorVC = segue.destination as! ArticlePresentorVC
        if let indexPath = tableView.indexPathForSelectedRow {
            let article = articlesDB?.data[indexPath.row]
            viewController.article = article
        }
    }


}
