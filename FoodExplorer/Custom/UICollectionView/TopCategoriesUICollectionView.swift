import UIKit

final class TopCategoriesUICollectionView: UICollectionView,
                                           UICollectionViewDelegate,
                                           UICollectionViewDataSource,
                                           UICollectionViewDelegateFlowLayout {
    // MARK: - Constants
    private let collectionViewFlowLayout = UICollectionViewFlowLayout()

    // MARK: - Properties
    var topCategories = [TopCategory]()

    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(
        height: CGFloat,
        topEdge: CGFloat = 0,
        leftEdge: CGFloat = TopCategoriesCollectionViewCell.Constants.leftDistanceToView,
        rightEdge: CGFloat = TopCategoriesCollectionViewCell.Constants.rightDistanceToView,
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
    func setCells(topCategories: [TopCategory]) {
        self.topCategories = topCategories
    }

    // MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topCategories.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: TopCategoriesCollectionViewCell.Constants.topCategoriesCollectionViewCell,
            for: indexPath
        ) as? TopCategoriesCollectionViewCell else {
            fatalError("DequeueReusableCell failed while casting.")
        }
        cell.configure(using: topCategories[indexPath.row])
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: TopCategoriesCollectionViewCell.Constants.galleryItemWidth, height: frame.height)
    }
}
