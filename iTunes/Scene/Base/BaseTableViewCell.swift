//
//  BaseTableViewCell.swift
//  SmartPush
//
//  Created by A_Mcflurry on 2/15/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configureHierarchy()
		configureLayout()
		configureView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configureHierarchy() { }
	func configureLayout() { }
	func configureView() { }

}
