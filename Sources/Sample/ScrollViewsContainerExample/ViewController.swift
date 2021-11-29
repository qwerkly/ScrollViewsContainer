//
//  ViewController.swift
//  ScrollViewsContainerExample
//
//  Created by Бабич Иван Юрьевич on 29.11.2021.
//

import UIKit
import ScrollViewsContainer

final class ViewController: UIViewController {
    private let scrollView = ScrollViewsContainerView()
    private let containerView = UIView()
    private lazy var topCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    private lazy var bottomTableView = UITableView()
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.itemSize = CGSize(width: 100, height: 300)
        collectionLayout.scrollDirection = .horizontal
        return collectionLayout
    }()
    
    private var tableViewOriginalHeight: CGFloat {
        view.frame.height - UIApplication.shared.topSafeAreaHeight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutViews()
        setupViews()
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(topCollectionView)
        containerView.addSubview(bottomTableView)
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            topCollectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
            topCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            topCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            topCollectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
        NSLayoutConstraint.activate([
            bottomTableView.topAnchor.constraint(equalTo: topCollectionView.bottomAnchor),
            bottomTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            bottomTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bottomTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            bottomTableView.heightAnchor.constraint(equalToConstant: tableViewOriginalHeight)
        ])
    }
    
    private func setupViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        topCollectionView.translatesAutoresizingMaskIntoConstraints = false
        bottomTableView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.setChildViews(topView: topCollectionView, bottomScrollView: bottomTableView)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        topCollectionView.dataSource = self
        topCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        let collectionLayout = UICollectionViewFlowLayout()
        topCollectionView.collectionViewLayout = collectionLayout
        collectionLayout.itemSize = CGSize(width: 100, height: 300)
        collectionLayout.scrollDirection = .horizontal
        topCollectionView.showsVerticalScrollIndicator = false
        topCollectionView.showsHorizontalScrollIndicator = false
        
        bottomTableView.dataSource = self
        bottomTableView.isScrollEnabled = false
        bottomTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.contentView.backgroundColor = .green
        return cell
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

fileprivate extension UIApplication {
    var topSafeAreaHeight: CGFloat {
        let window = UIApplication.shared.keyWindow
        return window?.safeAreaInsets.top ?? 0
    }
}
