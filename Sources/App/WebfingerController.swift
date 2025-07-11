import Hummingbird

import WebFinger

struct WebfingerResourceDescriptor: ResponseEncodable {
	struct Link: ResponseEncodable {
		let rel: String
		let type: String
		let href: String
	}

	let subject: String
	let aliases: [String]?
	let links: [Link]
}

struct WebfingerController {
	var endpoints: RouteCollection<AppRequestContext> {
		RouteCollection(context: AppRequestContext.self)
			.get("/", use: get)
	}

	func get(request: Request, context: some RequestContext) async throws -> Response {
		guard let value = request.uri.queryParameters["resource"]?.split(separator: "acct:").last else {
			return Response(status: .badRequest)
		}

		let components = value.split(separator: "@")
		guard components.count == 2 else {
			return Response(status: .badRequest)
		}

		let user = components[0]
		let server = components[1]

		let descriptor = WebFingerResource.Descriptor(
			subject: String(user),
			aliases: nil,
			links: [
				WebFingerResource.Descriptor.Link(
					rel: "self",
					type: "application/activity+json",
					href: "http://127.0.0.1:8080/users/\(value)"
				)
			]
		)

		var response = try context.responseEncoder.encode(descriptor, from: request, context: context)

		response.headers[.contentType] = "application/jrd+json"

		return response
	}
}
