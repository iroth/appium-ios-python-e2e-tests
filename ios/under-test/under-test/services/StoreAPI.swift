//
//  StoreAPI.swift
//  SwiftApp
//
//  Created by Israel Roth on 11/2/14.
//  Copyright (c) 2014 Israel Roth. All rights reserved.
//


typealias listCompletionCallback = ([String], Int)->()

class StoreAPI {

    func getProductList(completion: listCompletionCallback) {
        request(.GET, "http://localhost:8000/api/product_list.json").responseJSON { (_, _, JSON, _) in
            println(JSON)
            if JSON != nil {
                let jsonResult = JSON as? Dictionary<String, AnyObject>
                let prodList = jsonResult!["products"] as? [String]
                if prodList != nil {
                    completion (prodList!, 200)
                }
                else {
                    completion([], 500)
                }
            }
            else {
                completion([], 400)
            }
        }
    }
}
