import JSONLD

public struct DIDWeb: JSONLDDocument, Identifiable, Hashable, Sendable {
	public struct Sevice: Codable, Hashable, Sendable {
		public let id: String
		public let serviceEndpoint: String
		public let type: String

		public init(id: String, serviceEndpoint: String, type: String) {
			self.id = id
			self.serviceEndpoint = serviceEndpoint
			self.type = type
		}
	}

	public struct VerificationMethod: Codable, Hashable, Sendable {
		public let controller: String
		public let id: String
		public let type: String
		public let publicKeyMultibase: String

		public init(controller: String, id: String, type: String, publicKeyMultibase: String) {
			self.controller = controller
			self.id = id
			self.type = type
			self.publicKeyMultibase = publicKeyMultibase
		}
	}

	enum CodingKeys: String, CodingKey {
		case context = "@context"
		case id
		case alsoKnownAs
		case service
		case verificationMethod
	}

	public let context: ContextDefinition
	public let id: String
	public let alsoKnownAs: [String]
	public let service: [Sevice]
	public let verificationMethod: [VerificationMethod]

	public init(context: ContextDefinition, id: String, alsoKnownAs: [String], service: [Sevice], verificationMethod: [VerificationMethod]) {
		self.context = context
		self.id = id
		self.alsoKnownAs = alsoKnownAs
		self.service = service
		self.verificationMethod = verificationMethod
	}
}
