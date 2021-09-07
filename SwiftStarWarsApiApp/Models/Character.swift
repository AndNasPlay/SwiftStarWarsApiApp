//
//  Character.swift
//  SwiftStarWarsApiApp
//
//  Created by Андрей Щекатунов on 07.09.2021.
//

import Foundation
import GraphQLite

class Character: NSObject, GQLObject {

	@objc var characterId = ""
	@objc var name = ""
	@objc var gender = ""
	@objc var birthYear = ""
	@objc var eyeColor = ""
	@objc var hairColor = ""
	@objc var height = 0
	@objc var mass = 0
	@objc var skinColor = ""
	@objc var created = ""
	@objc var edited = ""

	static func primaryKey() -> String {
		return "characterId"
	}
}
