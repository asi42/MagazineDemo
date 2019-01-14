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
        fetchData { (dict, error) in
            debugPrint(dict)
        }
    }
    
    
    func fetchData(completion: @escaping ([String:Any]?, Error?) -> Void) {
        let url = URL(string: "http://api.geekdo.com/api/images?ajax=1&gallery=all&nosession=1&objectid=127023&objecttype=thing&pageid=357&showcount=1&size=thumb&sort=recent")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                if let array = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]{
                    completion(array, nil)
                }
            } catch {
                print(error)
                completion(nil, error)
            }
        }
        task.resume()
    }


}

