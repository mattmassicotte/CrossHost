import Foundation

public struct PublicKey: Codable {
	public let id: String
	public let owner: String
	public let publicKeyPem: String
}

public struct APActor: Codable {
	let context: [String]
	let id: String
	let type: String
	let preferredUsername: String
	let inbox: String
	let publicKey: String

	enum CodingKeys: String, CodingKey {
		case context = "@context"
		case id
		case type
		case preferredUsername
		case inbox
		case publicKey
	}
}

public enum APType: String, Codable {
	case person = "Person"
}

public struct Feed: Codable {
	struct Endpoints: Codable {
		let sharedInbox: String
	}

	let context: [String]
	let id: String
	let type: APType
	let endpoints: Endpoints
	let inbox: String
	let outbox: String
	let name: String
	let published: Date

	enum CodingKeys: String, CodingKey {
		case context = "@context"
		case id
		case endpoints
		case type
		case inbox
		case outbox
		case name
		case published
	}
}
