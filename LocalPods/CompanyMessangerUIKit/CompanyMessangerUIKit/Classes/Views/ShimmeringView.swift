import UIKit

public final class ShimmeringView: UIView {
    // MARK: - Variables
    var shimmeringColor: UIColor = .white {
        didSet { updateShimmeringColor() }
    }
    var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    var gradienMask: CALayer? {
        get { return laShimmering.mask }
        set { laShimmering.mask = newValue }
    }
    
    // MARK: - UI
    private let laShimmering = CAGradientLayer()
    
    // MARK: - Init
    convenience init(cornerRadius: CGFloat = 0) {
        self.init()
        
        self.cornerRadius = cornerRadius
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        laShimmering.frame = self.bounds
    }
    
    // MARK: - Inputs
    public func startShimmering() {
        layoutIfNeeded()
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.52, -0.48, 0.0]
        animation.toValue = [1.0, 1.48, 1.52, 2.0]
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.duration = 0.6
        animation.isRemovedOnCompletion = false
        laShimmering.add(animation, forKey: animation.keyPath)
        laShimmering.isHidden = false
    }
    
    public func stopShimmering() {
        laShimmering.removeAllAnimations()
        laShimmering.isHidden = true
    }
    
    // MARK: - Configure
    private func configure() {
        backgroundColor = .lightGray.withAlphaComponent(0.4)
        
        layer.addSublayer(laShimmering)
        laShimmering.startPoint = CGPoint(x: 0, y: 0.5)
        laShimmering.endPoint = CGPoint(x: 1, y: 0.5)
        laShimmering.locations = [0.0, 0.48, 0.52, 1.0]
        laShimmering.isHidden = true
        
        updateShimmeringColor()
    }
    
    // MARK: - Private
    private func updateShimmeringColor() {
        laShimmering.colors = [
            shimmeringColor.withAlphaComponent(0).cgColor,
            shimmeringColor.withAlphaComponent(0.4).cgColor,
            shimmeringColor.withAlphaComponent(0.4).cgColor,
            shimmeringColor.withAlphaComponent(0).cgColor
        ]
    }
}
