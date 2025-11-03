import JSONLD

public struct APOutbox: JSONLDDocument, Identifiable {
	enum CodingKeys: String, CodingKey {
		case context = "@context"
		case id
		case type
		case totalItems
		case first
		case last
	}

	public let context: ContextDefinition
	public let id: String
	public let type: String
	public let totalItems: Int
	public let first: String
	public let last: String

	public init(context: ContextDefinition, id: String, type: String, totalItems: Int, first: String, last: String) {
		self.context = context
		self.id = id
		self.type = type
		self.totalItems = totalItems
		self.first = first
		self.last = last
	}
}
