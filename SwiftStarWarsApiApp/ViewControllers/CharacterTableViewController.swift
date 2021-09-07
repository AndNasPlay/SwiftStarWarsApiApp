//
//  CharacterTableViewController.swift
//  SwiftStarWarsApiApp
//
//  Created by Андрей Щекатунов on 07.09.2021.
//

import UIKit

class CharacterTableViewController: UITableViewController {

	private var character: Character?
	private var characterParams: Int = 8

	init(_ people: Character) {
		super.init(nibName: nil, bundle: nil)
		self.character = people
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = character?.name
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return characterParams
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
		if cell == nil {
			cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
		}
		if indexPath.row == 0 {
			cell?.textLabel?.text = "Name: \(character?.name ?? "name")"
		}
		if indexPath.row == 1 {
			cell?.textLabel?.text = "Gender: \(character?.gender ?? "gender")"
		}
		if indexPath.row == 2 {
			cell?.textLabel?.text = "Birth year: \(character?.birthYear ?? "birthYear")"
		}
		if indexPath.row == 3 {
			cell?.textLabel?.text = "Eye color: \(character?.eyeColor ?? "eyeColor")"
		}
		if indexPath.row == 4 {
			cell?.textLabel?.text = "Hair color: \(character?.hairColor ?? "hairColor")"
		}
		if indexPath.row == 5 {
			cell?.textLabel?.text = "Height: \(character?.height ?? 100) cm"
		}
		if indexPath.row == 6 {
			cell?.textLabel?.text = "Mass: \(character?.mass ?? 100) kg"
		}
		if indexPath.row == 7 {
			cell?.textLabel?.text = "Skin color: \(character?.skinColor ?? "skinColor")"
		}
		return cell!
	}
}
