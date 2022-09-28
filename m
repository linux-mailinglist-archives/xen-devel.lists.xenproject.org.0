Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB85EDD74
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 15:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413314.656881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odWin-0006uE-Kj; Wed, 28 Sep 2022 13:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413314.656881; Wed, 28 Sep 2022 13:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odWin-0006rG-Ho; Wed, 28 Sep 2022 13:03:29 +0000
Received: by outflank-mailman (input) for mailman id 413314;
 Wed, 28 Sep 2022 13:03:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1odWil-0006r9-2b
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 13:03:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f01e2ec8-3f2d-11ed-964a-05401a9f4f97;
 Wed, 28 Sep 2022 15:03:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E90CD21C17;
 Wed, 28 Sep 2022 13:03:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD7C113A84;
 Wed, 28 Sep 2022 13:03:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OrThMBxGNGOSTwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 28 Sep 2022 13:03:24 +0000
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
X-Inumbo-ID: f01e2ec8-3f2d-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664370204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WLOKAe0Zy9onlk67rXxTb60lcTABGIARXiVSstAtl5c=;
	b=FDZuBMOif6+IIeMTh+ps10WqmX/Nu52Tkd2MJnzAV8O7S/9G0fexRtDmGo/kGSSQ4BAjOE
	NW2AGB7Miydm8h0DP+eqHJn+yqATDP4aKiQYmYb/4rrah/uIxK2biuMjvg+gVLy2zx+XrT
	fRGNDU8MAqbrpbYQlW/PNEywEqHezLo=
Message-ID: <94aab958-c141-4c43-a249-a55d8e5be735@suse.com>
Date: Wed, 28 Sep 2022 15:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
 <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for physical address based hypercalls
In-Reply-To: <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YwmfFyl4MUWyXfocPzr4f48i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YwmfFyl4MUWyXfocPzr4f48i
Content-Type: multipart/mixed; boundary="------------P9mk0xTRkupVqoBidzI5Fgiy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <94aab958-c141-4c43-a249-a55d8e5be735@suse.com>
Subject: Re: Proposal for physical address based hypercalls
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
 <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>
In-Reply-To: <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>

--------------P9mk0xTRkupVqoBidzI5Fgiy
Content-Type: multipart/mixed; boundary="------------MnthlwNHWJdKVHE8KnRxNbHZ"

--------------MnthlwNHWJdKVHE8KnRxNbHZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDkuMjIgMTQ6MDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4wOS4yMDIy
IDEyOjU4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMjgvMDkvMjAyMiAxMTozOCwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gQXMgYW4gYWx0ZXJuYXRpdmUgSSdkIGxpa2UgdG8g
cHJvcG9zZSB0aGUgaW50cm9kdWN0aW9uIG9mIGEgYml0IChvciBtdWx0aXBsZQ0KPj4+IG9u
ZXMsIHNlZSBiZWxvdykgYXVnbWVudGluZyB0aGUgaHlwZXJjYWxsIG51bWJlciwgdG8gY29u
dHJvbCB0aGUgZmxhdm9yIG9mIHRoZQ0KPj4+IGJ1ZmZlcnMgdXNlZCBmb3IgZXZlcnkgaW5k
aXZpZHVhbCBoeXBlcmNhbGwuICBUaGlzIHdvdWxkIGxpa2VseSBpbnZvbHZlIHRoZQ0KPj4+
IGludHJvZHVjdGlvbiBvZiBhIG5ldyBoeXBlcmNhbGwgcGFnZSAob3IgbXVsdGlwbGUgb25l
cyBpZiBtb3JlIHRoYW4gb25lIGJpdCBpcw0KPj4+IHRvIGJlIHVzZWQpLCB0byByZXRhaW4g
dGhlIHByZXNlbnQgYWJzdHJhY3Rpb24gd2hlcmUgaXQgaXMgdGhlIGh5cGVydmlzb3Igd2hp
Y2gNCj4+PiBhY3R1YWxseSBmaWxscyB0aGVzZSBwYWdlcy4NCj4+DQo+PiBUaGVyZSBhcmUg
b3RoZXIgY29uY2VybnMgd2hpY2ggbmVlZCB0byBiZSBhY2NvdW50ZWQgZm9yLg0KPj4NCj4+
IEVuY3J5cHRlZCBWTXMgY2Fubm90IHVzZSBhIGh5cGVyY2FsbCBwYWdlOyB0aGV5IGRvbid0
IHRydXN0IHRoZQ0KPj4gaHlwZXJ2aXNvciBpbiB0aGUgZmlyc3QgcGxhY2UsIGFuZCB0aGUg
aHlwZXJjYWxsIHBhZ2UgaXMgKHNwZWNpZmljYWxseSkNCj4+IGNvZGUgaW5qZWN0aW9uLsKg
IFNvIHRoZSBzZW5zaWJsZSBuZXcgQUJJIGNhbm5vdCBkZXBlbmQgb24gYSBoeXBlcmNhbGwg
dGFibGUuDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYSBkZXBlbmRlbmN5LCBhbmQg
SSB0aGluayB0aGVyZSBuZXZlciByZWFsbHkgaGFzIGJlZW4uDQo+IFdlJ3ZlIGJlZW4gYWR2
b2NhdGluZyBmb3IgaXRzIHVzZSwgYnV0IHdlJ3ZlIG5vdCBlbmZvcmNlZCB0aGF0IGFueXdo
ZXJlLCBJDQo+IGRvbid0IHRoaW5rLg0KPiANCj4+IEFsc28sIHJld3JpdGluZyB0aGUgaHlw
ZXJjYWxsIHBhZ2Ugb24gbWlncmF0ZSB0dXJucyBvdXQgbm90IHRvIGhhdmUgYmVlbg0KPj4g
dGhlIG1vc3QgY2xldmVyIGlkZWEsIGFuZCBvbmx5IHdvcmtzIHJpZ2h0IG5vdyBiZWNhdXNl
IHRoZSBpbnN0cnVjdGlvbnMNCj4+IGFyZSB0aGUgc2FtZSBsZW5ndGggaW4gdGhlIHZhcmlh
dGlvbnMgZm9yIGVhY2ggbW9kZS4NCj4+DQo+PiBBbHNvIGNvbnRpbnVhdGlvbnMgbmVlZCB0
byBjaGFuZ2UgdG8gYXZvaWQgdXNlcnNwYWNlIGxpdmVuZXNzIHByb2JsZW1zLA0KPj4gYW5k
IGV4aXN0aW5nIGh5cGVyY2FsbHMgdGhhdCB3ZSBkbyBoYXZlIG5lZWQgc3BsaXR0aW5nIGJl
dHdlZW4gdGhpbmdzDQo+PiB3aGljaCBhcmUgYWN0dWFsbHkgcHJpdmlsZWdlZCBvcGVyYXRp
b25zICh3aXRoaW4gdGhlIGd1ZXN0IGNvbnRleHQpIGFuZA0KPj4gdGhpbmdzIHdoaWNoIGFy
ZSBsb2dpY2FsIGNvbnRyb2wgb3BlcmF0aW9ucywgc28gdGhlIGtlcm5lbCBjYW4gZXhwb3Nl
DQo+PiB0aGUgbGF0dGVyIHRvIHVzZXJzcGFjZSB3aXRob3V0IHJldGFpbmluZyB0aGUgZ2Fw
aW5nIHJvb3QgaG9sZSB3aGljaCBpcw0KPj4gL2Rldi94ZW4vcHJpdmNtZCwgYW5kIGEgYmxv
Y2tlciB0byBkb2luZyBVRUZJIFNlY3VyZWJvb3QuDQo+Pg0KPj4gU28geWVzLCBzdGFydGlu
ZyBzb21lIG5ldyBjbGVhbihlcikgaW50ZXJmYWNlIGZyb20gaHlwZXJjYWxsIDY0IGlzIHRo
ZQ0KPj4gcGxhbiwgYnV0IGl0IHZlcnkgbXVjaCBkb2VzIG5vdCB3YW50IHRvIGJlIGEgc2lt
cGxlIG1pcnJvciBvZiB0aGUNCj4+IGV4aXN0aW5nIDAtNjMgd2l0aCBhIGRpZmZlcmluZyBj
YWxsaW5nIGNvbnZlbnRpb24uDQo+IA0KPiBBbGwgb2YgdGhlc2UgbG9vayBsaWtlIG9ydGhv
Z29uYWwgcHJvYmxlbXMgdG8gbWUuIFRoYXQncyBsaWtlbHkgYWxsDQo+IHJlbGV2YW50IGZv
ciwgYXMgSSB0aGluayB5b3UndmUgYmVlbiBjYWxsaW5nIGl0LCBBQkkgdjIsIGJ1dCBzaG91
bGRuJ3QNCj4gaGluZGVyIG91ciBzd2l0Y2hpbmcgdG8gYSBwaHlzaWNhbCBhZGRyZXNzIGJh
c2VkIGh5cGVyY2FsbCBtb2RlbC4NCj4gT3RoZXJ3aXNlIEknbSBhZnJhaWQgd2UnbGwgbmV2
ZXIgbWFrZSBhbnkgcHJvZ3Jlc3MgaW4gdGhhdCBkaXJlY3Rpb24uDQoNCldoYXQgYWJvdXQg
YW4gYWx0ZXJuYXRpdmUgbW9kZWwgYWxsb3dpbmcgdG8gdXNlIG1vc3Qgb2YgdGhlIGN1cnJl
bnQNCmh5cGVyY2FsbHMgdW5tb2RpZmllZD8NCg0KV2UgY291bGQgYWRkIGEgbmV3IGh5cGVy
Y2FsbCBmb3IgcmVnaXN0ZXJpbmcgaHlwZXJjYWxsIGJ1ZmZlcnMgdmlhDQp2aXJ0dWFsIGFk
ZHJlc3MsIHBoeXNpY2FsIGFkZHJlc3MsIGFuZCBzaXplIG9mIHRoZSBidWZmZXJzIChraW5k
IG9mIGENCnNvZnR3YXJlIFRMQikuIFRoZSBidWZmZXIgdGFibGUgd291bGQgd2FudCB0byBi
ZSBwaHlzaWNhbGx5IGFkZHJlc3NlZA0KYnkgdGhlIGh5cGVyY2FsbCwgb2YgY291cnNlLg0K
DQpJdCBtaWdodCBiZSBpbnRlcmVzdGluZyB0byBoYXZlIHRoaXMgdGFibGUgcGVyIHZjcHUg
KGl0IHNob3VsZCBiZQ0KYWxsb3dlZCB0byB1c2UgdGhlIHNhbWUgdGFibGUgZm9yIG11bHRp
cGxlIHZjcHVzKSBpbiBvcmRlciB0byBzcGVlZA0KdXAgZmluZGluZyB0cmFuc2xhdGlvbiBl
bnRyaWVzIG9mIHBlcmNwdSBidWZmZXJzLg0KDQpBbnkgaHlwZXJjYWxsIGJ1ZmZlciBiZWlu
ZyBhZGRyZXNzZWQgdmlydHVhbGx5IGNvdWxkIGZpcnN0IHRyaWVkIHRvDQpiZSBmb3VuZCB2
aWEgdGhlIFNXLVRMQi4gVGhpcyB3b3VsZG4ndCByZXF1aXJlIGFueSBjaGFuZ2VzIGZvciBt
b3N0DQpvZiB0aGUgaHlwZXJjYWxsIGludGVyZmFjZXMuIE9ubHkgc3BlY2lhbCBjYXNlcyB3
aXRoIHZlcnkgbGFyZ2UgYnVmZmVycw0KbWlnaHQgbmVlZCBpbmRpcmVjdCB2YXJpYW50cyAo
bGlrZSBKYW4gc2FpZDogdmlhIEdGTiBsaXN0cywgd2hpY2ggY291bGQNCmJlIHBhc3NlZCBp
biByZWdpc3RlcmVkIGJ1ZmZlcnMpLg0KDQpFbmNyeXB0ZWQgZ3Vlc3RzIHdvdWxkIHByb2Jh
Ymx5IHdhbnQgdG8gdXNlIHN0YXRpYyBwZXJjcHUgYnVmZmVycyBpbg0Kb3JkZXIgdG8gYXZv
aWQgc3dpdGNoaW5nIHRoZSBlbmNyeXB0aW9uIHN0YXRlIG9mIHRoZSBidWZmZXJzIGFsbCB0
aGUNCnRpbWUuDQoNCkFuIHVuZW5jcnlwdGVkIFBWSC9IVk0gZG9tYWluIChlLmcuIFBWSCBk
b20wKSBjb3VsZCBqdXN0IGRlZmluZSBvbmUNCmdpYW50IGJ1ZmZlciB3aXRoIHRoZSBkb21h
aW4ncyBtZW1vcnkgc2l6ZSB2aWEgdGhlIHBoeXNpY2FsIG1lbW9yeQ0KbWFwcGluZyBvZiB0
aGUga2VybmVsLiBBbGwga21hbGxvYygpIGFkZHJlc3NlcyB3b3VsZCBiZSBpbiB0aGF0IHJl
Z2lvbi4NCg0KQSBidWZmZXIgYWRkcmVzcyBub3QgZm91bmQgd291bGQgbmVlZCB0byBiZSB0
cmFuc2xhdGVkIGxpa2UgdG9kYXkgKGFuZA0KZmFpbCBmb3IgYW4gZW5jcnlwdGVkIGd1ZXN0
KS4NCg0KVGhvdWdodHM/DQoNCg0KSnVlcmdlbg0K
--------------MnthlwNHWJdKVHE8KnRxNbHZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------MnthlwNHWJdKVHE8KnRxNbHZ--

--------------P9mk0xTRkupVqoBidzI5Fgiy--

--------------YwmfFyl4MUWyXfocPzr4f48i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM0RhwFAwAAAAAACgkQsN6d1ii/Ey+O
7wgAm8rH8XEEXow2ZOoAn94Js5TD73/z86wzRgzERe3ZCh9VvIR/Zp25p9bxl/OXld2tE0niNxa2
2ClNz1gGKE5j50UvD+skX4dTJel94cf8lJjOU3Kvm54pStmpT+VBOFfbbREqZD/04KoaFAwxgBy4
PtmNitPvKHTlXbBOTmXR/t0R+es8ZNnQoIhg1CsWbFcbb6ssfXVcWogGmIT4LwCEozbVv+Sf+JTk
h8RRnBbXjj6wlb8tiOZL7kF+QMZB7kbinEsuztFNssW3MO6TCiHpZWITmohtR3DemqfryHsyUguZ
0CtW8IHXf2PbfHobqFPaJSlePfzba7GN9lj/8bM+kQ==
=DbDR
-----END PGP SIGNATURE-----

--------------YwmfFyl4MUWyXfocPzr4f48i--

