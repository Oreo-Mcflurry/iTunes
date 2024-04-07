//
//  SearchViewModel.swift
//  iTunes
//
//  Created by A_Mcflurry on 4/7/24.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel: InputOutputViewModelProtocol {
	struct Input {
		let inputSearchText: ControlProperty<String?>
	}

	struct Output {
		let outputSearchResult: PublishSubject<[ItunesResult]>
	}

	var disposeBag = DisposeBag()

	func transform(input: Input) -> Output {
		let searchResult = PublishSubject<[ItunesResult]>()

		input.inputSearchText.orEmpty
			.filter { !$0.isEmpty }
			.distinctUntilChanged()
			.debounce(.seconds(1), scheduler: MainScheduler.instance)
			.flatMap { RequestManager().callRequest(type: ItunesModel.self, api: .itunesSearch(searchText: $0)) }
			.subscribe(with: self) { _, value in
				searchResult.onNext(value.results)
			}.disposed(by: disposeBag)

		return Output(outputSearchResult: searchResult)
	}
}
