//
//  ProductListModel.swift
//  under-test
//
//  Created by Israel Roth on 11/5/14.
//  Copyright (c) 2014 Israel Roth. All rights reserved.
//

class ProductListModel {
    var dataSource = GenericListDataSource<ProductModel>()
    
    init() {
        dataSource.addItem(ProductModel(name: "p1"))
        dataSource.addItem(ProductModel(name: "p2"))
    }

    var itemsCount: Int {
        get {
            return dataSource.itemsCount
        }
    }
    
    func itemForRow(row: Int) -> ProductModel {
        return dataSource.itemForRow(row)
    }

}
