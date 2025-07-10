import Hummingbird

struct WebfingerResourceDescriptor : ResponseEncodable {
	struct Link : ResponseEncodable {
		let rel: String
		let type: String
		let href: String
	}

	let subject: String
	let aliases: [String]
	let links: [Link]
}

struct WebfingerController {
	var endpoints: RouteCollection<AppRequestContext> {
		RouteCollection(context: AppRequestContext.self)
			.get("/", use: get)
	}

	func get(request: Request, context: some RequestContext) async throws -> String? {
		let value = request.uri.queryParameters["resource"] ?? "hmmm"

		return "hello: \(value)"
	}
}
