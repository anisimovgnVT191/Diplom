import CompanyMessangerCore
import CompanyMessangerUIKit
import SnapKit
import UIKit

final class BreedImagesPagerItemView: UIView, ConfigurableView, ReusableView {
    typealias Cell = CollectionViewContainerCell<BreedImagesPagerItemView>
    
    static let cellId = String(describing: BreedImagesPagerItemView.self)
    
    struct DisplayItem: Hashable {
        let imagesUrls: [String]
    }
    
    private let pagerIndicator = UIPageControl().forAutoLayout()
    private let pagerScrollView = UIScrollView().forAutoLayout().configure {
        $0.isPagingEnabled = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForReuse() {
        self.pagerScrollView.subviews.forEach { $0.removeFromSuperview() }
        self.pagerIndicator.currentPage = 0
        self.pagerIndicator.numberOfPages = 0
    }
    
    func configure(with item: DisplayItem) {
        var previousView: UIView = self
        
        item.imagesUrls.enumerated().forEach { index, url in
            let imageView = UIImageView()
            
            self.pagerScrollView.addSubview(imageView)
            
            imageView.snp.makeConstraints {
                $0.width.equalToSuperview()
                $0.top.bottom.equalToSuperview()
                $0.left.equalTo(previousView.snp.left)
                if index == item.imagesUrls.count - 1 {
                    $0.right.equalToSuperview()
                }
            }
            
            imageView.loadImage(fromUrl: url)
            previousView = imageView
        }
    }
    
    private func setUpView() {
        self.addSubviews(self.pagerScrollView, self.pagerIndicator)
        
        self.pagerScrollView.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }
        
        self.pagerIndicator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
}

extension BreedImagesPagerItemView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pagerIndicator.currentPage = Int(round(scrollView.contentOffset.x / scrollView.bounds.width))
    }
}


