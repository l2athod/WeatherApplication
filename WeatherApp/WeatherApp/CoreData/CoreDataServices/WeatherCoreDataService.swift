import Foundation
import CoreData

protocol IWeatherCoreDataService {
    func fetchById(city: String) -> DetailCardModel?
    func fetch() -> [DetailCardModel]?
    func insert(data: DetailCardModel) -> Bool
    func update(data: DetailCardModel) -> Bool
    func delete(city: String) -> Bool
}

final class WeatherCoreDataService: IWeatherCoreDataService {
    func fetchById(city: String) -> DetailCardModel? {
        guard let cdDetailCardModel: CDDetailCard = fetchById(city: city) else {
            return nil
        }
        return cdDetailCardModel.toConvert()
    }
    
    func fetch() -> [DetailCardModel]? {
        let fetchRequest = NSFetchRequest<CDDetailCard>(entityName: String(describing: CDDetailCard.self))
        
        do {
            let result = try PersistanceContainer.context.fetch(fetchRequest)
            let convertedResult = result.compactMap {
                $0.toConvert()
            }
            return convertedResult
        } catch {
            print("\(error.localizedDescription)")
        }
        return nil
    }
    
    func insert(data: DetailCardModel) -> Bool {
        let cdDetailCardModel = CDDetailCard(context: PersistanceContainer.context)
        cdDetailCardModel.id = data.id
        cdDetailCardModel.discription = data.weatherdescription
        cdDetailCardModel.image = data.image
        cdDetailCardModel.lat = data.lat!
        cdDetailCardModel.long = data.long!
        cdDetailCardModel.name = data.location
        cdDetailCardModel.tempreature = data.tempreature
        
        do {
            try PersistanceContainer.context.save()
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
    
    func update(data: DetailCardModel) -> Bool {
        guard let cdDetailCardModel: CDDetailCard = fetchById(city: data.location) else {
            return true
        }
        cdDetailCardModel.discription = data.weatherdescription
        cdDetailCardModel.image = data.image
        cdDetailCardModel.lat = data.lat!
        cdDetailCardModel.long = data.long!
        cdDetailCardModel.name = data.location
        cdDetailCardModel.tempreature = data.tempreature
        
        do {
            try PersistanceContainer.context.save()
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
    
    func delete(city: String) -> Bool {
        guard let cdDetailCardModel: CDDetailCard = fetchById(city: city) else {
            return true
        }
        PersistanceContainer.context.delete(cdDetailCardModel)
        
        do {
            try PersistanceContainer.context.save()
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
    
    func fetchById(city: String) -> CDDetailCard? {
        let fetchRequest = NSFetchRequest<CDDetailCard>(entityName: String(describing: CDDetailCard.self))
        fetchRequest.predicate =  NSPredicate(format: "name == %@", city)
        
        do {
            let result = try PersistanceContainer.context.fetch(fetchRequest)
            return result.first
        } catch {
            print("\(error.localizedDescription)")
        }
        return nil
    }
}
