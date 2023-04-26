Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1727C6EF7AF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 17:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526777.818750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgwA-0007vs-Pz; Wed, 26 Apr 2023 15:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526777.818750; Wed, 26 Apr 2023 15:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgwA-0007u0-LB; Wed, 26 Apr 2023 15:20:06 +0000
Received: by outflank-mailman (input) for mailman id 526777;
 Wed, 26 Apr 2023 15:20:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDOC=AR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1prgw9-0007pK-Lk
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 15:20:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b5c262-e445-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 17:20:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3F8831FDD3;
 Wed, 26 Apr 2023 15:20:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EC97138F0;
 Wed, 26 Apr 2023 15:20:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zDcaAiJBSWQKfwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 26 Apr 2023 15:20:02 +0000
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
X-Inumbo-ID: d0b5c262-e445-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682522402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=doQDFYN3VKAZkjC7VD7tFCLBIqOUq3XK95YVk3QGTOY=;
	b=n8yo9DfJTnztYjWntbkthDRpGNwf3LUq2oXc8YoJEkInn2mXypk1kpgUyOGo4TIkGunYaW
	Y1tN91gH1RvtEB07cJ/kz4nY3rkJlaLieIhaXfmku8NIKPSwB8BNDQZWnM2/Da0i6pq3/4
	ewGV1wHmyliawGexPE2NGEM5Y79fxp8=
Message-ID: <18f4bd31-b26c-5cdc-5798-94ac8b7f282e@suse.com>
Date: Wed, 26 Apr 2023 17:20:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.org>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <20230426145932.3340-5-alejandro.vallejo@cloud.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/7] tools: Make init-xenstore-domain use
 xc_domain_getinfolist()
In-Reply-To: <20230426145932.3340-5-alejandro.vallejo@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uKEOHg9kx7vBXDsA0lco8sHH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uKEOHg9kx7vBXDsA0lco8sHH
Content-Type: multipart/mixed; boundary="------------caGaSSQ00IoQW8N2hQtV98RR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.org>
Message-ID: <18f4bd31-b26c-5cdc-5798-94ac8b7f282e@suse.com>
Subject: Re: [PATCH 4/7] tools: Make init-xenstore-domain use
 xc_domain_getinfolist()
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <20230426145932.3340-5-alejandro.vallejo@cloud.com>
In-Reply-To: <20230426145932.3340-5-alejandro.vallejo@cloud.com>

--------------caGaSSQ00IoQW8N2hQtV98RR
Content-Type: multipart/mixed; boundary="------------DvC0XkO9nd0vQ4Cm4fvU2NCm"

--------------DvC0XkO9nd0vQ4Cm4fvU2NCm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDQuMjMgMTY6NTksIEFsZWphbmRybyBWYWxsZWpvIHdyb3RlOg0KPiBJdCBjdXJy
ZW50bHkgcmVsaWVzIG9uIHhjX2RvbWFpbl9nZXRpbmZvKCkgcmV0dXJuaW5nIHRoZSBuZXh0
IGF2YWlsYWJsZQ0KPiBkb21haW4gcGFzdCAiZmlyc3RfZG9taWQiLCB3aGljaCBpcyBhIGZl
YXR1cmUgdGhhdCB3aWxsIGRpc2FwcGVhciBpbiBhDQo+IGZ1dHVyZSBwYXRjaC4NCj4gDQo+
IEZ1cnRoZXJtb3JlIGFuZCB3aGlsZSBhdCBpdCwgbWFrZSBpdCBzbyB0aGUgaHlwZXJjYWxs
IHRyaWVzIHRvIGZldGNoIGluZm9ybWF0aW9uDQo+IGFib3V0IG1vcmUgdGhhbiBvbmUgZG9t
YWluIHBlciBoeXBlcmNhbGwgc28gd2UgY2FuIChob3BlZnVsbHkpIGdldCBhd2F5IHdpdGgg
YQ0KPiBzaW5nbGUgaHlwZXJjYWxsIGluIGEgdHlwaWNhbCBzeXN0ZW0uDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGVqYW5kcm8gVmFsbGVqbyA8YWxlamFuZHJvLnZhbGxlam9AY2xvdWQu
Y29tPg0KPiAtLS0NCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+DQo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBDYzogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2Uub3JnPg0KPiAtLS0NCj4gICB0b29scy9oZWxwZXJzL2luaXQteGVu
c3RvcmUtZG9tYWluLmMgfCAxNCArKysrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jIGIvdG9vbHMvaGVscGVycy9p
bml0LXhlbnN0b3JlLWRvbWFpbi5jDQo+IGluZGV4IDA5NTBiYTdkYzUuLjVmNDA5MDFkMzEg
MTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2hlbHBlcnMvaW5pdC14ZW5zdG9yZS1kb21haW4uYw0K
PiArKysgYi90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMNCj4gQEAgLTIx
LDYgKzIxLDcgQEANCj4gICAjZGVmaW5lIExBUElDX0JBU0VfQUREUkVTUyAgMHhmZWUwMDAw
MFVMDQo+ICAgI2RlZmluZSBNQih4KSAgICAgICAgICAgICAgICgodWludDY0X3QpeCA8PCAy
MCkNCj4gICAjZGVmaW5lIEdCKHgpICAgICAgICAgICAgICAgKCh1aW50NjRfdCl4IDw8IDMw
KQ0KPiArI2RlZmluZSBBUlJBWV9TSVpFKHgpICAgICAgIChzaXplb2YoeCkgLyBzaXplb2Yo
KHgpWzBdKSkNCg0KUGxlYXNlIGluY2x1ZGUgPHhlbi10b29scy9jb21tb24tbWFjcm9zLmg+
IGluc3RlYWQgb2YgZGVmaW5pbmcgQVJSQVlfU0laRSgpLg0KDQpXaXRoIHRoYXQgY2hhbmdl
ZDoNCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0K
DQpKdWVyZ2VuDQo=
--------------DvC0XkO9nd0vQ4Cm4fvU2NCm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------DvC0XkO9nd0vQ4Cm4fvU2NCm--

--------------caGaSSQ00IoQW8N2hQtV98RR--

--------------uKEOHg9kx7vBXDsA0lco8sHH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRJQSEFAwAAAAAACgkQsN6d1ii/Ey/K
qQf/fyq8k+xtSoO7wY+YiqM7WwP6yDksECgRb17VnhIZem/lESrMmwEWvMStqqyrg+VRdULiOhu7
j2/4jH2zDS6wrPhqLGCzvAuTcQQiFTdlOhqbKnAQXqgk0EECCX7tfGDaek+EPFzESTcIFYMI/h4C
ZQyfDQ3CpgunmTKNMly5RczP52k+q4sqvi3QNDtaj4vgb6crCOMDJUHdmU8QCHi87BGFzjWUvk2t
UZKkR9YIbW+AfrxMQc4eKGdbvDU+GGe+Gt8E6ywKBazGZnhKMeV6Y2hD4leeTotZUii1KWeyrSFp
1D40JK2LPXzlF2Iu+bHKPEsULNWDuhLPL/chbwpjTQ==
=tTqV
-----END PGP SIGNATURE-----

--------------uKEOHg9kx7vBXDsA0lco8sHH--

