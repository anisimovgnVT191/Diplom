import UIKit

public final class ProfileViewController: UIViewController {
    private let output: ProfileViewOutput
    
    init(output: ProfileViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileViewController: ProfileViewInput {}
