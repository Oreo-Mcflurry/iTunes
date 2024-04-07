//
//  iTunesModel.swift
//  iTunes
//
//  Created by A_Mcflurry on 4/6/24.
//

import Foundation

struct ItunesModel: Decodable {
	 let resultCount: Int
	 let results: [ItunesResult]
}

struct ItunesResult: Decodable {
	 let screenshotUrls: [String]
	 let ipadScreenshotUrls: [String]
	 let appletvScreenshotUrls: [String]
	 let artworkUrl60: String
	 let artworkUrl512: String
	 let artworkUrl100: String
	 let artistViewURL: String
	 let advisories: [String]
	 let features: [String]
	 let isGameCenterEnabled: Bool
	 let supportedDevices: [String]
	 let kind: String
	 let minimumOSVersion: String
	 let currentVersionReleaseDate: String
	 let trackCensoredName: String
	 let languageCodesISO2A: [String]
	 let fileSizeBytes: String
	 let sellerURL: String
	 let formattedPrice: String
	 let userRatingCountForCurrentVersion: Int
	 let trackViewURL: String
	 let trackContentRating: String
	 let description: String
	 let isVppDeviceBasedLicensingEnabled: Bool
	 let genreIDS: [String]
	 let trackID: Int
	 let trackName: String
	 let primaryGenreName: String
	 let primaryGenreID: Int
	 let releaseNotes: String
	 let bundleID: String
	 let currency: String
	 let releaseDate: String
	 let averageUserRatingForCurrentVersion: Double
	 let averageUserRating: Double
	 let contentAdvisoryRating: String
	 let sellerName: String
	 let version: String
	 let wrapperType: String
	 let artistID: Int
	 let artistName: String
	 let genres: [String]
	 let price: Double
	 let userRatingCount: Int

	 enum CodingKeys: String, CodingKey {
		  case screenshotUrls = "screenshotUrls"
		  case ipadScreenshotUrls = "ipadScreenshotUrls"
		  case appletvScreenshotUrls = "appletvScreenshotUrls"
		  case artworkUrl60 = "artworkUrl60"
		  case artworkUrl512 = "artworkUrl512"
		  case artworkUrl100 = "artworkUrl100"
		  case artistViewURL = "artistViewUrl"
		  case advisories = "advisories"
		  case features = "features"
		  case isGameCenterEnabled = "isGameCenterEnabled"
		  case supportedDevices = "supportedDevices"
		  case kind = "kind"
		  case minimumOSVersion = "minimumOsVersion"
		  case currentVersionReleaseDate = "currentVersionReleaseDate"
		  case trackCensoredName = "trackCensoredName"
		  case languageCodesISO2A = "languageCodesISO2A"
		  case fileSizeBytes = "fileSizeBytes"
		  case sellerURL = "sellerUrl"
		  case formattedPrice = "formattedPrice"
		  case userRatingCountForCurrentVersion = "userRatingCountForCurrentVersion"
		  case trackViewURL = "trackViewUrl"
		  case trackContentRating = "trackContentRating"
		  case description = "description"
		  case isVppDeviceBasedLicensingEnabled = "isVppDeviceBasedLicensingEnabled"
		  case genreIDS = "genreIds"
		  case trackID = "trackId"
		  case trackName = "trackName"
		  case primaryGenreName = "primaryGenreName"
		  case primaryGenreID = "primaryGenreId"
		  case releaseNotes = "releaseNotes"
		  case bundleID = "bundleId"
		  case currency = "currency"
		  case releaseDate = "releaseDate"
		  case averageUserRatingForCurrentVersion = "averageUserRatingForCurrentVersion"
		  case averageUserRating = "averageUserRating"
		  case contentAdvisoryRating = "contentAdvisoryRating"
		  case sellerName = "sellerName"
		  case version = "version"
		  case wrapperType = "wrapperType"
		  case artistID = "artistId"
		  case artistName = "artistName"
		  case genres = "genres"
		  case price = "price"
		  case userRatingCount = "userRatingCount"
	 }

	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.screenshotUrls = try container.decode([String].self, forKey: .screenshotUrls)
		self.ipadScreenshotUrls = try container.decode([String].self, forKey: .ipadScreenshotUrls)
		self.appletvScreenshotUrls = try container.decode([String].self, forKey: .appletvScreenshotUrls)
		self.artworkUrl60 = try container.decode(String.self, forKey: .artworkUrl60)
		self.artworkUrl512 = try container.decode(String.self, forKey: .artworkUrl512)
		self.artworkUrl100 = try container.decode(String.self, forKey: .artworkUrl100)
		self.artistViewURL = try container.decode(String.self, forKey: .artistViewURL)
		self.advisories = try container.decode([String].self, forKey: .advisories)
		self.features = try container.decode([String].self, forKey: .features)
		self.isGameCenterEnabled = try container.decode(Bool.self, forKey: .isGameCenterEnabled)
		self.supportedDevices = try container.decode([String].self, forKey: .supportedDevices)
		self.kind = try container.decode(String.self, forKey: .kind)
		self.minimumOSVersion = try container.decode(String.self, forKey: .minimumOSVersion)
		self.currentVersionReleaseDate = try container.decode(String.self, forKey: .currentVersionReleaseDate)
		self.trackCensoredName = try container.decode(String.self, forKey: .trackCensoredName)
		self.languageCodesISO2A = try container.decode([String].self, forKey: .languageCodesISO2A)
		self.fileSizeBytes = try container.decode(String.self, forKey: .fileSizeBytes)
		self.sellerURL = try container.decodeIfPresent(String.self, forKey: .sellerURL) ?? ""
		self.formattedPrice = try container.decodeIfPresent(String.self, forKey: .formattedPrice) ?? ""
		self.userRatingCountForCurrentVersion = try container.decode(Int.self, forKey: .userRatingCountForCurrentVersion)
		self.trackViewURL = try container.decode(String.self, forKey: .trackViewURL)
		self.trackContentRating = try container.decode(String.self, forKey: .trackContentRating)
		self.description = try container.decode(String.self, forKey: .description)
		self.isVppDeviceBasedLicensingEnabled = try container.decode(Bool.self, forKey: .isVppDeviceBasedLicensingEnabled)
		self.genreIDS = try container.decode([String].self, forKey: .genreIDS)
		self.trackID = try container.decode(Int.self, forKey: .trackID)
		self.trackName = try container.decode(String.self, forKey: .trackName)
		self.primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)
		self.primaryGenreID = try container.decode(Int.self, forKey: .primaryGenreID)
		self.releaseNotes = try container.decodeIfPresent(String.self, forKey: .releaseNotes) ?? ""
		self.bundleID = try container.decode(String.self, forKey: .bundleID)
		self.currency = try container.decode(String.self, forKey: .currency)
		self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
		self.averageUserRatingForCurrentVersion = try container.decode(Double.self, forKey: .averageUserRatingForCurrentVersion)
		self.averageUserRating = try container.decode(Double.self, forKey: .averageUserRating)
		self.contentAdvisoryRating = try container.decode(String.self, forKey: .contentAdvisoryRating)
		self.sellerName = try container.decode(String.self, forKey: .sellerName)
		self.version = try container.decode(String.self, forKey: .version)
		self.wrapperType = try container.decode(String.self, forKey: .wrapperType)
		self.artistID = try container.decode(Int.self, forKey: .artistID)
		self.artistName = try container.decode(String.self, forKey: .artistName)
		self.genres = try container.decode([String].self, forKey: .genres)
		self.price = try container.decodeIfPresent(Double.self, forKey: .price) ?? 0
		self.userRatingCount = try container.decode(Int.self, forKey: .userRatingCount)
	}
}
