Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72AD6F5383
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 10:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529035.822941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu83f-000747-P6; Wed, 03 May 2023 08:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529035.822941; Wed, 03 May 2023 08:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu83f-00070l-Lf; Wed, 03 May 2023 08:41:55 +0000
Received: by outflank-mailman (input) for mailman id 529035;
 Wed, 03 May 2023 08:41:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C18W=AY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pu83e-00070f-1W
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 08:41:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59abf5b9-e98e-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 10:41:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 75AAC22448;
 Wed,  3 May 2023 08:41:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E77C139F8;
 Wed,  3 May 2023 08:41:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ekddEU8eUmT0dwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 May 2023 08:41:51 +0000
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
X-Inumbo-ID: 59abf5b9-e98e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683103311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lUD7esgrDW79z9o7+4vsMOz/TSmW2ZPXBObw8d5vtnU=;
	b=Z95QtXrIV8lVavs295Wjb54a3o+JdDbodmdlTdvZ5OBWGCGCegXm+GcDi3lzbNOT4bKnZm
	wxgNWV1JogPKjZfZGjRlb4EXF9ekz6uPoaYHG4j//PMQhubJLIml3rvdf/0sEbEOFPhaFC
	NDIS/b95wbSa3tRRghUQgGW03zzYTdM=
Message-ID: <ce231d58-c300-36d8-791c-2c6544b5e329@suse.com>
Date: Wed, 3 May 2023 10:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 05/13] tools/xenstore: use accounting buffering for
 node accounting
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-6-jgross@suse.com>
 <c3be0db1-ed47-967b-7f98-6f1569691fb6@xen.org>
 <887675ad-ef06-cf8c-8a32-5b3f726e2198@suse.com>
 <acea2ebe-47c5-1d26-887d-b29df06d07dd@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <acea2ebe-47c5-1d26-887d-b29df06d07dd@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TMp6T5rdQQnTdKltCroqfQzP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TMp6T5rdQQnTdKltCroqfQzP
Content-Type: multipart/mixed; boundary="------------5CBjTXPndDZHeScJshg2sxDR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <ce231d58-c300-36d8-791c-2c6544b5e329@suse.com>
Subject: Re: [PATCH v4 05/13] tools/xenstore: use accounting buffering for
 node accounting
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-6-jgross@suse.com>
 <c3be0db1-ed47-967b-7f98-6f1569691fb6@xen.org>
 <887675ad-ef06-cf8c-8a32-5b3f726e2198@suse.com>
 <acea2ebe-47c5-1d26-887d-b29df06d07dd@xen.org>
In-Reply-To: <acea2ebe-47c5-1d26-887d-b29df06d07dd@xen.org>

--------------5CBjTXPndDZHeScJshg2sxDR
Content-Type: multipart/mixed; boundary="------------OB0I27oQAIR4oCHfZceSMzAY"

--------------OB0I27oQAIR4oCHfZceSMzAY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDUuMjMgMTA6MDIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAzLzA1LzIwMjMgMDY6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwMi4wNS4yMyAyMDo1NSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAwNS8wNC8yMDIzIDA4OjAzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBBZGQgdGhlIG5vZGUgYWNjb3VudGluZyB0byB0aGUgYWNjb3VudGluZyBpbmZvcm1h
dGlvbiBidWZmZXJpbmcgaW4NCj4+Pj4gb3JkZXIgdG8gYXZvaWQgaGF2aW5nIHRvIHVuZG8g
aXQgaW4gY2FzZSBvZiBmYWlsdXJlLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiDCoCB0b29scy94
ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jwqDCoCB8IDIxICsrLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPj4+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmggfMKgIDQgKyst
LQ0KPj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRp
b25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfY29yZS5jIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4+PiBpbmRl
eCA4NDMzNWY1ZjNkLi45MmE0MGNjZjNmIDEwMDY0NA0KPj4+PiAtLS0gYS90b29scy94ZW5z
dG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+Pj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0
b3JlZF9jb3JlLmMNCj4+Pj4gQEAgLTE0NTIsNyArMTQ1Miw2IEBAIHN0YXRpYyB2b2lkIGRl
c3Ryb3lfbm9kZV9ybShzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwgDQo+Pj4+IHN0cnVjdCBu
b2RlICpub2RlKQ0KPj4+PiDCoCBzdGF0aWMgaW50IGRlc3Ryb3lfbm9kZShzdHJ1Y3QgY29u
bmVjdGlvbiAqY29ubiwgc3RydWN0IG5vZGUgKm5vZGUpDQo+Pj4+IMKgIHsNCj4+Pj4gwqDC
oMKgwqDCoCBkZXN0cm95X25vZGVfcm0oY29ubiwgbm9kZSk7DQo+Pj4+IC3CoMKgwqAgZG9t
YWluX25iZW50cnlfZGVjKGNvbm4sIGdldF9ub2RlX293bmVyKG5vZGUpKTsNCj4+Pj4gwqDC
oMKgwqDCoCAvKg0KPj4+PiDCoMKgwqDCoMKgwqAgKiBJdCBpcyBub3QgcG9zc2libGUgdG8g
ZWFzaWx5IHJldmVydCB0aGUgY2hhbmdlcyBpbiBhIHRyYW5zYWN0aW9uLg0KPj4+PiBAQCAt
MTc5NywyNyArMTc5NiwxMSBAQCBzdGF0aWMgaW50IGRvX3NldF9wZXJtcyhjb25zdCB2b2lk
ICpjdHgsIHN0cnVjdCANCj4+Pj4gY29ubmVjdGlvbiAqY29ubiwNCj4+Pj4gwqDCoMKgwqDC
oCBvbGRfcGVybXMgPSBub2RlLT5wZXJtczsNCj4+Pj4gwqDCoMKgwqDCoCBkb21haW5fbmJl
bnRyeV9kZWMoY29ubiwgZ2V0X25vZGVfb3duZXIobm9kZSkpOw0KPj4+DQo+Pj4gSUlSQywg
d2Ugb3JpZ2luYWxseSBzYWlkIHRoYXQgZG9tYWluX25iZW50cnlfZGVjKCkgY291bGQgbmV2
ZXIgZmFpbCBpbiBhIA0KPj4+IG5vbi10cmFuc2FjdGlvbiBjYXNlLiBCdXQgd2l0aCB5b3Vy
IGN1cnJlbnQgcmV3b3JrLCB0aGUgZnVuY3Rpb24gY2FuIG5vdyBmYWlsIA0KPj4+IGJlY2F1
c2Ugb2YgYW4gYWxsb2NhdGlvbiBmYWlsdXJlLg0KPj4NCj4+IEhvdyB3b3VsZCB0aGF0IGJl
IHBvc3NpYmxlIHRvIGhhcHBlbj8NCj4+DQo+PiBkb21haW5fbmJlbnRyeV9kZWMoKSBjYW4g
b25seSBiZSBjYWxsZWQgaWYgYSBub2RlIGlzIGJlaW5nIG93bmVkIGJ5IGFuIGFscmVhZHkN
Cj4+IGtub3duIGRvbWFpbi4gU28gYWxsb2NhdGlvbiBpcyBpbXBvc3NpYmxlIHRvIGhhcHBl
biwgYXMgdGhpcyB3b3VsZCBiZSBhIG1ham9yDQo+PiBlcnJvciBpbiB4ZW5zdG9yZWQuDQo+
IA0KPiAgRnJvbSBteSB1bmRlcnN0YW5kaW5nLCB0aGUgbm9kZXMgYWNjb3VudGluZyB3aWxs
IGJlIHRlbXBvcmFyeSBhbmQgdGhlbiANCj4gY29tbWl0dGVkIGF0IHRoZSBlbmQgb2YgdGhl
IHJlcXVlc3QuDQo+IA0KPiBTbyB3ZSB3b3VsZCBjYWxsIGFjY19hZGRfY2hhbmdlZF9kb20o
KSB3aGljaCBtYXkgcmVxdWlyZSBhbGxvY2F0aW9uIHRvIGhvbGQgdGhlIA0KPiB0ZW1wb3Jh
cnkgYWNjb3VudGluZy4NCg0KQWgsIHJpZ2h0LCBnb29kIGNhdGNoIQ0KDQpXaWxsIGFkZCBj
aGVja2luZyB0aGUgcmV0dXJuIHZhbHVlIGFuZCBtb3ZlIHRoZSBjYWxscyBhaGVhZCBvZiB0
aGUgdGRiIGNoYW5nZXMuDQoNCg0KSnVlcmdlbg0K
--------------OB0I27oQAIR4oCHfZceSMzAY
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------OB0I27oQAIR4oCHfZceSMzAY--

--------------5CBjTXPndDZHeScJshg2sxDR--

--------------TMp6T5rdQQnTdKltCroqfQzP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRSHk4FAwAAAAAACgkQsN6d1ii/Ey/x
/Af+LQayKbh6eHMkv4HWMtqlDxEjXR1ipNLuHisUPL+VBlb2oqr35hC2mKpkD014gUBr7gGonEHH
yBbA+EKgTBdNM/HAnB2UzxOW/IHavKElP+U2CVAM9g9PPuOTJZoLIo5OP6tMRWjbIETvT0Kn8OLm
/rP5jqmBi4G0slEKnci4XPn4qeW2GwOagcvJgW5d05a4rfxyX1O4ik2lzFj641/MpLyc25++JJwR
PrgY7nB4nhDok1xYz0Q0GUXfHfIN/zjEoVamIsrltsIv+FQBaRgufH6Mxwx7TC8koDJOwl6PIHz1
pbPa6P3o71M8r05ofPeRW9HW5Dmn+1k12DdNoRaVuA==
=WGAn
-----END PGP SIGNATURE-----

--------------TMp6T5rdQQnTdKltCroqfQzP--

