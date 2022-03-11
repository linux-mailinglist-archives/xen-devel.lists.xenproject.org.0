Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66934D5D1F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 09:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288844.489918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaSR-0000Iy-NU; Fri, 11 Mar 2022 08:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288844.489918; Fri, 11 Mar 2022 08:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaSR-0000GQ-KI; Fri, 11 Mar 2022 08:17:07 +0000
Received: by outflank-mailman (input) for mailman id 288844;
 Fri, 11 Mar 2022 08:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nSaSQ-0000GJ-8f
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 08:17:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2be9dab-a113-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 09:17:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 86E391F38D;
 Fri, 11 Mar 2022 08:17:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 527EF13C9D;
 Fri, 11 Mar 2022 08:17:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZvIyEoAFK2IWNQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 11 Mar 2022 08:17:04 +0000
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
X-Inumbo-ID: a2be9dab-a113-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646986624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m5giv2VUbhUOTe8v735blL4jXRTl2UKmg1TxdJTcal0=;
	b=S7IN2a1lM9UaGLfIPO5TojMN0i+Ne8SVph8H416ZsW0vYimlETglaFKKdmmXEdCu5epTrC
	0C1sty9ah8GR4aeaBVd8K92Znzps4g8ZcdIKgn8r3HmarAi/yVpGKygV7JWacFdtFE41yq
	8Xy/bH9z0xRMlbDWsrQU/E7HK1/MSyM=
Message-ID: <2dfb6f30-ef47-0450-2846-c5e0e6e1c73e@suse.com>
Date: Fri, 11 Mar 2022 09:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/6] tools/cpupools: Give a name to unnamed cpupools
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-2-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220310171019.6170-2-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------r9VJ2ukTbZzGmipn0u4tVDuI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------r9VJ2ukTbZzGmipn0u4tVDuI
Content-Type: multipart/mixed; boundary="------------0QfhGAUMn9buG0qd3EPR0072";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <2dfb6f30-ef47-0450-2846-c5e0e6e1c73e@suse.com>
Subject: Re: [PATCH v2 1/6] tools/cpupools: Give a name to unnamed cpupools
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-2-luca.fancellu@arm.com>
In-Reply-To: <20220310171019.6170-2-luca.fancellu@arm.com>

--------------0QfhGAUMn9buG0qd3EPR0072
Content-Type: multipart/mixed; boundary="------------3IMchMNyIrEJV6phl3pqcHV0"

--------------3IMchMNyIrEJV6phl3pqcHV0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDMuMjIgMTg6MTAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IFdpdGggdGhlIGlu
dHJvZHVjdGlvbiBvZiBib290IHRpbWUgY3B1cG9vbHMsIFhlbiBjYW4gY3JlYXRlIG1hbnkN
Cj4gZGlmZmVyZW50IGNwdXBvb2xzIGF0IGJvb3QgdGltZSBvdGhlciB0aGFuIGNwdXBvb2wg
d2l0aCBpZCAwLg0KPiANCj4gU2luY2UgdGhlc2UgbmV3bHkgY3JlYXRlZCBjcHVwb29scyBj
YW4ndCBoYXZlIGFuDQo+IGVudHJ5IGluIFhlbnN0b3JlLCBjcmVhdGUgdGhlIGVudHJ5IHVz
aW5nIHhlbi1pbml0LWRvbTANCj4gaGVscGVyIHdpdGggdGhlIHVzdWFsIGNvbnZlbnRpb246
IFBvb2wtPGNwdXBvb2wgaWQ+Lg0KPiANCj4gR2l2ZW4gdGhlIGNoYW5nZSwgcmVtb3ZlIHRo
ZSBjaGVjayBmb3IgcG9vbGlkID09IDAgZnJvbQ0KPiBsaWJ4bF9jcHVwb29saWRfdG9fbmFt
ZSguLi4pLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5j
ZWxsdUBhcm0uY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gICAtIFJlbW92ZSB1
bnVzZWQgdmFyaWFibGUsIG1vdmVkIHhjX2NwdXBvb2xfaW5mb2ZyZWUNCj4gICAgIGFoZWFk
IHRvIHNpbXBsaWZ5IHRoZSBjb2RlLCB1c2UgYXNwcmludGYgKEp1ZXJnZW4pDQo+IC0tLQ0K
PiAgIHRvb2xzL2hlbHBlcnMveGVuLWluaXQtZG9tMC5jICB8IDM1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3V0aWxz
LmMgfCAgMyArLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvaGVscGVycy94ZW4taW5p
dC1kb20wLmMgYi90b29scy9oZWxwZXJzL3hlbi1pbml0LWRvbTAuYw0KPiBpbmRleCBjOTky
MjRhNGI2MDcuLjg0Mjg2NjE3NzkwZiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvaGVscGVycy94
ZW4taW5pdC1kb20wLmMNCj4gKysrIGIvdG9vbHMvaGVscGVycy94ZW4taW5pdC1kb20wLmMN
Cj4gQEAgLTQzLDcgKzQzLDkgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0K
PiAgICAgICBpbnQgcmM7DQo+ICAgICAgIHN0cnVjdCB4c19oYW5kbGUgKnhzaCA9IE5VTEw7
DQo+ICAgICAgIHhjX2ludGVyZmFjZSAqeGNoID0gTlVMTDsNCj4gLSAgICBjaGFyICpkb21u
YW1lX3N0cmluZyA9IE5VTEwsICpkb21pZF9zdHJpbmcgPSBOVUxMOw0KPiArICAgIGNoYXIg
KmRvbW5hbWVfc3RyaW5nID0gTlVMTCwgKmRvbWlkX3N0cmluZyA9IE5VTEwsICpwb29sX3Bh
dGgsICpwb29sX25hbWU7DQo+ICsgICAgeGNfY3B1cG9vbGluZm9fdCAqeGNpbmZvOw0KPiAr
ICAgIHVuc2lnbmVkIGludCBwb29sX2lkID0gMDsNCj4gICAgICAgbGlieGxfdXVpZCB1dWlk
Ow0KPiAgIA0KPiAgICAgICAvKiBBY2NlcHQgMCBvciAxIGFyZ3VtZW50ICovDQo+IEBAIC0x
MTQsNiArMTE2LDM3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikNCj4gICAg
ICAgICAgIGdvdG8gb3V0Ow0KPiAgICAgICB9DQo+ICAgDQo+ICsgICAgLyogQ3JlYXRlIGFu
IGVudHJ5IGluIHhlbnN0b3JlIGZvciBlYWNoIGNwdXBvb2wgb24gdGhlIHN5c3RlbSAqLw0K
PiArICAgIGRvIHsNCj4gKyAgICAgICAgeGNpbmZvID0geGNfY3B1cG9vbF9nZXRpbmZvKHhj
aCwgcG9vbF9pZCk7DQo+ICsgICAgICAgIGlmICh4Y2luZm8gIT0gTlVMTCkgew0KPiArICAg
ICAgICAgICAgaWYgKHhjaW5mby0+Y3B1cG9vbF9pZCAhPSBwb29sX2lkKQ0KDQpJIHRoaW5r
IHlvdSBjYW4ganVzdCBkcm9wIHRoaXMgaWYuDQoNCldpdGggb3Igd2l0aG91dCB0aGlzLA0K
DQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQo+ICsg
ICAgICAgICAgICAgICAgcG9vbF9pZCA9IHhjaW5mby0+Y3B1cG9vbF9pZDsNCj4gKyAgICAg
ICAgICAgIHhjX2NwdXBvb2xfaW5mb2ZyZWUoeGNoLCB4Y2luZm8pOw0KPiArICAgICAgICAg
ICAgaWYgKGFzcHJpbnRmKCZwb29sX3BhdGgsICIvbG9jYWwvcG9vbC8lZC9uYW1lIiwgcG9v
bF9pZCkgPD0gMCkgew0KPiArICAgICAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiY2Fu
bm90IGFsbG9jYXRlIG1lbW9yeSBmb3IgcG9vbCBwYXRoXG4iKTsNCj4gKyAgICAgICAgICAg
ICAgICByYyA9IDE7DQo+ICsgICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+ICsgICAgICAg
ICAgICB9DQo+ICsgICAgICAgICAgICBpZiAoYXNwcmludGYoJnBvb2xfbmFtZSwgIlBvb2wt
JWQiLCBwb29sX2lkKSA8PSAwKSB7DQo+ICsgICAgICAgICAgICAgICAgZnByaW50ZihzdGRl
cnIsICJjYW5ub3QgYWxsb2NhdGUgbWVtb3J5IGZvciBwb29sIG5hbWVcbiIpOw0KPiArICAg
ICAgICAgICAgICAgIHJjID0gMTsNCj4gKyAgICAgICAgICAgICAgICBnb3RvIG91dF9lcnI7
DQo+ICsgICAgICAgICAgICB9DQo+ICsgICAgICAgICAgICBwb29sX2lkKys7DQo+ICsgICAg
ICAgICAgICBpZiAoIXhzX3dyaXRlKHhzaCwgWEJUX05VTEwsIHBvb2xfcGF0aCwgcG9vbF9u
YW1lLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJsZW4ocG9vbF9uYW1lKSkp
IHsNCj4gKyAgICAgICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImNhbm5vdCBzZXQgcG9v
bCBuYW1lXG4iKTsNCj4gKyAgICAgICAgICAgICAgICByYyA9IDE7DQo+ICsgICAgICAgICAg
ICB9DQo+ICsgICAgICAgICAgICBmcmVlKHBvb2xfbmFtZSk7DQo+ICtvdXRfZXJyOg0KPiAr
ICAgICAgICAgICAgZnJlZShwb29sX3BhdGgpOw0KPiArICAgICAgICAgICAgaWYgKCByYyAp
DQo+ICsgICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+ICsgICAgICAgIH0NCj4gKyAgICB9
IHdoaWxlKHhjaW5mbyAhPSBOVUxMKTsNCj4gKw0KPiAgICAgICBwcmludGYoIkRvbmUgc2V0
dGluZyB1cCBEb20wXG4iKTsNCj4gICANCj4gICBvdXQ6DQo+IGRpZmYgLS1naXQgYS90b29s
cy9saWJzL2xpZ2h0L2xpYnhsX3V0aWxzLmMgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3V0
aWxzLmMNCj4gaW5kZXggYjkxYzJjYWZhMjIzLi44MTc4MGRhM2ZmNDAgMTAwNjQ0DQo+IC0t
LSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfdXRpbHMuYw0KPiArKysgYi90b29scy9saWJz
L2xpZ2h0L2xpYnhsX3V0aWxzLmMNCj4gQEAgLTE1MSw4ICsxNTEsNyBAQCBjaGFyICpsaWJ4
bF9jcHVwb29saWRfdG9fbmFtZShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgcG9vbGlkKQ0K
PiAgIA0KPiAgICAgICBzbnByaW50ZihwYXRoLCBzaXplb2YocGF0aCksICIvbG9jYWwvcG9v
bC8lZC9uYW1lIiwgcG9vbGlkKTsNCj4gICAgICAgcyA9IHhzX3JlYWQoY3R4LT54c2gsIFhC
VF9OVUxMLCBwYXRoLCAmbGVuKTsNCj4gLSAgICBpZiAoIXMgJiYgKHBvb2xpZCA9PSAwKSkN
Cj4gLSAgICAgICAgcmV0dXJuIHN0cmR1cCgiUG9vbC0wIik7DQo+ICsNCj4gICAgICAgcmV0
dXJuIHM7DQo+ICAgfQ0KPiAgIA0KDQoNCkp1ZXJnZW4NCg==
--------------3IMchMNyIrEJV6phl3pqcHV0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------3IMchMNyIrEJV6phl3pqcHV0--

--------------0QfhGAUMn9buG0qd3EPR0072--

--------------r9VJ2ukTbZzGmipn0u4tVDuI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIrBX8FAwAAAAAACgkQsN6d1ii/Ey+6
dQf/UPXlk4bf9OC4GD+rV1vNQROmDbOhpIFsLBx3Dvs7LJ0WlYUQcfCVRPkBmYEx0i+8jEPzNUFY
l9OAyVbv5n8rMFeTU3GVGhxntUXlrZDxj1+QuQW2qw8cj71Wy1j6rxtbxPDpCGmsofyts/uUIaPm
8WeeyfPa3JbBR2K9DvlEMOh26ExP4j5KenxIfJ/5h1+TN3fZG9J8iMoZ7B/Lldx8JybtOuE5/oyu
MNsvUKt1pG1lFtYRKs9la3yL2xznZ8u32ZYrVdCGkLgXp4kr2H8NdLIjGK9xqwxLRO4YfMuw5NR+
xDXws3gM+qpZHgW7IzJYA34oJ8r4tZiN2vAdaABfcQ==
=PuEC
-----END PGP SIGNATURE-----

--------------r9VJ2ukTbZzGmipn0u4tVDuI--

