import Foundation
import UIKit

extension UIView {
    func applyShadow(color: UIColor, opacity: Float, radius: CGFloat, offset: CGSize) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
    }
}
