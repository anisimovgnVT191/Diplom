import CompanyMessangerUIKit
import Foundation

final class BreedDescriptionSkeletonItemView: UIView, ConfigurableView, ReusableView {
    typealias Cell = CollectionViewContainerCell<BreedDescriptionSkeletonItemView>
    
    static let cellId = String(describing: BreedDescriptionSkeletonItemView.self)
    
    struct DisplayItem: Hashable {}
    
    private let stackView = UIStackView().forAutoLayout().configure {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 4
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
        self.addSubview(self.stackView)
        
        self.stackView.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }
        
        (0...5).forEach { _ in
            let lineView = ShimmeringView().forAutoLayout().configure { $0.layer.cornerRadius = 4 }
            lineView.snp.makeConstraints { $0.height.equalTo(12) }
            
            self.stackView.addArrangedSubview(lineView)
        }
    }
    
    private func startShimmering() {
        self.stackView.subviews.forEach { ($0 as? ShimmeringView)?.startShimmering() }
    }
    
    private func stopShimmering() {
        self.stackView.subviews.forEach { ($0 as? ShimmeringView)?.stopShimmering() }
    }
}
