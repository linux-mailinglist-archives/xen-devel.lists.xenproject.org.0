Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002F4A3DD3
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 07:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262731.455090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEQRy-0003bw-Oa; Mon, 31 Jan 2022 06:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262731.455090; Mon, 31 Jan 2022 06:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEQRy-0003Yi-Ks; Mon, 31 Jan 2022 06:46:06 +0000
Received: by outflank-mailman (input) for mailman id 262731;
 Mon, 31 Jan 2022 06:46:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FCUt=SP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nEQRx-0003Yc-Eq
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 06:46:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75dee376-8261-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 07:46:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 27AEF212BA;
 Mon, 31 Jan 2022 06:46:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F063813A89;
 Mon, 31 Jan 2022 06:46:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WfE+OauF92FiNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 31 Jan 2022 06:46:03 +0000
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
X-Inumbo-ID: 75dee376-8261-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643611564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhoIjVGNxD61y6wypELo13frmHMFiJnGgwM5kx+UkMo=;
	b=eIqihckZo+EtX0TdIRyYPZv632lvZPTHaf6OQ8lWGNG30CQf1DSz8kE10+NdWYVWlTVpEh
	tsp92nDMKsfDRFK9wwXFYBHW5OGQJlSuoL4Kgur8JEzpvyF9HsSj++dRBpnWEG+9SqQRNS
	DlnZOe1e5Qv7FbN1sh25ItZYMYIcrOk=
Message-ID: <3359061b-656e-24f0-7b81-0905943afc78@suse.com>
Date: Mon, 31 Jan 2022 07:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] xen: xenbus_dev.h: delete incorrect file name
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, patches@lists.linux.dev
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220130191705.24971-1-rdunlap@infradead.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220130191705.24971-1-rdunlap@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GXljl0PX4ua0YUxLb2L0MCb0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GXljl0PX4ua0YUxLb2L0MCb0
Content-Type: multipart/mixed; boundary="------------bOJgV0CgzP6fBtAZ5PlmC8o0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Randy Dunlap <rdunlap@infradead.org>, patches@lists.linux.dev
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <3359061b-656e-24f0-7b81-0905943afc78@suse.com>
Subject: Re: [PATCH] xen: xenbus_dev.h: delete incorrect file name
References: <20220130191705.24971-1-rdunlap@infradead.org>
In-Reply-To: <20220130191705.24971-1-rdunlap@infradead.org>

--------------bOJgV0CgzP6fBtAZ5PlmC8o0
Content-Type: multipart/mixed; boundary="------------0pGJlWf8OoS0YGV8acvZnCdW"

--------------0pGJlWf8OoS0YGV8acvZnCdW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDEuMjIgMjA6MTcsIFJhbmR5IER1bmxhcCB3cm90ZToNCj4gSXQgaXMgYmV0dGVy
L3ByZWZlcnJlZCBub3QgdG8gaW5jbHVkZSBmaWxlIG5hbWVzIGluIHNvdXJjZSBmaWxlcw0K
PiBiZWNhdXNlIChhKSB0aGV5IGFyZSBub3QgbmVlZGVkIGFuZCAoYikgdGhleSBjYW4gYmUg
aW5jb3JyZWN0LA0KPiBzbyBqdXN0IGRlbGV0ZSB0aGlzIGluY29ycmVjdCBmaWxlIG5hbWUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFk
Lm9yZz4NCj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+DQo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IENjOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gLS0tDQo+ICAgaW5jbHVkZS94ZW4veGVuYnVz
X2Rldi5oIHwgICAgMSAtDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4g
DQo+IC0tLSBsaW51eC1uZXh0LTIwMjIwMTI4Lm9yaWcvaW5jbHVkZS94ZW4veGVuYnVzX2Rl
di5oDQo+ICsrKyBsaW51eC1uZXh0LTIwMjIwMTI4L2luY2x1ZGUveGVuL3hlbmJ1c19kZXYu
aA0KPiBAQCAtMSw1ICsxLDQgQEANCj4gICAvKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+
IC0gKiBldnRjaG4uaA0KDQpJIHRoaW5rIHRoZSBmb2xsb3dpbmcgbGluZSBzaG91bGQgYmUg
ZGVsZXRlZCwgdG9vIChjYW4gYmUgZG9uZSB3aGlsZQ0KY29tbWl0dGluZykuDQoNCj4gICAg
Kg0KPiAgICAqIEludGVyZmFjZSB0byAvZGV2L3hlbi94ZW5idXNfYmFja2VuZC4NCj4gICAg
Kg0KPiANCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4N
Cg0KDQpKdWVyZ2VuDQo=
--------------0pGJlWf8OoS0YGV8acvZnCdW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0pGJlWf8OoS0YGV8acvZnCdW--

--------------bOJgV0CgzP6fBtAZ5PlmC8o0--

--------------GXljl0PX4ua0YUxLb2L0MCb0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmH3hasFAwAAAAAACgkQsN6d1ii/Ey9x
0AgAlru9wYN/9wKxunqaK+jOmSMSuNZhTuRjpem9BAQRtsoLMqMOekIJ4t5D/81TXBnHg5p0QYoS
4z/w7uQcNbJ+qmeOfYGLNU2vYie3sNZ+peIH22yxoUILhFx8fbF1lgmlTMevQR8ISuG3Zj+1xWrR
PwWHeXCmy9Dmt3c2Qzf5bkxA16hUOnysogoPkipfgmS+8UvB4ZYoBv9QCbIIU8Qg9i5/GlNRn3Id
09Xo7Cya3NMBQyKi6zBV4ioqbwroiXz1A7UhRN3Xxa+CagqWA9baJWGFJPoxbvq46BoMKrJNCS30
xrWRZANqdTPvg/AQpVyjnq5curo8przhcrUV/PrX7w==
=iwec
-----END PGP SIGNATURE-----

--------------GXljl0PX4ua0YUxLb2L0MCb0--

