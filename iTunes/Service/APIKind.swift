//
//  APIKind.swift
//  iTunes
//
//  Created by A_Mcflurry on 4/6/24.
//

import Foundation
import Alamofire

enum APIKind {
	case itunesSearch(searchText: String)

	var url: URL {
		switch self {
		case .itunesSearch:
			return URL(string: "https://itunes.apple.com/search")!
		}
	}

	var method: HTTPMethod {
		return .get
	}

	var header: HTTPHeaders {
		return [HTTPHeader(name: "User-Agent", value: "XYZ")]
	}

	var parameter: Parameters {
		switch self {
		case .itunesSearch(searchText: let searchText):
			return ["term": searchText,
					  "country": "KR",
					  "media": "software",
					  "lang": "ko_kr"]
		}
	}
}
