import CompanyMessangerUIKit
import UIKit

final class BreedCharacteristicsSkeletonItemView: UIView, ConfigurableView, ReusableView {
    typealias Cell = CollectionViewContainerCell<BreedCharacteristicsSkeletonItemView>
    
    static let cellId = String(describing: BreedCharacteristicsSkeletonItemView.self)
    
    struct DisplayItem: Hashable {}
    
    private let titleView = ShimmeringView().forAutoLayout().configure {
        $0.layer.cornerRadius = 6
    }
    private let starsView = ShimmeringView().forAutoLayout().configure {
        $0.layer.cornerRadius = 6
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
        self.addSubviews(self.titleView, self.starsView)
        
        self.titleView.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalToSuperview().multipliedBy(0.25)
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.lessThanOrEqualTo(self.starsView)
        }
        
        self.starsView.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalToSuperview().multipliedBy(0.40)
            $0.right.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
    }
    
    private func startShimmering() {
        self.subviews.forEach { ($0 as? ShimmeringView)?.startShimmering() }
    }
    
    private func stopShimmering() {
        self.subviews.forEach { ($0 as? ShimmeringView)?.stopShimmering() }
    }
}
