<div align="center">

[![Build Status][build status badge]][build status]
[![Matrix][matrix badge]][matrix]

</div>

# CrossHost

Multi-platform social service.

CrossHost is a Swift-based server platform that abstracts multiple underlying social services. The goal here is interoperability with low-cost hosting.

Optimizing for cost is tricky, because different people have access to different hosting arrangements. This is why CrossHost is implemented as a library. The idea is to abstract out enough of the underlying dependencies so that multiple concrete hosting implementations are supported.

Services:

- [ActivityPub](https://activitypub.rocks)
- [ATProto](https://atproto.com)

Implementations:

- [AWS lambda](https://github.com/mattmassicotte/CrossHostAWS)

> [!WARNING]
> This project is just in the learning/toy phase.

## Integration

```swift
dependencies: [
    .package(url: "https://github.com/mattmassicotte/CrossHost", branch: "main")
]
```

## Handy Tools

- https://activitypub.academy
- https://pdsls.dev

### Encryption

Mastodon needs RSA256, and ATProto requires P256.

```
openssl ecparam -genkey -name prime256v1 -noout -out ec256-key.pem
```

### Domain Configuration

`dig _atproto.YOUR_DOMAIN -t txt`

### Initiate Bluesky crawl

```
curl -X POST -H 'Content-Type: application/json' -d '{"hostname": "YOUR_DOMAIN"}' -i "https://bsky.network/xrpc/com.atproto.sync.requestCrawl"
```

## Contribution and Collaboration

I would love to hear from you! Issues or pull requests work great. A [Discord server][discord] is also available for live help, but I have a strong bias towards answering in the form of documentation.

I prefer collaboration, and would love to find ways to work together if you have a similar project.

I prefer indentation with tabs for improved accessibility. But, I'd rather you use the system you want and make a PR than hesitate because of whitespace.

By participating in this project you agree to abide by the [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

[build status]: https://github.com/mattmassicotte/CrossHost/actions
[build status badge]: https://github.com/mattmassicotte/CrossHost/workflows/CI/badge.svg
[platforms]: https://swiftpackageindex.com/mattmassicotte/CrossHost
[platforms badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmattmassicotte%2FCrossHost%2Fbadge%3Ftype%3Dplatforms
[documentation]: https://swiftpackageindex.com/mattmassicotte/CrossHost/main/documentation
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue
[matrix]: https://matrix.to/#/%23chimehq%3Amatrix.org
[matrix badge]: https://img.shields.io/matrix/chimehq%3Amatrix.org?label=Matrix
[discord]: https://discord.gg/esFpX6sErJ
