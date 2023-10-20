import Foundation
import CoreData


import Foundation
import CoreData

@objc(CDDetailCard)
public class CDDetailCard: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDDetailCard> {
        return NSFetchRequest<CDDetailCard>(entityName: "CDDetailCard")
    }
    
    @NSManaged public var discription: String?
    @NSManaged public var image: String?
    @NSManaged public var lat: Double
    @NSManaged public var long: Double
    @NSManaged public var name: String?
    @NSManaged public var tempreature: Double
    @NSManaged public var id: UUID?
}
