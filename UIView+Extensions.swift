import UIKit

/**
 More readable constraints using builder pattern
*/
extension UIView {

    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
        return self
    }

    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
        return self
    }

    @discardableResult
    func leading(to anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
        return self
    }

    @discardableResult
    func trailing(to anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
        return self
    }
    
    @discardableResult
    func centerY(to anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
        return self
    }

    @discardableResult
    func centerX(to anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
        return self
    }
 
    @discardableResult
    func height(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }

    @discardableResult
    func width(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
}


class Example {

    let background = UIView();
    let footer = UIView();

    background
        .leading(to: view.leadingAnchor)
        .trailing(to: view.trailingAnchor, padding: 13)
        .bottom(to: view.bottomAnchor)
        .height(FooterView.heightWithMargin)

    footer
        .leading(to: background.leadingAnchor)
        .trailing(to: background.trailingAnchor)
        .top(to: background.topAnchor)
        .height(100))
}
