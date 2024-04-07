//
//  SearchTableViewCell.swift
//  SeSACRxThreads
//
//  Created by jack on 2024/04/01.
//

import UIKit
import SnapKit
import Kingfisher
import RxSwift
import RxCocoa

final class SearchTableViewCell: UITableViewCell {

	static let identifier = "SearchTableViewCell"

	private var disposeBag = DisposeBag()

	let appNameLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 18, weight: .bold)
		label.textColor = .black
		return label
	}()

	let appIconImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.backgroundColor = .systemMint
		imageView.layer.cornerRadius = 8
		return imageView
	}()

	let downloadButton: UIButton = {
		let button = UIButton()
		button.setTitle("받기", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.isUserInteractionEnabled = true
		button.backgroundColor = .lightGray
		button.layer.cornerRadius = 16
		return button
	}()

	var screenShotStackView: UIStackView = {
		let stackView = UIStackView(frame: .zero)
		stackView.axis = .horizontal
		stackView.distribution = .equalCentering
		stackView.alignment = .fill
		return stackView
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		self.selectionStyle = .none
		configure()
	}


	override func prepareForReuse() {
		disposeBag = DisposeBag()

		screenShotStackView = {
			let stackView = UIStackView(frame: .zero)
			stackView.axis = .horizontal
			stackView.distribution = .equalCentering
			stackView.alignment = .fill
			return stackView
		}()

		for item in screenShotStackView.arrangedSubviews {
			screenShotStackView.removeArrangedSubview(item)
		}
	}


	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func configure() {
		contentView.addSubview(appNameLabel)
		contentView.addSubview(appIconImageView)
		contentView.addSubview(downloadButton)
		contentView.addSubview(screenShotStackView)

		appIconImageView.snp.makeConstraints {
			$0.top.equalToSuperview().offset(10)
			$0.leading.equalTo(20)
			$0.size.equalTo(60)
		}

		appNameLabel.snp.makeConstraints {
			$0.top.equalToSuperview().offset(10)
			$0.leading.equalTo(appIconImageView.snp.trailing).offset(8)
			$0.height.equalTo(32)
			$0.trailing.equalTo(downloadButton.snp.leading).offset(-8)
		}

		downloadButton.snp.makeConstraints {
			$0.top.equalToSuperview().offset(10)
			$0.leading.equalTo(appNameLabel.snp.trailing).offset(10)
			$0.trailing.equalToSuperview().inset(20)
			$0.height.equalTo(32)
			$0.width.equalTo(72)
		}

		screenShotStackView.snp.makeConstraints {
			$0.top.equalTo(appIconImageView.snp.bottom).offset(10)
			$0.height.equalTo(250)
			$0.horizontalEdges.bottom.equalToSuperview().offset(10)
		}
	}

	func configureStackView(_ data: [String]) {
		let dataIndex = min(data.count, 3)
		for index in 0..<dataIndex {
			let imageView = UIImageView()
			imageView.kf.setImage(with: URL(string: data[index])!)
			imageView.contentMode = .scaleAspectFit
			screenShotStackView.addArrangedSubview(imageView)
		}
	}

}

