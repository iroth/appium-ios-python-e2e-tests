//
//  GenericListDataSource.swift
//  under-test
//
//  Created by Israel Roth on 11/5/14.
//  Copyright (c) 2014 Israel Roth. All rights reserved.
//

class GenericListDataSource<T> {
    var items = [T]()
    var itemsCount: Int {
        get {
            return items.count
        }
    }

    func itemForRow(row: Int) -> T {
        return items[row]
    }

    func addItem(item: T) {
        items.append(item)
    }
}

