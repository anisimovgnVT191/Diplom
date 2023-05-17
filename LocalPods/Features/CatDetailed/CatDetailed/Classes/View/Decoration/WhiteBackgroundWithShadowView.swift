import UIKit

final class WhiteBackgroundWithShadowView: UICollectionReusableView {
    static let id = String(describing: WhiteBackgroundWithShadowView.self)
    
    override var reuseIdentifier: String? {
        return WhiteBackgroundWithShadowView.id
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        self.backgroundColor = .white
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 24
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 34
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
    }
}
