public struct WebFingerResource {
}

extension WebFingerResource {
}

extension WebFingerResource {
	public struct Descriptor: Encodable {
		public let subject: String
		public let aliases: [String]?
		public let links: [Link]

		public init(subject: String, aliases: [String]? = nil, links: [Link]) {
			self.subject = subject
			self.aliases = aliases
			self.links = links
		}
	}
}

extension WebFingerResource.Descriptor {
	public struct Link: Encodable {
		public let rel: String
		public let type: String
		public let href: String

		public init(rel: String, type: String, href: String) {
			self.rel = rel
			self.type = type
			self.href = href
		}
	}
}
