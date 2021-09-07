//
//  Network.swift
//  SwiftStarWarsApiApp
//
//  Created by Андрей Щекатунов on 07.09.2021.
//

import Foundation
import GraphQLite

var gqldb: GQLDatabase!

class GraphQLite: NSObject {

	class func setup() {
		initDatabase()
		initServer()
	}

	private class func initDatabase() {
		gqldb = GQLDatabase()
	}

	private class func initServer() {
		let link = "https://swapi-graphql.netlify.app/.netlify/functions/index"
		let server = GQLServer(HTTP: link)
		ServerData.setup(server)
	}
}
