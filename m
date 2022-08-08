Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D722258C606
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 12:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382336.617254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKzcw-0005gk-Pd; Mon, 08 Aug 2022 10:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382336.617254; Mon, 08 Aug 2022 10:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKzcw-0005dW-Mj; Mon, 08 Aug 2022 10:04:50 +0000
Received: by outflank-mailman (input) for mailman id 382336;
 Mon, 08 Aug 2022 10:04:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qbuG=YM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oKzcv-0005dQ-CI
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 10:04:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 848d2d12-1701-11ed-924f-1f966e50362f;
 Mon, 08 Aug 2022 12:04:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE52B20B36;
 Mon,  8 Aug 2022 10:04:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 819C813A7C;
 Mon,  8 Aug 2022 10:04:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hvJ+Hb/f8GKNfgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 Aug 2022 10:04:47 +0000
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
X-Inumbo-ID: 848d2d12-1701-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659953087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A5Vdp259iyrPQhr6eAL7IwFXUp/JMkHtIHoNgO1dQDc=;
	b=hgVy9lJSK/wYikaE34t02MeS/vqAeJbhJiCeKFYfgKmyMb6j6rePn3wPBsQI6fSHrQsw8N
	AtqlCAHjN2Z/cZRtwcwaZrs7rp4oiHm2JKEgnzzQ6QTZ+Hz8R7RTUN+f5hvZDr35nCR7Yu
	97VQz33T7jtSJsBoOb0yHT/RWxrwHuM=
Message-ID: <b0a8e835-dbd0-6522-3bd0-edde27861323@suse.com>
Date: Mon, 8 Aug 2022 12:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802132747.22507-3-jgross@suse.com>
 <5b68bc1d-e920-bae8-52c9-809d9f4919f8@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
In-Reply-To: <5b68bc1d-e920-bae8-52c9-809d9f4919f8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ryEXm5CfPWHLZY0z5E1dfb0j"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ryEXm5CfPWHLZY0z5E1dfb0j
Content-Type: multipart/mixed; boundary="------------OP00nIFVC0f0kMGJIlKj4Xej";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Message-ID: <b0a8e835-dbd0-6522-3bd0-edde27861323@suse.com>
Subject: Re: [PATCH 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802132747.22507-3-jgross@suse.com>
 <5b68bc1d-e920-bae8-52c9-809d9f4919f8@suse.com>
In-Reply-To: <5b68bc1d-e920-bae8-52c9-809d9f4919f8@suse.com>

--------------OP00nIFVC0f0kMGJIlKj4Xej
Content-Type: multipart/mixed; boundary="------------ZucyvOwvbWH2IKNeIJLdnkSg"

--------------ZucyvOwvbWH2IKNeIJLdnkSg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjIgMTE6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4wOC4yMDIy
IDE1OjI3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZC9jb3JlLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiBAQCAtMzE5
MCw2ICszMTkwLDY2IEBAIG91dDoNCj4+ICAgICAgIHJldHVybiByZXQ7DQo+PiAgIH0NCj4+
ICAgDQo+PiArc3RhdGljIHN0cnVjdCBjcHVfcm1fZGF0YSAqc2NoZWR1bGVfY3B1X3JtX2Fs
bG9jKHVuc2lnbmVkIGludCBjcHUpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgY3B1X3JtX2Rh
dGEgKmRhdGE7DQo+PiArICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc3I7DQo+IA0KPiBj
b25zdD8NCg0KWWVzLg0KDQo+IA0KPj4gKyAgICBpbnQgaWR4Ow0KPiANCj4gV2hpbGUgY29k
ZSBpcyBzdXBwb3NlZGx5IG9ubHkgYmVpbmcgbW92ZWQsIEkgc3RpbGwgcXVlc3Rpb24gdGhp
cyBub3QNCj4gYmVpbmcgInVuc2lnbmVkIGludCIsIHRoZSBtb3JlIHRoYXQgc3ItPmdyYW51
bGFyaXR5IGlzICJ1bnNpZ25lZCBpbnQiDQo+IGFzIHdlbGwuIChTYW1lIHRoZW4gZm9yIHRo
ZSByZXRhaW5lZCBpbnN0YW5jZSBvZnRoZSB2YXJpYWJsZSBpbiB0aGUNCj4gb3JpZ2luYWwg
ZnVuY3Rpb24uKSBPZiBjb3Vyc2UgdGhlIGxvb3AgaW4gdGhlIGVycm9yIHBhdGggdGhlbiBu
ZWVkcw0KPiB3cml0aW5nIGRpZmZlcmVudGx5Lg0KDQpJIGNvbnNpZGVyZWQgdGhhdCBhbmQg
ZGlkbid0IHdhbnQgdG8gY2hhbmdlIHRoZSBsb29wLiBPVE9IIHRoaXMgc2VlbXMNCnRvIGJl
IHJhdGhlciB0cml2aWFsLCBzbyBJIGNhbiBkbyB0aGUgc3dpdGNoLg0KDQo+IA0KPj4gKyAg
ICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7DQo+PiArDQo+PiArICAgIHNy
ID0gZ2V0X3NjaGVkX3JlcyhjcHUpOw0KPj4gKyAgICBkYXRhID0geHphbGxvY19mbGV4X3N0
cnVjdChzdHJ1Y3QgY3B1X3JtX2RhdGEsIHNyLCBzci0+Z3JhbnVsYXJpdHkgLSAxKTsNCj4g
DQo+IEFmYWljdCB4bWFsbG9jX2ZsZXhfc3RydWN0KCkgd291bGQgZG8gaGVyZSwgYXMgeW91
IGZpbGwgYWxsIGZpZWxkcy4NCg0KT2theS4NCg0KPiANCj4+ICsgICAgaWYgKCAhZGF0YSAp
DQo+PiArICAgICAgICBnb3RvIG91dDsNCj4+ICsNCj4+ICsgICAgZGF0YS0+b2xkX29wcyA9
IHNyLT5zY2hlZHVsZXI7DQo+PiArICAgIGRhdGEtPnZwcml2X29sZCA9IGlkbGVfdmNwdVtj
cHVdLT5zY2hlZF91bml0LT5wcml2Ow0KPj4gKyAgICBkYXRhLT5wcHJpdl9vbGQgPSBzci0+
c2NoZWRfcHJpdjsNCj4gDQo+IEF0IGxlYXN0IGZyb20gYW4gYWJzdHJhY3QgcGVyc3BlY3Rp
dmUsIGRvZXNuJ3QgcmVhZGluZyBmaWVsZHMgZnJvbQ0KPiBzciByZXF1aXJlIHRoZSBSQ1Ug
bG9jayB0byBiZSBoZWxkIGNvbnRpbnVvdXNseSAoaS5lLiBub3QgZHJvcHBpbmcNCj4gaXQg
YXQgdGhlIGVuZCBvZiB0aGlzIGZ1bmN0aW9uIGFuZCByZS1hY3F1aXJpbmcgaXQgaW4gdGhl
IGNhbGxlcik/DQo+IA0KPj4gKyAgICBmb3IgKCBpZHggPSAwOyBpZHggPCBzci0+Z3JhbnVs
YXJpdHkgLSAxOyBpZHgrKyApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGRhdGEtPnNyW2lk
eF0gPSBzY2hlZF9hbGxvY19yZXMoKTsNCj4+ICsgICAgICAgIGlmICggZGF0YS0+c3JbaWR4
XSApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgZGF0YS0+c3JbaWR4XS0+c2No
ZWRfdW5pdF9pZGxlID0gc2NoZWRfYWxsb2NfdW5pdF9tZW0oKTsNCj4+ICsgICAgICAgICAg
ICBpZiAoICFkYXRhLT5zcltpZHhdLT5zY2hlZF91bml0X2lkbGUgKQ0KPj4gKyAgICAgICAg
ICAgIHsNCj4+ICsgICAgICAgICAgICAgICAgc2NoZWRfcmVzX2ZyZWUoJmRhdGEtPnNyW2lk
eF0tPnJjdSk7DQo+PiArICAgICAgICAgICAgICAgIGRhdGEtPnNyW2lkeF0gPSBOVUxMOw0K
Pj4gKyAgICAgICAgICAgIH0NCj4+ICsgICAgICAgIH0NCj4+ICsgICAgICAgIGlmICggIWRh
dGEtPnNyW2lkeF0gKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIGZvciAoIGlk
eC0tOyBpZHggPj0gMDsgaWR4LS0gKQ0KPj4gKyAgICAgICAgICAgICAgICBzY2hlZF9yZXNf
ZnJlZSgmZGF0YS0+c3JbaWR4XS0+cmN1KTsNCj4+ICsgICAgICAgICAgICB4ZnJlZShkYXRh
KTsNCj4+ICsgICAgICAgICAgICBkYXRhID0gTlVMTDsNCj4gDQo+IFhGUkVFKCk/DQoNCk9o
LCByaWdodC4gRm9yZ290IGFib3V0IHRoYXQgcG9zc2liaWxpdHkuDQoNCj4gDQo+PiBAQCAt
MzE5OCw1MyArMzI1OCwyMiBAQCBvdXQ6DQo+PiAgICAqLw0KPj4gICBpbnQgc2NoZWR1bGVf
Y3B1X3JtKHVuc2lnbmVkIGludCBjcHUpDQo+PiAgIHsNCj4+IC0gICAgdm9pZCAqcHByaXZf
b2xkLCAqdnByaXZfb2xkOw0KPj4gLSAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNyLCAq
KnNyX25ldyA9IE5VTEw7DQo+PiArICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc3I7DQo+
PiArICAgIHN0cnVjdCBjcHVfcm1fZGF0YSAqZGF0YTsNCj4+ICAgICAgIHN0cnVjdCBzY2hl
ZF91bml0ICp1bml0Ow0KPj4gLSAgICBzdHJ1Y3Qgc2NoZWR1bGVyICpvbGRfb3BzOw0KPj4g
ICAgICAgc3BpbmxvY2tfdCAqb2xkX2xvY2s7DQo+PiAgICAgICB1bnNpZ25lZCBsb25nIGZs
YWdzOw0KPj4gLSAgICBpbnQgaWR4LCByZXQgPSAtRU5PTUVNOw0KPj4gKyAgICBpbnQgaWR4
ID0gMDsNCj4+ICAgICAgIHVuc2lnbmVkIGludCBjcHVfaXRlcjsNCj4+ICAgDQo+PiArICAg
IGRhdGEgPSBzY2hlZHVsZV9jcHVfcm1fYWxsb2MoY3B1KTsNCj4+ICsgICAgaWYgKCAhZGF0
YSApDQo+PiArICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+ICsNCj4+ICAgICAgIHJjdV9y
ZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsNCj4+ICAgDQo+PiAgICAgICBzciA9IGdl
dF9zY2hlZF9yZXMoY3B1KTsNCj4+IC0gICAgb2xkX29wcyA9IHNyLT5zY2hlZHVsZXI7DQo+
PiAgIA0KPj4gLSAgICBpZiAoIHNyLT5ncmFudWxhcml0eSA+IDEgKQ0KPj4gLSAgICB7DQo+
IA0KPiBUaGlzIGNvbmRpdGlvbmFsIGlzIGxvc3QgYWZhaWN0LCByZXN1bHRpbmcgaW4gcG90
ZW50aWFsbHkgd3JvbmcgYmVoYXZpb3INCj4gaW4gdGhlIG5ldyBoZWxwZXIuIENvbnNpZGVy
aW5nIGl0cyBwdXJwb3NlIEkgZXhwZWN0IHRoZXJlJ3MgYSBndWFyYW50ZWUNCj4gdGhhdCB0
aGUgZmllbGQncyB2YWx1ZSBjYW4gbmV2ZXIgYmUgemVybywgYnV0IHRoZW4gSSBndWVzcyBh
biBBU1NFUlQoKQ0KPiB3b3VsZCBiZSBuaWNlIG5leHQgdG8gdGhlIHBvdGVudGlhbGx5IHBy
b2JsZW1hdGljIHVzZXMgaW4gdGhlIGhlbHBlci4NCg0KSSdsbCBhZGQgdGhlIEFTU0VSVCgp
Lg0KDQo+IA0KPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9wcml2YXRlLmgNCj4+ICsrKyBi
L3hlbi9jb21tb24vc2NoZWQvcHJpdmF0ZS5oDQo+PiBAQCAtNTk4LDYgKzU5OCwxNCBAQCBz
dHJ1Y3QgYWZmaW5pdHlfbWFza3Mgew0KPj4gICAgICAgY3B1bWFza192YXJfdCBzb2Z0Ow0K
Pj4gICB9Ow0KPj4gICANCj4+ICsvKiBNZW1vcnkgYWxsb2NhdGlvbiByZWxhdGVkIGRhdGEg
Zm9yIHNjaGVkdWxlX2NwdV9ybSgpLiAqLw0KPj4gK3N0cnVjdCBjcHVfcm1fZGF0YSB7DQo+
PiArICAgIHN0cnVjdCBzY2hlZHVsZXIgKm9sZF9vcHM7DQo+IA0KPiBjb25zdD8NCg0KWWVz
Lg0KDQoNCkp1ZXJnZW4NCg0K
--------------ZucyvOwvbWH2IKNeIJLdnkSg
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ZucyvOwvbWH2IKNeIJLdnkSg--

--------------OP00nIFVC0f0kMGJIlKj4Xej--

--------------ryEXm5CfPWHLZY0z5E1dfb0j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLw378FAwAAAAAACgkQsN6d1ii/Ey/I
ZAf+JsfSUOVNEYr3wqoUg7XJoLKwhGl3vgI0lqKxiRuIiyaOj6BcoNJGU050A0v+1PWCzHyGXu6z
sjQ0dRNF69FRQGsu7I2aTdcP7iibgpg9wt0qv2aNWop/iIamn8ksH6ALoaJOvEn4Ym5b0ZRle22v
w5n/ZC/oLfn/MEa3HIBH5xliPDI+1r97c0LllCIJb0mLMOazTspMvtHZNHS1W8QZX9wU9kCiJZk1
1KW8nOy3ZKIZfK+R4Qc03AzQVKN0EI+03JTBeqc/78Qs4cD4Z9m9vDJ8l/YZscaARGK110/XZGMD
QCMJ7Ag20zvVQl/frgBDALMX/mgkIvfMWHw2NwtuQw==
=UcBQ
-----END PGP SIGNATURE-----

--------------ryEXm5CfPWHLZY0z5E1dfb0j--

