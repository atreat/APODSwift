//
//  ViewController.swift
//  APODSwift
//
//  Created by Austin Emmons on 5/25/17.
//  Copyright © 2017 Modo Labs. All rights reserved.
//

import UIKit

// https://api.nasa.gov/planetary/apod?api_key=VvJtXj1Ejm5kyfAvOleQ104FSt7bNgDalkqq7vba

class MainViewController: UIViewController {

    @IBOutlet var dailyImageView: UIImageView!
    @IBOutlet var copyrightLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var explanationTextView: UITextView!
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        
        AppDelegate.shared.apod.getImageData()
    
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.setDataFields), name: NSNotification.Name(rawValue: "dataIsReady"), object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func setDataFields()
    {
        if let data = AppDelegate.shared.apod.imageData
        {
            copyrightLabel.text = data.copyright
            titleLabel.text = data.title
            dateLabel.text = data.date
            explanationTextView.text = data.explanation
            if let image = AppDelegate.shared.apod.image
            {
                dailyImageView.image = image
            }
        }
    }


}

