import CompanyMessangerCore
import CompanyMessangerUIKit
import UIKit

final class CatCardSkeletonView: UIView, ConfigurableView, ReusableView {
    typealias Cell = CollectionViewContainerCell<CatCardSkeletonView>
    
    static let cellId = String(describing: CatCardSkeletonView.self)
    
    struct DisplayItem: Hashable {}
    
    private let shimmeringView = ShimmeringView().forAutoLayout().configure {
        $0.layer.shadowOffset = .zero
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 15
        $0.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        $0.layer.cornerRadius = 16
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForReuse() {
        self.stopShimmering()
    }
    
    func configure(with item: DisplayItem) {
        self.startShimmering()
    }
    
    private func setUpView() {
        self.addSubview(self.shimmeringView)
        
        self.shimmeringView.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }
    }
    
    private func startShimmering() {
        self.subviews.forEach { ($0 as? ShimmeringView)?.startShimmering() }
    }
    
    private func stopShimmering() {
        self.subviews.forEach { ($0 as? ShimmeringView)?.stopShimmering() }
    }
}
