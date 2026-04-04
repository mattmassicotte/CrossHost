import Foundation

#if canImport(Crypto)
import Crypto
#elseif canImport(CryptoKit)
import CryptoKit
#endif

extension CID {
	public init(_ data: Data) throws {
		try self.init { multihash in
			switch (multihash.function, multihash.digestSize) {
			case (.SHA2, 256):
				let digest = SHA256.hash(data: data)

				return Data(digest)
			default:
				throw CIDError.unsupportedCodec(Int(multihash.function.rawValue))
			}
		}
	}
}
