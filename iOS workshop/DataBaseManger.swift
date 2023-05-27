//
//  DataBaseManger.swift
//  iOS workshop
//
//  Created by ahmed osama on 27/05/2023.
//

import Foundation
import CoreData
class DatabaseManager {
    static let shared = DatabaseManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Meal")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Failed to load Core Data stack: \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    // MARK: - CRUD Operations
    
    func createMeal(withData data: Meal) {
        let managedObjectContext = persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "MealEntity", in: managedObjectContext) else {
            fatalError("Failed to create entity description for MealEntity")
        }
        
        let mealEntity = MealEntity(entity: entity, insertInto: managedObjectContext)
        mealEntity.chefName = data.credits?.first?.name
        mealEntity.foodType = data.credits?.first?.type
        mealEntity.mealImage = data.thumbnail_url
        mealEntity.mealName = data.name
        mealEntity.servingsNumber = Int32(data.num_servings ?? 0 )
        mealEntity.showId =  Int32(data.show_id ?? 0)
        
        saveContext()
    }
    
    func fetchAllMeals() -> [Meal] {
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<MealEntity> = MealEntity.fetchRequest()
        
        do {
            let mealEntities = try managedObjectContext.fetch(fetchRequest)
            return mealEntities.map { mealEntity in
                Meal(
                    show_id: Int(  mealEntity.showId ),
                    name: mealEntity.mealName,
                    credits: [Credit(name: mealEntity.chefName, type: mealEntity.foodType)],
                    thumbnail_url: mealEntity.mealImage,
                    video_url: nil,
                    num_servings: Int(  mealEntity.servingsNumber ),
                    instructions: nil,
                    tags: nil
                )
            }
        } catch {
            fatalError("Failed to fetch meals: \(error)")
        }
    }
    
    // MARK: - Core Data Stack
    
    private func saveContext() {
        let managedObjectContext = persistentContainer.viewContext
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                fatalError("Failed to save managed object context: \(error)")
            }
        }
    }
}
