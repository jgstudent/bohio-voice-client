# Licensing Decision

Status: **Proprietary application; SDK purchase required before integration**

Last verified: 2026-11-05

## Decision

Bohio Voice Client is intended to remain closed-source commercial software.
The preferred SIP/media candidate is Liblinphone, but no Liblinphone source,
binary, package, sample, derivative, or copied implementation may be added to
this repository until Bohio Systems has a written proprietary license covering
the intended platforms, distribution model, build process, updates, and use of
the required codecs and optional modules.

## Basis

Official Linphone documentation states that Linphone SDK/Liblinphone is dual
licensed under GNU Affero GPLv3 or a paid proprietary license for closed-source
applications. The SDK currently lists Android, iOS, Windows, macOS, and Linux
support and provides platform-language wrappers.

Official references:

- https://wiki.linphone.org/xwiki/wiki/public/view/Lib/
- https://www.linphone.org/en/liblinphone-voip-sdk/
- https://www.linphone.org/en/download/
- https://www.linphone.org/en/faq/

## Required evidence before dependency approval

1. Executed proprietary license or written vendor authorization.
2. Covered SDK version, applications, bundle identifiers, platforms, and
   redistribution channels.
3. Support, maintenance, security-fix, and upgrade terms.
4. Codec and patent-license inventory for the selected build configuration.
5. Complete third-party dependency and attribution inventory.
6. Rules for CI artifacts, symbols, SDK binaries, source access, contractors,
   and disaster recovery.
7. Written confirmation of white-label/rebranding and store-distribution rights.

## Alternatives

PJSIP and other engines may be evaluated if licensing, integration, or support
terms are unsuitable. No alternative may be selected merely because a public
repository can be downloaded; its license, maintenance, mobile push support,
platform integration, security record, and long-term ownership must pass the
same review.
