import UIKit

public final class HomeViewController: UIViewController {
    private let output: HomeViewOutput
    
    init(output: HomeViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController: HomeViewInput {}
