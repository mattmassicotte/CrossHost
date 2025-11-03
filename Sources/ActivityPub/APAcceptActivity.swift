import JSONLD

public struct APAcceptActivity: JSONLDDocument, Identifiable {
	public struct Object: Identifiable, Codable {
		public let id: String
		public let type: String
		public let actor: String
		public let object: String

		public init(id: String, type: String, actor: String, object: String) {
			self.id = id
			self.type = type
			self.actor = actor
			self.object = object
		}
	}

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
	public let object: Object

	public init(context: ContextDefinition, id: String, type: String, actor: String, object: Object) {
		self.context = context
		self.id = id
		self.type = type
		self.actor = actor
		self.object = object
	}
}
