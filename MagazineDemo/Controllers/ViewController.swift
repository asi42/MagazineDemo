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
        fetchData { (articles, error) in
            viewController.articlesDB = articles
        }
    }
    
    
    func fetchData(completion: @escaping (Articles?, Error?) -> Void) {
        let url = URL(string: "https://cdn.theculturetrip.com/home-assignment/response.json")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                if let articles = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Articles{
                    completion(articles, nil)
                }
            } catch {
                print(error)
                completion(nil, error)
            }
        }
        task.resume()
    }


}

