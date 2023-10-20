import Foundation
import UIKit

extension UIColor {
    static let shadowColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
    static let backgroundColor: UIColor = UIColor.hexToColor(hexcode: "#828CAE")
    static let viewReportColor: UIColor = UIColor.hexToColor(hexcode: "#002688")
    static let collectionViewCellColor: UIColor =  UIColor.hexToColor(hexcode: "#A7B4E0")
    static let collectionViewBackgroundColor: UIColor =  UIColor.hexToColor(hexcode: "#7882A7")
    static let tabBarColor: UIColor = UIColor(red: 0.656, green: 0.706, blue: 0.879, alpha: 1)
    
    static func hexToColor(hexcode: String) -> UIColor {
        var hexSanitized = hexcode.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
