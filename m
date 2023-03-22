Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720026C4B55
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 14:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513434.794411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyEA-0001HT-SK; Wed, 22 Mar 2023 13:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513434.794411; Wed, 22 Mar 2023 13:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyEA-0001Fj-O5; Wed, 22 Mar 2023 13:10:06 +0000
Received: by outflank-mailman (input) for mailman id 513434;
 Wed, 22 Mar 2023 13:10:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1peyE9-000101-27
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 13:10:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daf2dc96-c8b2-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 14:10:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CDF2C33B38;
 Wed, 22 Mar 2023 13:10:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9422E138E9;
 Wed, 22 Mar 2023 13:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C3c3Iin+GmTXdAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Mar 2023 13:10:01 +0000
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
X-Inumbo-ID: daf2dc96-c8b2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679490601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ljw+XIHcZhRxb/XcpWxNa2YPpJuWzqy/nH3XMoHPAiY=;
	b=bbfusIa11qnX2rja+1wMjm2flR4Xbw6lYDINmkzP0L9nBEpdBf/eaBrPuGO6H8nJ1B4y7I
	EEzwbVPTAdNwCOPMvIqwVVPgqsyEduinsRZ/mKU4ZgvwTF4SqiVdLKZovKhswGdiIGRBvw
	zg8saQTimPNvCXErxCADHQzZVNXEtDU=
Message-ID: <164268c2-5392-4a91-5ac7-969ca9f62b6f@suse.com>
Date: Wed, 22 Mar 2023 14:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230322120844.19657-1-jgross@suse.com>
 <20230322120844.19657-3-jgross@suse.com>
 <cd1b5f73-aa57-938d-8453-9c2e7b0895cd@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 2/5] tools: get rid of additional min() and max()
 definitions
In-Reply-To: <cd1b5f73-aa57-938d-8453-9c2e7b0895cd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UDuXy09InV6h56zPJoAZ0FPY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UDuXy09InV6h56zPJoAZ0FPY
Content-Type: multipart/mixed; boundary="------------6QZhpjVPQ1Ukr9Yobz7Fxkr4";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <164268c2-5392-4a91-5ac7-969ca9f62b6f@suse.com>
Subject: Re: [PATCH v4 2/5] tools: get rid of additional min() and max()
 definitions
References: <20230322120844.19657-1-jgross@suse.com>
 <20230322120844.19657-3-jgross@suse.com>
 <cd1b5f73-aa57-938d-8453-9c2e7b0895cd@suse.com>
In-Reply-To: <cd1b5f73-aa57-938d-8453-9c2e7b0895cd@suse.com>

--------------6QZhpjVPQ1Ukr9Yobz7Fxkr4
Content-Type: multipart/mixed; boundary="------------CL8QcLqnT5BSpbZ1TgrW3VS1"

--------------CL8QcLqnT5BSpbZ1TgrW3VS1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDMuMjMgMTM6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMi4wMy4yMDIz
IDEzOjA4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvdG9vbHMvdGVzdHMvdnBj
aS9lbXVsLmgNCj4+ICsrKyBiL3Rvb2xzL3Rlc3RzL3ZwY2kvZW11bC5oDQo+PiBAQCAtMTA2
LDIyICsxMDYsNiBAQCB0eXBlZGVmIHVuaW9uIHsNCj4+ICAgI2RlZmluZSBCVUcoKSBhc3Nl
cnQoMCkNCj4+ICAgI2RlZmluZSBBU1NFUlRfVU5SRUFDSEFCTEUoKSBhc3NlcnQoMCkNCj4+
ICAgDQo+PiAtI2RlZmluZSBtaW4oeCwgeSkgKHsgICAgICAgICAgICAgICAgICAgIFwNCj4+
IC0gICAgICAgIGNvbnN0IHR5cGVvZih4KSB0eCA9ICh4KTsgICAgICAgXA0KPj4gLSAgICAg
ICAgY29uc3QgdHlwZW9mKHkpIHR5ID0gKHkpOyAgICAgICBcDQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+IC0gICAgICAgICh2b2lkKSAoJnR4
ID09ICZ0eSk7ICAgICAgICAgICAgXA0KPj4gLSAgICAgICAgdHggPCB0eSA/IHR4IDogdHk7
ICAgICAgICAgICAgICBcDQo+PiAtfSkNCj4+IC0NCj4+IC0jZGVmaW5lIG1heCh4LCB5KSAo
eyAgICAgICAgICAgICAgICAgICAgXA0KPj4gLSAgICAgICAgY29uc3QgdHlwZW9mKHgpIHR4
ID0gKHgpOyAgICAgICBcDQo+PiAtICAgICAgICBjb25zdCB0eXBlb2YoeSkgdHkgPSAoeSk7
ICAgICAgIFwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XA0KPj4gLSAgICAgICAgKHZvaWQpICgmdHggPT0gJnR5KTsgICAgICAgICAgICBcDQo+PiAt
ICAgICAgICB0eCA+IHR5ID8gdHggOiB0eTsgICAgICAgICAgICAgIFwNCj4+IC19KQ0KPiAN
Cj4gVGhlIG5ldyBpbmNsdWRlIGlzIGFkZGVkIHRvIHRoaXMgZmlsZSBieSB0aGUgZmlyc3Qg
cGF0Y2guIEhvdyBkbyB0aGluZ3MNCj4gYnVpbGQgd2FybmluZy1mcmVlIGJlZm9yZSB0aGVz
ZSBtYWNyb3MgKGZ1bmN0aW9uYWxseSBjb21wYXRpYmxlIGJ1dA0KPiBkaWZmZXJlbnQgaW4g
dGhlIHNwZWNpZmljIHRva2VucyB1c2VkKSBhcmUgcmVtb3ZlZCwgaS5lLiBiZWZvcmUgdGhp
cw0KPiBwYXRjaCBpcyAoYWxzbykgYXBwbGllZD8NCg0KT2gsIEkgc2VlbSB0byBoYXZlIGZh
aWxlZCB0byBtYWtlIGEgdGVzdCBidWlsZCBvZiB0aGUgdG9vbHMvdGVzdHMgZGlyZWN0b3J5
DQphZnRlciBhcHBseWluZyBvbmx5IHRoZSBmaXJzdCBwYXRjaC4NCg0KSXQgd291bGQgYmUg
cHJvYmFibHkgYmUgdGhlIGJlc3QgdG8gc3dpdGNoIHBhdGNoZXMgMSBhbmQgMiB3aGlsZSBr
ZWVwaW5nIHRoZQ0KIiNpbmNsdWRlIDx4ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oPiIgaW4g
dG9vbHMvdGVzdHMvdnBjaS9lbXVsLmggaW4gdGhlIGZpcnN0DQpwYXRjaC4NCg0KDQpKdWVy
Z2VuDQoNCg==
--------------CL8QcLqnT5BSpbZ1TgrW3VS1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------CL8QcLqnT5BSpbZ1TgrW3VS1--

--------------6QZhpjVPQ1Ukr9Yobz7Fxkr4--

--------------UDuXy09InV6h56zPJoAZ0FPY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQa/ikFAwAAAAAACgkQsN6d1ii/Ey+X
hQf9FrjTuh5Tp0DnZI8TR3OwfG69JhUjxsN84wWdqkR/w1UxReXzGd6/uYsLW89FCRYGWDp3zTtj
zgyWj9dk/99lkKzE2tYxXsGWcineHS/BmB/0hk1OZcpLYTF7BbQSGbWZFTlTGzOlkEsudsE0lIFA
e9wqU9sjcKrWedSwXxAxe3lQ/0fuXIMbrWvHYI0ECR/FByku4ImrHnnJG5ZIm++swnIZwq+5rIKA
SDGbNwRWTWgUA3WrbRnH0WsfaG3oUinIcIDdJxlV6jJIs2QzsOH2YxWpSyFu0mcAcgaaMNsBjKW5
Meoeu8s9rPhgvpm16qkTK4KYAnkH79GfwClbZ0fplw==
=foEA
-----END PGP SIGNATURE-----

--------------UDuXy09InV6h56zPJoAZ0FPY--

