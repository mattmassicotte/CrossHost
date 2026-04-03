import Foundation

import ATAT
import CBOR

extension ATProto {
	public static let iso8061DecimalDecoder: DateFormatter = {
		let formatter = DateFormatter()

		// 2024-11-15T18:16:35.907Z
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

		return formatter
	}()
}

extension ATProto {
    public struct Sync {
        public struct SubscribeRepos {
        }
    }
}

extension ATProto.Sync.SubscribeRepos {
    public struct ErrorPayload: Codable, Hashable, Sendable {
        public let error: String
        public let message: String?

        public init(error: String, message: String?) {
            self.error = error
            self.message = message
        }
    }

    public struct Identity: Codable, Hashable, Sendable {
        public let did: ATProtoDID
        public let handle: String
        public let seq: Int
        public let time: String

        public init(did: ATProtoDID, handle: String, seq: Int, time: String) {
            self.did = did
            self.handle = handle
            self.seq = seq
            self.time = time
        }
    }

    public struct Account: Codable, Hashable, Sendable {
        public enum Status: String, Codable, Hashable, Sendable {
            case takendown
            case suspended
            case deleted
            case deactivated
            case desynchronized
            case throttled
        }

        public let did: ATProtoDID
        public let active: Bool
        public let seq: Int
        public let time: String
        public let status: Status?

        public init(did: ATProtoDID, active: Bool, seq: Int, time: String, status: Status?) {
            self.did = did
            self.active = active
            self.seq = seq
            self.time = time
            self.status = status
        }
    }
}

extension ATProto.Sync.SubscribeRepos {
	public struct Header: Codable, Hashable, Sendable {
		public let op: Int
		public let t: String?

		public init(op: Int, t: String?) {
			self.op = op
			self.t = t
		}
	}

	public struct Message<Payload: Codable>: Codable {
        public let header: Header
        public let payload: Payload

        public init(header: Header, payload: Payload) {
            self.header = header
            self.payload = payload
        }

		public func dagCBOREncoded() throws -> Data {
			let encoder = DAGCBOREncoder()

			let headerData = try encoder.encode(header)
			let payloadData = try encoder.encode(payload)

			return headerData + payloadData
		}
    }
}

extension ATProto.Sync.SubscribeRepos.Message: Equatable where Payload: Equatable {}
extension ATProto.Sync.SubscribeRepos.Message: Hashable where Payload: Hashable {}
extension ATProto.Sync.SubscribeRepos.Message: Sendable where Payload: Sendable {}
