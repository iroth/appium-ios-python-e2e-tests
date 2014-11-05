//
//  ProductListModel.swift
//  under-test
//
//  Created by Israel Roth on 11/5/14.
//  Copyright (c) 2014 Israel Roth. All rights reserved.
//

class ProductListModel {
    var dataSource = GenericListDataSource<ProductModel>()
    let storeApi = StoreAPI()
    
    init(loaded: () -> (), error: (Int) -> ()) {
        storeApi.getProductList({ (prodList: [String], resultCode: Int) in
            if resultCode == 200 {
                for p in prodList {
                    self.dataSource.addItem(ProductModel(name: p))
                }
                loaded()
            }
            else {
                error(resultCode)
            }
        })
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
