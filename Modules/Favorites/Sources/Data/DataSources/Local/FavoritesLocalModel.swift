//
//  FavoriteLocalModel.swift
//  
//
//  Created by Miguel Angel on 28-05-21.
//

import CoreData
import Foundation
import AltairMDKProviders

@objc(FavoritesLocalModel)
public class FavoritesLocalModel: NSManagedObject, Storable {
    public static var entityName: String = "Favorite"
    
    @NSManaged public var id: Int16

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritesLocalModel> {
        return NSFetchRequest<FavoritesLocalModel>(entityName: "Favorite")
    }
}
