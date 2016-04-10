//
//  ViewController.swift
//  product
//
//  Created by 彥勝 王 on 4/11/16.
//  Copyright © 2016 Jerry. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cleanUpProducts()
        
        self.addProduct("iPhone 6s 16GB", price: 24500)
        self.addProduct("iPhone 6s 64GB", price: 28500)
        self.addProduct("iPhone 6s 128GB", price: 22500)
        
        self.updateProductPrice()
        
        self.showProducts()
        
    }
    
    
    //add
    func addProduct(name:String, price:Int) {
        let product = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: self.moc) as! Product
        product.name = name
        product.price = price
        do {
            try self.moc.save()
        }catch{
            fatalError("Failure to save context: \(error)")
        }
    }
    
    //get
    func showProducts() {
        let request = NSFetchRequest(entityName: "Product")
        do {
            let results = try moc.executeFetchRequest(request) as! [Product]
            for result in results {
                print("Product Name: \(result.name!), Price: \(result.price!)")
            }
        }catch{
            fatalError("Failed to fetch data: \(error)")
        }
    }
    
    //delete
    func cleanUpProducts() {
        let request = NSFetchRequest(entityName: "Product")
        do {
            let results = try moc.executeFetchRequest(request) as! [Product]
            for result in results {
                moc.deleteObject(result)
            }
            do {
                try moc.save()
            }catch{
                fatalError("Failure to save context: \(error)")
            }
        }catch{
            fatalError("Failed to fetch data: \(error)")
        }
    }
    
    //update
    func updateProductPrice(){
        let request = NSFetchRequest(entityName: "Product")
        request.predicate = NSPredicate(format: "name == %@", "iPhone 6s 128GB")
        do{
            let results = try moc.executeFetchRequest(request) as! [Product]
            if (results.count > 0){
                let product = results[0]
                product.price = 32500
                try self.moc.save()
            }
        } catch {
            fatalError("Failed to update data: \(error)")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

