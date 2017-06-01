//
//  ViewController.swift
//  APODSwift
//
//  Created by Austin Emmons on 5/25/17.
//  Copyright © 2017 Modo Labs. All rights reserved.
//

import UIKit

// https://api.nasa.gov/planetary/apod?api_key=VvJtXj1Ejm5kyfAvOleQ104FSt7bNgDalkqq7vba

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AppDelegate.shared.apod.getImageData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

