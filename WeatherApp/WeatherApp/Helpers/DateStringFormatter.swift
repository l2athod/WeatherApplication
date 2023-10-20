import Foundation

struct DateStringFormatter {
    static func convertToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    static func convertDateFormat(date: String, from: String, to: String) -> String? {
        let fromFormatter = DateFormatter()
        fromFormatter.dateFormat = from
        
        guard let date = fromFormatter.date(from: date) else {
            return nil
        }
        let toFormatter = DateFormatter()
        toFormatter.dateFormat = to
        
        return toFormatter.string(from: date)
    }
    
    static func convertDate(date: String, format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: date)!
    }
}
