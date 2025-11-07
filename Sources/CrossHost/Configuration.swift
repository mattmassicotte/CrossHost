public struct ControllerConfiguration: Sendable, Hashable {
	public let host: String
	public let routePrefix: String
	public let scheme: String = "https"
	public let p256KeyPem: String

	public init(host: String?, routePrefix: String?, p256KeyPem: String) {
		self.host = host ?? "localhost"
		self.routePrefix = routePrefix ?? ""
		self.p256KeyPem = p256KeyPem
	}

	public var urlPrefix: String {
		"\(scheme)://\(host)"
	}
}
