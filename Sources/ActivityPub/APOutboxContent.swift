import JSONLD

public struct APOutboxContent: JSONLDDocument, Identifiable {
	public struct Item: Codable {
		public struct ItemObject: Codable {
			public let id: String
			public let type: String
			public let content: String

			public init(id: String, type: String, content: String) {
				self.id = id
				self.type = type
				self.content = content
			}
		}

		public let id: String
		public let type: String
		public let actor: String
		public let published: String
		public let to: [String]
		public let cc: [String]
		public let object: ItemObject

		public init(id: String, type: String, actor: String, published: String, to: [String], cc: [String], object: ItemObject) {
			self.id = id
			self.type = type
			self.actor = actor
			self.published = published
			self.to = to
			self.cc = cc
			self.object = object
		}
	}

	enum CodingKeys: String, CodingKey {
		case context = "@context"
		case id
		case type
		case next
		case prev
		case partOf
		case orderedItems
	}

	public let context: ContextDefinition
	public let id: String
	public let type: String
	public let next: String?
	public let prev: String?
	public let partOf: String
	public let orderedItems: [Item]

	public init(context: ContextDefinition, id: String, type: String, next: String?, prev: String?, partOf: String, orderedItems: [Item]) {
		self.context = context
		self.id = id
		self.type = type
		self.next = next
		self.prev = prev
		self.partOf = partOf
		self.orderedItems = orderedItems
	}
}
