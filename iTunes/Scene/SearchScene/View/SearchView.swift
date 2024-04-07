//
//  SearchView.swift
//  iTunes
//
//  Created by A_Mcflurry on 4/7/24.
//

import UIKit
import SnapKit

final class SearchView: BaseUIView {
	let searchController = UISearchController(searchResultsController: nil)
	lazy var searchTableView = UITableView(frame: .zero)

	override func configureHierarchy() {
		self.addSubview(searchTableView)
	}

	override func configureLayout() {
		searchTableView.snp.makeConstraints {
			$0.top.equalTo(self.safeAreaLayoutGuide)
			$0.horizontalEdges.bottom.equalTo(self)
		}

		searchTableView.tableHeaderView = searchController.searchBar
	}

	override func configureView() {
		searchController.searchBar.placeholder = "앱을 검색하세요."
		searchTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
		searchTableView.rowHeight = UITableView.automaticDimension
	}
}
