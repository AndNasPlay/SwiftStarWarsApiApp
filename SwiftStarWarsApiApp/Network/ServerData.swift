//
//  ServerData.swift
//  SwiftStarWarsApiApp
//
//  Created by Андрей Щекатунов on 07.09.2021.
//

import Foundation
import GraphQLite

class ServerData: NSObject {

	static var server: GQLServer!

	class func setup(_ server: GQLServer) {
		self.server = server
		fetchAll()
	}
}

extension ServerData {

	private class func fetchAll() {

		let query = GQLQuery["GetAllData"]

		server.query(query, [:]) { result, error in
			if let error = error {
				print(error.localizedDescription)
			} else {
				if let allPeople = result["allPeople"] as? [String: Any] {
					if let people = allPeople["people"] as? [[String: Any]] {
						for values in people {
							self.updateDatabase(values)
						}
					}
				}
			}
		}
	}

	private class func updateDatabase(_ values: [String: Any]) {
		gqldb.updateInsert("People", values)
	}
}
