Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AE156D5E8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 09:10:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364889.594859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAnYL-0006jD-7S; Mon, 11 Jul 2022 07:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364889.594859; Mon, 11 Jul 2022 07:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAnYL-0006h0-3Z; Mon, 11 Jul 2022 07:09:57 +0000
Received: by outflank-mailman (input) for mailman id 364889;
 Mon, 11 Jul 2022 07:09:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=twA/=XQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oAnYJ-0006gu-P8
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 07:09:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76d40db2-00e8-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 09:09:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4455620084;
 Mon, 11 Jul 2022 07:09:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16F7813524;
 Mon, 11 Jul 2022 07:09:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RaQDBMLMy2KkAgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 11 Jul 2022 07:09:54 +0000
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
X-Inumbo-ID: 76d40db2-00e8-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657523394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K2VFV8qdbE6Z5NB6WOrUrcPao6W4Q0PYmnKxJXLDz8k=;
	b=ShChLikP3cfjSbOkgb24vwb3MfWZSF5EI5P5q9RpFTjysZwnrg0RH6FvRq0s8LaxuLkD14
	9CuDMOCi+uDMNlvp5/VCnzsH6TmvW2v2o2MreB1TXQKvCNPAtnk+aoJYg56NhyWSEHTF6I
	tQ71ET6JpErNecT7vWlcOjYQR51lnhw=
Message-ID: <20f563b2-68e1-e429-f762-78474c566d04@suse.com>
Date: Mon, 11 Jul 2022 09:09:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/4] tools: remove xenstore entries on vchan server
 closure
In-Reply-To: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HAhON0yoFl6h3W5HEnaexa4f"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HAhON0yoFl6h3W5HEnaexa4f
Content-Type: multipart/mixed; boundary="------------0JVjvipApbVP4TBgLcVlgsat";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20f563b2-68e1-e429-f762-78474c566d04@suse.com>
Subject: Re: [PATCH 1/4] tools: remove xenstore entries on vchan server
 closure
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
In-Reply-To: <20220709101035.2989428-1-dmitry.semenets@gmail.com>

--------------0JVjvipApbVP4TBgLcVlgsat
Content-Type: multipart/mixed; boundary="------------8HgPWNx1j5RlPkUxdXqivo09"

--------------8HgPWNx1j5RlPkUxdXqivo09
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDcuMjIgMTI6MTAsIGRtaXRyeS5zZW1lbmV0c0BnbWFpbC5jb20gd3JvdGU6DQo+
IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5r
b0BlcGFtLmNvbT4NCj4gDQo+IHZjaGFuIHNlcnZlciBjcmVhdGVzIFhlblN0b3JlIGVudHJp
ZXMgdG8gYWR2ZXJ0aXNlIGl0cyBldmVudCBjaGFubmVsIGFuZA0KPiByaW5nLCBidXQgdGhv
c2UgYXJlIG5vdCByZW1vdmVkIGFmdGVyIHRoZSBzZXJ2ZXIgcXVpdHMuDQo+IEFkZCBhZGRp
dGlvbmFsIGNsZWFudXAgc3RlcCwgc28gdGhvc2UgYXJlIHJlbW92ZWQsIHNvIGNsaWVudHMg
ZG8gbm90IHRyeQ0KPiB0byBjb25uZWN0IHRvIGEgbm9uLWV4aXN0aW5nIHNlcnZlci4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4gLS0tDQo+ICAgdG9vbHMvaW5jbHVkZS9saWJ4
ZW52Y2hhbi5oIHwgIDUgKysrKysNCj4gICB0b29scy9saWJzL3ZjaGFuL2luaXQuYyAgICAg
fCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIHRvb2xzL2xpYnMvdmNoYW4vaW8u
YyAgICAgICB8ICA0ICsrKysNCj4gICB0b29scy9saWJzL3ZjaGFuL3ZjaGFuLmggICAgfCAz
MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgNCBmaWxlcyBjaGFuZ2Vk
LCA2MyBpbnNlcnRpb25zKCspDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xpYnMv
dmNoYW4vdmNoYW4uaA0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvbGlieGVu
dmNoYW4uaCBiL3Rvb2xzL2luY2x1ZGUvbGlieGVudmNoYW4uaA0KPiBpbmRleCBkNjAxMGIx
NDVkLi4zMGNjNzNjZjk3IDEwMDY0NA0KPiAtLS0gYS90b29scy9pbmNsdWRlL2xpYnhlbnZj
aGFuLmgNCj4gKysrIGIvdG9vbHMvaW5jbHVkZS9saWJ4ZW52Y2hhbi5oDQo+IEBAIC04Niw2
ICs4NiwxMSBAQCBzdHJ1Y3QgbGlieGVudmNoYW4gew0KPiAgIAlpbnQgYmxvY2tpbmc6MTsN
Cj4gICAJLyogY29tbXVuaWNhdGlvbiByaW5ncyAqLw0KPiAgIAlzdHJ1Y3QgbGlieGVudmNo
YW5fcmluZyByZWFkLCB3cml0ZTsNCj4gKwkvKioNCj4gKwkgKiBCYXNlIHhlbnN0b3JlIHBh
dGggZm9yIHN0b3JpbmcgcmluZy9ldmVudCBkYXRhIHVzZWQgYnkgdGhlIHNlcnZlcg0KPiAr
CSAqIGR1cmluZyBjbGVhbnVwLg0KPiArCSAqICovDQo+ICsJY2hhciAqeHNfcGF0aDsNCj4g
ICB9Ow0KPiAgIA0KPiAgIC8qKg0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy92Y2hhbi9p
bml0LmMgYi90b29scy9saWJzL3ZjaGFuL2luaXQuYw0KPiBpbmRleCBjODUxMGU2Y2U5Li5j
NmI4Njc0ZWY1IDEwMDY0NA0KPiAtLS0gYS90b29scy9saWJzL3ZjaGFuL2luaXQuYw0KPiAr
KysgYi90b29scy9saWJzL3ZjaGFuL2luaXQuYw0KPiBAQCAtNDYsNiArNDYsOCBAQA0KPiAg
ICNpbmNsdWRlIDx4ZW4vc3lzL2dudGRldi5oPg0KPiAgICNpbmNsdWRlIDxsaWJ4ZW52Y2hh
bi5oPg0KPiAgIA0KPiArI2luY2x1ZGUgInZjaGFuLmgiDQo+ICsNCj4gICAjaWZuZGVmIFBB
R0VfU0hJRlQNCj4gICAjZGVmaW5lIFBBR0VfU0hJRlQgMTINCj4gICAjZW5kaWYNCj4gQEAg
LTI1MSw2ICsyNTMsMTAgQEAgc3RhdGljIGludCBpbml0X3hzX3NydihzdHJ1Y3QgbGlieGVu
dmNoYW4gKmN0cmwsIGludCBkb21haW4sIGNvbnN0IGNoYXIqIHhzX2Jhc2UNCj4gICAJY2hh
ciByZWZbMTZdOw0KPiAgIAljaGFyKiBkb21pZF9zdHIgPSBOVUxMOw0KPiAgIAl4c190cmFu
c2FjdGlvbl90IHhzX3RyYW5zID0gWEJUX05VTEw7DQo+ICsNCj4gKwkvLyBzdG9yZSB0aGUg
YmFzZSBwYXRoIHNvIHdlIGNhbiBjbGVhbiB1cCBvbiBzZXJ2ZXIgY2xvc3VyZQ0KDQpQbGVh
c2UgZG9uJ3QgaW50cm9kdWNlIG5ldyB1c2FnZXMgb2YgdGhlIEMrKyBjb21tZW50IHN0eWxl
Lg0KDQo+ICsJY3RybC0+eHNfcGF0aCA9IHN0cmR1cCh4c19iYXNlKTsNCg0KUmV0dXJuIGFu
IGVycm9yIGluIGNhc2Ugb2Ygc3RyZHVwKCkgZmFpbHVyZT8NCg0KPiArDQo+ICAgCXhzID0g
eHNfb3BlbigwKTsNCj4gICAJaWYgKCF4cykNCj4gICAJCWdvdG8gZmFpbDsNCj4gQEAgLTI5
OCw2ICszMDQsMjMgQEAgcmV0cnlfdHJhbnNhY3Rpb246DQo+ICAgCXJldHVybiByZXQ7DQo+
ICAgfQ0KPiAgIA0KPiArdm9pZCBjbG9zZV94c19zcnYoc3RydWN0IGxpYnhlbnZjaGFuICpj
dHJsKQ0KPiArew0KPiArCXN0cnVjdCB4c19oYW5kbGUgKnhzOw0KPiArDQo+ICsJaWYgKCFj
dHJsLT54c19wYXRoKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwl4cyA9IHhzX29wZW4oMCk7
DQo+ICsJaWYgKCF4cykNCj4gKwkJZ290byBmYWlsOw0KPiArDQo+ICsJeHNfcm0oeHMsIFhC
VF9OVUxMLCBjdHJsLT54c19wYXRoKTsNCg0KSW4gdGhpcyBzaW1wbGUgY2FzZSBJJ2QgcHJl
ZmVyDQoNCmlmICh4cykNCiAgICAgeHNfcm0oeHMsIFhCVF9OVUxMLCBjdHJsLT54c19wYXRo
KTsNCg0KPiArDQo+ICtmYWlsOg0KPiArCWZyZWUoY3RybC0+eHNfcGF0aCk7DQoNCk5vIHhz
X2Nsb3NlKCk/DQoNCg0KSnVlcmdlbg0K
--------------8HgPWNx1j5RlPkUxdXqivo09
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------8HgPWNx1j5RlPkUxdXqivo09--

--------------0JVjvipApbVP4TBgLcVlgsat--

--------------HAhON0yoFl6h3W5HEnaexa4f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLLzMEFAwAAAAAACgkQsN6d1ii/Ey90
XAf9GQj8w/1FSbWNKV3liYVKV7oPkNTaCkE5a80xZRZXUaZtXuwAkIDYqQKx1uGGTSNIyQUVae0X
cBLevyLyOb/P2TxacXNhdsG487uC5ART4SZ+QqLKy9jR1cO1LtEeQ3RJdYWrgRbI8kkIPF7huqnC
oMbWOwnkiLlksiK5b3Dl5LzXbG7J2qdDu0frnLfQ/U2eHttqd3DfHLPjVk1bsTFtXcxBZWjEnbBK
dnTHkO87gr519qatcrBHL29jWQsCEt0Hc5WBS0ycR2EK3pOFTQHv6jnne7zK1TiPQQd7IiTSatzz
IKYVrHShbQJOS5QvY9g6OXqb+0JA7Hr1Xh5+wOdeKQ==
=m5fC
-----END PGP SIGNATURE-----

--------------HAhON0yoFl6h3W5HEnaexa4f--

