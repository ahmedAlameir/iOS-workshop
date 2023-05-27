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
    private init(){
        
    }
    
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
    
    func saveMeal(withData data: Meal) {
        let managedObjectContext = persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "MealEntity", in: managedObjectContext) else {
            fatalError("Failed to create entity description for MealEntity")
        }
        
        let mealEntity = MealEntity(entity: entity, insertInto: managedObjectContext)
        mealEntity.chefName = data.credits?.first?.name
        mealEntity.foodType = data.credits?.first?.type
        mealEntity.mealImage = data.thumbnailURL
        mealEntity.mealName = data.name
        mealEntity.id =  Int32(data.id ?? 0)
        mealEntity.servingsNumber = Int32(data.numServings ?? 0 )
  
        
        saveContext()
    }
    
    
     func fetchAllMeals() -> [Meal] {
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<MealEntity> = MealEntity.fetchRequest()
        
        do {
            let mealEntities = try managedObjectContext.fetch(fetchRequest)
            return mealEntities.map { mealEntity in
                Meal(
                    id: Int(  mealEntity.id ),

                    name: mealEntity.mealName,
                    credits: [Credit(name: mealEntity.chefName, type: mealEntity.foodType)],
                    thumbnailURL: mealEntity.mealImage,
                    videoURL:  nil,
                    numServings: Int(  mealEntity.servingsNumber ),
                    instructions: nil,
                    tags: nil
                )
            }
        } catch {
            fatalError("Failed to fetch meals: \(error)")
        }
    }
    
    func deleteMeal(withId id: Int) {
            let managedObjectContext = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<MealEntity> = MealEntity.fetchRequest()

            // Set a predicate to fetch the meal entity with the matching show_id
            fetchRequest.predicate = NSPredicate(format: "id == %@", NSNumber(value: id))

            do {
                let mealEntities = try managedObjectContext.fetch(fetchRequest)

                guard let mealEntity = mealEntities.first else {
                    // Meal entity not found, handle the error or return
                    return
                }

                managedObjectContext.delete(mealEntity)
                saveContext()
            } catch {
                fatalError("Failed to fetch or delete meal: \(error)")
            }
        }
    
    // MARK: - Core Data Stack
    
    private func saveContext() {
        let managedObjectContext = persistentContainer.viewContext
        managedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                fatalError("Failed to save managed object context: \(error)")
            }
        }
    }
}
