//
//  MainTableViewController.swift
//  SwiftStarWarsApiApp
//
//  Created by Андрей Щекатунов on 06.09.2021.
//

import UIKit
import GraphQLite

class MainTableViewController: UITableViewController {

	private var characters: [Character] = []
	private var observerId: String?

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Star Wars"

		loadPeople()
		createObserver()
	}

	func loadPeople() {
		characters = Character.fetchAll(gqldb)
	}

	func createObserver() {
		let types: [GQLObserverType] = [.insert, .update]

		observerId = Character.createObserver(gqldb, types) { [self] (method, objectId) in
			if method == "INSERT" {
				refreshInsert(objectId)
			}
			if method == "UPDATE" {
				refreshUpdate(objectId)
			}
		}
	}

	func refreshInsert(_ objectId: Any) {
		if let object = Character.fetchOne(gqldb, key: objectId) {
			DispatchQueue.main.async { [self] in
				characters.append(object)
				tableView.reloadData()
			}
		}
	}

	func refreshUpdate(_ objectId: Any) {
		if let object = Character.fetchOne(gqldb, key: objectId) {
			let index = indexOf(objectId)
			DispatchQueue.main.async { [self] in
				if let index = index {
					characters[index] = object
					tableView.reloadData()
				}
			}
		}
	}

	func indexOf(_ objectId: Any) -> Int? {
		for (index, object) in characters.enumerated() where object.characterId == objectId as? String ?? ""{
				return index
			}
		return nil
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return characters.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
		if cell == nil {
			cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
		}

		let people = characters[indexPath.row]
		cell?.textLabel?.text = people.name
		cell?.accessoryType = .disclosureIndicator

		return cell!
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)
		let newTableView = CharacterTableViewController(characters[indexPath.row])
		navigationController?.pushViewController(newTableView, animated: true)
	}

}
