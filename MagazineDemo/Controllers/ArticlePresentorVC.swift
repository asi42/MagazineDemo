//
//  ArticlePresentorVC.swift
//  MagazineDemo
//
//  Created by Asaf h on 1/14/19.
//  Copyright © 2019 A h. All rights reserved.
//UIViewController

import UIKit

class ArticlePresentorVC: UIViewController {
    var article:Article?
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var likesLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    
    @IBOutlet weak var avatarThumbnail: UIImageView!
    @IBOutlet weak var likesBtn: UIButton!
    @IBOutlet weak var savedBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard article != nil else {return}
        titleLbl.text = article!.title
        categoryLbl.text = article!.category
        nameLbl.text = article!.author.authorName
        dateLbl.text = article!.metaData.updateTime
        avatarThumbnail.loadImageUsingCache(withUrl: article!.author.authorAvatar.imageUrl)
        image.loadImageUsingCache(withUrl: article!.imageUrl)
        likesLbl.text = "\(article!.likesCount)"
        let likedImageName = article!.isLiked ? "liked" : "like"
        let savedImageName = article!.isSaved ? "saved" : "save"
        let likedImage = UIImage(named:likedImageName) as UIImage?
        let savedImage = UIImage(named: savedImageName) as UIImage?
        likesBtn.setImage(likedImage, for: .normal)
        savedBtn.setImage(savedImage, for: .normal)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
