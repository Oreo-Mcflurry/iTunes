//
//  RequestManager.swift
//  iTunes
//
//  Created by A_Mcflurry on 4/6/24.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

final class RequestManager {
	enum RequestError: Error {
		case fail
	}

	func callRequest<T: Decodable>(type: T.Type, api: APIKind) -> Observable<T> {
		return Observable<T>.create { observer in
			AF.request(api.url, method: api.method, parameters: api.parameter, headers: api.header).responseDecodable(of: T.self) { response in
				switch response.result {
				case .success(let result):
					observer.onNext(result)
					observer.onCompleted()
				case .failure(let fail):
					observer.onError(RequestError.fail)
					print(fail)
				}
			}
			return Disposables.create()
		}
	}
}
