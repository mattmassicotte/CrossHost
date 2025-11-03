import Hummingbird

import WebFinger

public struct WebFingerController<Context: RequestContext>: Sendable {
	let configuration: ControllerConfiguration

	public init(configuration: ControllerConfiguration) {
		self.configuration = configuration
	}

	public var endpoints: RouteCollection<Context> {
		RouteCollection(context: Context.self)
			.get("/.well-known/webfinger", use: get)
	}

	public func get(request: Request, context: Context) async throws -> Response {
		guard
			let resource: String = context.parameters.get("resource"),
			let query = WebFingerResource.Query(resource: resource)
		else {
			return Response(status: .badRequest, headers: [:])
		}

		if query.user != "test" {
			return Response(status: .notFound, headers: [:])
		}

		let descriptor = WebFingerResource.Descriptor(
			subject: query.resource,
			aliases: nil,
			links: [
				WebFingerResource.Descriptor.Link(
					rel: "self",
					type: "application/activity+json",
					href: "\(configuration.urlPrefix)/users/\(query.user)"
				)
			]
		)

		var response = try context.responseEncoder.encode(descriptor, from: request, context: context)

		response.headers[.contentType] = WebFingerResource.contentType

		return response
	}
}
