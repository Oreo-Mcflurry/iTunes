//
//  SearchViewController.swift
//  iTunes
//
//  Created by A_Mcflurry on 4/6/24.
//

import UIKit
import SnapKit
import Kingfisher
import RxSwift
import RxCocoa

final class SearchViewController: BaseViewController {

	private let searchView = SearchView()
	private let disposeBag = DisposeBag()
	private let viewModel = SearchViewModel()

	override func loadView() {
		self.view = searchView
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.navigationBar.prefersLargeTitles = true
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func configureView() {
		self.navigationItem.title = "검색"
		searchView.searchTableView.rowHeight = UITableView.automaticDimension
	}

	override func configureBinding() {
		let input = SearchViewModel.Input(
			inputSearchText: searchView.searchController.searchBar.rx.text, 
			inputDidSelect: searchView.searchTableView.rx.modelSelected(ItunesResult.self)
		)

		let output = viewModel.transform(input: input)

		output.outputSearchResult
			.bind(to: searchView.searchTableView.rx.items(
				cellIdentifier: SearchTableViewCell.identifier,
				cellType: SearchTableViewCell.self)
			) { (row, element, cell) in
				cell.appIconImageView.kf.setImage(with: URL(string: element.artworkUrl60)!)
				cell.appNameLabel.text = element.trackName
				cell.configureStackView(element.screenshotUrls)
			}.disposed(by: disposeBag)

		output.outputDidSelect
			.drive(with: self) { owner, value in
				let vc = DetailViewController()
				vc.testData = value
				owner.navigationController?.pushViewController(vc, animated: true)
				owner.searchView.searchController.isActive = false
			}.disposed(by: disposeBag)

	}
}
