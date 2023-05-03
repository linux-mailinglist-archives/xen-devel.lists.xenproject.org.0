Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27236F5A58
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 16:45:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529264.823460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDjX-0003XD-48; Wed, 03 May 2023 14:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529264.823460; Wed, 03 May 2023 14:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDjX-0003UP-0h; Wed, 03 May 2023 14:45:31 +0000
Received: by outflank-mailman (input) for mailman id 529264;
 Wed, 03 May 2023 14:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C18W=AY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1puDjV-0003Tz-83
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 14:45:29 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2558c85d-e9c1-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 16:45:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1A5DD20472;
 Wed,  3 May 2023 14:45:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4C601331F;
 Wed,  3 May 2023 14:45:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JLF5NodzUmTzTQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 May 2023 14:45:27 +0000
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
X-Inumbo-ID: 2558c85d-e9c1-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683125128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGQYK42d3jA6rJoAskGLq5Fd4hxMy9lkmej84hXY6bk=;
	b=SMmWC5G6ERV3cjrfWKkUE+RNx7QvqF9tcw+V3WWvmgCteTwolgAlMRIpVMd74me4DIo12f
	H0a3GhMONfseA8yWGZFxXJKu970GLf7My2biGEeFV8IcGE45QcVkD6ZiufOFbWB3lzJCgl
	jHz/724htpgdD2zyZ4Mr2pg8iV1g9QM=
Message-ID: <ffe24c91-2227-8551-ebfb-55e84cf57a55@suse.com>
Date: Wed, 3 May 2023 16:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 03/13] tools/xenstore: modify interface of
 create_hashtable()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-4-jgross@suse.com>
 <1a2a7aed-8947-c5ed-e1ed-8fa80bc75750@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <1a2a7aed-8947-c5ed-e1ed-8fa80bc75750@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9QaKlmPp0zNMNJYTjaYe2SOX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9QaKlmPp0zNMNJYTjaYe2SOX
Content-Type: multipart/mixed; boundary="------------wqR7kyJJtfyTTDjEJUj6v8r0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <ffe24c91-2227-8551-ebfb-55e84cf57a55@suse.com>
Subject: Re: [PATCH v2 03/13] tools/xenstore: modify interface of
 create_hashtable()
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-4-jgross@suse.com>
 <1a2a7aed-8947-c5ed-e1ed-8fa80bc75750@xen.org>
In-Reply-To: <1a2a7aed-8947-c5ed-e1ed-8fa80bc75750@xen.org>

--------------wqR7kyJJtfyTTDjEJUj6v8r0
Content-Type: multipart/mixed; boundary="------------2afD6VB57g35pVY2pMO5GNIx"

--------------2afD6VB57g35pVY2pMO5GNIx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDUuMjMgMTQ6NTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzAzLzIwMjMgMDk6NTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
aGUgbWluc2l6ZSBwYXJhbWV0ZXIgb2YgY3JlYXRlX2hhc2h0YWJsZSgpIGRvZXNuJ3QgaGF2
ZSBhbnkgcmVhbCB1c2UNCj4+IGNhc2UgZm9yIFhlbnN0b3JlLCBzbyBkcm9wIGl0Lg0KPj4N
Cj4+IEZvciBiZXR0ZXIgdGFsbG9jX3JlcG9ydF9mdWxsKCkgZGlhZ25vc3RpYyBvdXRwdXQg
YWRkIGEgbmFtZSBwYXJhbWV0ZXINCj4+IHRvIGNyZWF0ZV9oYXNodGFibGUoKS4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAt
LS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL2hhc2h0YWJsZS5jwqDCoMKgwqDCoMKgwqAgfCAy
MCArKysrKystLS0tLS0tLS0tLS0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUvaGFzaHRhYmxl
LmjCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0tDQo+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5z
dG9yZWRfY29yZS5jwqDCoCB8wqAgMiArLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUveGVuc3Rv
cmVkX2RvbWFpbi5jIHzCoCA0ICsrLS0NCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3hlbnN0b3JlL2hhc2h0YWJsZS5jIGIvdG9vbHMveGVuc3RvcmUvaGFzaHRhYmxlLmMNCj4+
IGluZGV4IGMxYjExNzQzYmIuLmFiMWU2ODdkMGIgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94
ZW5zdG9yZS9oYXNodGFibGUuYw0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmUvaGFzaHRhYmxl
LmMNCj4+IEBAIC01NSwzNiArNTUsMjggQEAgc3RhdGljIHVuc2lnbmVkIGludCBsb2FkbGlt
aXQodW5zaWduZWQgaW50IHBpbmRleCkNCj4+IMKgwqDCoMKgwqAgcmV0dXJuICgodWludDY0
X3QpcHJpbWVzW3BpbmRleF0gKiBNQVhfTE9BRF9QRVJDRU5UKSAvIDEwMDsNCj4+IMKgIH0N
Cj4+IC1zdHJ1Y3QgaGFzaHRhYmxlICpjcmVhdGVfaGFzaHRhYmxlKGNvbnN0IHZvaWQgKmN0
eCwgdW5zaWduZWQgaW50IG1pbnNpemUsDQo+PiArc3RydWN0IGhhc2h0YWJsZSAqY3JlYXRl
X2hhc2h0YWJsZShjb25zdCB2b2lkICpjdHgsIGNvbnN0IGNoYXIgKm5hbWUsDQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50ICgqaGFzaGYpIChjb25zdCB2b2lkICopLA0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCAoKmVxZikgKGNvbnN0IHZvaWQgKiwgY29uc3Qg
dm9pZCAqKSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgZmxhZ3MpDQo+
PiDCoCB7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBoYXNodGFibGUgKmg7DQo+PiAtwqDCoMKg
IHVuc2lnbmVkIGludCBwaW5kZXgsIHNpemUgPSBwcmltZXNbMF07DQo+PiAtDQo+PiAtwqDC
oMKgIC8qIENoZWNrIHJlcXVlc3RlZCBoYXNodGFibGUgaXNuJ3QgdG9vIGxhcmdlICovDQo+
PiAtwqDCoMKgIGlmIChtaW5zaXplID4gKDF1IDw8IDMwKSkgcmV0dXJuIE5VTEw7DQo+PiAt
DQo+PiAtwqDCoMKgIC8qIEVuZm9yY2Ugc2l6ZSBhcyBwcmltZSAqLw0KPj4gLcKgwqDCoCBm
b3IgKHBpbmRleD0wOyBwaW5kZXggPCBQUklNRV9UQUJMRV9MRU47IHBpbmRleCsrKSB7DQo+
PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHByaW1lc1twaW5kZXhdID4gbWluc2l6ZSkgeyBzaXpl
ID0gcHJpbWVzW3BpbmRleF07IGJyZWFrOyB9DQo+PiAtwqDCoMKgIH0NCj4+IMKgwqDCoMKg
wqAgaCA9IHRhbGxvY196ZXJvKGN0eCwgc3RydWN0IGhhc2h0YWJsZSk7DQo+PiDCoMKgwqDC
oMKgIGlmIChOVUxMID09IGgpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnIwOw0K
Pj4gLcKgwqDCoCBoLT50YWJsZSA9IHRhbGxvY196ZXJvX2FycmF5KGgsIHN0cnVjdCBlbnRy
eSAqLCBzaXplKTsNCj4+ICvCoMKgwqAgdGFsbG9jX3NldF9uYW1lX2NvbnN0KGgsIG5hbWUp
Ow0KPj4gK8KgwqDCoCBoLT50YWJsZSA9IHRhbGxvY196ZXJvX2FycmF5KGgsIHN0cnVjdCBl
bnRyeSAqLCBwcmltZXNbMF0pOw0KPj4gwqDCoMKgwqDCoCBpZiAoTlVMTCA9PSBoLT50YWJs
ZSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycjE7DQo+PiAtwqDCoMKgIGgtPnRh
YmxlbGVuZ3RowqAgPSBzaXplOw0KPj4gK8KgwqDCoCBoLT50YWJsZWxlbmd0aMKgID0gcHJp
bWVzWzBdOw0KPiANCj4gSSBmaW5kIHRoZSBjb25uZWN0aW9uIGJldHdlZW4gdGhpcyBsaW5l
LCAuLi4NCj4gDQo+PiDCoMKgwqDCoMKgIGgtPmZsYWdzwqDCoMKgwqDCoMKgwqAgPSBmbGFn
czsNCj4+IC3CoMKgwqAgaC0+cHJpbWVpbmRleMKgwqAgPSBwaW5kZXg7DQo+PiArwqDCoMKg
IGgtPnByaW1laW5kZXjCoMKgID0gMDsNCj4gDQo+IC4uLiB0aGlzIG9uZSBhbmQgLi4uDQo+
IA0KPj4gwqDCoMKgwqDCoCBoLT5lbnRyeWNvdW50wqDCoCA9IDA7DQo+PiDCoMKgwqDCoMKg
IGgtPmhhc2hmbsKgwqDCoMKgwqDCoCA9IGhhc2hmOw0KPj4gwqDCoMKgwqDCoCBoLT5lcWZu
wqDCoMKgwqDCoMKgwqDCoCA9IGVxZjsNCj4+IC3CoMKgwqAgaC0+bG9hZGxpbWl0wqDCoMKg
ID0gbG9hZGxpbWl0KHBpbmRleCk7DQo+PiArwqDCoMKgIGgtPmxvYWRsaW1pdMKgwqDCoCA9
IGxvYWRsaW1pdCgwKTsNCj4gDQo+IC4uLiBub3cgbW9yZSBkaWZmaWN1bHQgdG8gZmluZC4g
SG93IGFib3V0IHNldHRpbmcgaC0+cHJpbWVpbmRleCBmaXJzdCBhbmQgdGhlbiANCj4gdXNp
bmcgaXQgaW4gcGxhY2Ugb2YgMD8NCg0KRmluZSB3aXRoIG1lLg0KDQoNCkp1ZXJnZW4NCg==

--------------2afD6VB57g35pVY2pMO5GNIx
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2afD6VB57g35pVY2pMO5GNIx--

--------------wqR7kyJJtfyTTDjEJUj6v8r0--

--------------9QaKlmPp0zNMNJYTjaYe2SOX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRSc4cFAwAAAAAACgkQsN6d1ii/Ey9P
0ggAkS5HMD+CA45UEsBPOrXVWkP+jY6NYAHffWzFz8D8oXkWaqyroga1kZlbTxBilzlsd8UqPdhj
+TlLCwlaGj0+MLT/4q/OA4GBklwN7MqZ4fh4I1+rBquUE3KxBCUQwPzP8Dwueln1NxPCNEA5CYbn
99XQ7qilvhCqQLKxZHBAW5M064xT8VKN97w3IACB/S6SHohaUvxGJ/mlO+Z4f+krESA87PckU8zz
Pbc4kyvp2cIht2hYN1oVxrZyueRx7xGi1gABV286e/frRIFUCvJWhtm1HFt6eso2XAF4TlXTr2Ou
l4luEdXdQHx8g41swz0pbx7bWUrGLRBO1chgJbymiw==
=yyFZ
-----END PGP SIGNATURE-----

--------------9QaKlmPp0zNMNJYTjaYe2SOX--

