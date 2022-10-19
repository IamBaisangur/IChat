//
//  Extensions.swift
//  IChat
//
//  Created by Байсангур on 19.09.2022.
//

import Foundation
import UIKit

// MARK: - extension UIView

extension UIView {
    
    func applyGradients(cornerRadius: CGFloat) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientView = GradientView(from: .topTrailing, to: .bottomLeading,  startColor: #colorLiteral(red: 0.8309441209, green: 0.7057330012, blue: 0.9536229968, alpha: 1), endColor: #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))
        if let gradientLayer = gradientView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = cornerRadius
            
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}

// MARK: - extension UIViewController

extension UIViewController {
    func configure<T: SelfConfiguringCell, U: Hashable> (collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")}
        cell.configure(with: value)
        return cell
    }
}

// MARK: - extension UIButton

extension UIButton {
    convenience init(title: String,
                     backgroundColor: UIColor,
                     titleColor: UIColor,
                     font: UIFont? = .avenir20(),
                     isShadow: Bool = false,
                     cornerRadius: CGFloat = 4) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        
        self.layer.cornerRadius = cornerRadius
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
    
    func customizeGoogleButtom() {
        let googleLogo = UIImageView(image: #imageLiteral(resourceName: "googleLogo"), contentMode: .scaleAspectFit)
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(googleLogo)
        NSLayoutConstraint.activate([
            googleLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 26),
            googleLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    }
}

// MARK: - extension UIFont

extension UIFont {
    static func avenir20() -> UIFont? {
        return UIFont.init(name: "avenir", size: 20)
    }
    
    static func avenir26() -> UIFont? {
        return UIFont.init(name: "avenir", size: 26)
    }
    
    static func laoSangamMN20() -> UIFont? {
        return UIFont.init(name: "Lao Sangam MN", size: 20)
    }
    
    static func laoSangamMN18() -> UIFont? {
        return UIFont.init(name: "Lao Sangam MN", size: 18)
    }
}

// MARK: - extension UIColor

extension UIColor {
    static func buttonRed() -> UIColor {
        return #colorLiteral(red: 0.8156862745, green: 0.007843137255, blue: 0.1058823529, alpha: 1)
    }

    static func mainWhite() -> UIColor {
        return #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
    }
    
    static func buttonDark() -> UIColor {
        return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    static func textFieldLight() -> UIColor {
        return #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
    }
}


// MARK: - extension UILabel

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        self.text = text
        self.font = font
    }
}

// MARK: - extension UIImageView

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
    
    func setupColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

// MARK: - extension UIStackView

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews:  arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }
}

// MARK: - extension UISegmentedControl

extension UISegmentedControl {
    
    convenience init(first: String, second: String) {
        self.init()
        self.insertSegment(withTitle: first, at: 0, animated: true)
        self.insertSegment(withTitle: second, at: 1, animated: true)
        self.selectedSegmentIndex = 0
    }
}
