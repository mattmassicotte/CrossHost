public struct ControllerConfiguration: Sendable, Hashable {
	public let host: String
	public let routePrefix: String
	public let scheme: String = "https"

	public init(host: String?, routePrefix: String?) {
		self.host = host ?? "localhost"
		self.routePrefix = routePrefix ?? ""
	}

	public var urlPrefix: String {
		"\(scheme)://\(host)"
	}
}
