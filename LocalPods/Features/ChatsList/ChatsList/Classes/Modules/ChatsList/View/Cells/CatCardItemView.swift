import CompanyMessangerCore
import CompanyMessangerResources
import CompanyMessangerUIKit
import SnapKit
import UIKit

final class CatCardItemView: UIView, ConfigurableView {
    typealias Cell = CollectionViewContainerCell<CatCardItemView>
    
    static let cellId = String(describing: CatCardItemView.self)
    
    struct DisplayItem: Hashable {
        let imageUrl: String
        let isFavorite: Bool
        let breedTitle: String
        @DisplayItemCallback var didTapFavorite: ClosureVoid
    }
    
    private var displayItem: DisplayItem?
    
    private lazy var catImageView = UIImageView().forAutoLayout().configure {
        $0.layer.cornerRadius = 16
        $0.isUserInteractionEnabled = true
    }
    private let titleBlurView = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial)).forAutoLayout()
    private let titleLabel = UILabel().forAutoLayout().configure {
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    }
    
    private let favoriteImageView = UIImageView().forAutoLayout().configure {
        $0.layer.cornerRadius = 12
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: DisplayItem) {
        self.displayItem = item
        
        self.favoriteImageView.image = item.isFavorite
            ? .tic.Images.Common.favoritesSelected()
            : .tic.Images.Common.favoritesDeselected()
        self.titleLabel.text = item.breedTitle
        self.catImageView.loadImage(fromUrl: item.imageUrl)
    }
    
    private func setUpView() {
        self.addSubviews(self.catImageView, self.titleBlurView, self.favoriteImageView)
        self.titleBlurView.addSubview(self.titleLabel)
        
        self.catImageView.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }
        
        self.titleBlurView.snp.makeConstraints {
            $0.left.bottom.bottom.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview().inset(8)
        }
        
        self.favoriteImageView.snp.makeConstraints {
            $0.top.right.equalToSuperview().inset(16)
        }
    }
    
    @objc private func tapFavorite() {
        self.displayItem?.didTapFavorite()
    }
}
