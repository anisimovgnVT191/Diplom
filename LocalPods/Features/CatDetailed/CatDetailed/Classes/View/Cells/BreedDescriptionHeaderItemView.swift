import CompanyMessangerUIKit
import SnapKit
import UIKit

final class BreedDescriptionHeaderItemView: UIView, ConfigurableView {
    typealias Cell = CollectionViewContainerCell<BreedDescriptionHeaderItemView>
    
    static let cellId = String(describing: BreedDescriptionHeaderItemView.self)
    
    struct DisplayItem: Hashable {
        let title: String
    }
    
    private let titleLabel = UILabel().forAutoLayout().configure {
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .black
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: DisplayItem) {
        self.titleLabel.text = item.title
    }
    
    private func setUpView() {
        self.addSubviews(self.titleLabel)
        
        self.titleLabel.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }
    }
}
