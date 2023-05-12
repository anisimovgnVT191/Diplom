import UIKit

final class CatDetailedViewController: UIViewController {
    private let output: CatDetailedViewOutput
    
    init(output: CatDetailedViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CatDetailedViewController: CatDetailedViewInput {
    
}
