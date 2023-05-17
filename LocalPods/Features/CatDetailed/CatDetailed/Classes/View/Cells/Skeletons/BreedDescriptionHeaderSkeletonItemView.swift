import CompanyMessangerUIKit
import SnapKit
import UIKit

final class BreedDescriptionHeaderSkeletonItemView: UIView, ConfigurableView, ReusableView {
    typealias Cell = CollectionViewContainerCell<BreedDescriptionHeaderSkeletonItemView>
    
    static let cellId = String(describing: BreedDescriptionHeaderSkeletonItemView.self)
    
    struct DisplayItem: Hashable {}
    
    private var titleWidthConstraint: Constraint?
    
    private let titleView = ShimmeringView().forAutoLayout().configure {
        $0.layer.cornerRadius = 8
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForReuse() {
        self.titleView.stopShimmering()
    }
    
    func configure(with item: DisplayItem) {
        self.titleView.startShimmering()
    }
    
    private func setUpView() {
        self.addSubview(self.titleView)
        
        self.titleView.snp.makeConstraints {
            $0.height.equalTo(28)
            $0.width.equalToSuperview().multipliedBy(0.3)
            $0.top.left.bottom.equalToSuperview()
        }
    }
}
