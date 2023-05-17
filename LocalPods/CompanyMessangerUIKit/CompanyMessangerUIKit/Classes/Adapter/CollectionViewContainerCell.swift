import UIKit

open class CollectionViewContainerCell<T: UIView>: UICollectionViewCell
    where T: ConfigurableView {
    public typealias DisplayItem = T.DisplayItem
    
    private let cellContentView = T()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        (self.cellContentView as? ReusableView)?.prepareForReuse()
    }
    
    // MARK: - Configure
    private func setUpView() {
        backgroundColor = .clear
        
        self.contentView.addSubview(self.cellContentView)
        self.cellContentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(
            item: self.cellContentView,
            attribute: .top,
            relatedBy: .equal,
            toItem: self.contentView,
            attribute: .top,
            multiplier: 1.0,
            constant: 0
        ).isActive = true
        NSLayoutConstraint(
            item: self.cellContentView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self.contentView,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0
        ).isActive = true
        NSLayoutConstraint(
            item: self.cellContentView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self.contentView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0
        ).isActive = true
        NSLayoutConstraint(
            item: self.cellContentView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self.contentView,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0
        ).isActive = true
    }
    
    // MARK: - ConfigurableView
    public func configure(with displayItem: T.DisplayItem) {
        self.cellContentView.configure(with: displayItem)
    }
}
