import SnapKit
import UIKit

public final class ChatsListViewController: UIViewController {
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: self.collectionAdapter.compositionalLayout()
    ).forAutoLayout()
    
    private let output: ChatsListViewOutput
    private let collectionAdapter: CatsListAdapter
    
    init(output: ChatsListViewOutput, collectionAdapter: CatsListAdapter) {
        self.output = output
        self.collectionAdapter = collectionAdapter
        
        super.init(nibName: nil, bundle: nil)
        
        self.collectionAdapter.collectionView = self.collectionView
        self.collectionAdapter.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpView()
        self.viewDidLoad()
    }
    
    private func setUpView() {
        self.view.addSubview(self.collectionView)
        
        self.collectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.left.bottom.right.equalToSuperview()
        }
    }
}

extension ChatsListViewController: ChatsListViewInput {
    public func updateSections(_ sections: [CatsListSection], animating: Bool) {
        self.collectionAdapter.updateDataSource(sections, animating: animating)
    }
}

extension ChatsListViewController: CatsListAdapterDelegate {
    func didSelectItem(_ item: CatsListSection.Item, at index: Int) {
        switch item {
        case .cat:
            self.output.onCatTapped(at: index)
        }
    }
}
