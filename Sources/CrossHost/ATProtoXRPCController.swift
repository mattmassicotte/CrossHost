import Foundation

import ATAT
import ATProto
import Crypto
import Hummingbird
import JSONLD

public struct ATProtoXRPCController<Context: RequestContext>: Sendable {
	let configuration: ControllerConfiguration

	public init(configuration: ControllerConfiguration) {
		self.configuration = configuration
	}

	public var endpoints: RouteCollection<Context> {
		RouteCollection(context: Context.self)
			.get("/xrpc/com.atproto.repo.describeRepo", use: repoDescribeRepo)
			.get("/xrpc/com.atproto.server.describeServer", use: serverDescribeServer)
			.get("/xrpc/_health", use: health)
			.get("/xrpc/:nsid", use: getResource)
			.post("/xrpc/:nsid", use: createResource)
	}

	func repoDescribeRepo(request: Request, context: some RequestContext) async throws -> Response {
		let repo = try request.uri.queryParameters.require("repo")

		context.logger.info("repoDescribeRepo: \(repo) \(request)")

		guard repo == "did:web:\(configuration.host)" || repo == configuration.host else {
			context.logger.warning("Unexpected repo")

			return Response(status: .notFound)
		}

		let didDoc = try DIDWebController<Context>.DIDDocument(with: configuration.host, key: configuration.p256KeyPem)

		let content = ATProto.Repo.DescribeRepo(
			handle: configuration.host,
			did: "did:web:\(configuration.host)",
			didDoc: didDoc,
			collections: [],
			handleIsCorrect: true
		)

		return try context.jsonResponse(content, for: request)
	}

	func serverDescribeServer(request: Request, context: some RequestContext) async throws -> Response {
		let content = ATProto.Server.DescribeServer(
			did: "did:web:\(configuration.host)",
			availableUserDomains: ["." + configuration.host],
			inviteCodeRequired: true,
			phoneVerificationRequired: nil,
			contact: ATProto.Server.DescribeServer.Contact(email: nil),
			links: nil
		)

		return try context.jsonResponse(content, for: request)
	}

	func health(request: Request, context: some RequestContext) async throws -> Response {
		Response(status: .ok)
	}

	private func getResource(request: Request, context: some RequestContext) async throws -> Response {
		Response(status: .notImplemented)
	}

	private func createResource(request: Request, context: some RequestContext) async throws -> Response {
		Response(status: .notImplemented)
	}

}
