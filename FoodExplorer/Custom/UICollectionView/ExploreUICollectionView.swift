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

    init(
        topEdge: CGFloat = 0,
        leftEdge: CGFloat = Constants.leftDistanceToView,
        rightEdge: CGFloat = Constants.rightDistanceToView,
        bottomEdge: CGFloat = 0,
        lineSpacing: CGFloat = Constants.galleryMinimumLineSpacing,
        scrollDirection: UICollectionView.ScrollDirection,
        horizontalIndicator: Bool = false,
        verticalIndicator: Bool = false
    ) {
        super.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        setupCollectionView(
            topEdge: topEdge,
            leftEdge: leftEdge,
            rightEdge: rightEdge,
            bottomEdge: bottomEdge
        )
        setupCollectionViewFlowLayout(
            lineSpacing: lineSpacing,
            scrollDirection: scrollDirection,
            horizontalIndicator: horizontalIndicator,
            verticalIndicator: verticalIndicator
        )
    }

    // MARK: - Setups
    private func setupCollectionView(topEdge: CGFloat, leftEdge: CGFloat, rightEdge: CGFloat, bottomEdge: CGFloat) {
        contentInset = UIEdgeInsets(
            top: topEdge,
            left: leftEdge,
            bottom: bottomEdge,
            right: rightEdge
        )
        delegate = self
        dataSource = self
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseId)
    }

    private func setupCollectionViewFlowLayout(
        lineSpacing: CGFloat,
        scrollDirection: UICollectionView.ScrollDirection,
        horizontalIndicator: Bool,
        verticalIndicator: Bool
    ) {
        collectionViewFlowLayout.minimumLineSpacing = lineSpacing
        collectionViewFlowLayout.scrollDirection = scrollDirection
        showsHorizontalScrollIndicator = horizontalIndicator
        showsVerticalScrollIndicator = verticalIndicator
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
