import Foundation

import ATProto
import Crypto
import Hummingbird
import JSONLD

public struct DIDWebController<Context: RequestContext>: Sendable {
	let configuration: ControllerConfiguration

	public init(configuration: ControllerConfiguration) {
		self.configuration = configuration
	}

	public var endpoints: RouteCollection<Context> {
		RouteCollection(context: Context.self)
			.get("/.well-known/did.json", use: getRoot)
			.get("/.well-known/users/:id/did.json", use: get)
			.get("/.well-known/atproto-did", use: getATProtoDID)
	}

	public static func DIDDocument(with host: String, key: String) throws -> DIDWeb {
		let didPrivateKey = try P256.Signing.PrivateKey(pemRepresentation: key)
		let pubKey = didPrivateKey.publicKey
		let keyBytes = pubKey.compressedRepresentation
		let encodedKey = keyBytes.multibaseEncodedP256Key

		return DIDWeb(
			context: .list(
				[
					.simple("https://www.w3.org/ns/did/v1"),
					.simple("https://w3id.org/security/suites/jws-2020/v1"),
					.simple("https://w3id.org/security/multikey/v1"),
				]
			),
			id: "did:web:\(host)",
			alsoKnownAs: [
				"at://\(host)"
			],
			service: [
				DIDWeb.Sevice(
					id: "#atproto_pds",
					serviceEndpoint: "https://\(host)",
					type: "AtprotoPersonalDataServer"
				)
			],
			verificationMethod: [
				DIDWeb.VerificationMethod(
					controller: "did:web:\(host)",
					id: "\(host)#atproto",
					type: "Multikey",
					publicKeyMultibase: "did:key:\(encodedKey)"
				),
				DIDWeb.VerificationMethod(
					controller: "did:web:\(host)",
					id: "did:web:\(host)#signing",
					type: "Multikey",
					publicKeyMultibase: "did:key:\(encodedKey)"
				)
			]
		)
	}

	func getRoot(request: Request, context: some RequestContext) async throws -> Response {
		let didDoc = try Self.DIDDocument(with: configuration.host, key: configuration.p256KeyPem)

		let encoder = JSONEncoder()

		encoder.outputFormatting = .withoutEscapingSlashes

		return try encoder.encode(didDoc, from: request, context: context)
	}

	func getATProtoDID(request: Request, context: some RequestContext) async throws -> Response {
		let data = "did:web:\(configuration.host)\n"

		return Response(
			status: .ok,
			headers: [
				.contentType: "text/plain; charset=utf-8"
			],
			body: .init(byteBuffer: ByteBuffer(string: data))
		)
	}

	func get(request: Request, context: some RequestContext) async throws -> Response {
		return Response(status: .notImplemented)
	}
}
