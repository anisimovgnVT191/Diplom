import CompanyMessangerUIKit
import UIKit

final class BreedCharacteristicItemView: UIView, ConfigurableView {
    typealias Cell = CollectionViewContainerCell<BreedCharacteristicItemView>
    
    static let cellId = String(String(describing: BreedCharacteristicItemView.self))
    
    struct DisplayItem: Hashable {
        let title: String
        let characteristicRate: Int
    }
    
    private var cachedCharacteristicRate = 0
    
    private let titleLabel = UILabel().forAutoLayout().configure {
        $0.textColor = .black
    }
    private let starsStackView = UIStackView().forAutoLayout().configure {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.spacing = 6
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
        
        self.updateStarsSelection(with: item.characteristicRate - 1)
        self.cachedCharacteristicRate = item.characteristicRate - 1
    }
    
    private func setUpView() {
        self.addSubviews(self.titleLabel, self.starsStackView)
        
        self.titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.lessThanOrEqualTo(self.starsStackView.snp.left).offset(-16)
        }
        
        self.starsStackView.snp.makeConstraints {
            $0.top.bottom.right.equalToSuperview()
        }
        
        (0..<5).forEach { _ in
            let starImageView = UIImageView(image: .tic.Images.CatDetailed.starDeselected())
            starImageView.contentMode = .scaleAspectFit
            
            self.starsStackView.addArrangedSubview(starImageView)
            
            starImageView.snp.makeConstraints {
                $0.width.height.equalTo(24)
            }
        }
    }
    
    private func updateStarsSelection(with rate: Int) {
        let sliceStart = min(self.cachedCharacteristicRate, rate)
        let sliceEnd = max(self.cachedCharacteristicRate, rate)
        let slice = self.starsStackView.subviews[sliceStart...sliceEnd]
        
        slice.forEach { view in
            (view as? UIImageView)?.image = self.cachedCharacteristicRate > rate
                ? .tic.Images.CatDetailed.starDeselected()
                : .tic.Images.CatDetailed.starSelected()
        }
    }
}
