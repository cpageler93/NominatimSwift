//
//  SearchOptions.swift
//  NominatimSwift
//
//  Created by Christoph Pageler on 13.01.21.
//


import Foundation


public struct SearchOptions {

    var street: String?
    var city: String?
    var postalCode: String?
    var country: String?

    init(street: String?, city: String?, postalCode: String?, country: String?) {
        self.street = street
        self.city = city
        self.postalCode = postalCode
        self.country = country
    }

}
