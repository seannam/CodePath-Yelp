//
//  Business.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class Business: NSObject {
    let name: String?
    let address: String?
    let imageURL: URL?
    let categories: String?
    let distance: String?
    let ratingImageURL: URL?
    let reviewCount: NSNumber?
    
    let phone: String?
    let snippetURL: URL?
    
    let longitude: Double?
    let latitude: Double?
    
    let latitudeDelta: Double?
    let longitudeDelta: Double?
    
    init(dictionary: NSDictionary) {
        name = dictionary["name"] as? String
        
        let imageURLString = dictionary["image_url"] as? String
        if imageURLString != nil {
            imageURL = URL(string: imageURLString!)!
        } else {
            imageURL = nil
        }
        
        let location = dictionary["location"] as? NSDictionary
        var address = ""
        if location != nil {
            let addressArray = location!["address"] as? NSArray
            if addressArray != nil && addressArray!.count > 0 {
                address = addressArray![0] as! String
            }
            
            let neighborhoods = location!["neighborhoods"] as? NSArray
            if neighborhoods != nil && neighborhoods!.count > 0 {
                if !address.isEmpty {
                    address += ", "
                }
                address += neighborhoods![0] as! String
            }
        }
        self.address = address
        
        let categoriesArray = dictionary["categories"] as? [[String]]
        if categoriesArray != nil {
            var categoryNames = [String]()
            for category in categoriesArray! {
                let categoryName = category[0]
                categoryNames.append(categoryName)
            }
            categories = categoryNames.joined(separator: ", ")
        } else {
            categories = nil
        }
        
        let distanceMeters = dictionary["distance"] as? NSNumber
        if distanceMeters != nil {
            let milesPerMeter = 0.000621371
            distance = String(format: "%.2f mi", milesPerMeter * distanceMeters!.doubleValue)
        } else {
            distance = nil
        }
        
        let ratingImageURLString = dictionary["rating_img_url_large"] as? String
        if ratingImageURLString != nil {
            ratingImageURL = URL(string: ratingImageURLString!)
        } else {
            ratingImageURL = nil
        }
        
        reviewCount = dictionary["review_count"] as? NSNumber
        
        let phoneNumber = dictionary["display_phone"] as? String
        if phoneNumber != nil {
            phone = phoneNumber
        } else {
            phone = nil
        }
        
        
        let snippetImageURLString = dictionary["snippet_image_url"] as? String
        if snippetImageURLString != nil {
            snippetURL = URL(string: snippetImageURLString!)
        } else {
            snippetURL = nil
        }
        
        let lat = dictionary["region.center.latitude"] as? Double
        if lat != nil {
            latitude = lat
        } else {
            latitude = nil
        }
        
        let lon = dictionary["region.center.longitude"] as? Double
        if lon != nil {
            longitude = lon
        } else {
            longitude = nil
        }
        
        let latDelta = dictionary["region.span.latitude_delta"] as? Double
        if latDelta != nil {
            latitudeDelta = latDelta
        } else {
            latitudeDelta = nil
        }
        
        let lonDelta = dictionary["region.span.longitude_delta"] as? Double
        if lonDelta != nil {
            longitudeDelta = lonDelta
        } else {
            longitudeDelta = nil
        }
    }
    
    class func businesses(array: [NSDictionary]) -> [Business] {
        var businesses = [Business]()
        for dictionary in array {
            let business = Business(dictionary: dictionary)
            businesses.append(business)
        }
        return businesses
    }
    
    class func searchWithTerm(term: String, offset:Int?, completion: @escaping ([Business]?, Error?) -> Void) {
        _ = YelpClient.sharedInstance.searchWithTerm(term, pgOffset: offset!, completion: completion)
    }
    
    class func searchWithTerm(term: String, offset:Int?, sort: YelpSortMode?, categories: [String]?, deals: Bool?, completion: @escaping ([Business]?, Error?) -> Void) -> Void {
        _ = YelpClient.sharedInstance.searchWithTerm(term, pgOffset: offset!, sort: sort, categories: categories, deals: deals, completion: completion)
    }
}
