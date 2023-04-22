import UIKit

public typealias Constraints = (leading: NSLayoutConstraint, top: NSLayoutConstraint, trailing: NSLayoutConstraint, bottom: NSLayoutConstraint)

public extension UIView {
    @discardableResult
    func forAutoLayout() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    @discardableResult
    func addSubviewWithSimpleLayout(_ subview: UIView, at index: Int? = nil) -> Constraints {
        subview.frame = self.bounds
        subview.translatesAutoresizingMaskIntoConstraints = false
        if let index = index {
            self.insertSubview(subview, at: index)
        } else {
            self.addSubview(subview)
        }
        let constraints = self.makeConstraints(to: subview, top: 0, bottom: 0, leading: 0, trailing: 0)
        NSLayoutConstraint.activate(constraints)
        return (leading: constraints[2], top: constraints[0], trailing: constraints[3], bottom: constraints[1])
    }
    
    func makeConstraints(
        to view: UIView,
        top: CGFloat? = nil,
        bottom: CGFloat? = nil,
        leading: CGFloat? = nil,
        trailing: CGFloat? = nil
    ) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        if let top = top {
            constraints.append(view.topAnchor.constraint(equalTo: self.topAnchor, constant: top))
        }
        if let bottom = bottom {
            constraints.append(self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom))
        }
        if let leading = leading {
            constraints.append(view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leading))
        }
        if let trailing = trailing {
            constraints.append(self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing))
        }
        return constraints
    }
}
