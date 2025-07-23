import HTTPTypes

public protocol HTTPResponding {
	associatedtype Response

	func urlParameter(for key: String) -> String?
	func queryParameters(for key: String) -> [String]

	func statusResponse(_ status: HTTPResponse.Status, headers: HTTPFields) async throws -> Response
	func jsonResponse<T: Encodable>(_ value: T, headers: HTTPFields) async throws -> Response
}

extension HTTPResponding {
	func jsonResponse<T: Encodable>(_ value: T) async throws -> Response {
		try await jsonResponse(value, headers: [.contentType: "application/json"])
	}

	func queryParameter(for key: String) -> String? {
		let values = queryParameters(for: key)

		if values.isEmpty {
			return nil
		}

		return values.first
	}
}

