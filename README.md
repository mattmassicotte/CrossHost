<div align="center">

[![Build Status][build status badge]][build status]
[![Matrix][matrix badge]][matrix]

</div>

# SocialServer

Multi-platform social service.

SocialServer (real name forthcoming?) is a Swift-based server platform that abstracts multiple underlying social services. The goal here is interoperability with low-cost hosting.

Optimizing for cost is tricky, because different people have access to different hosting arrangements. This is why SocialServer is implemented as a library. The idea is to abstract out enough of the underlying dependencies so that multiple concrete hosting implementations are supported.

Services:

- [ActivityPub](https://activitypub.rocks)
- [ATProto](https://atproto.com)

Implementations:

- [AWS lambda](https://github.com/mattmassicotte/SocialServerLambda)

> [!WARNING]
> This project is just in the learning/toy phase.

## Integration

```swift
dependencies: [
    .package(url: "https://github.com/mattmassicotte/SocialServer", branch: "main")
]
```

## Contribution and Collaboration

I would love to hear from you! Issues or pull requests work great. A [Discord server][discord] is also available for live help, but I have a strong bias towards answering in the form of documentation.

I prefer collaboration, and would love to find ways to work together if you have a similar project.

I prefer indentation with tabs for improved accessibility. But, I'd rather you use the system you want and make a PR than hesitate because of whitespace.

By participating in this project you agree to abide by the [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

[build status]: https://github.com/mattmassicotte/SocialServer/actions
[build status badge]: https://github.com/mattmassicotte/SocialServer/workflows/CI/badge.svg
[platforms]: https://swiftpackageindex.com/mattmassicotte/SocialServer
[platforms badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmattmassicotte%2FSocialServer%2Fbadge%3Ftype%3Dplatforms
[documentation]: https://swiftpackageindex.com/mattmassicotte/SocialServer/main/documentation
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue
[matrix]: https://matrix.to/#/%23chimehq%3Amatrix.org
[matrix badge]: https://img.shields.io/matrix/chimehq%3Amatrix.org?label=Matrix
[discord]: https://discord.gg/esFpX6sErJ
