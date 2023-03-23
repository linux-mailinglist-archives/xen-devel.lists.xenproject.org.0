Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6366C647D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 11:12:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513731.795176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfHvr-0001ku-N1; Thu, 23 Mar 2023 10:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513731.795176; Thu, 23 Mar 2023 10:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfHvr-0001if-Iv; Thu, 23 Mar 2023 10:12:31 +0000
Received: by outflank-mailman (input) for mailman id 513731;
 Thu, 23 Mar 2023 10:12:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfHvp-0001iZ-Vv
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 10:12:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36350a8c-c963-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 11:12:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58F9A33AFE;
 Thu, 23 Mar 2023 10:12:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D670132C2;
 Thu, 23 Mar 2023 10:12:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EUluBQomHGQ0YQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Mar 2023 10:12:26 +0000
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
X-Inumbo-ID: 36350a8c-c963-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679566346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ouqexAkSn6AKuLTLiOQWZF854CrJCw4ONqX8Vr+xK58=;
	b=ssNa/VI18XKd4Q4UBWzwPIfOynidMZfM17AdG8+vzQ5oqjVfda7f1TDe6M+DH1BI/5Qhl3
	5WLe//rY6LdwPOVpmqJyT9CMUYxWcRoU5SILl1iAXKOAHtGlTWx3xhGCgXKEbvFRyNG5a9
	HCnCPUlCSMukQWQU9hgSGOcfMsYCCps=
Message-ID: <7cc1318a-1b70-7c90-3c82-29e9716ac001@suse.com>
Date: Thu, 23 Mar 2023 11:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 3/5] tools/hvmloader: remove private offsetof()
 definition
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230323090859.25240-1-jgross@suse.com>
 <20230323090859.25240-4-jgross@suse.com>
 <3178a474-371c-2dbd-a9d8-f90a6fb4e13c@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <3178a474-371c-2dbd-a9d8-f90a6fb4e13c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9Oym9UzeBFf0vyWhvfnYMdFu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9Oym9UzeBFf0vyWhvfnYMdFu
Content-Type: multipart/mixed; boundary="------------jORlYN0BhL6LPAxH09IyU4Ue";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <7cc1318a-1b70-7c90-3c82-29e9716ac001@suse.com>
Subject: Re: [PATCH v5 3/5] tools/hvmloader: remove private offsetof()
 definition
References: <20230323090859.25240-1-jgross@suse.com>
 <20230323090859.25240-4-jgross@suse.com>
 <3178a474-371c-2dbd-a9d8-f90a6fb4e13c@suse.com>
In-Reply-To: <3178a474-371c-2dbd-a9d8-f90a6fb4e13c@suse.com>

--------------jORlYN0BhL6LPAxH09IyU4Ue
Content-Type: multipart/mixed; boundary="------------RZNWMCVOOzdIx4aEq1jwa122"

--------------RZNWMCVOOzdIx4aEq1jwa122
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDMuMjMgMTE6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wMy4yMDIz
IDEwOjA4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gdXRpbC5oIGNvbnRhaW5zIGEgZGVm
aW5pdGlvbiBvZiBvZmZzZXRvZigpLCB3aGljaCBpc24ndCB1c2VkLg0KPiANCj4gQ29taW5n
IGJhY2sgdG8gbXkgY29tbWVudCBvbiB0aGUgZWFybGllciB2ZXJzaW9uOiAibm90IHVzZWQi
IGlzbid0IHRydWUsDQo+IGJ1dCB0aGUgZWFybGllciAibm90IG5lZWRlZCIgYWxzbyBkaWRu
J3QgbWFrZSBjbGVhciB3aHkgaXQgd2FzIG5vdCBuZWVkZWQNCj4gKG1pc2xlYWRpbmcgbWUg
aW50byBtYWtpbmcgdGhlIFt3cm9uZ10gc3VnZ2VzdGlvbik6IFRoZSBtYWNybyBpcyB1c2Vk
LA0KPiBqdXN0IG5vdCBpbiBodm1sb2FkZXIvIGJ1dCBpbiBmaWxlcyBsaXZpbmcgaW4gbGli
YWNwaS8gYW5kIGNvbXBpbGVkIGhlcmUNCj4gKGFzIHdlbGwgYXMgZWxzZXdoZXJlKS4NCg0K
QWgsIG9rYXksIEkgb25seSBsb29rZWQgaW4gaHZtbG9hZGVyIGZvciB1c2Vycy4NCg0KPiBO
ZXcgc3VnZ2VzdGlvbiAod2hpY2ggSSdtIGhhcHB5IHRvIGFwcGx5IHdoaWxlIGNvbW1pdHRp
bmcpOiAiLi4uIHdoaWNoDQo+IGlzbid0IG5lZWRlZCwgYXMgZmlybXdhcmUvaW5jbHVkZS9z
dGRkZWYuaCdzIGRvZXNuJ3QgcmVhbGx5IG5lZWQNCj4gb3ZlcnJpZGluZyIuIChUaGUgc2Ft
ZSwgYnR3LCBpcyB0cnVlIGZvciBOVUxMLCBzbyBJIGd1ZXNzIEknbGwgbWFrZSBhDQo+IGZv
bGxvdy11cCBwYXRjaCB0byByZW1vdmUgdGhhdCBvbmUgYXMgd2VsbC4pDQoNCkZpbmUgd2l0
aCBtZS4NCg0KDQpKdWVyZ2VuDQo=
--------------RZNWMCVOOzdIx4aEq1jwa122
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------RZNWMCVOOzdIx4aEq1jwa122--

--------------jORlYN0BhL6LPAxH09IyU4Ue--

--------------9Oym9UzeBFf0vyWhvfnYMdFu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQcJgkFAwAAAAAACgkQsN6d1ii/Ey96
VQgAk1pF+cITeafbBPlvFIkwU0gbbAh2WkdaJCSG3sezCbjGarTbWkaz0iAzkRy4RP1VpTUjSdhP
P1qoV+BlQ4SgTjlZdXut7ZZs7WSVNtVmoO8FkDtMbSXuPX0bsn9VVa0w2HbkBW9e7MDQSYXFakQL
leshsqbJ/7pXNKFTIIGcWCEIBFssmj06ASjRbANmLk2fXiN93gHIqHiAt/XoksbH/ZgH6SSf3lGE
9kemU2A4Ks/YPyWUV+g5YQSXIEujI+Hdr+wN13QFxOIx0ibtRcPUZMStYzmkX+dKY9ZAwKkqQ/dP
CBRKf8s/0p06/NhYf0perIIuQhgFNzF/iHBB3W3INA==
=dBks
-----END PGP SIGNATURE-----

--------------9Oym9UzeBFf0vyWhvfnYMdFu--

