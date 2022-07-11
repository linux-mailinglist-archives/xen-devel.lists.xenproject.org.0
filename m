Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF056D6C0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 09:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364898.594869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAnmt-0000jf-Gu; Mon, 11 Jul 2022 07:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364898.594869; Mon, 11 Jul 2022 07:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAnmt-0000hK-Dv; Mon, 11 Jul 2022 07:24:59 +0000
Received: by outflank-mailman (input) for mailman id 364898;
 Mon, 11 Jul 2022 07:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=twA/=XQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oAnmr-0000hE-L7
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 07:24:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f9cd65c-00ea-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 09:24:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A39A5226A1;
 Mon, 11 Jul 2022 07:24:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7648C13524;
 Mon, 11 Jul 2022 07:24:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id O4xnG0bQy2J1CAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 11 Jul 2022 07:24:54 +0000
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
X-Inumbo-ID: 8f9cd65c-00ea-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657524294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UdHkqfH82oc9inS5aKFs8Nq9TUm3h4V1F4l9lAKv12A=;
	b=Lk4G0FeOCTSwEt8nMM8pRGAM1DMbTZogiuDstUkFuvqvJyXN49oDzUvRgWzSPe5Ad9Gi5N
	0Up28OebQHIqXN7SpiyVHSIE8yl80Plap8shay/lNiK6fwAGgQXOQ7WOAawCKFDFAy6XBs
	Gsddu3VJazdkh3+goinSvJqP19bnvI0=
Message-ID: <7e32d853-a1e4-f828-7c27-dbd2e3595d5f@suse.com>
Date: Mon, 11 Jul 2022 09:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
 <20220709101035.2989428-2-dmitry.semenets@gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/4] tools: allow vchan XenStore paths more then 64 bytes
 long
In-Reply-To: <20220709101035.2989428-2-dmitry.semenets@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3ERNcltNu0zbZAg8NwiGKGeR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3ERNcltNu0zbZAg8NwiGKGeR
Content-Type: multipart/mixed; boundary="------------HLhae3TVHdPqWjEN1NsDMezD";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <7e32d853-a1e4-f828-7c27-dbd2e3595d5f@suse.com>
Subject: Re: [PATCH 2/4] tools: allow vchan XenStore paths more then 64 bytes
 long
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
 <20220709101035.2989428-2-dmitry.semenets@gmail.com>
In-Reply-To: <20220709101035.2989428-2-dmitry.semenets@gmail.com>

--------------HLhae3TVHdPqWjEN1NsDMezD
Content-Type: multipart/mixed; boundary="------------EKNnpEc95D8GqeEqMIGH0G06"

--------------EKNnpEc95D8GqeEqMIGH0G06
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDcuMjIgMTI6MTAsIGRtaXRyeS5zZW1lbmV0c0BnbWFpbC5jb20gd3JvdGU6DQo+
IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5r
b0BlcGFtLmNvbT4NCj4gDQo+IEN1cnJlbnQgdmNoYW4gaW1wbGVtZW50YXRpb24sIHdoaWxl
IGRlYWxpbmcgd2l0aCBYZW5TdG9yZSBwYXRocywNCj4gYWxsb2NhdGVzIDY0IGJ5dGVzIGJ1
ZmZlciBvbiB0aGUgc3RhY2sgd2hpY2ggbWF5IG5vdCBiZSBlbm91Z2ggZm9yDQo+IHNvbWUg
dXNlLWNhc2VzLiBNYWtlIHRoZSBidWZmZXIgbG9uZ2VyIHRvIHJlc3BlY3QgbWF4aW11bSBh
bGxvd2VkDQo+IFhlblN0b3JlIHBhdGggb2YgWEVOU1RPUkVfQUJTX1BBVEhfTUFYLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9h
bmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPiAtLS0NCj4gICB0b29scy9saWJzL3ZjaGFuL2lu
aXQuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS90b29scy9saWJzL3ZjaGFuL2luaXQuYyBiL3Rvb2xzL2xpYnMvdmNoYW4vaW5pdC5j
DQo+IGluZGV4IGM2Yjg2NzRlZjUuLjE3OTQ1YzI0YTEgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L2xpYnMvdmNoYW4vaW5pdC5jDQo+ICsrKyBiL3Rvb2xzL2xpYnMvdmNoYW4vaW5pdC5jDQo+
IEBAIC0yNDksNyArMjQ5LDcgQEAgc3RhdGljIGludCBpbml0X3hzX3NydihzdHJ1Y3QgbGli
eGVudmNoYW4gKmN0cmwsIGludCBkb21haW4sIGNvbnN0IGNoYXIqIHhzX2Jhc2UNCj4gICAJ
aW50IHJldCA9IC0xOw0KPiAgIAlzdHJ1Y3QgeHNfaGFuZGxlICp4czsNCj4gICAJc3RydWN0
IHhzX3Blcm1pc3Npb25zIHBlcm1zWzJdOw0KPiAtCWNoYXIgYnVmWzY0XTsNCj4gKwljaGFy
ICpidWY7DQo+ICAgCWNoYXIgcmVmWzE2XTsNCj4gICAJY2hhciogZG9taWRfc3RyID0gTlVM
TDsNCj4gICAJeHNfdHJhbnNhY3Rpb25fdCB4c190cmFucyA9IFhCVF9OVUxMOw0KPiBAQCAt
MjU3LDYgKzI1NywxMiBAQCBzdGF0aWMgaW50IGluaXRfeHNfc3J2KHN0cnVjdCBsaWJ4ZW52
Y2hhbiAqY3RybCwgaW50IGRvbWFpbiwgY29uc3QgY2hhciogeHNfYmFzZQ0KPiAgIAkvLyBz
dG9yZSB0aGUgYmFzZSBwYXRoIHNvIHdlIGNhbiBjbGVhbiB1cCBvbiBzZXJ2ZXIgY2xvc3Vy
ZQ0KPiAgIAljdHJsLT54c19wYXRoID0gc3RyZHVwKHhzX2Jhc2UpOw0KPiAgIA0KPiArCWJ1
ZiA9IG1hbGxvYyhYRU5TVE9SRV9BQlNfUEFUSF9NQVgpOw0KPiArCWlmICghYnVmKSB7DQo+
ICsJCWZyZWUoY3RybCk7DQo+ICsJCXJldHVybiAwOw0KPiArCX0NCj4gKw0KPiAgIAl4cyA9
IHhzX29wZW4oMCk7DQo+ICAgCWlmICgheHMpDQo+ICAgCQlnb3RvIGZhaWw7DQo+IEBAIC0y
NzgsMTQgKzI4NCwxNCBAQCByZXRyeV90cmFuc2FjdGlvbjoNCj4gICAJCWdvdG8gZmFpbF94
c19vcGVuOw0KPiAgIA0KPiAgIAlzbnByaW50ZihyZWYsIHNpemVvZiByZWYsICIlZCIsIHJp
bmdfcmVmKTsNCj4gLQlzbnByaW50ZihidWYsIHNpemVvZiBidWYsICIlcy9yaW5nLXJlZiIs
IHhzX2Jhc2UpOw0KPiArCXNucHJpbnRmKGJ1ZiwgWEVOU1RPUkVfQUJTX1BBVEhfTUFYLCAi
JXMvcmluZy1yZWYiLCB4c19iYXNlKTsNCj4gICAJaWYgKCF4c193cml0ZSh4cywgeHNfdHJh
bnMsIGJ1ZiwgcmVmLCBzdHJsZW4ocmVmKSkpDQo+ICAgCQlnb3RvIGZhaWxfeHNfb3BlbjsN
Cj4gICAJaWYgKCF4c19zZXRfcGVybWlzc2lvbnMoeHMsIHhzX3RyYW5zLCBidWYsIHBlcm1z
LCAyKSkNCj4gICAJCWdvdG8gZmFpbF94c19vcGVuOw0KPiAgIA0KPiAgIAlzbnByaW50Zihy
ZWYsIHNpemVvZiByZWYsICIlZCIsIGN0cmwtPmV2ZW50X3BvcnQpOw0KPiAtCXNucHJpbnRm
KGJ1Ziwgc2l6ZW9mIGJ1ZiwgIiVzL2V2ZW50LWNoYW5uZWwiLCB4c19iYXNlKTsNCj4gKwlz
bnByaW50ZihidWYsIFhFTlNUT1JFX0FCU19QQVRIX01BWCwgIiVzL2V2ZW50LWNoYW5uZWwi
LCB4c19iYXNlKTsNCj4gICAJaWYgKCF4c193cml0ZSh4cywgeHNfdHJhbnMsIGJ1ZiwgcmVm
LCBzdHJsZW4ocmVmKSkpDQo+ICAgCQlnb3RvIGZhaWxfeHNfb3BlbjsNCj4gICAJaWYgKCF4
c19zZXRfcGVybWlzc2lvbnMoeHMsIHhzX3RyYW5zLCBidWYsIHBlcm1zLCAyKSkNCj4gQEAg
LTMwMSw2ICszMDcsNyBAQCByZXRyeV90cmFuc2FjdGlvbjoNCj4gICAJZnJlZShkb21pZF9z
dHIpOw0KPiAgIAl4c19jbG9zZSh4cyk7DQo+ICAgIGZhaWw6DQo+ICsJZnJlZShidWYpOw0K
PiAgIAlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICANCj4gQEAgLTQxOCwxMyArNDI1LDIwIEBA
IHN0cnVjdCBsaWJ4ZW52Y2hhbiAqbGlieGVudmNoYW5fY2xpZW50X2luaXQoc3RydWN0IHhl
bnRvb2xsb2dfbG9nZ2VyICpsb2dnZXIsDQo+ICAgew0KPiAgIAlzdHJ1Y3QgbGlieGVudmNo
YW4gKmN0cmwgPSBtYWxsb2Moc2l6ZW9mKHN0cnVjdCBsaWJ4ZW52Y2hhbikpOw0KPiAgIAlz
dHJ1Y3QgeHNfaGFuZGxlICp4cyA9IE5VTEw7DQo+IC0JY2hhciBidWZbNjRdOw0KPiArCWNo
YXIgKmJ1ZjsNCj4gICAJY2hhciAqcmVmOw0KPiAgIAlpbnQgcmluZ19yZWY7DQo+ICAgCXVu
c2lnbmVkIGludCBsZW47DQo+ICAgDQo+ICAgCWlmICghY3RybCkNCj4gICAJCXJldHVybiAw
Ow0KPiArDQo+ICsJYnVmID0gbWFsbG9jKFhFTlNUT1JFX0FCU19QQVRIX01BWCk7DQo+ICsJ
aWYgKCFidWYpIHsNCj4gKwkJZnJlZShjdHJsKTsNCj4gKwkJcmV0dXJuIDA7DQo+ICsJfQ0K
PiArDQo+ICAgCWN0cmwtPnJpbmcgPSBOVUxMOw0KPiAgIAljdHJsLT5ldmVudCA9IE5VTEw7
DQo+ICAgCWN0cmwtPmdudHRhYiA9IE5VTEw7DQo+IEBAIC00MzUsOCArNDQ5LDkgQEAgc3Ry
dWN0IGxpYnhlbnZjaGFuICpsaWJ4ZW52Y2hhbl9jbGllbnRfaW5pdChzdHJ1Y3QgeGVudG9v
bGxvZ19sb2dnZXIgKmxvZ2dlciwNCj4gICAJaWYgKCF4cykNCj4gICAJCWdvdG8gZmFpbDsN
Cg0KWW91IGFyZSBsZWFraW5nIGJ1ZiBpbiB0aGlzIGNhc2UuDQoNCj4gICANCj4gKw0KPiAg
IC8vIGZpbmQgeGVuc3RvcmUgZW50cnkNCj4gLQlzbnByaW50ZihidWYsIHNpemVvZiBidWYs
ICIlcy9yaW5nLXJlZiIsIHhzX3BhdGgpOw0KPiArCXNucHJpbnRmKGJ1ZiwgWEVOU1RPUkVf
QUJTX1BBVEhfTUFYLCAiJXMvcmluZy1yZWYiLCB4c19wYXRoKTsNCj4gICAJcmVmID0geHNf
cmVhZCh4cywgMCwgYnVmLCAmbGVuKTsNCj4gICAJaWYgKCFyZWYpDQo+ICAgCQlnb3RvIGZh
aWw7DQo+IEBAIC00NDQsNyArNDU5LDcgQEAgc3RydWN0IGxpYnhlbnZjaGFuICpsaWJ4ZW52
Y2hhbl9jbGllbnRfaW5pdChzdHJ1Y3QgeGVudG9vbGxvZ19sb2dnZXIgKmxvZ2dlciwNCj4g
ICAJZnJlZShyZWYpOw0KPiAgIAlpZiAoIXJpbmdfcmVmKQ0KPiAgIAkJZ290byBmYWlsOw0K
PiAtCXNucHJpbnRmKGJ1Ziwgc2l6ZW9mIGJ1ZiwgIiVzL2V2ZW50LWNoYW5uZWwiLCB4c19w
YXRoKTsNCj4gKwlzbnByaW50ZihidWYsIFhFTlNUT1JFX0FCU19QQVRIX01BWCwgIiVzL2V2
ZW50LWNoYW5uZWwiLCB4c19wYXRoKTsNCj4gICAJcmVmID0geHNfcmVhZCh4cywgMCwgYnVm
LCAmbGVuKTsNCj4gICAJaWYgKCFyZWYpDQo+ICAgCQlnb3RvIGZhaWw7DQo+IEBAIC00NzQs
NiArNDg5LDcgQEAgc3RydWN0IGxpYnhlbnZjaGFuICpsaWJ4ZW52Y2hhbl9jbGllbnRfaW5p
dChzdHJ1Y3QgeGVudG9vbGxvZ19sb2dnZXIgKmxvZ2dlciwNCj4gICAgb3V0Og0KPiAgIAlp
ZiAoeHMpDQo+ICAgCQl4c19jbG9zZSh4cyk7DQo+ICsJZnJlZShidWYpOw0KPiAgIAlyZXR1
cm4gY3RybDsNCj4gICAgZmFpbDoNCj4gICAJbGlieGVudmNoYW5fY2xvc2UoY3RybCk7DQoN
Ckp1ZXJnZW4NCg==
--------------EKNnpEc95D8GqeEqMIGH0G06
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------EKNnpEc95D8GqeEqMIGH0G06--

--------------HLhae3TVHdPqWjEN1NsDMezD--

--------------3ERNcltNu0zbZAg8NwiGKGeR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLL0EYFAwAAAAAACgkQsN6d1ii/Ey8V
+gf/YVgyRUWBUNLLvnU2zcEL1T8V/jfbebCEft9U/tReFZOFbPTlYpNI2HlupcX6bkL2JMJkxKHe
7IrpE+H/OP9kydP/ud3gqyboETabe2n7Uj8FvrUWSh1CnlHUEzC3xw4xqJMQ+DQ/lN/HJmTpykHu
NzORfgObJpdfYbYodQRTdN33u7VMp27k+zQMV9dC7RXdo+ChIf+PdQCsyvh8dWn2VVrz8koEOhYw
VSHXJL2KAENVQtMdc2ymVT1Ltu3R0f9Ta67woSmTfi5yNGuOlFFMkFzfwsTiwCZcUvfm134yeT03
rEMvGsVWKDTnEVaHPWEPzBtxVTlhlplZs6hM3fEZNg==
=6sEl
-----END PGP SIGNATURE-----

--------------3ERNcltNu0zbZAg8NwiGKGeR--

