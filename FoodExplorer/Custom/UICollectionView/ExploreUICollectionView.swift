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
        height: CGFloat,
        topEdge: CGFloat = 0,
        leftEdge: CGFloat = Constants.leftDistanceToView,
        rightEdge: CGFloat = Constants.rightDistanceToView,
        bottomEdge: CGFloat = 0,
        lineSpacing: CGFloat,
        scrollDirection: UICollectionView.ScrollDirection,
        horizontalIndicator: Bool = false,
        verticalIndicator: Bool = false,
        cellClass: AnyClass,
        identifier: String
    ) {
        super.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        setupCollectionView(cellClass: cellClass, identifier: identifier)
        setupConstraintsCollectionView(height: height)
        setupContentInsetCollectionView(
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
    private func setupCollectionView(cellClass: AnyClass, identifier: String) {
        delegate = self
        dataSource = self
        register(cellClass, forCellWithReuseIdentifier: identifier)
    }

    private func setupConstraintsCollectionView(height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    private func setupContentInsetCollectionView(
        topEdge: CGFloat,
        leftEdge: CGFloat,
        rightEdge: CGFloat,
        bottomEdge: CGFloat
    ) {
        contentInset = UIEdgeInsets(
            top: topEdge,
            left: leftEdge,
            bottom: bottomEdge,
            right: rightEdge
        )
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
            withReuseIdentifier: Constants.discoveryCollectionViewCell,
            for: indexPath
        ) as? DiscoveryCollectionViewCell else {
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
