Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AFD6713BF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 07:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480141.744374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI1mI-0000Jw-6q; Wed, 18 Jan 2023 06:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480141.744374; Wed, 18 Jan 2023 06:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI1mI-0000Hk-2O; Wed, 18 Jan 2023 06:18:30 +0000
Received: by outflank-mailman (input) for mailman id 480141;
 Wed, 18 Jan 2023 06:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI1mH-0000HW-18
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 06:18:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb5a80c6-96f7-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 07:18:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AD7123EB18;
 Wed, 18 Jan 2023 06:18:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B8CF138FE;
 Wed, 18 Jan 2023 06:18:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id y7vLGDKPx2OQWQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 06:18:26 +0000
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
X-Inumbo-ID: eb5a80c6-96f7-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674022706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y2hBd3BYt/zkcZa1Ddp9kUwSg+T1Z+CDys6gyy5sF4c=;
	b=nEBY+NVc8OhboiOHjvQtcG52CfmYI+J4zoneZ7r7dVn1Jhm9fAKj/Zaq1YiOr+D4jCcqmD
	0UaSaA7G4bTeC0Hro1vY2CiL/Hasff2ifPytVlz4QMRpMnIZqCxnW/6ue5E7gII7bGSf/b
	5yaQVnOZgFeab0r30VOZMu3ZwDrtQ+Q=
Message-ID: <ededea85-19df-fc56-23d3-555871923ad7@suse.com>
Date: Wed, 18 Jan 2023 07:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 15/17] tools/xenstore: introduce trace classes
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-16-jgross@suse.com>
 <2ab20725-4bb9-66ac-a87f-01dca92f9453@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <2ab20725-4bb9-66ac-a87f-01dca92f9453@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ijYTGASDyFQB404vDvbF0aKn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ijYTGASDyFQB404vDvbF0aKn
Content-Type: multipart/mixed; boundary="------------j5a8XqnpF0ZYJG7Gd3tVAs6k";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <ededea85-19df-fc56-23d3-555871923ad7@suse.com>
Subject: Re: [PATCH v3 15/17] tools/xenstore: introduce trace classes
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-16-jgross@suse.com>
 <2ab20725-4bb9-66ac-a87f-01dca92f9453@xen.org>
In-Reply-To: <2ab20725-4bb9-66ac-a87f-01dca92f9453@xen.org>

--------------j5a8XqnpF0ZYJG7Gd3tVAs6k
Content-Type: multipart/mixed; boundary="------------o3yt0udUaMngoGNulmJRTIKa"

--------------o3yt0udUaMngoGNulmJRTIKa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDEuMjMgMjM6MTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE3LzAxLzIwMjMgMDk6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBA
QCAtMjYwNCw2ICsyNjA3LDggQEAgc3RhdGljIHZvaWQgdXNhZ2Uodm9pZCkNCj4+IMKgICLC
oCAtTiwgLS1uby1mb3JrwqDCoMKgwqDCoMKgwqDCoMKgwqAgdG8gcmVxdWVzdCB0aGF0IHRo
ZSBkYWVtb24gZG9lcyBub3QgZm9yayxcbiINCj4+IMKgICLCoCAtUCwgLS1vdXRwdXQtcGlk
wqDCoMKgwqDCoMKgwqAgdG8gcmVxdWVzdCB0aGF0IHRoZSBwaWQgb2YgdGhlIGRhZW1vbiBp
cyBvdXRwdXQsXG4iDQo+PiDCoCAiwqAgLVQsIC0tdHJhY2UtZmlsZSA8ZmlsZT4gZ2l2aW5n
IHRoZSBmaWxlIGZvciBsb2dnaW5nLCBhbmRcbiINCj4+ICsiwqDCoMKgwqDCoCAtLXRyYWNl
LWNvbnRyb2w9Kzxzd2l0Y2g+IGFjdGl2YXRlIGEgc3BlY2lmaWMgPHN3aXRjaD5cbiINCj4+
ICsiwqDCoMKgwqDCoCAtLXRyYWNlLWNvbnRyb2w9LTxzd2l0Y2g+IGRlYWN0aXZhdGUgYSBz
cGVjaWZpYyA8c3dpdGNoPlxuIg0KPj4gwqAgIsKgIC1FLCAtLWVudHJ5LW5iIDxuYj7CoMKg
wqDCoCBsaW1pdCB0aGUgbnVtYmVyIG9mIGVudHJpZXMgcGVyIGRvbWFpbixcbiINCj4+IMKg
ICLCoCAtUywgLS1lbnRyeS1zaXplIDxzaXplPiBsaW1pdCB0aGUgc2l6ZSBvZiBlbnRyeSBw
ZXIgZG9tYWluLCBhbmRcbiINCj4+IMKgICLCoCAtVywgLS13YXRjaC1uYiA8bmI+wqDCoMKg
wqAgbGltaXQgdGhlIG51bWJlciBvZiB3YXRjaGVzIHBlciBkb21haW4sXG4iDQo+PiBAQCAt
MjY0Nyw2ICsyNjUyLDcgQEAgc3RhdGljIHN0cnVjdCBvcHRpb24gb3B0aW9uc1tdID0gew0K
Pj4gwqDCoMKgwqDCoCB7ICJvdXRwdXQtcGlkIiwgMCwgTlVMTCwgJ1AnIH0sDQo+PiDCoMKg
wqDCoMKgIHsgImVudHJ5LXNpemUiLCAxLCBOVUxMLCAnUycgfSwNCj4+IMKgwqDCoMKgwqAg
eyAidHJhY2UtZmlsZSIsIDEsIE5VTEwsICdUJyB9LA0KPj4gK8KgwqDCoCB7ICJ0cmFjZS1j
b250cm9sIiwgMSwgTlVMTCwgMSB9LA0KPj4gwqDCoMKgwqDCoCB7ICJ0cmFuc2FjdGlvbiIs
IDEsIE5VTEwsICd0JyB9LA0KPj4gwqDCoMKgwqDCoCB7ICJwZXJtLW5iIiwgMSwgTlVMTCwg
J0EnIH0sDQo+PiDCoMKgwqDCoMKgIHsgInBhdGgtbWF4IiwgMSwgTlVMTCwgJ00nIH0sDQo+
PiBAQCAtMjcyMSw2ICsyNzI3LDQzIEBAIHN0YXRpYyB2b2lkIHNldF9xdW90YShjb25zdCBj
aGFyICphcmcsIGJvb2wgc29mdCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBiYXJmKCJ1bmtu
b3duIHF1b3RhIFwiJXNcIlxuIiwgYXJnKTsNCj4+IMKgIH0NCj4+ICsvKiBTb3J0ZWQgYnkg
Yml0IHZhbHVlcyBvZiBUUkFDRV8qIGZsYWdzLiBGbGFnIGlzICgxdSA8PCBpbmRleCkuICov
DQo+PiArY29uc3QgY2hhciAqdHJhY2Vfc3dpdGNoZXNbXSA9IHsNCj4gDQo+IEFGQUlDVCwg
dGhpcyBhcnJheSBpcyBub3QgbWVhbnQgdG8gYmUgbW9kaWZpZWQuIFNvIHlvdSB3YW50IGEg
c2Vjb25kIGNvbnN0Lg0KDQpZZXMsIHlvdSBhcmUgcmlnaHQuDQoNCj4gDQo+PiArwqDCoMKg
ICJvYmoiLCAiaW8iLCAid3JsIiwNCj4+ICvCoMKgwqAgTlVMTA0KPj4gK307DQo+IA0KPiBb
Li4uXQ0KPiANCj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29y
ZS5oIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuaA0KPj4gaW5kZXggM2I5NmVj
ZDAxOC4uYzg1YjE1NTE1YyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0
b3JlZF9jb3JlLmgNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmgN
Cj4+IEBAIC0yODcsNiArMjg3LDEyIEBAIGV4dGVybiBjaGFyICoqb3JpZ19hcmd2Ow0KPj4g
wqAgZXh0ZXJuIGNoYXIgKnRyYWNlZmlsZTsNCj4+IMKgIGV4dGVybiBpbnQgdHJhY2VmZDsN
Cj4+ICtleHRlcm4gdW5zaWduZWQgaW50IHRyYWNlX2ZsYWdzOw0KPj4gKyNkZWZpbmUgVFJB
Q0VfT0JKwqDCoMKgIDB4MDAwMDAwMDENCj4+ICsjZGVmaW5lIFRSQUNFX0lPwqDCoMKgIDB4
MDAwMDAwMDINCj4+ICsjZGVmaW5lIFRSQUNFX1dSTMKgwqDCoCAweDAwMDAwMDA0DQo+IEkg
d291bGQgYWRkIGEgY29tbWVudCBvbiB0b3AgdG8gZXhwbGFpbiB0aGF0IHRoZSB2YWx1ZSBz
aG91bGQgYmUga2VwdCBpbiBzeW5jIA0KPiB3aXRoIHRyYWNlX3N3aXRjaGVzLg0KDQpPa2F5
Lg0KDQoNCkp1ZXJnZW4NCg0K
--------------o3yt0udUaMngoGNulmJRTIKa
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------o3yt0udUaMngoGNulmJRTIKa--

--------------j5a8XqnpF0ZYJG7Gd3tVAs6k--

--------------ijYTGASDyFQB404vDvbF0aKn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPHjzIFAwAAAAAACgkQsN6d1ii/Ey9c
Hgf/Wc1hiLi/+tQSaKs3yJ6o/x5eKQjbSW4rJIQ4zZWBlicUC0Sq/XKKrzbkvZ+83uLvihho0Coh
7ysj/OBrwL9VIB5AZ8mhSmu43RPYF1Gus7tlcj0o5p/kVKgqM3TDEn74u6Vn2qzP9qhkb2bZxpmz
WwjdIdIcltfhR5tzZ6dLxc1UNWvSR3XMc8A+20wd/CxqQQwR78RuYdWtzqmA8omA2p9obQHJMHgr
9vVq6hjE+F3+HtO/DDvsFTK17dAmxzbOv2hw6LWhSuFSeeBqDVoqWDCr+G3zxWk+TG7sArIUGZKx
ao44NLL5ovrDPe6MIqoIxgrxZWqjmk3YezY0xl42BQ==
=Rhlv
-----END PGP SIGNATURE-----

--------------ijYTGASDyFQB404vDvbF0aKn--

