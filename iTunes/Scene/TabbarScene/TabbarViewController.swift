//
//  TabbarViewController.swift
//  iTunes
//
//  Created by A_Mcflurry on 4/6/24.
//

import UIKit

final class TabbarViewController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()
		setTabbarViewControllers()
	}

	private func setTabbarViewControllers() {
		let searchVC = UINavigationController(rootViewController: SearchViewController())
		searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)

		self.viewControllers = [searchVC]
	}
}
