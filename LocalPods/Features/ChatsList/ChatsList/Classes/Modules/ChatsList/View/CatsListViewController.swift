import SnapKit
import UIKit

public final class ChatsListViewController: UIViewController {
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: self.collectionAdapter.compositionalLayout()
    ).forAutoLayout().configure {
        $0.backgroundColor = .clear
    }
    
    private let output: CatsListViewOutput
    private let collectionAdapter: CatsListAdapter
    
    init(output: CatsListViewOutput, collectionAdapter: CatsListAdapter) {
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
        self.output.viewDidLoad()
    }
    
    private func setUpView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.collectionView)
        
        self.collectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.left.bottom.right.equalToSuperview()
        }
    }
}

extension ChatsListViewController: CatsListViewInput {
    public func updateSections(_ sections: [CatsListSection], animating: Bool) {
        self.collectionAdapter.updateDataSource(sections, animating: animating)
    }
}

extension ChatsListViewController: CatsListAdapterDelegate {
    func didSelectItem(_ item: CatsListSection.Item, at index: Int) {
        switch item {
        case .cat:
            self.output.onCatTapped(at: index)
        default:
            break
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height > 0,
           scrollView.contentSize.height - scrollView.contentOffset.y <= 1.5 * scrollView.frame.height {
            self.output.onScrollPassBottomItems()
        }
    }
}
