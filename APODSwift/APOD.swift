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
    var data: String?
    var explanation: String?
    var title: String?
    var hdUrl: String?
    var url: String?
}

class APOD {
    public private(set) var apiKey: String
    
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
                
                print(json)
            }
            catch let error as NSError
            {
                print(error)
            }
        })
        task.resume()
        
    }
    
    func downloadImage(isHD: Bool)
    {
        
    }
}
