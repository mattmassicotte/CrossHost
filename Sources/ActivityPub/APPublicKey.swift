public struct APPublicKey: Codable, Identifiable {
	public let id: String
	public let owner: String?
	public let controller: String?
	public let publicKeyPem: String

	public init(id: String, controller: String, publicKeyPem: String) {
		self.id = id
		self.owner = controller
		self.controller = controller
		self.publicKeyPem = publicKeyPem
	}
}
