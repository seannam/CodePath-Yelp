//
//  BusinessDetailsViewController.swift
//  Yelp
//
//  Created by Sean Nam on 2/20/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var name: String?
    var distance: String?
    var ratingsImageURL: URL?
    var categories: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = name
        distanceLabel.text = distance
        categoriesLabel.text = categories
        if let ratingsImageUrl = ratingsImageURL {
            self.ratingImageView.setImageWith(ratingsImageUrl)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
