//
//  NominatimSwift.swift
//  NominatimSwift
//
//  Created by Christoph Pageler on 13.01.21.
//


import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif


public class NominatimSwift {

    public init() { }

    public func search(_ searchOptions: SearchOptions, completion: @escaping ([SearchResult]?) -> Void) {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "format", value: "jsonv2"),
            URLQueryItem(name: "q", value: searchOptions.query),
            URLQueryItem(name: "street", value: searchOptions.street),
            URLQueryItem(name: "city", value: searchOptions.city),
            URLQueryItem(name: "postalCode", value: searchOptions.postalCode),
            URLQueryItem(name: "country", value: searchOptions.country),
        ].filter({ $0.value != nil })
        var urlComponents = URLComponents(string: "https://nominatim.openstreetmap.org/search")
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url else {
            completion(nil)
            return
        }
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            let searchResults = try? JSONDecoder().decode([SearchResult].self, from: data)
            completion(searchResults)
        }.resume()
    }

}
