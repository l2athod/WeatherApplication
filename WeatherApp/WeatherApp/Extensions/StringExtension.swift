import Foundation

extension String {
    func convertDateFormat(from: String, to: String) -> Self? {
        let fromFormatter = DateFormatter()
        fromFormatter.dateFormat = from
        
        guard let date = fromFormatter.date(from: self) else {
            return nil
        }
        let toFormatter = DateFormatter()
        toFormatter.dateFormat = to
        
        return toFormatter.string(from: date)
    }
    
    func convertDate(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)!
    }
}
