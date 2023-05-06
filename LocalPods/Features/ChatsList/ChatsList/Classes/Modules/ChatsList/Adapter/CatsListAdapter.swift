import UIKit

protocol CatsListAdapterDelegate: AnyObject {}

final class CatsListAdapter {
    //typealias DataSource = UICollectionViewDataSource<>
    weak var delegate: CatsListAdapterDelegate?
}
