//
//  DetailView.swift
//  iTunes
//
//  Created by A_Mcflurry on 4/7/24.
//

import UIKit
import SnapKit
import Kingfisher

final class DetailView: BaseUIView {

	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let appInfoView = AppInfoView()
	private let updateDescriptionLabel = UILabel()
	private let versionLabel = UILabel()
	private let updateLabel = UILabel()
	private let screenshotImage = UIImageView()
	private let appDescriptionLabel = UILabel()

	override func configureHierarchy() {
		[scrollView].forEach { addSubview($0) }
		[contentView].forEach { scrollView.addSubview($0) }
		[appInfoView, updateDescriptionLabel, versionLabel, updateLabel, screenshotImage, appDescriptionLabel].forEach { contentView.addSubview($0) }
	}

	override func configureLayout() {
		scrollView.snp.makeConstraints {
			$0.edges.equalTo(self)
		}

		contentView.snp.makeConstraints {
			$0.verticalEdges.equalTo(scrollView)
			$0.width.equalTo(scrollView)
		}

		appInfoView.snp.makeConstraints {
			$0.top.horizontalEdges.equalTo(contentView)
		}

		updateDescriptionLabel.snp.makeConstraints {
			$0.top.equalTo(appInfoView.snp.bottom).offset(10)
			$0.horizontalEdges.equalTo(contentView).inset(10)
		}

		versionLabel.snp.makeConstraints {
			$0.top.equalTo(updateDescriptionLabel.snp.bottom).offset(10)
			$0.horizontalEdges.equalTo(contentView).inset(10)
		}

		updateLabel.snp.makeConstraints {
			$0.top.equalTo(versionLabel.snp.bottom).offset(10)
			$0.horizontalEdges.equalTo(contentView).inset(10)
		}

		screenshotImage.snp.makeConstraints {
			$0.top.equalTo(updateLabel.snp.bottom).offset(10)
			$0.horizontalEdges.equalTo(contentView).inset(10)
			$0.height.equalTo(200)
		}

		appDescriptionLabel.snp.makeConstraints {
			$0.top.equalTo(screenshotImage.snp.bottom).offset(10)
			$0.horizontalEdges.equalTo(contentView).inset(10)
			$0.bottom.equalTo(contentView.safeAreaLayoutGuide)
		}
	}

	override func configureView() {
		updateDescriptionLabel.font = .boldSystemFont(ofSize: 25)
		updateDescriptionLabel.text = "새로운 소식"

		updateLabel.numberOfLines = 0

		versionLabel.font = .systemFont(ofSize: 16)
		versionLabel.textColor = .lightGray

		appDescriptionLabel.numberOfLines = 0
	}

	func configureDetailView(_ data: ItunesResult) {
		appInfoView.appImageView.kf.setImage(with: URL(string: data.artworkUrl60)!)
		appInfoView.appNameLabel.text = data.trackName
		appInfoView.makerLabel.text = data.sellerName

		versionLabel.text = "버전 \(data.version)"

		updateLabel.text = data.releaseNotes

		screenshotImage.kf.setImage(with: URL(string: data.screenshotUrls.first!))

		appDescriptionLabel.text = data.description
	}
}
