Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA9B5BFFC8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 16:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409816.652789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob0bn-00033e-7d; Wed, 21 Sep 2022 14:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409816.652789; Wed, 21 Sep 2022 14:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob0bn-00030B-4p; Wed, 21 Sep 2022 14:21:51 +0000
Received: by outflank-mailman (input) for mailman id 409816;
 Wed, 21 Sep 2022 14:21:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7n+=ZY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ob0bl-000305-QH
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 14:21:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba4b09db-39b8-11ed-9647-05401a9f4f97;
 Wed, 21 Sep 2022 16:21:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AACE521AC2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Sep 2022 14:21:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88EF013A00
 for <xen-devel@lists.xenproject.org>; Wed, 21 Sep 2022 14:21:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JbeKH/sdK2NQUwAAMHmgww
 (envelope-from <jgross@suse.com>)
 for <xen-devel@lists.xenproject.org>; Wed, 21 Sep 2022 14:21:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ba4b09db-39b8-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663770107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=TWiNv0qhhYrbfIzk6dWaa/yIClGvWFZCCN1NbsLlVsE=;
	b=op8B4UqEFbhQvdPdSNiTNNhDieVFc3ieJM2E1QjZwQYSWdGZDbv0JIqXSfR/8Ffkw54ZlW
	lWVU3g8AEv2+wpk0/SULBiofG4yg+M6sMvKbD975QShhVtlrTtrP56ytpEmIDp6WBfAHv/
	EOgXUbCSoOfLhSTWythmyC2JtwNuW4I=
Message-ID: <41d5e47d-8b5b-6ba9-486f-3b294692880b@suse.com>
Date: Wed, 21 Sep 2022 16:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Juergen Gross <jgross@suse.com>
Subject: Xen summit: x86 emulator design session
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yHFP5hfdPD6WcJQYDtGTtC5G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yHFP5hfdPD6WcJQYDtGTtC5G
Content-Type: multipart/mixed; boundary="------------XGIxOj9G5OXmLwz6s2Lmewbj";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <41d5e47d-8b5b-6ba9-486f-3b294692880b@suse.com>
Subject: Xen summit: x86 emulator design session

--------------XGIxOj9G5OXmLwz6s2Lmewbj
Content-Type: multipart/mixed; boundary="------------IUQ6EfIX8042jS4Rd2eyJtWz"

--------------IUQ6EfIX8042jS4Rd2eyJtWz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

RGVzaWduOiBvbmUgbGFyZ2Ugc3dpdGNoIHN0YXRlbWVudCwgbWFpbnRhaW5hYmxlIGJ5IEFu
ZHJldyBhbmQgSmFuLCBidXQgcHJvYmFibHkgDQpub3QgZm9yIHNvbWVvbmUgZWxzZS4gRXZl
biBoYXJkIGZvciBKYW4gYXMgd29ya2luZyBvbmx5IHNvbWV0aW1lcyBvbiBpdC4NCkFkZGl0
aW9uYWwgcHJvYmxlbSBpcyB0aGUgbmVlZCBmb3IgcmV2aWV3cywgYXMgdGhlIGJhcnJpZXIg
Zm9yIGRvaW5nIHJldmlld3MgaXMgDQpxdWl0ZSBoaWdoIChldmVuIGZvciBBbmRyZXcpLg0K
DQpUaGlzIGlzIHByb2JsZW1hdGljIHJlZ2FyZGluZyB0byByZXdvcmsgdGhlIGVtdWxhdG9y
IGFzIG5vYm9keSBpcyByZWFsbHkgbG9va2luZyANCmF0IHRoZSBwYXRjaGVzIChwZW5kaW5n
IHNpbmNlIG1vcmUgdGhhbiAxIHllYXIpLiBXaG8gd2lsbCB0YWtlIG92ZXIgZnJvbSBKYW4g
DQphZnRlciBoaXMgcmV0aXJlbWVudCAoaW4gMTEgeWVhcnMpLg0KDQpXaGF0IG5lZWRzIHRv
IGJlIGRvbmUgdG8gdW5ibG9jayBKYW4ncyByZXdvcmsgYW5kIGZ1cnRoZXIgaW1wcm92ZW1l
bnRzPw0KDQpHZW9yZ2U6IHNvbWV0aW1lcyByZXZpZXdpbmcgSmFuJ3MgcGF0Y2hlcy4gRW11
bGF0aW9uIGlzIGRvbmUgbm90IGJ5IHNpbXVsYXRpbmcgDQp0aGUgaW5zdHJ1Y3Rpb25zLCBi
dXQgdG8gc2V0dXAgdGhlIGlucHV0IGRhdGEgYW5kIHRvIHRoZW4gZXhlY3V0ZSB0aGUgc2lu
Z2xlIA0KaW5zdHJ1Y3Rpb25zLCBlbXVsYXRpbmcgb25seSB0aGUgbWVtb3J5IGFjY2Vzc2Vz
Lg0KDQpNYXJlazogaG93IGRvZXMgdGVzdGluZyBsb29rIGxpa2U/DQoNCkphbi9HZW9yZ2U6
IGVtdWxhdG9yIGNhbiBiZSBjb21waWxlZCBpbnRvIHRoZSBoeXBlcnZpc29yIG9yIGludG8g
dGhlIHRlc3QgY29kZSANCmFuZCB0aGVuIHRoZSB0ZXN0cyBhcmUgcnVuLCBlLmcuIEFGTCAo
ZGV0ZWN0aW5nIGJhc2ljYWxseSB3cm9uZyBhc3NlcnRpb25zKS4gDQpUZXN0cyB3aWxsIGZp
bmQgcmVncmVzc2lvbnMgd2hlbiBhZGRpbmcgbmV3IGluc3RydWN0aW9ucy4NCldoYXQgaXMg
bWlzc2luZyBpcyBzb21lIGF1dG9tYXRpYyB2ZXJpZmljYXRpb24gYmV0d2VlbiBuYXRpdmUg
YW5kIGVtdWxhdGVkIA0KaW5zdHJ1Y3Rpb25zIGFyZSBoYXZpbmcgdGhlIHNhbWUgcmVzdWx0
cy4NCg0KSmFuOiByZWZhY3RvcmluZyBpcyByZWFsbHkgbmVlZGVkLCBidXQgc3R1Y2sgZHVl
IHRvIGFib3ZlIHJlYXNvbnMuDQoNCkp1ZXJnZW46IG5vIGluZGlyZWN0IGNhbGxzIHdhbnRl
ZCwgd2hhdCBhYm91dCBnZW5lcmF0aW5nIHRoZSBjb2RlIGZyb20gYW4gDQppbml0aWFsIHRh
YmxlLg0KDQpKYW46IHN0cnVjdHVyZSBpcyBjb21wbGljYXRlZCwgZS5nLiB1c2luZyBxdWl0
ZSBzb21lIGdvdG9zIHRvIGNvbW1vbiBjb2RlDQoNCkdlb3JnZTogd291bGQgbm90IGJlIGNl
cnRpZnlhYmxlDQoNCkp1ZXJnZW46IGp1c3QgYSB3YXkgdG8gYXZvaWQgaW5kaXJlY3QgY2Fs
bHMNCg0KSmFuOiBnb3RvcyBjb3VsZCBiZSByZXBsYWNlZCBieSBjYWxscyBnaXZlbiB0aGF0
IGFsbCBzdGF0ZSB3b3VsZCBiZSBwYXNzZWQgdmlhIA0KcGFyYW1zIG9yIGEgY29tbW9uIHN0
cnVjdC4NCg0KSnVlcmdlbjogSSBjb3VsZCBwcm9iYWJseSByZXZpZXcgc29tZSBwYXRjaGVz
LCBidXQgSSdtIHJldGlyaW5nIHByb2JhYmx5IGFoZWFkIA0Kb2YgSmFuLg0KDQpNYXJlazog
a25vd2luZyB0byBub3QgdXNlIHNvbWUgZmVhdHVyZXMsIGNhbiB3ZSBkaXNhYmxlIHRoZSBl
bXVsYXRvcj8NCg0KSmFuOiBpZiB5b3UgYXJlIG5vdCB1c2luZyBzaGFkb3cgcGFnZSB0YWJs
ZXMsIGVtdWxhdGVkIGdyYXBoaWNzLCBlbXVsYXRlZCBNTUlPLCANCmludHJvc3BlY3Rpb24s
IC4uLg0KDQpHZW9yZ2U6IHdoYXQgYWJvdXQgdHJ5aW5nIHRvIHdyaXRlIHRoZSBuZXcgZW11
bGF0b3IgZnJvbSBzY3JhdGNoIGluIGEgY2xlYW4gd2F5IA0Kd2hpbGUgZG9jdW1lbnRpbmcv
dW5kZXJzdGFuZGluZyBpdCBieSB0aGUgbmV3IG1haW50YWluZXI/DQoNCkphbjogcHJvYmxl
bSBpcyBtYWlubHkgdGhlIHNwZWNpYWwgY2FzZSBoYW5kbGVkIGJhc2ljYWxseSB2aWEgdGhl
IGdvdG9zIHRvZGF5IA0KKGV4Y2VwdGlvbnMsIC4uLikNCg0KR2VvcmdlOiBwcm9wZXIgdGVz
dCBjYXNlcyB3b3VsZCBoZWxwIHRvIGRvIHRoYXQgZm9yIHZlcmlmaWNhdGlvbiBvZiBhIG5l
dyBzdHJ1Y3R1cmUNCg0KSmFuLiBlLmcuIEFWWDUxMiBpbnN0cnVjdGlvbnMgYXJlIGNvdmVy
ZWQgb25seSBmb3IgbWVtb3J5IGFjY2Vzc2VzDQoNCkdlb3JnZTogYW5vdGhlciBwcm9ibGVt
IGFyZWEgaXMgaW50ZXJydXB0YWJpbGl0eSB0ZXN0aW5nDQoNCkdlb3JnZTogbWF5YmUgd2Ug
bmVlZCB0byBmaW5kIHNvbWVvbmUgZG9pbmcgdGhlIHdvcmsgKGhpcmluZykgZm9yIGF1ZGl0
aW5nIHRoZSANCmVtdWxhdG9yIGNvZGUNCg0KSnVlcmdlbjogd2hhdCBhYm91dCBhc2tpbmcg
ZS5nLiBBTUQ/DQoNCkphbi9HZW9yZ2U6IG1heWJlIHBlb3BsZSBhdCBBTUQgY2FwYWJsZSB0
byBkbyB0aGF0IGFyZSBub3QgaW50ZXJlc3RlZCBpbiBYZW4NCg0KTWFyZWs6IEtWTSB1c2Vz
IHFlbXUgdG8gZW11bGF0ZWQgZS5nLiBlbXVsYXRlZCBWR0EgbWVtb3J5LiBXaGF0IGFib3V0
IGRvaW5nIHRoZSANCnNhbWUgaW4gWGVuPw0KDQpKYW46IG5vdCBlYXN5LCBidXQgbWF5YmUg
cG9zc2libGUsIHJlbW92aW5nIHRoZSBuZWVkIHRvIGVtdWxhdGUgYWxsIHRoZSBTSU1EIA0K
c3R1ZmYgZXRjLg0KDQpHZW9yZ2U6IHdoYXQgdG8gZG8gd2l0aCBKYW4ncyBjdXJyZW50IHBl
bmRpbmcgcGF0Y2hlcz8NCg0KSmFuOiBqdXN0IHRha2UgbWlzc2luZyBOQUsgYXMgc2lsZW50
IGFncmVlbWVudCwgZ2l2ZW4gdGhhdCB0ZXN0aW5nIGhhcyBiZWVuIA0KcXVpdGUgZ29vZA0K
DQpHZW9yZ2U6IHF1aXRlIGRhbmdlcm91cw0KDQpKYW46IGZvciByZXdvcmsgd2UnZCBuZWVk
IHNvbWUgbW9yZSB0ZXN0cyBmb3IgYmVpbmcgc3VyZSBub3QgaGF2aW5nIGJyb2tlbiBzb21l
dGhpbmcNCg0KR2VvcmdlOiBhZGQgYWRkaXRpb25hbCBBRkwgdGVzdHMgdGVzdGluZyBzdHVm
ZiB3aGljaCBjYW4gdGhlbiBiZSB0ZXN0ZWQgb24gYmFyZSANCm1ldGFsIGFuZCBjb21wYXJl
IHRoZSByZXN1bHRzIHRvIGJlIHRoZSBzYW1lLg0KDQpKdWVyZ2VuOiB3aGF0IGFib3V0IHVz
aW5nIHNvbWUgZXhpc3Rpbmcgc2VsZnRlc3RzIChBTUQsIHFlbXUsIC4uLik/IExvb2tpbmcg
DQplc3BlY2lhbGx5IGF0IHFlbXUgVENHIHRlc3RzIGNvdWxkIGJlIGEgZ29vZCB3YXkgdG8g
aGFuZGxlIGl0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------IUQ6EfIX8042jS4Rd2eyJtWz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------IUQ6EfIX8042jS4Rd2eyJtWz--

--------------XGIxOj9G5OXmLwz6s2Lmewbj--

--------------yHFP5hfdPD6WcJQYDtGTtC5G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMrHfsFAwAAAAAACgkQsN6d1ii/Ey9c
fQf+Pj5AvXY0qkIOoABKqaPeyoDyIwqqhsL1Fz2/NFlCD+216f/5Mc9z157pRi4wdKZy+mr8iw4R
rcZoLf2r7rBa4R24NEi5V/l1wGMqZA/SHe4iYM6svIb0boKbeFil9s50+/ovDt5fz1wzB3jUhD3p
2ZSqAi50NAhJfjouuA/Hg3p96bbDFo3DVPTXRZNcJHUuMC7BUQ25TnaIj7YLtcTFL9UMXLXys520
W0hpf1gr4pANZyzHmRta89X4kGYRoPq/n8s281M+rFBW5Q97fKZWp4iE1ltJ2ipw3XgJhqMr9TNf
rHkPT3TW/+aSYX23n7PR29ZFxv62GHvKyUPBIYJfcA==
=iXHT
-----END PGP SIGNATURE-----

--------------yHFP5hfdPD6WcJQYDtGTtC5G--

