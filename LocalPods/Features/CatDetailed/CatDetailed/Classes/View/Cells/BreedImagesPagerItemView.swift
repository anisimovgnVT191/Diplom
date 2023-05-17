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
    
    private lazy var pagerIndicator = UIPageControl().forAutoLayout().configure {
        $0.backgroundStyle = .prominent
        $0.addTarget(self, action: #selector(self.tapIndicatorDot), for: .valueChanged)
    }
    private lazy var pagerScrollView = UIScrollView().forAutoLayout().configure {
        $0.isPagingEnabled = true
        $0.delegate = self
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
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
        var previousView: UIView = self.pagerScrollView
        
        item.imagesUrls.enumerated().forEach { index, url in
            let imageView = UIImageView().forAutoLayout().configure {
                $0.contentMode = .scaleAspectFit
            }
            
            self.pagerScrollView.addSubview(imageView)
            
            imageView.snp.makeConstraints {
                $0.width.equalToSuperview()
                $0.height.equalToSuperview()
                $0.top.bottom.equalToSuperview()
                $0.left.equalTo(index == 0 ? previousView.snp.left : previousView.snp.right)
                if index == item.imagesUrls.count - 1 {
                    $0.right.equalToSuperview()
                }
            }
            
            imageView.loadImage(fromUrl: url)
            previousView = imageView
        }
        
        self.pagerIndicator.numberOfPages = item.imagesUrls.count
        self.pagerIndicator.currentPage = 0
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
    
    @objc private func tapIndicatorDot() {
        self.pagerScrollView.setContentOffset(
            .init(
                x: Int(self.pagerScrollView.frame.width) * self.pagerIndicator.currentPage,
                y: 0
            ),
            animated: true
        )
    }
}

extension BreedImagesPagerItemView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pagerIndicator.currentPage = Int(round(scrollView.contentOffset.x / scrollView.bounds.width))
    }
}


