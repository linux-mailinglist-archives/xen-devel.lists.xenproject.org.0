Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DC061EC1F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 08:34:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439075.693025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orwdA-0005wr-EC; Mon, 07 Nov 2022 07:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439075.693025; Mon, 07 Nov 2022 07:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orwdA-0005u9-BV; Mon, 07 Nov 2022 07:33:16 +0000
Received: by outflank-mailman (input) for mailman id 439075;
 Mon, 07 Nov 2022 07:33:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bDd0=3H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1orwd8-0005u3-IO
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 07:33:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f6b1fee-5e6e-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 08:33:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B6631F91C;
 Mon,  7 Nov 2022 07:33:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35D5B13AC7;
 Mon,  7 Nov 2022 07:33:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IoKcC7i0aGNjDAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 07 Nov 2022 07:33:12 +0000
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
X-Inumbo-ID: 6f6b1fee-5e6e-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667806392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w57SdNk4+rMF4F1CSL2UorXLTY3nTcZvu9goOvfkLsg=;
	b=ZTc8eQlt2kydMVxbM+plysapNM5aeIIEDhvYU7WOIF+Ltl0vDBr3y51HLUszqxulttq8Pa
	JbDTQwTDEdv0Tbc9ydg6FSHm19I9jTcVKKDCWKLgGpMunObuihxnTrYxAseN6VvOTJqf6H
	/wom1yQoVPfXOPH7SZEvya+7E5UcQg0=
Message-ID: <a4e22fb5-206e-65d0-e953-a8da3141d088@suse.com>
Date: Mon, 7 Nov 2022 08:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-4-jgross@suse.com>
 <f89eb853-5adb-f63b-a587-ebd88a2c2c3d@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 03/20] tools/xenstore: let talloc_free() preserve errno
In-Reply-To: <f89eb853-5adb-f63b-a587-ebd88a2c2c3d@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9TZ0F4cfDjPykCJBU2kTugDU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9TZ0F4cfDjPykCJBU2kTugDU
Content-Type: multipart/mixed; boundary="------------wgiQcH4M2YMCUDT1aliMVt3Y";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <a4e22fb5-206e-65d0-e953-a8da3141d088@suse.com>
Subject: Re: [PATCH 03/20] tools/xenstore: let talloc_free() preserve errno
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-4-jgross@suse.com>
 <f89eb853-5adb-f63b-a587-ebd88a2c2c3d@xen.org>
In-Reply-To: <f89eb853-5adb-f63b-a587-ebd88a2c2c3d@xen.org>

--------------wgiQcH4M2YMCUDT1aliMVt3Y
Content-Type: multipart/mixed; boundary="------------Ujmvd03nAcUXwVsjj7xFZZYS"

--------------Ujmvd03nAcUXwVsjj7xFZZYS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTEuMjIgMjI6MDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzExLzIwMjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
b2RheSB0YWxsb2NfZnJlZSgpIGlzIG5vdCBndWFyYW50ZWVkIHRvIHByZXNlcnZlIGVycm5v
LCBlc3BlY2lhbGx5IGluDQo+PiBjYXNlIGEgY3VzdG9tIGRlc3RydWN0b3IgaXMgYmVpbmcg
dXNlZC4NCj4+DQo+PiBDaGFuZ2UgdGhhdCBieSByZW5hbWluZyB0YWxsb2NfZnJlZSgpIHRv
IF90YWxsb2NfZnJlZSgpIGluIHRhbGxvYy5jIGFuZA0KPj4gYWRkaW5nIGEgd3JhcHBlciB0
byB0YWxsb2MuYy4NCj4+DQo+PiBUaGlzIGFsbG93cyB0byByZW1vdmUgc29tZSBlcnJubyBz
YXZpbmcgb3V0c2lkZSBvZiB0YWxsb2MuYy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IMKgIHRvb2xzL3hlbnN0
b3JlL3RhbGxvYy5jwqDCoMKgwqDCoMKgwqDCoCB8IDI1ICsrKysrKysrKysrKysrKysrKy0t
LS0tLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMgfMKgIDIgLS0N
Cj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUvdGFsbG9jLmMgYi90b29s
cy94ZW5zdG9yZS90YWxsb2MuYw0KPj4gaW5kZXggZDdlZGNmM2E5My4uNWZiZWZkZjA5MSAx
MDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3RhbGxvYy5jDQo+PiArKysgYi90b29s
cy94ZW5zdG9yZS90YWxsb2MuYw0KPj4gQEAgLTEwMyw2ICsxMDMsOCBAQCBzdHJ1Y3QgdGFs
bG9jX2NodW5rIHsNCj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgZmxhZ3M7DQo+PiDCoCB9Ow0K
Pj4gK3N0YXRpYyBpbnQgX3RhbGxvY19mcmVlKHZvaWQgKnB0cik7DQo+PiArDQo+PiDCoCAv
KiAxNiBieXRlIGFsaWdubWVudCBzZWVtcyB0byBrZWVwIGV2ZXJ5b25lIGhhcHB5ICovDQo+
PiDCoCAjZGVmaW5lIFRDX0hEUl9TSVpFICgoc2l6ZW9mKHN0cnVjdCB0YWxsb2NfY2h1bmsp
KzE1KSZ+MTUpDQo+PiDCoCAjZGVmaW5lIFRDX1BUUl9GUk9NX0NIVU5LKHRjKSAoKHZvaWQg
KikoVENfSERSX1NJWkUgKyAoY2hhciopdGMpKQ0KPj4gQEAgLTI0NSw3ICsyNDcsNyBAQCBz
dGF0aWMgaW50IHRhbGxvY19yZWZlcmVuY2VfZGVzdHJ1Y3Rvcih2b2lkICpwdHIpDQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgdGMxLT5kZXN0cnVjdG9yID0gTlVMTDsNCj4+IMKgwqDCoMKg
wqAgfQ0KPj4gwqDCoMKgwqDCoCBfVExJU1RfUkVNT1ZFKHRjMi0+cmVmcywgaGFuZGxlKTsN
Cj4+IC3CoMKgwqAgdGFsbG9jX2ZyZWUoaGFuZGxlKTsNCj4+ICvCoMKgwqAgX3RhbGxvY19m
cmVlKGhhbmRsZSk7DQo+IA0KPiAgRnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UsIGl0IGlzIG5v
dCBjbGVhciB0byBtZSB3aHkgd2UgYXJlIGNhbGxpbmcgdGhlIA0KPiB1bmRlcnNjb3JlIHZl
cnNpb24gaGVyZS4gU2FtZSBmb3IgdGhlIG90aGVycyBiZWxvdy4NCg0KSSB3YXMgdGFyZ2V0
aW5nIG9ubHkgdGFsbG9jX2ZyZWUoKSBjYWxscyBmcm9tIHhlbnN0b3JlZCB0byBwcmVzZXJ2
ZSBlcnJuby4NCg0KSSBjYW4gc2VlIHlvdXIgcG9pbnQgdGhhdCB3ZSBjb3VsZCBqdXN0IGRv
IHRoZSBzYW1lIGZvciB0YWxsb2MgaW50ZXJuYWwNCmNhbGxzLCBwcmVzZXJ2aW5nIGVycm5v
IGluIG90aGVyIGNhc2VzLCB0b28uDQoNCk9UT0ggdGhlIG9ubHkgcmVsZXZhbnQgY2FzZSB3
b3VsZCBiZSB0aGUgY2FsbCBmcm9tIHRhbGxvY191bmxpbmsoKSB2aWENCnRhbGxvY191bnJl
ZmVyZW5jZSgpLCB3aGljaCBpcyBhdCBsZWFzdCBjdXJyZW50bHkgbm8gcHJvYmxlbSByZWdh
cmRpbmcNCmVycm5vLg0KDQpEbyB5b3UgaGF2ZSBhbnkgcHJlZmVyZW5jZXM/IEknbSBsZWFu
aW5nIHRvd2FyZHMgZHJvcHBpbmcgdGhlIHdyYXBwZXINCmFuZCBkbyB0aGUgZXJybm8gcHJl
c2VydmluZyBqdXN0IGluc2lkZSB0YWxsb2NfZnJlZSgpLg0KDQoNCkp1ZXJnZW4NCg==
--------------Ujmvd03nAcUXwVsjj7xFZZYS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Ujmvd03nAcUXwVsjj7xFZZYS--

--------------wgiQcH4M2YMCUDT1aliMVt3Y--

--------------9TZ0F4cfDjPykCJBU2kTugDU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNotLcFAwAAAAAACgkQsN6d1ii/Ey+M
Ywf6AwOHZabytLWyQKM9iTA6ZFmTbZjgaEEhogPBFk5cslHafcY9a8dZKjoyLzwrXSXKS8Gyg/3n
LkGD9ozHattxk6XmWIv1CIQ9hreJEUGBUHoLf2Gh10CawnUY8oJ4vm7I8/piRM7RWLtfFqa+Wkvm
2k905utZySvR2n30Zx7TNMl8Vd1zvl4rpbBwwz2t2zhG5si8MjDGUY1xqGaxQRSQze87NJ4DkU4F
f1vJpGzKcY4Tzm8eYeQNea8c9OUBH15rGAQOVzKgFWrEF9QYWyLc4Mh6sc4jQQvXTtjk2Ay7uy+6
yuOkUX/EES0GF/J/ZwgUXGOiDW2IdwUSjiUNRzVyHg==
=X08d
-----END PGP SIGNATURE-----

--------------9TZ0F4cfDjPykCJBU2kTugDU--

