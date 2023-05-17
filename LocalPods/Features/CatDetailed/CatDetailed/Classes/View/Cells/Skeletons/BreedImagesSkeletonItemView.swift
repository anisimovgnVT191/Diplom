import CompanyMessangerUIKit
import UIKit

final class BreedImagesSkeletonItemView: UIView, ConfigurableView, ReusableView {
    typealias Cell = CollectionViewContainerCell<BreedImagesSkeletonItemView>
    
    static let cellId = String(describing: BreedImagesSkeletonItemView.self)
    
    struct DisplayItem: Hashable {}
    
    private let imageView = ShimmeringView().forAutoLayout()
    
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
        self.addSubview(self.imageView)
        
        self.imageView.snp.makeConstraints {
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
