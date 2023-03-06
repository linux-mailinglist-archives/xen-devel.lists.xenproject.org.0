Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44466AB7F8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 09:09:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506749.779888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5ub-000259-KN; Mon, 06 Mar 2023 08:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506749.779888; Mon, 06 Mar 2023 08:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5ub-00021q-HO; Mon, 06 Mar 2023 08:09:37 +0000
Received: by outflank-mailman (input) for mailman id 506749;
 Mon, 06 Mar 2023 08:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kIMi=66=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZ5uZ-00021j-Ee
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 08:09:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aeecf67-bbf6-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 09:09:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3AFA21DDA;
 Mon,  6 Mar 2023 08:09:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1F4E13A66;
 Mon,  6 Mar 2023 08:09:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eoqqKb2fBWQwPAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Mar 2023 08:09:33 +0000
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
X-Inumbo-ID: 3aeecf67-bbf6-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678090173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eUoxEhZbENV190/jBgWCUAgKgJwm5Im6+MeY0aWZKM4=;
	b=o+5ReatLyuU09FJUJp7JnjaVuP6zagF5JkW/JXkniPNnQyXpDRDLX7Fgg9Te/urt7eJnbO
	QHBVAcmQ2KJ1sDdSOZ/AQVd4qdujal39HemBqPiQGRJotmhuHKnpsTIC2mJhwTnvnRdW40
	hnYFAyy/na1zwcuSwNTuUuEd3dM1h0o=
Message-ID: <1d4cd0ea-11fa-757f-edc7-526ef36f305e@suse.com>
Date: Mon, 6 Mar 2023 09:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/4] tools: add offsetof() to xen-tools/common-macros.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230306072140.28402-1-jgross@suse.com>
 <20230306072140.28402-5-jgross@suse.com>
 <a38060b7-c4ff-51d2-e596-8bacbd253912@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a38060b7-c4ff-51d2-e596-8bacbd253912@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cxuQ4sZnoZyhCc5fIhJKKiqk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cxuQ4sZnoZyhCc5fIhJKKiqk
Content-Type: multipart/mixed; boundary="------------hHgMbiDE24dkLGQpjsO03Bs6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <1d4cd0ea-11fa-757f-edc7-526ef36f305e@suse.com>
Subject: Re: [PATCH v3 4/4] tools: add offsetof() to xen-tools/common-macros.h
References: <20230306072140.28402-1-jgross@suse.com>
 <20230306072140.28402-5-jgross@suse.com>
 <a38060b7-c4ff-51d2-e596-8bacbd253912@suse.com>
In-Reply-To: <a38060b7-c4ff-51d2-e596-8bacbd253912@suse.com>

--------------hHgMbiDE24dkLGQpjsO03Bs6
Content-Type: multipart/mixed; boundary="------------oE07EcXepkTL8QgYp8Y0yfn8"

--------------oE07EcXepkTL8QgYp8Y0yfn8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDMuMjMgMDk6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wMy4yMDIz
IDA4OjIxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvdG9vbHMvaW5jbHVkZS94
ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oDQo+PiArKysgYi90b29scy9pbmNsdWRlL3hlbi10
b29scy9jb21tb24tbWFjcm9zLmgNCj4+IEBAIC04MCw0ICs4MCw4IEBADQo+PiAgICAgICB0
eXBlb2YoICgodHlwZSAqKTApLT5tZW1iZXIgKSAqX19tcHRyID0gKHB0cik7ICAgICAgICBc
DQo+PiAgICAgICAodHlwZSAqKSggKGNoYXIgKilfX21wdHIgLSBvZmZzZXRvZih0eXBlLG1l
bWJlcikgKTt9KQ0KPj4gICANCj4+ICsjaWZuZGVmIG9mZnNldG9mDQo+PiArI2RlZmluZSBv
ZmZzZXRvZihhLCBiKSBfX2J1aWx0aW5fb2Zmc2V0b2YoYSwgYikNCj4+ICsjZW5kaWYNCj4g
DQo+IEhvdydzIHRoaXMgZ29pbmcgdG8gd29yayByZWxpYWJseSB3aXRoIHBhcnRpZXMgcGVy
aGFwcyBhbHNvIGluY2x1ZGluZw0KPiBzdGRkZWYuaCwgd2hpY2ggYWxzbyBpcyBleHBlY3Rl
ZCB0byBkZWZpbmUgdGhpcyBtYWNybywgYW5kIHdoaWNoIG1heQ0KPiBkbyBzbyB3aXRoIGEg
ZGlmZmVyZW50IHNlcXVlbmNlIG9mIHRva2VucyAoZXZlbiBpZiB0aGF0IGVuZHMgdXANCj4g
aGF2aW5nIHRoZSBzYW1lIGVmZmVjdCk/IFRoZXJlIHNob3VsZG4ndCBiZSBhIG5lZWQgdG8g
ZGVmaW5lIHRoaXMNCj4gbWFjcm8gZm9yIGFueSAibm9ybWFsIiBlbnZpcm9ubWVudHMsIGUu
Zy4gLi4uDQo+IA0KPj4gLS0tIGEvdG9vbHMvbGliZnNpbWFnZS94ZnMvZnN5c194ZnMuYw0K
Pj4gKysrIGIvdG9vbHMvbGliZnNpbWFnZS94ZnMvZnN5c194ZnMuYw0KPj4gQEAgLTE5LDYg
KzE5LDcgQEANCj4+ICAgDQo+PiAgICNpbmNsdWRlIDx4ZW5mc2ltYWdlX2dydWIuaD4NCj4+
ICAgI2luY2x1ZGUgInhmcy5oIg0KPj4gKyNpbmNsdWRlIDx4ZW4tdG9vbHMvY29tbW9uLW1h
Y3Jvcy5oPg0KPj4gICANCj4+ICAgI2RlZmluZSBNQVhfTElOS19DT1VOVAk4DQo+PiAgIA0K
Pj4gQEAgLTE4Miw5ICsxODMsNiBAQCBmc2IyZGFkZHIgKHhmc19mc2Jsb2NrX3QgZnNibm8p
DQo+PiAgIAkJCSAoeGZzX2FnYmxvY2tfdCkoZnNibm8gJiBtYXNrMzJsbyh4ZnMuYWdibGts
b2cpKSk7DQo+PiAgIH0NCj4+ICAgDQo+PiAtI3VuZGVmIG9mZnNldG9mDQo+PiAtI2RlZmlu
ZSBvZmZzZXRvZih0LG0pCSgoc2l6ZV90KSYoKCh0ICopMCktPm0pKQ0KPj4gLQ0KPj4gICBz
dGF0aWMgaW5saW5lIGludA0KPj4gICBidHJvb3RfbWF4cmVjcyAoZnNpX2ZpbGVfdCAqZmZp
KQ0KPj4gICB7DQo+IA0KPiAuLi4gdGhpcyBsaWJyYXJ5IG9yIC4uLg0KPiANCj4+IC0tLSBh
L3Rvb2xzL2xpYnMvdmNoYW4vaW5pdC5jDQo+PiArKysgYi90b29scy9saWJzL3ZjaGFuL2lu
aXQuYw0KPj4gQEAgLTY5LDEwICs2OSw2IEBADQo+PiAgICNkZWZpbmUgTUFYX1JJTkdfU0hJ
RlQgMjANCj4+ICAgI2RlZmluZSBNQVhfUklOR19TSVpFICgxIDw8IE1BWF9SSU5HX1NISUZU
KQ0KPj4gICANCj4+IC0jaWZuZGVmIG9mZnNldG9mDQo+PiAtI2RlZmluZSBvZmZzZXRvZihU
WVBFLCBNRU1CRVIpICgoc2l6ZV90KSAmKChUWVBFICopMCktPk1FTUJFUikNCj4+IC0jZW5k
aWYNCj4+IC0NCj4+ICAgc3RhdGljIGludCBpbml0X2dudF9zcnYoc3RydWN0IGxpYnhlbnZj
aGFuICpjdHJsLCBpbnQgZG9tYWluKQ0KPj4gICB7DQo+PiAgIAlpbnQgcGFnZXNfbGVmdCA9
IGN0cmwtPnJlYWQub3JkZXIgPj0gUEFHRV9TSElGVCA/IDEgPDwgKGN0cmwtPnJlYWQub3Jk
ZXIgLSBQQUdFX1NISUZUKSA6IDA7DQo+IA0KPiAuLi4gdGhpcyB0b29sIG9yIC4uLg0KPiAN
Cj4+IC0tLSBhL3Rvb2xzL3Rlc3RzL3ZocGV0L2VtdWwuaA0KPj4gKysrIGIvdG9vbHMvdGVz
dHMvdmhwZXQvZW11bC5oDQo+PiBAQCAtMTE1LDggKzExNSw2IEBAIGVudW0NCj4+ICAgICAg
IE5SX0NPTU1PTl9TT0ZUSVJRUw0KPj4gICB9Ow0KPj4gICANCj4+IC0jZGVmaW5lIG9mZnNl
dG9mKHQsIG0pICgodW5zaWduZWQgbG9uZyApJigodCAqKTApLT5tKQ0KPj4gLQ0KPj4gICBz
dHJ1Y3QgZG9tYWluOw0KPj4gICANCj4+ICAgc3RydWN0IHZjcHUNCj4gDQo+IC4uLiB0aGlz
IHRlc3QgYmluYXJ5ICh3aGljaCBpcyBhbiBvcmRpbmFyeSBob3N0IG9uZSBhcyB3ZWxsKS4g
VGhleSBhbGwNCj4gc2hvdWxkIGluY2x1ZGUgc3RkZGVmLmggYW5kIGJlIGRvbmUuDQoNClll
cywgdGhpcyBpcyBwcm9iYWJseSBhIGJldHRlciB3YXkgdG8gaGFuZGxlIHRoaXMuDQoNClNv
IEkgdGhpbmsgdGhpcyBwYXRjaCBzaG91bGQgYmUgZHJvcHBlZC4NCg0KSSdsbCBzZW5kIG91
dCBhbm90aGVyIHNtYWxsIHNlcmllcyByZW1vdmluZyB0aGUgcHJpdmF0ZSBvZmZzZXRvZigp
DQpkZWZpbml0aW9ucyBhbmQgdXNpbmcgc3RkZGVmLmggaW5zdGVhZC4gVGhpcyBzaG91bGQg
aW5jbHVkZSBodm1sb2FkZXIsDQp3aGljaCBjYW4gdXNlIHRoZSB0b29scy9maXJtd2FyZS9p
bmNsdWRlL3N0ZGRlZi5oIHZhcmlhbnQuDQoNCg0KSnVlcmdlbg0K
--------------oE07EcXepkTL8QgYp8Y0yfn8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------oE07EcXepkTL8QgYp8Y0yfn8--

--------------hHgMbiDE24dkLGQpjsO03Bs6--

--------------cxuQ4sZnoZyhCc5fIhJKKiqk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQFn70FAwAAAAAACgkQsN6d1ii/Ey9R
kAf/UYEvKkS9erxssrJa16/PMMtEuj7WKvPL9UGZVzgBuMajhHPT+dx/rQkQWC5VjH55wU6O8FSB
ytcaG2q0ceDSYfOuR+9Pz68hVA85ig4gdWBblTWTXpojJarSf1mYEPqKB4+Ucja5tc4/VHtVIeGP
d7voSbIpZ9Q21IvuyhO4FyVABO9lCGm7tSYoJkhJ3D1Zm1uh8JL5RK5b7x3/w69Wy0JwwTiS35Sb
koA34bm6K6JfCJk+CfhduSto41e8b7et4baOyCz5g45f2trtYMQ4svs81fjRLscHBAlvCMJiIPKa
MUDwDLzGf5oKjNI9iC9lgKhBChyWFNEJvQRvefTmtQ==
=VWz/
-----END PGP SIGNATURE-----

--------------cxuQ4sZnoZyhCc5fIhJKKiqk--

