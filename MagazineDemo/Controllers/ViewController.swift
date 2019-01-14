//
//  ViewController.swift
//  MagazineDemo
//
//  Created by Asaf h on 1/14/19.
//  Copyright © 2019 A h. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController:ArticlesTVC = segue.destination as! ArticlesTVC
        DispatchQueue.global(qos: .background).async {
            self.fetchData { (articles, error) in
                viewController.articlesDB = articles
            }
        }

    }
    
    
    func fetchData(completion: @escaping (Articles?, Error?) -> Void) {
        let url = URL(string: "https://cdn.theculturetrip.com/home-assignment/response.json")!
        do {
            let articles = try Articles(url: url)
            DispatchQueue.main.async {
                completion(articles, nil)
            }
            
        } catch {
            print(error)
            completion(nil, error)
        }
    }
}

