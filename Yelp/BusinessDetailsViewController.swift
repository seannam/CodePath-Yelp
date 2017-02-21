//
//  BusinessDetailsViewController.swift
//  Yelp
//
//  Created by Sean Nam on 2/20/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking
import MapKit

class BusinessDetailsViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var detailedMapView: MKMapView!
    
    var name: String?
    var distance: String?
    var categories: String?
    var address: String?
    var ratingsImageURL: URL?
    var backgroundImageUrl: URL?
    var phone: String?
    var latitude: Double?
    var longitude: Double?
    var latitudeDelta: Double?
    var longitudeDelta: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = name
        distanceLabel.text = distance
        categoriesLabel.text = categories
        addressLabel.text = address
        phoneLabel.text = "\(phone!)"
        
        if let ratingsImageUrl = ratingsImageURL {
            self.ratingImageView.setImageWith(ratingsImageUrl)
        }
        if let backgroundImageUrl = backgroundImageUrl {
            self.backgroundImageView.setImageWith(backgroundImageUrl)
        }
        
        if latitude != nil && longitude != nil {
            let centerLocation = CLLocation(latitude: latitude!, longitude: longitude!)
            if latitudeDelta != nil && longitudeDelta != nil {
                goToLocation(location: centerLocation, latitudeDelta: latitudeDelta!, longitudeDelta: longitudeDelta!)
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToLocation(location: CLLocation, latitudeDelta: Double, longitudeDelta: Double) {
        let span = MKCoordinateSpanMake(longitudeDelta, latitudeDelta)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        detailedMapView.setRegion(region, animated: false)
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
