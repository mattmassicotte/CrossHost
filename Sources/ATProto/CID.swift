import Foundation

import Base32

public enum Multibase: UInt8, Hashable, Sendable {
	case base32 = 0x62    // "b"
	case base58BTC = 0x7a // "z
}

public enum Multicodec: UInt8, Hashable, Sendable {
	case DAGCBOR = 0x71
}

public struct Multihash: Hashable, Sendable {
	public enum Function: UInt8, Hashable, Sendable {
		case SHA2 = 0x12
	}

	public let function: Function
	public let digestSize: Int
}

public enum CIDError: Error {
	case inputTooShort
	case unsupportedVersion(Int)
	case unsupportedBase(Character)
	case unsupportedCodec(Int)
	case unsupportedHash(Int, Int)
}

public struct CID {
	public let version: Int = 1
	public let base: Multibase
	public let codec: Multicodec
	public let multihash: Multihash
	public let digest: Data

	public init(_ string: String) throws {
		guard
			let leading = string.first,
			let base = leading.utf8.first else {
			throw CIDError.inputTooShort
		}

		guard base == Multibase.base32.rawValue else {
			throw CIDError.unsupportedBase(leading)
		}

		self.base = .base32

		let encoded = String(string.dropFirst())
		let decoded = try Base32.decode(encoded)

		guard decoded.count > 3 else {
			throw CIDError.inputTooShort
		}

		guard decoded[0] == 1 else {
			throw CIDError.unsupportedVersion(Int(decoded[0]))
		}

		guard decoded[1] == Multicodec.DAGCBOR.rawValue else {
			throw CIDError.unsupportedCodec(Int(decoded[1]))
		}

		self.codec = .DAGCBOR

		guard
			decoded[2] == Multihash.Function.SHA2.rawValue,
			decoded[3] == 32
		else {
			throw CIDError.unsupportedHash(Int(decoded[2]), Int(decoded[3]))
		}

		self.multihash = Multihash(function: .SHA2, digestSize: 256)
		self.digest = Data(decoded.dropFirst(4))
	}

	public init(provider: (Multihash) throws -> Data) throws {
		self.base = .base32
		self.codec = .DAGCBOR
		self.multihash = Multihash(function: .SHA2, digestSize: 256)
		self.digest = try provider(multihash)
	}

	public func baseEncodedString() -> String {
		let prefix = Data([0x01, Multicodec.DAGCBOR.rawValue, Multihash.Function.SHA2.rawValue, 32])

		return "b" + Base32.encode(prefix + digest, options: [.pad(false), .letterCase(.lower)])
	}
}
