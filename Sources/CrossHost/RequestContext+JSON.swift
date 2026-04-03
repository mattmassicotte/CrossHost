import Hummingbird

extension RequestContext {
	func jsonResponse<T: Encodable>(_ value: T, for request: Request) throws -> Response {
		var response = try responseEncoder.encode(value, from: request, context: self)

		response.headers[.contentType] = "application/json; charset=utf-8;"

		return response
	}
}
