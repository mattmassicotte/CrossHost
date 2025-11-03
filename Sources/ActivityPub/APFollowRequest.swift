import JSONLD

public struct APFollowRequest: JSONLDDocument, Identifiable {
	enum CodingKeys: String, CodingKey {
		case context = "@context"
		case id
		case type
		case actor
		case object
	}

	public let context: ContextDefinition
	public let id: String
	public let type: String
	public let actor: String
	public let object: String
}
