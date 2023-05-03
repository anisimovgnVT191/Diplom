import UIKit

public final class ChatsListViewController: UIViewController {
    private let output: ChatsListViewOutput
    
    init(output: ChatsListViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatsListViewController: ChatsListViewInput {}
