import Testing
import Foundation

import ATProto
import CBOR

import CryptoKit
//import CID
//import Multicodec
//import Multihash

import Base32
import BaseX

@Suite
struct DABCBORTests {
	@Test
	func example1() throws {
		let data = Data([0x41, 0xa1])

		let value = try DAGCBORDecoder().decode(Data.self, from: data)

		let result = try DAGCBOREncoder().encode(value)

		print(result)
	}

	@Test
	func cidDecode() throws {
		let value = "bafyreic62lzdtesykbkti6nmdt3htsfu34jwjz3bkqy4q4zntegllhmyxy"

		let cid = try ATProto.CID(value)

		let expected = try BaseX.decode("5ED2F239925850553479AC1CF679C8B4DF1364E7615431C8732D990CB59D98BE", as: .base16Hex)

		#expect(cid.digest == expected)
	}

	@Test
	func cidEncode() throws {
		let input = Data("abc".utf8)
		let cid = try ATProto.CID(input)

		let expected = try BaseX.decode("ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad", as: .base16Hex)

		#expect(cid.digest == expected)
		#expect(cid.baseEncodedString() == "bafyreif2pall7dybz7vecqka3zo24irdwabwdi4wc55jznaq75q7eaavvu")
	}
}
