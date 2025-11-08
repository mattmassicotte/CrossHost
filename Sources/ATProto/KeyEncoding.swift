import Foundation

import BaseX

extension Data {
	public var multibaseEncodedP256Key: String {
		var output = self

		// 0x80, 0x24 => 0x1200 multicodec value for "p256-pub"
		output.append(contentsOf: [0x80, 0x24])

		// pre-pend with the "z" for multibase encoding
		return "z" + BaseX.encode(output, into: .base58BTC)
	}
}
