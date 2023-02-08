Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653C968E916
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 08:36:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491586.760768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPezp-0001sZ-5R; Wed, 08 Feb 2023 07:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491586.760768; Wed, 08 Feb 2023 07:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPezp-0001qD-26; Wed, 08 Feb 2023 07:36:01 +0000
Received: by outflank-mailman (input) for mailman id 491586;
 Wed, 08 Feb 2023 07:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSNm=6E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pPezn-0001pz-Na
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 07:35:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ac11e4e-a783-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 08:35:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 74E5F33876;
 Wed,  8 Feb 2023 07:35:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D9BA13425;
 Wed,  8 Feb 2023 07:35:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vq4QEd5Q42P+agAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Feb 2023 07:35:58 +0000
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
X-Inumbo-ID: 3ac11e4e-a783-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675841758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wMLDm6HC72+yePinbuQ93EyNJ0Xs8Qcg0nWPi5wVOt0=;
	b=ZWU1AcsF5oJPNVDf7z/lHoMW6/8RaCc/Pw+AIHHw4VbRvMQcTSn8r7pBpV+E+omWeA6NR7
	m7TkG3dNP3d1hzVgsvmAxXSWEtGlSP+fhfCpaOemUgexgdVmwKSJJJdQC4Z79lJUFXXTUF
	Rkqy04af873x9aiBS1yCiM0QaLJLZxg=
Message-ID: <778b4f10-5e4d-72f8-32b6-1e20c7300bad@suse.com>
Date: Wed, 8 Feb 2023 08:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH for-4.17 v6 2/5] libs/light: Rework targets
 prerequisites
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
 <20230120194431.55922-3-anthony.perard@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230120194431.55922-3-anthony.perard@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------APpGJ5s0DotdnxR4EUT4nHxr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------APpGJ5s0DotdnxR4EUT4nHxr
Content-Type: multipart/mixed; boundary="------------SMrOlJfIzq7uZ1mT880h4VXx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Message-ID: <778b4f10-5e4d-72f8-32b6-1e20c7300bad@suse.com>
Subject: Re: [XEN PATCH for-4.17 v6 2/5] libs/light: Rework targets
 prerequisites
References: <20230120194431.55922-1-anthony.perard@citrix.com>
 <20230120194431.55922-3-anthony.perard@citrix.com>
In-Reply-To: <20230120194431.55922-3-anthony.perard@citrix.com>

--------------SMrOlJfIzq7uZ1mT880h4VXx
Content-Type: multipart/mixed; boundary="------------0orpuLnNhOpClhuJj0y5cUkc"

--------------0orpuLnNhOpClhuJj0y5cUkc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDEuMjMgMjA6NDQsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBObyBuZWVkIGZv
ciAkKEFVVE9TUkNTKSwgR05VIG1ha2UgY2FuIGdlbmVyYXRlIHRoZW0gYXMgbmVlZGVkIHdo
ZW4NCj4gdHJ5aW5nIHRvIGJ1aWxkIHRoZW0gYXMgbmVlZGVkIHdoZW4gdHJ5aW5nIHRvIGJ1
aWxkIHRoZSBvYmplY3QuIEFsc28sDQo+IHRob3NlIHR3byBBVVRPU1JDUyBkb24ndCBuZWVk
IHRvIGJlIGEgcHJlcmVxdWlzaXRlIG9mICJhbGwiLiBBcyBmb3INCj4gdGhlICJjbGVhbiIg
dGFyZ2V0LCB0aG9zZSB0d28gZmlsZXMgYXJlIGFscmVhZHkgcmVtb3ZlZCB2aWEgIl8qLmMi
Lg0KPiANCj4gV2UgZG9uJ3QgbmVlZCAkKEFVVE9JTkNTKSBlaXRoZXI6DQo+IC0gQXMgZm9y
IGJvdGggX2xpYnhsX3NhdmVfbXNncyouaCBoZWFkZXJzLCB3ZSBhcmUgYWRkaW5nIG1vcmUN
Cj4gICAgc2VsZWN0aXZlIGRlcGVuZGVuY2llcyBzbyB0aGUgaGVhZGVycyB3aWxsIHN0aWxs
IGJlIGdlbmVyYXRlZCBhcw0KPiAgICBuZWVkZWQuDQo+IC0gImNsZWFuIiBydWxlIGFscmVh
ZHkgZGVsZXRlIHRoZSBfKi5oIGZpbGVzLCBzbyBBVVRPSU5DUyBhcmVuJ3QgbmVlZGVkDQo+
ICAgIHRoZXJlLg0KPiANCj4gImxpYnhsX2ludGVybmFsX2pzb24uaCIgZG9lc24ndCBzZWVt
cyB0byBoYXZlIGV2ZXIgZXhpc3RlZCwgc28gdGhlDQo+IGRlcGVuZGVuY3kgaXMgcmVtb3Zl
ZC4NCj4gDQo+IFJld29yayBvYmplY3RzIHByZXJlcXVpc2l0ZXMsIHRvIGhhdmUgdGhlbSBk
ZXBlbmRlbnRzIG9uIGVpdGhlcg0KPiAibGlieGwuaCIgb3IgImxpYnhsX2ludGVybmFsLmgi
LiAibGlieGwuaCIgaXMgbm90IG5vcm1hbGx5IGluY2x1ZGVkDQo+IGRpcmVjdGx5IGluIHRo
ZSBzb3VyY2UgY29kZSBhcyAibGlieGxfaW50ZXJuYWwuaCIgaXMgdXNlZCBpbnN0ZWFkLCBi
dXQNCj4gd2UgaGF2ZSAibGlieGwuaCIgYXMgcHJlcmVxdWlzaXRlIG9mICJsaWJ4bF9pbnRl
cm5hbC5oIiwgc28gZ2VuZXJhdGVkDQo+IGhlYWRlcnMgd2lsbCBzdGlsbCBiZSBnZW5lcmF0
ZWQgYXMgbmVlZGVkLg0KPiANCj4gTWFrZSBkb2Vzbid0IG5lZWQgImxpYnhsLmgiIHRvIGdl
bmVyYXRlICJ0ZXN0aWRsLmMiLCAibGlieGwuaCIgaXMgb25seQ0KPiBuZWVkZWQgbGF0ZXIg
d2hlbiBidWlsZGluZyAidGVzdGlkbC5vIi4gVGhpcyBhdm9pZCB0aGUgbmVlZCB0bw0KPiBy
ZWdlbmVyYXRlICJ0ZXN0aWRsLmMiIHdoZW4gb25seSAibGlieGwuaCIgY2hhbmdlZC4gQWxz
byB1c2UgYXV0b21hdGljDQo+IHZhcmlhYmxlcyAkPCBhbmQgJEAuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVy
Z2VuDQoNCg==
--------------0orpuLnNhOpClhuJj0y5cUkc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0orpuLnNhOpClhuJj0y5cUkc--

--------------SMrOlJfIzq7uZ1mT880h4VXx--

--------------APpGJ5s0DotdnxR4EUT4nHxr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPjUN0FAwAAAAAACgkQsN6d1ii/Ey/z
iAf/SXId6hTOqhv8reqTqxvXAz2WpE0RbydR+TJ2wVecs8Rq/cFxmiWnRaHO2qp/k6PvQ6XGVFeM
j6FIcsEpN7mMisoxxoSJKLFJcUgrsWpJ9P7YuSaqzcL2rgNZkZYQNavo/JS+h+Bm/kyjLuVZOcUj
QwdHmHliVVwbRu4912XtRjLIThz0SgoP3gBoCoiHLiR65VlzESR0M4eg/eY7UFrtpfYT0M0Z1I08
hi1kpvNsOABjokC8K7wFihzWfg5EvORKK0b/CSdr3dBXGubB8ps8euXnbCTJRRjredwy1EDvuN77
cBFmK6RISzCBEOzrhOkwnYYsQEM1VJtV/PF3EF4Ubw==
=8b1e
-----END PGP SIGNATURE-----

--------------APpGJ5s0DotdnxR4EUT4nHxr--

