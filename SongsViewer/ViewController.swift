//
//  ViewController.swift
//  SongsViewer
//
//  Created by furukawa on 2022/10/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.showSongs()
    }

    private func showSongs() {
        let urlString = "http://itunes.apple.com/search?term=Ryuichi+Sakamoto&entity=musicTrack&limit=3&lang=ja_jp&country=JP"
        let url = NSURL(string: urlString)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let dataTask = session.dataTask(with: url! as URL, completionHandler: { (data, response, error) -> Void in
            if (error == nil) {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as! [String:AnyObject]
                    let results = json["results"] as! [[String:AnyObject]]
                    for song in results {
                        let trackName = song["trackName"] as! String
                        let artistName = song["artistName"] as! String
                        print(artistName)
                        print(trackName)
                    }
                }
                catch {
                    print("Error!!")
                }
            }
        })
        dataTask.resume()
    }

}

