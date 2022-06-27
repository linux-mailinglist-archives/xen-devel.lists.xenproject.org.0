Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8DD55BAAD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 17:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356855.585173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5qQV-000153-HD; Mon, 27 Jun 2022 15:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356855.585173; Mon, 27 Jun 2022 15:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5qQV-00012f-EC; Mon, 27 Jun 2022 15:13:23 +0000
Received: by outflank-mailman (input) for mailman id 356855;
 Mon, 27 Jun 2022 15:13:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6rY=XC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o5qQU-00012Z-CM
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 15:13:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abbb9691-f62b-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 17:13:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 954961FA63;
 Mon, 27 Jun 2022 15:13:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DCF513AB2;
 Mon, 27 Jun 2022 15:13:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +ixTGRDJuWLUUAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Jun 2022 15:13:20 +0000
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
X-Inumbo-ID: abbb9691-f62b-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656342800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RBbt/XB73h/kq6kSZdzu9YQ6+tvIXQVXwroWuJNZ790=;
	b=BrgNjrAVzwjxBnZ5DOZ6GKwMNA170zBi0MezWo1DM0SvtPtcbJZo/uDaWGnWnUu04OS7RY
	mSn5Kt4TXfzBTyvGY1KHJGrbph5gX7Fy1MRBnRZY+PqqrEGWfIoEzzAqHnOaZMFjoCgejV
	7jfCoQvLf0azoHE884g5Bz95S001uk8=
Message-ID: <c6ed6696-74f1-824f-5f64-f016284e3348@suse.com>
Date: Mon, 27 Jun 2022 17:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Julien Grall <jgrall@amazon.com>
References: <20220627123635.3416-1-julien@xen.org>
 <20220627123635.3416-2-julien@xen.org>
 <d0330408-2301-6145-f46b-c3da302a1edb@suse.com>
 <7af3e9ec-59fe-32ce-2a9d-b8dab57d0e9e@xen.org>
 <f7c0d5c1-01da-4dca-42ac-ce17c6109371@suse.com>
 <10c2bc1f-f035-648f-3b9d-7c29007d3527@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/2] public/io: xs_wire: Document that EINVAL should
 always be first in xsd_errors
In-Reply-To: <10c2bc1f-f035-648f-3b9d-7c29007d3527@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UNfAah1Fnrsewn9BpaI7wW0B"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UNfAah1Fnrsewn9BpaI7wW0B
Content-Type: multipart/mixed; boundary="------------t8F5Xlm7wXgGnvbo8rW8T2Gp";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Julien Grall <jgrall@amazon.com>
Message-ID: <c6ed6696-74f1-824f-5f64-f016284e3348@suse.com>
Subject: Re: [PATCH v2 1/2] public/io: xs_wire: Document that EINVAL should
 always be first in xsd_errors
References: <20220627123635.3416-1-julien@xen.org>
 <20220627123635.3416-2-julien@xen.org>
 <d0330408-2301-6145-f46b-c3da302a1edb@suse.com>
 <7af3e9ec-59fe-32ce-2a9d-b8dab57d0e9e@xen.org>
 <f7c0d5c1-01da-4dca-42ac-ce17c6109371@suse.com>
 <10c2bc1f-f035-648f-3b9d-7c29007d3527@xen.org>
In-Reply-To: <10c2bc1f-f035-648f-3b9d-7c29007d3527@xen.org>

--------------t8F5Xlm7wXgGnvbo8rW8T2Gp
Content-Type: multipart/mixed; boundary="------------7gcikDgpxpYVrwMGbJkfofhT"

--------------7gcikDgpxpYVrwMGbJkfofhT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjIgMTc6MDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI3LzA2LzIwMjIgMTU6NTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyNy4wNi4yMiAxNjo0OCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+
Pj4gT24gMjcvMDYvMjAyMiAxNTozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24g
MjcuMDYuMjIgMTQ6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+IEZyb206IEp1bGll
biBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+Pj4+Pg0KPj4+Pj4gU29tZSB0b29scyAo
ZS5nLiB4ZW5zdG9yZWQpIGFsd2F5cyBleHBlY3QgRUlOVkFMIHRvIGJlIGZpcnN0IGluIHhz
ZF9lcnJvcnMuDQo+Pj4+Pg0KPj4+Pj4gRG9jdW1lbnQgaXQgc28sIG9uZSBkb2Vzbid0IGFk
ZCBhIG5ldyBlbnRyeSBiZWZvcmUgaGFuZCBieSBtaXN0YWtlLg0KPj4+Pj4NCj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+Pj4+Pg0K
Pj4+Pj4gLS0tLQ0KPj4+Pj4NCj4+Pj4+IEkgaGF2ZSB0cmllZCB0byBhZGQgYSBCVUlMRF9C
VUdfT04oKSBidXQgR0NDIGNvbXBsYWluZWQgdGhhdCB0aGUgdmFsdWUNCj4+Pj4+IHdhcyBu
b3QgYSBjb25zdGFudC4gSSBjb3VsZG4ndCBmaWd1cmUgb3V0IGEgd2F5IHRvIG1ha2UgR0ND
IGhhcHB5Lg0KPj4+Pj4NCj4+Pj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4+PiDCoMKgwqDCoCAt
IE5ldyBwYXRjaA0KPj4+Pj4gLS0tDQo+Pj4+PiDCoCB4ZW4vaW5jbHVkZS9wdWJsaWMvaW8v
eHNfd2lyZS5oIHwgMSArDQo+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2lvL3hz
X3dpcmUuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby94c193aXJlLmgNCj4+Pj4+IGluZGV4
IGMxZWM3YzczZTNiMS4uZGQ0YzljOWI5NzJkIDEwMDY0NA0KPj4+Pj4gLS0tIGEveGVuL2lu
Y2x1ZGUvcHVibGljL2lvL3hzX3dpcmUuaA0KPj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvcHVi
bGljL2lvL3hzX3dpcmUuaA0KPj4+Pj4gQEAgLTc2LDYgKzc2LDcgQEAgc3RhdGljIHN0cnVj
dCB4c2RfZXJyb3JzIHhzZF9lcnJvcnNbXQ0KPj4+Pj4gwqAgX19hdHRyaWJ1dGVfXygodW51
c2VkKSkNCj4+Pj4+IMKgICNlbmRpZg0KPj4+Pj4gwqDCoMKgwqDCoCA9IHsNCj4+Pj4+ICvC
oMKgwqAgLyogLyFcIFNvbWUgdXNlcnMgKGUuZy4geGVuc3RvcmVkKSBleHBlY3QgRUlOVkFM
IHRvIGJlIHRoZSBmaXJzdCANCj4+Pj4+IGVudHJ5LiAqLw0KPj4+Pj4gwqDCoMKgwqDCoCBY
U0RfRVJST1IoRUlOVkFMKSwNCj4+Pj4+IMKgwqDCoMKgwqAgWFNEX0VSUk9SKEVBQ0NFUyks
DQo+Pj4+PiDCoMKgwqDCoMKgIFhTRF9FUlJPUihFRVhJU1QpLA0KPj4+Pg0KPj4+PiBXaGF0
IGFib3V0IGFub3RoZXIgYXBwcm9hY2gsIGxpa2U6DQo+Pj4NCj4+PiBJbiBwbGFjZSBvZiB3
aGF0PyBJIHN0aWxsIHRoaW5rIHdlIG5lZWQgdGhlIGNvbW1lbnQgYmVjYXVzZSB0aGlzIGFz
c3VtcHRpb24gDQo+Pj4gaXMgbm90IHBhcnQgb2YgdGhlIEFCSSAoQUZBSUNUIHhzX3dpcmUu
aCBpcyBtZWFudCB0byBiZSBzdGFibGUpLg0KPj4+DQo+Pj4gQXQgd2hpY2ggcG9pbnQsIEkg
c2VlIGxpbWl0ZWQgcmVhc29uIHRvIGZpeCB4ZW5zdG9yZWRfY29yZS5jLg0KPj4+DQo+Pj4g
QnV0IEkgd291bGQgaGF2ZSByZWFsbHkgcHJlZmVyIHRvIHVzZSBhIEJVSUxEX0JVR19PTigp
IChvciBzaW1pbGFyKSBzbyB3ZSBjYW4gDQo+Pj4gY2F0Y2ggYW55IG1pc3VlIGEgYnVpbGQu
IE1heWJlIEkgc2hvdWxkIHdyaXRlIGEgc21hbGwgcHJvZ3JhbSB0aGF0IGlzIA0KPj4+IGV4
ZWN1dGVkIGF0IGNvbXBpbGUgdGltZT8NCj4+DQo+PiBNeSBzdWdnZXN0aW9uIHJlbW92ZXMg
dGhlIG5lZWQgZm9yIEVJTlZBTCBiZWluZyB0aGUgZmlyc3QgZW50cnkNCj4gDQo+IHhzZF9l
cnJvcnNbXSBpcyBwYXJ0IG9mIHRoZSBzdGFibGUgQUJJLiBJZiBYZW5zdG9yZWQgaXMgYWxy
ZWFkeSAibWlzdXNpbmciIGl0LCANCj4gdGhlbiBJIHdvdWxkbid0IGJlIHN1cnByaXNlZCBp
ZiBvdGhlciBzb2Z0d2FyZSByZWx5IG9uIHRoaXMgYXMgd2VsbC4NCg0KWGVuc3RvcmVkIGlz
IHRoZSBvbmx5IGluc3RhbmNlIHdoaWNoIG5lZWRzIGEgdHJhbnNsYXRpb24gZnJvbSB2YWx1
ZSB0bw0Kc3RyaW5nLCB3aGlsZSBhbGwgb3RoZXIgdXNlcnMgc2hvdWxkIG5lZWQgb25seSB0
aGUgb3Bwb3NpdGUgZGlyZWN0aW9uLg0KVGhlIG9ubHkgb3RoZXIgY2FuZGlkYXRlIHdvdWxk
IGJlIG94ZW5zdG9yZWQsIGJ1dCB0aGF0IHNlZW1zIG5vdCB0byB1c2UNCnhzZF9lcnJvcnNb
XS4NCg0KQW5kIGluIGZhY3QgbGlieGVuc3RvcmUgd2lsbCBqdXN0IHJldHVybiBhIHBsYWlu
IEVJTlZBTCBpbiBjYXNlIGl0DQpjYW4ndCBmaW5kIGEgdHJhbnNsYXRpb24sIHdoaWxlIGh2
bWxvYWRlciB3aWxsIHJldHVybiBFSU8gaW4gdGhhdCBjYXNlLg0KDQpXaXRoIHlvdXIgcmVh
c29uaW5nIGFuZCB0aGUgaHZtbG9hZGVyIHVzZSBjYXNlIHlvdSBjb3VsZCBhcmd1ZSB0aGF0
DQp0aGUgRUlPIGVudHJ5IG5lZWRzIHRvIHN0YXkgYXQgdGhlIHNhbWUgcG9zaXRpb24sIHRv
by4NCg0KPiBUaGVyZWZvcmUsIEkgZG9uJ3QgcmVhbGx5IHNlZSBob3cgZml4aW5nIFhlbnN0
b3JlZCB3b3VsZCBhbGxvdyB1cyB0byByZW1vdmUgdGhpcyANCj4gcmVzdHJpY3Rpb24uDQo+
IA0KPiBUaGUgb25seSByZWFzb24gdGhpcyB3YXMgc3BvdHRlZCBpcyBieSBKYW4gcmV2aWV3
aW5nIEMgWGVuc3RvcmVkLiBXaXRob3V0IHRoYXQsIA0KPiBpdCB3b3VsZCBoYXZlIHByb2Js
YWJseSB0b29rIGEgbG9uZyB0aW1lIHRvIG5vdGljZQ0KPiB0aGlzIGNoYW5nZSAoSSBkb24n
dCB0aGluayB0aGVyZSBhcmUgbWFueSBvdGhlciBlcnJubyB1c2VkIGJ5IFhlbnN0b3JlZA0K
PiBhbmQgeHNkX2Vycm9ycykuIFNvIEkgdGhpbmsgdGhlIHJpc2sgaXMgbm90IHdvcnRoIHRo
ZSBlZmZvcnQuDQoNCkkgZG9uJ3Qgc2VlIGEgcmVhbCByaXNrIGhlcmUsIGJ1dCBpZiB0aGVy
ZSBpcyBjb25zZW5zdXMgdGhhdCB0aGUgcmlzayBzaG91bGQNCm5vdCBiZSB0YWtlbiwgdGhl
biBJJ2QgcmF0aGVyIGFkZCBhIGNvbW1lbnQgdGhhdCBuZXcgZW50cmllcyBhcmUgb25seSBh
bGxvd2VkDQp0byBiZSBhZGRlZCBhdCB0aGUgZW5kIG9mIHRoZSBhcnJheS4NCg0KPiBBdCBs
ZWFzdCwgdGhpcyBpcyBub3QgYSBwYXRjaCBJIHdvdWxkIGJlIHdpbGxpbmcgdG8gaGF2ZSBt
eSBuYW1lIG9uIChlaXRoZXIgYXMgYSANCj4gc2lnbmVkLW9mZi1ieSBvciBhY2tlZC1ieSku
DQoNCkZhaXIgZW5vdWdoLiA6LSkNCg0KDQpKdWVyZ2VuDQo=
--------------7gcikDgpxpYVrwMGbJkfofhT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------7gcikDgpxpYVrwMGbJkfofhT--

--------------t8F5Xlm7wXgGnvbo8rW8T2Gp--

--------------UNfAah1Fnrsewn9BpaI7wW0B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK5yRAFAwAAAAAACgkQsN6d1ii/Ey9T
xAf7BzZvvCgCfYom6Zw+I8G84tZhrVLDo2CHsAJnMK1qIcke7JKfaLwwQRxloTXucYPerq3BwzS6
zk5Uo6cKQy+cLpLIFqIG19S8YJFCUiCYab9U8pRN2R48/6sgQQ9At/1JyUyGBvZu9Ylel5kueW+f
WSqUca2toJ6ZDrsL00Yto6/duhlEfEiboh1yxMqZKAhGFMw3kMvuOVF3nzb1P7gA+g2yCR6AO4T9
d/Jtss/HfY+lC1uQoMwZoGg4NBucSjvbAOFDBmUc2lT3hcDGS28cSAJm+loNyRoaPHCU4aGcwvpy
z7hneLHvcey6lXyYw3XMLgwH8BFW4oh6DFPmG5mHDw==
=OGjs
-----END PGP SIGNATURE-----

--------------UNfAah1Fnrsewn9BpaI7wW0B--

