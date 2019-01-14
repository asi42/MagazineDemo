//
//  ArticleCell.swift
//  MagazineDemo
//
//  Created by Asaf h on 1/14/19.
//  Copyright © 2019 A h. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    var article : Article? {
        didSet {
            thumbnail.loadImageUsingCache(withUrl: (article?.imageUrl)!)
            titleLbl.text = article?.title
            nameLbl.text = article?.author.authorName
        }
    }

}
