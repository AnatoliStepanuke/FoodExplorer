import UIKit

final class ExploreUICollectionView: UICollectionView,
                                     UICollectionViewDelegate,
                                     UICollectionViewDataSource,
                                     UICollectionViewDelegateFlowLayout {

    // MARK: - Constants
    private let starUIImage = UIImage(named: "star")
    private let collectionViewFlowLayout = UICollectionViewFlowLayout()

    // MARK: - Properties
    private var cells = [Restaurant]()

    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        setupCollectionView()
        setupCollectionViewFlowLayout()
    }

    // MARK: - Setups
    private func setupCollectionView() {
        contentInset = UIEdgeInsets(
            top: 0, left: Constants.leftDistanceToView,
            bottom: 0, right: Constants.rightDistanceToView
        )
        delegate = self
        dataSource = self
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseId)
    }

    private func setupCollectionViewFlowLayout() {
        collectionViewFlowLayout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        collectionViewFlowLayout.scrollDirection = .horizontal
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }

    // MARK: - API
    func setCells(cells: [Restaurant]) {
        self.cells = cells
    }

    // MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: Constants.reuseId,
            for: indexPath
        ) as? GalleryCollectionViewCell else {
            fatalError("DequeueReusableCell failed while casting.")
        }
        cell.configure(using: cells[indexPath.row], starImage: starUIImage)
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: Constants.galleryItemWidth, height: frame.height)
    }
}
