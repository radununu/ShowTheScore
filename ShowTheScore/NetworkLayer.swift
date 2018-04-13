//
//  NetworkLayer.swift
//  ShowTheScore
//
//  Created by Nunu, Radu (Developer) on 11/04/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

class NetworkLayer {
    private let scoreURLString = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
    
    func requestScoreData(_ completionHandler:@escaping (Error?, [String: AnyObject]?) -> ()) {
        guard let url = URL(string: scoreURLString) else {
            return
        }
        
        createRequest(with: URLRequest(url: url)) { (error, requestedData) in
            guard let data = requestedData,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else {
                    completionHandler(NSError(domain: "Could not get dictionary", code: 10, userInfo: nil), nil)
                    return
            }
            
            completionHandler(nil, json)
        }
    }
    
    private func createRequest(with request: URLRequest, completionHandler: @escaping (Error?,
        Data?) -> ()) {
        
        URLSession.shared.dataTask(with: request) {(data, response, error) -> Void in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                200...299 ~= response.statusCode else {
                    completionHandler(NSError(domain: "Wrong response", code: 0, userInfo: nil),nil)
                    return
            }
            
            completionHandler(nil, data)
            }.resume()
    }
}
