import CompanyMessangerUIKit
import SnapKit
import UIKit

final class BreedDescriptionItemView: UIView, ConfigurableView {
    typealias Cell = CollectionViewContainerCell<BreedDescriptionItemView>
    
    static let cellId = String(describing: BreedDescriptionItemView.self)
    
    struct DisplayItem: Hashable {
        let description: String
    }
    
    private let descriptionLabel = UILabel().forAutoLayout().configure {
        $0.font = .italicSystemFont(ofSize: 14)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: DisplayItem) {
        self.descriptionLabel.text = item.description
        self.layoutIfNeeded()
    }
    
    private func setUpView() {
        self.addSubviews(self.descriptionLabel)
        
        self.descriptionLabel.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }
    }
}
