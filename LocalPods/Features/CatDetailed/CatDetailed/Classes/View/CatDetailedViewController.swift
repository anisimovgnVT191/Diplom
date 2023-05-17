import UIKit

final class CatDetailedViewController: UIViewController {
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: self.collectionAdapter.compositionalLayout()
    ).forAutoLayout().configure {
        $0.backgroundColor = .clear
    }
    
    private let output: CatDetailedViewOutput
    private let collectionAdapter: CatDetailedAdapter
    
    init(output: CatDetailedViewOutput, collectionAdapter: CatDetailedAdapter) {
        self.output = output
        self.collectionAdapter = collectionAdapter
        
        super.init(nibName: nil, bundle: nil)
        
        self.collectionAdapter.collectionView = self.collectionView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
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

extension CatDetailedViewController: CatDetailedViewInput {
    func updateSections(with sections: [CatDetailedSection], animating: Bool) {
        self.collectionAdapter.updateDataSource(with: sections, animating: animating)
    }
    
    func setTitle(_ title: String) {
        self.navigationItem.title = title
    }
}
