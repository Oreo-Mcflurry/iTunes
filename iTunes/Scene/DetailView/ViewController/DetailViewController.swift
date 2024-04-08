//
//  DetailViewController.swift
//  iTunes
//
//  Created by A_Mcflurry on 4/7/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class DetailViewController: BaseViewController {

	private let detailView = DetailView()
	private let viewModel = DetailViewModel()
	private let disposeBag = DisposeBag()
	var testData: ItunesResult!

	override func loadView() {
		self.view = detailView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		detailView.configureDetailView(testData)
		navigationController?.navigationBar.prefersLargeTitles = false
	}
}
