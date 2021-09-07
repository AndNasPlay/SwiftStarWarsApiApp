//
//  People.swift
//  SwiftStarWarsApiApp
//
//  Created by Андрей Щекатунов on 07.09.2021.
//

import Foundation
import GraphQLite

class People: NSObject, GQLObject {

	@objc var id = ""
	@objc var name = ""
	@objc var gender = ""
	@objc var birthYear = ""
	@objc var eyeColor = ""
	@objc var hairColor = ""
	@objc var height = 0
	@objc var mass = 0
	@objc var skinColor = ""

	static func primaryKey() -> String {
		return "id"
	}
}
