//
//  ViewController.swift
//  WixSM1
//
//  Created by Israel Roth on 11/3/14.
//  Copyright (c) 2014 Israel Roth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView?
    var modelLoaded = false
    var model : ProductListModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.model = ProductListModel(loaded: {
            self.modelLoaded = true
            self.collectionView!.reloadData()
            },
            error: { (code: Int) in
        })

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 320, height: 90)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.accessibilityLabel = "ProductList"
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(ProductCollectionViewCell.self,
            forCellWithReuseIdentifier: "ProductCell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if modelLoaded {
            return model!.itemsCount
        }
        else {
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductCell", forIndexPath: indexPath) as ProductCollectionViewCell
        var product: Product
        if modelLoaded {
            product = model!.itemForRow(indexPath.row)
            cell.textLabel?.text = product.name
        }
        return cell
    }
    
}

