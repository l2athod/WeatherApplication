import Foundation
import UIKit

extension UIFont {
    static func robotoSlabMedium(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "RobotoSlab-Medium", size: ofSize) ?? .systemFont(ofSize: ofSize)
    }
    
    static func robotoSlabLight(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "RobotoSlab-Light", size: ofSize) ?? .systemFont(ofSize: ofSize)
    }
}
