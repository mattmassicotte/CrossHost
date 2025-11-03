import JSONLD

public struct APActor: JSONLDDocument, Identifiable {
	enum CodingKeys: String, CodingKey {
		case context = "@context"
		case id
		case type
		case preferredUsername
		case inbox
		case outbox
		case publicKey
	}

	public let context: ContextDefinition
	public let id: String
	public let type: String
	public let preferredUsername: String
	public let inbox: String
	public let outbox: String
	public let publicKey: APPublicKey

	public init(context: ContextDefinition, id: String, type: String, preferredUsername: String, inbox: String, outbox: String, publicKey: APPublicKey) {
		self.context = context
		self.id = id
		self.type = type
		self.preferredUsername = preferredUsername
		self.inbox = inbox
		self.outbox = outbox
		self.publicKey = publicKey
	}
}
