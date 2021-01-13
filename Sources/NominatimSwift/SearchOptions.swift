//
//  SearchOptions.swift
//  NominatimSwift
//
//  Created by Christoph Pageler on 13.01.21.
//


import Foundation


public struct SearchOptions {

    public var query: String?
    public var street: String?
    public var city: String?
    public var postalCode: String?
    public var country: String?

    public init(query: String) {
        self.query = query
    }

    public init(street: String?, city: String?, postalCode: String?, country: String?) {
        self.street = street
        self.city = city
        self.postalCode = postalCode
        self.country = country
    }

}
