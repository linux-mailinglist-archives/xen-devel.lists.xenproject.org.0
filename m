Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D4852BD8C
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 16:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332244.555903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKea-0000X5-Of; Wed, 18 May 2022 14:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332244.555903; Wed, 18 May 2022 14:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKea-0000Tr-LC; Wed, 18 May 2022 14:27:56 +0000
Received: by outflank-mailman (input) for mailman id 332244;
 Wed, 18 May 2022 14:27:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQHP=V2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nrKeZ-0000Ti-DW
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 14:27:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b421acbc-d6b6-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 16:27:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3769321B83;
 Wed, 18 May 2022 14:27:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 15BC5133F5;
 Wed, 18 May 2022 14:27:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vxMxA2kChWJmLgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 May 2022 14:27:53 +0000
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
X-Inumbo-ID: b421acbc-d6b6-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652884073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1+LpNjiIrXuvwJPjUcayiJhAb12XiRbtZWzMe2TKNWA=;
	b=I7on6FGcZfmklbVEUrAMrye7as4QNCXeDwX5s9CH6ImzrlETNzLV6hlOOeQXQBNB4UvKry
	a8CZZDU2YQob80wl1N1n3XW7rHpqIRIvAs+eVV1bY/seMOcUJ0Gu5qv8IMlDAO7nw9wqrz
	UwOo/NHk1J6qDNFz+oFdQPc6rvK7caw=
Message-ID: <6e5bb72f-6387-44ce-b7cc-de00c6a5acd3@suse.com>
Date: Wed, 18 May 2022 16:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] tools/libs/light: update xenstore entry when setting
 max domain memory
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220502084729.13044-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220502084729.13044-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WTOV6WYDBaysB1n2XKvBUQ0Z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WTOV6WYDBaysB1n2XKvBUQ0Z
Content-Type: multipart/mixed; boundary="------------zFYuwJb08Hv2UydumHymna0U";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <6e5bb72f-6387-44ce-b7cc-de00c6a5acd3@suse.com>
Subject: Re: [PATCH v3] tools/libs/light: update xenstore entry when setting
 max domain memory
References: <20220502084729.13044-1-jgross@suse.com>
In-Reply-To: <20220502084729.13044-1-jgross@suse.com>

--------------zFYuwJb08Hv2UydumHymna0U
Content-Type: multipart/mixed; boundary="------------NC0dd10ljWM0NpliYitORjVH"

--------------NC0dd10ljWM0NpliYitORjVH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZz8NCg0KT24gMDIuMDUuMjIgMTA6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IGxp
YnhsX2RvbWFpbl9zZXRtYXhtZW0oKSBjYWxsZWQgZHVyaW5nICJ4bCBtZW0tbWF4IiBzaG91
bGQgdXBkYXRlIHRoZQ0KPiBkb21haW4ncyBtZW1vcnkvc3RhdGljLW1heCBYZW5zdG9yZSBu
b2RlLCBhcyBvdGhlcndpc2UgInhsIG1lbS1zZXQiDQo+IHdvbid0IGJlIGFibGUgdG8gc2V0
IHRoZSBtZW1vcnkgc2l6ZSB0byB0aGUgbmV3IG1heGltdW0uDQo+IA0KPiBBZGp1c3QgdGhl
IHJlbGF0ZWQgY29tbWVudHMgYW5kIGRvY3VtZW50YXRpb24gYWNjb3JkaW5nbHkuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IC0t
LQ0KPiBWMjoNCj4gLSBhZGp1c3QgY29tbWVudHMgYW5kIGRvY3MgKEFudGhvbnkgUGVyYXJk
KQ0KPiBWMzoNCj4gLSByZWFsbHkgYWRqdXN0IHRoZSBkb2NzIChBbnRob255IFBlcmFyZCkN
Cj4gLS0tDQo+ICAgZG9jcy9tYW4veGwuMS5wb2QuaW4gICAgICAgICB8IDExICsrKysrLS0t
LS0tDQo+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9tZW0uYyB8IDEyICsrKysrKysrKyst
LQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kb2NzL21hbi94bC4xLnBvZC5pbiBiL2RvY3MvbWFu
L3hsLjEucG9kLmluDQo+IGluZGV4IGUyMTc2YmQ2OTYuLjEwMWUxNDI0MWQgMTAwNjQ0DQo+
IC0tLSBhL2RvY3MvbWFuL3hsLjEucG9kLmluDQo+ICsrKyBiL2RvY3MvbWFuL3hsLjEucG9k
LmluDQo+IEBAIC00NDIsMTUgKzQ0MiwxNCBAQCBhbGxvY2F0ZS4NCj4gICBUaGUgZGVmYXVs
dCB1bml0IGlzIGtpQi4gIEFkZCAndCcgZm9yIFRpQiwgJ2cnIGZvciBHaUIsICdtJyBmb3IN
Cj4gICBNaUIsICdrJyBmb3Iga2lCLCBhbmQgJ2InIGZvciBieXRlcyAoZS5nLiwgYDIwNDht
YCBmb3IgMjA0OCBNaUIpLg0KPiAgIA0KPiAtTkIgdGhhdCB1c2VycyBub3JtYWxseSBzaG91
bGRuJ3QgbmVlZCB0aGlzIGNvbW1hbmQ7IEI8eGwgbWVtLXNldD4gd2lsbA0KPiAtc2V0IHRo
aXMgYXMgYXBwcm9wcmlhdGUgYXV0b21hdGljYWxseS4NCj4gLQ0KPiAgIEk8bWVtPiBjYW4n
dCBiZSBzZXQgbG93ZXIgdGhhbiB0aGUgY3VycmVudCBtZW1vcnkgdGFyZ2V0IGZvcg0KPiAg
IEk8ZG9tYWluLWlkPi4gIEl0IGlzIGFsbG93ZWQgdG8gYmUgaGlnaGVyIHRoYW4gdGhlIGNv
bmZpZ3VyZWQgbWF4aW11bQ0KPiAgIG1lbW9yeSBzaXplIG9mIHRoZSBkb21haW4gKEI8bWF4
bWVtPiBwYXJhbWV0ZXIgaW4gdGhlIGRvbWFpbidzDQo+IC1jb25maWd1cmF0aW9uKS4gTm90
ZSBob3dldmVyIHRoYXQgdGhlIGluaXRpYWwgQjxtYXhtZW0+IHZhbHVlIGlzIHN0aWxsDQo+
IC11c2VkIGFzIGFuIHVwcGVyIGxpbWl0IGZvciBCPHhsIG1lbS1zZXQ+LiAgQWxzbyBub3Rl
IHRoYXQgY2FsbGluZyBCPHhsDQo+IC1tZW0tc2V0PiB3aWxsIHJlc2V0IHRoaXMgdmFsdWUu
DQo+ICtjb25maWd1cmF0aW9uKS4NCj4gKw0KPiArU2V0dGluZyB0aGUgbWF4aW11bSBtZW1v
cnkgc2l6ZSBhYm92ZSB0aGUgY29uZmlndXJlZCBtYXhpbXVtIG1lbW9yeSBzaXplDQo+ICt3
aWxsIHJlcXVpcmUgc3BlY2lhbCBndWVzdCBzdXBwb3J0IChtZW1vcnkgaG90cGx1ZykgaW4g
b3JkZXIgdG8gYmUgdXNhYmxlDQo+ICtieSB0aGUgZ3Vlc3QuDQo+ICAgDQo+ICAgVGhlIGRv
bWFpbiB3aWxsIG5vdCByZWNlaXZlIGFueSBzaWduYWwgcmVnYXJkaW5nIHRoZSBjaGFuZ2Vk
IG1lbW9yeQ0KPiAgIGxpbWl0Lg0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdodC9s
aWJ4bF9tZW0uYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfbWVtLmMNCj4gaW5kZXggYzcz
OWQwMGYzOS4uOTJlYzA5ZjRjZiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9s
aWJ4bF9tZW0uYw0KPiArKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX21lbS5jDQo+IEBA
IC0yMCw4ICsyMCw3IEBADQo+ICAgLyoNCj4gICAgKiBTZXQgdGhlIG1heGltdW0gbWVtb3J5
IHNpemUgb2YgdGhlIGRvbWFpbiBpbiB0aGUgaHlwZXJ2aXNvci4gVGhlcmUgaXMgbm8NCj4g
ICAgKiBjaGFuZ2Ugb2YgdGhlIGN1cnJlbnQgbWVtb3J5IHNpemUgaW52b2x2ZWQuIFRoZSBz
cGVjaWZpZWQgbWVtb3J5IHNpemUgY2FuDQo+IC0gKiBldmVuIGJlIGFib3ZlIHRoZSBjb25m
aWd1cmVkIG1heG1lbSBzaXplIG9mIHRoZSBkb21haW4sIGJ1dCB0aGUgcmVsYXRlZA0KPiAt
ICogWGVuc3RvcmUgZW50cnkgbWVtb3J5L3N0YXRpYy1tYXggaXNuJ3QgbW9kaWZpZWQhDQo+
ICsgKiBldmVuIGJlIGFib3ZlIHRoZSBjb25maWd1cmVkIG1heG1lbSBzaXplIG9mIHRoZSBk
b21haW4uDQo+ICAgICovDQo+ICAgaW50IGxpYnhsX2RvbWFpbl9zZXRtYXhtZW0obGlieGxf
Y3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLCB1aW50NjRfdCBtYXhfbWVta2IpDQo+ICAgew0K
PiBAQCAtODIsNiArODEsMTUgQEAgaW50IGxpYnhsX2RvbWFpbl9zZXRtYXhtZW0obGlieGxf
Y3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLCB1aW50NjRfdCBtYXhfbWVta2IpDQo+ICAgICAg
ICAgICBnb3RvIG91dDsNCj4gICAgICAgfQ0KPiAgIA0KPiArICAgIHJjID0gbGlieGxfX3hz
X3ByaW50ZihnYywgWEJUX05VTEwsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIEdD
U1BSSU5URigiJXMvbWVtb3J5L3N0YXRpYy1tYXgiLCBkb21wYXRoKSwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIiUiUFJJdTY0LCBtYXhfbWVta2IpOw0KPiArICAgIGlmIChy
YyAhPSAwKSB7DQo+ICsgICAgICAgIExPR0VEKEVSUk9SLCBkb21pZCwgIkNvdWxkbid0IHNl
dCAlcy9tZW1vcnkvc3RhdGljLW1heCwgcmM9JWRcbiIsDQo+ICsgICAgICAgICAgICAgIGRv
bXBhdGgsIHJjKTsNCj4gKyAgICAgICAgZ290byBvdXQ7DQo+ICsgICAgfQ0KPiArDQo+ICAg
ICAgIHJjID0gMDsNCj4gICBvdXQ6DQo+ICAgICAgIGxpYnhsX2RvbWFpbl9jb25maWdfZGlz
cG9zZSgmZF9jb25maWcpOw0KDQo=
--------------NC0dd10ljWM0NpliYitORjVH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------NC0dd10ljWM0NpliYitORjVH--

--------------zFYuwJb08Hv2UydumHymna0U--

--------------WTOV6WYDBaysB1n2XKvBUQ0Z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKFAmgFAwAAAAAACgkQsN6d1ii/Ey/1
jQf/QjkQV3alsj9fl1fYx6wL6qd5Ql0Uj5s6GxcPyXJe4ESN5/pMKJJrjO1Srz4ZNsAkGqv16vXG
HEaR0ElSXqfKKQwOc+u1HQdoy3cUZ30gXDSUlrd1R87lzLq6stPEr2V7kRsapaoaoaot/CJSHJh+
gbx/YwSkfdVJ99WLI3T0/ngj15zxdgtvAKJLHHsMSYCBBTJvpPs7bAJER/o+H/XStG3t3RqBOn3U
Xqz4fum4PWa84Kxz1Pjp7czGe4MRiGit/TArhsHY+4q55h5uhm/uzZFbQ8LTsjFqKWXzOyzUJQ8f
a09L5xxhvKZmWQFi91Wzo/LIXBWnTF8c2F3lrP8SDg==
=Rpcy
-----END PGP SIGNATURE-----

--------------WTOV6WYDBaysB1n2XKvBUQ0Z--

