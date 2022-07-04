Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4B4564FD4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 10:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359950.589246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HaB-0005bh-DC; Mon, 04 Jul 2022 08:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359950.589246; Mon, 04 Jul 2022 08:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HaB-0005Yw-A2; Mon, 04 Jul 2022 08:37:27 +0000
Received: by outflank-mailman (input) for mailman id 359950;
 Mon, 04 Jul 2022 08:37:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o8Ha9-0005Wx-Jt
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 08:37:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8489e7d9-fb74-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 10:37:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 591AB22C84;
 Mon,  4 Jul 2022 08:37:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 284AA1342C;
 Mon,  4 Jul 2022 08:37:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KjpBCMKmwmLtRAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 04 Jul 2022 08:37:22 +0000
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
X-Inumbo-ID: 8489e7d9-fb74-11ec-a8e4-439420d8e422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656923842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rZAzMpqQkhA3cqGdeTJ3GZ9UFeSdXq4Iv6GcisL74gc=;
	b=UGgI+n7dFUSmU02N7DjTaF0Ks/cB6kH0h74VLLsepLb5O2PRWImAOZgFs7rvzsh+9TQBLL
	5FqDAIyrD2CzMjzIyLn2lDrR5Uo4mXbD8Db/sAIwzyUSNx5J1i7ORWypc24p0Uk33vLXdK
	jSc/Sf1Gp/physg8GR4QiaPEq/S7lMM=
Message-ID: <10e6cfe8-2aaf-2340-a52e-bce0c3373706@suse.com>
Date: Mon, 4 Jul 2022 10:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/8] mini-os: some cleanup patches
Content-Language: en-US
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220620073820.9336-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220620073820.9336-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WM0Gqs1fKkUqTFm9W6Z1R5jA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WM0Gqs1fKkUqTFm9W6Z1R5jA
Content-Type: multipart/mixed; boundary="------------PePEE1Mhmp0wzxca8CDA7lbO";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <10e6cfe8-2aaf-2340-a52e-bce0c3373706@suse.com>
Subject: Re: [PATCH 0/8] mini-os: some cleanup patches
References: <20220620073820.9336-1-jgross@suse.com>
In-Reply-To: <20220620073820.9336-1-jgross@suse.com>

--------------PePEE1Mhmp0wzxca8CDA7lbO
Content-Type: multipart/mixed; boundary="------------786vqAUT4rEB3IipjWt0idez"

--------------786vqAUT4rEB3IipjWt0idez
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDYuMjIgMDk6MzgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IERvIHNvbWUgY2xl
YW51cHMuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZCwgYXBhcnQgZnJv
bSB3aGl0ZXNwYWNlIGNoYW5nZXMgb25seQ0KPiBtaW5vciBtb2RpZmljYXRpb25zIG1ha2lu
ZyBjb2RlIGVhc2llciB0byByZWFkLg0KPiANCj4gSnVlcmdlbiBHcm9zcyAoOCk6DQo+ICAg
IG1pbmktb3M6IGRyb3AgeGVuYnVzIGRpcmVjdG9yeQ0KPiAgICBtaW5pLW9zOiBhcHBseSBj
b2Rpbmcgc3R5bGUgdG8geGVuYnVzLmMNCj4gICAgbWluaS1vczogZWxpbWluYXRlIGNvbnNv
bGUvY29uc29sZS5oDQo+ICAgIG1pbmktb3M6IHJlbmFtZSBjb25zb2xlL3hlbmJ1cy5jIHRv
IGNvbnNmcm9udC5jDQo+ICAgIG1pbmktb3M6IGFwcGx5IGNvZGluZyBzdHlsZSB0byBjb25z
ZnJvbnQuYw0KPiAgICBtaW5pLW9zOiBlbGltaW5hdGUgY29uc29sZSBkaXJlY3RvcnkNCj4g
ICAgbWluaS1vczogYXBwbHkgY29kaW5nIHN0eWxlIHRvIGNvbnNvbGUuYw0KPiAgICBtaW5p
LW9zOiBhZGQgbWluaS1vcy1kZWJ1Z1suZ3pdIHRvIC5naXRpZ25vcmUNCj4gDQo+ICAgLmdp
dGlnbm9yZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArDQo+ICAgTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgOSArLQ0KPiAgIGNvbnNvbGUveGVuYnVzLmMgPT4g
Y29uc2Zyb250LmMgfCAgOTkgKysrKy0tLQ0KPiAgIGNvbnNvbGUuYyAgICAgICAgICAgICAg
ICAgICAgICAgfCA0MTUgKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBjb25zb2xl
L2NvbnNvbGUuYyAgICAgICAgICAgICAgIHwgMTc3IC0tLS0tLS0tLS0tDQo+ICAgY29uc29s
ZS9jb25zb2xlLmggICAgICAgICAgICAgICB8ICAgMiAtDQo+ICAgY29uc29sZS94ZW5jb25z
X3JpbmcuYyAgICAgICAgICB8IDIzOCAtLS0tLS0tLS0tLS0tLS0NCj4gICBpbmNsdWRlL2Nv
bnNvbGUuaCAgICAgICAgICAgICAgIHwgICAxICsNCj4gICB4ZW5idXMveGVuYnVzLmMgPT4g
eGVuYnVzLmMgICAgIHwgNTEwICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+
ICAgOSBmaWxlcyBjaGFuZ2VkLCA3NzggaW5zZXJ0aW9ucygrKSwgNjc1IGRlbGV0aW9ucygt
KQ0KPiAgIHJlbmFtZSBjb25zb2xlL3hlbmJ1cy5jID0+IGNvbnNmcm9udC5jICg3OCUpDQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbnNvbGUuYw0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0
NCBjb25zb2xlL2NvbnNvbGUuYw0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBjb25zb2xlL2Nv
bnNvbGUuaA0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBjb25zb2xlL3hlbmNvbnNfcmluZy5j
DQo+ICAgcmVuYW1lIHhlbmJ1cy94ZW5idXMuYyA9PiB4ZW5idXMuYyAoNzElKQ0KPiANCg0K
Q291bGQgc29tZW9uZSBwbGVhc2UgY29tbWl0IHRoaXMgc2VyaWVzPyBTYW11ZWwgZ2F2ZSBo
aXMgUi1iIG5lYXJseSAyIHdlZWtzDQphZ28uDQoNCg0KSnVlcmdlbg0K
--------------786vqAUT4rEB3IipjWt0idez
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------786vqAUT4rEB3IipjWt0idez--

--------------PePEE1Mhmp0wzxca8CDA7lbO--

--------------WM0Gqs1fKkUqTFm9W6Z1R5jA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLCpsEFAwAAAAAACgkQsN6d1ii/Ey8s
PQgAjUcrtcsGOPCBwb7gXLyaSUATq9pkDsVdRHO/UfFP+18fAepXFXsYoYBBN1LGOXirhidcinrn
aO4+uH6T4XcpOIuToqkn81+WPfPKol8xwpDmRshJiYArDN3yN0mdQHgaGNGWIGamYlPtEQq/d4vz
pKaPer01Uo33Xg5GoE39VgYDoxkit9RSQiAaVllnZp9neOS+yrWOvwHiVh33xtYoc8xFHxz1fetX
0twUMJrdiujGbEJTVJ8zoGUX4FICZ1m+FU8FIEz7yiENvXl9fQu2bTKldL+PvwCBuJJOd3xY4xDL
oQMvALTPA2i7nPTu9Fsj30R+ZzpsvTaxv3bdnG99FQ==
=mu2C
-----END PGP SIGNATURE-----

--------------WM0Gqs1fKkUqTFm9W6Z1R5jA--

