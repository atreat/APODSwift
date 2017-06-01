//
//  APOD.swift
//  APODSwift
//
//  Created by Austin Emmons on 5/25/17.
//  Copyright © 2017 Modo Labs. All rights reserved.
//

import UIKit

struct ImageData
{
    var copyright: String?
    var date: String?
    var explanation: String?
    var title: String?
    var hdUrl: String?
    var url: String?
}

class APOD {
    public private(set) var apiKey: String
    public private(set) var imageData: ImageData?
    public private(set) var image: UIImage?
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func getImageData()
    {
        
        let request = NSMutableURLRequest(url: URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)")!)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print(error!)
                return
            }
            do
            {
                let json = try JSONSerialization.jsonObject(with: data!) as! [String: String]
                self.imageData = ImageData(copyright: json["copyright"],
                                      date: json["date"],
                                      explanation: json["explanation"],
                                      title: json["title"],
                                      hdUrl: json["hdurl"],
                                      url: json["url"])
                self.downloadImage()
                
                print(json)
            }
            catch let error as NSError
            {
                print(error)
            }
        })
        task.resume()
        
    }
    
    func downloadImage()
    {
        do
        {
            let data = try Data(contentsOf: URL(string: (self.imageData?.hdUrl!)!)!)
            self.image = UIImage(data: data)
            DispatchQueue.main.async
            {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dataIsReady"), object: nil)
            }
        }
        catch let error as NSError
        {
            print(error)
        }
        
    }
}
