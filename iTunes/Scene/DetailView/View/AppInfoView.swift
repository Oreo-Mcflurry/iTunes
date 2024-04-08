//
//  AppInfoView.swift
//  iTunes
//
//  Created by A_Mcflurry on 4/7/24.
//

import UIKit
import SnapKit

final class AppInfoView: BaseUIView {
	let appImageView = UIImageView()
	let appNameLabel = UILabel()
	let makerLabel = UILabel()
	let installButton = UIButton()

	override func configureHierarchy() {
		[appImageView, appNameLabel, makerLabel, installButton].forEach { addSubview($0) }
	}

	override func configureLayout() {
		appImageView.snp.makeConstraints {
			$0.top.leading.equalTo(self).inset(10)
			$0.bottom.equalTo(self).inset(10)
			$0.size.equalTo(100)
		}

		appNameLabel.snp.makeConstraints {
			$0.top.equalTo(appImageView.snp.top)
			$0.leading.equalTo(appImageView.snp.trailing).offset(10)
			$0.trailing.equalTo(self).inset(10)
		}

		makerLabel.snp.makeConstraints {
			$0.top.greaterThanOrEqualTo(appNameLabel.snp.bottom).offset(10)
			$0.leading.equalTo(appImageView.snp.trailing).offset(10)
			$0.trailing.equalTo(self).inset(10)
		}

		installButton.snp.makeConstraints {
			$0.bottom.equalTo(appImageView.snp.bottom)
			$0.leading.equalTo(appImageView.snp.trailing).offset(10)
			$0.trailing.greaterThanOrEqualTo(self).inset(10)
			$0.top.equalTo(makerLabel.snp.bottom).offset(10)
		}
	}

	override func configureView() {
		installButton.setTitle("설치", for: .normal)
		installButton.backgroundColor = .blue
		installButton.setTitleColor(.white, for: .normal)
		installButton.layer.cornerRadius = 10
	}
}
