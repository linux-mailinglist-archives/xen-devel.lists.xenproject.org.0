Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070246D8F0A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 08:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518733.805551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkIkA-0008MF-Lc; Thu, 06 Apr 2023 06:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518733.805551; Thu, 06 Apr 2023 06:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkIkA-0008Jw-I9; Thu, 06 Apr 2023 06:05:10 +0000
Received: by outflank-mailman (input) for mailman id 518733;
 Thu, 06 Apr 2023 06:05:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=17RP=75=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pkIk8-0008Jq-I0
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 06:05:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9fa8b11-d440-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 08:05:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 33EB622851;
 Thu,  6 Apr 2023 06:05:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09AD2133E5;
 Thu,  6 Apr 2023 06:05:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zi6EABFhLmRaHQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Apr 2023 06:05:05 +0000
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
X-Inumbo-ID: f9fa8b11-d440-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680761105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iAiGf3cX2GW0bfrFRKXl6BpZg86FVq+iM6Qx7WST+Fk=;
	b=ubKyyYdlYlaWScuO/QO3mcCFfA3fxykuYorEIU2rTFXl0wvCCTupVmHNPYrQRxaySPw5WL
	T7VZrWpkUeba4ish02JdcbCp0zGkZxMxymxrUZCZU9BXKL5F4LZqS9l4jU2Xtd95iwv9t0
	9dsXSSeu/LBqshHQ6CY8XJhqQYhIy2k=
Message-ID: <e529da7e-0da6-af2f-e5b1-bb8f361a518c@suse.com>
Date: Thu, 6 Apr 2023 08:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 2/4] tools/xendevicemodel: Introduce
 ..._get_ioreq_server_info_ext
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <1f6dc87eebe5d1c27ae15ec8f5d8006e5aa1c36d.1680752649.git-series.marmarek@invisiblethingslab.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <1f6dc87eebe5d1c27ae15ec8f5d8006e5aa1c36d.1680752649.git-series.marmarek@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4yk10507j6h1jUkHG8ZqU8Vz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4yk10507j6h1jUkHG8ZqU8Vz
Content-Type: multipart/mixed; boundary="------------mdcjMNvxzTpVfimRWy4KDUVZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <e529da7e-0da6-af2f-e5b1-bb8f361a518c@suse.com>
Subject: Re: [PATCH v3 2/4] tools/xendevicemodel: Introduce
 ..._get_ioreq_server_info_ext
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <1f6dc87eebe5d1c27ae15ec8f5d8006e5aa1c36d.1680752649.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <1f6dc87eebe5d1c27ae15ec8f5d8006e5aa1c36d.1680752649.git-series.marmarek@invisiblethingslab.com>

--------------mdcjMNvxzTpVfimRWy4KDUVZ
Content-Type: multipart/mixed; boundary="------------IYP6TtmdnVCWEa5NYAwiEmVR"

--------------IYP6TtmdnVCWEa5NYAwiEmVR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDQuMjMgMDU6NTcsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gQWRkIHhlbmRldmljZW1vZGVsX2dldF9pb3JlcV9zZXJ2ZXJfaW5mb19leHQoKSB3aGlj
aCBhZGRpdGlvbmFsbHkNCj4gcmV0dXJucyBvdXRwdXQgZmxhZ3MgdGhhdCBYRU5fRE1PUF9n
ZXRfaW9yZXFfc2VydmVyX2luZm8gY2FuIG5vdyByZXR1cm4uDQo+IERvIG5vdCBjaGFuZ2Ug
c2lnbmF0dXJlIG9mIGV4aXN0aW5nDQo+IHhlbmRldmljZW1vZGVsX2dldF9pb3JlcV9zZXJ2
ZXJfaW5mbygpIHNvIGV4aXN0aW5nIHVzZXJzIHdpbGwgbm90IG5lZWQNCj4gdG8gYmUgY2hh
bmdlZC4NCj4gDQo+IFRoaXMgYWR2ZXJ0aXNlcyBiZWhhdmlvciBjaGFuZ2Ugb2YgIng4Ni9t
c2k6IHBhc3N0aHJvdWdoIGFsbCBNU0ktWA0KPiB2ZWN0b3IgY3RybCB3cml0ZXMgdG8gZGV2
aWNlIG1vZGVsIiBwYXRjaC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4NCj4gLS0t
DQo+IHYzOg0KPiAgIC0gbmV3IHBhdGNoDQo+IA0KPiBTaG91bGQgdGhlcmUgYmUgc29tZSBI
QVZFXyogI2RlZmluZSBpbiB0aGUgaGVhZGVyPyBEb2VzIHRoaXMgY2hhbmdlDQo+IHJlcXVp
cmUgc29uYW1lIGJ1bXAgKEkgaG9wZSBpdCBkb2Vzbid0Li4uKS4NCg0KWW91IG5lZWQgdG8g
YWRkIHZlcnNpb24gMS41IHRvIGxpYnhlbmRldmljZW1vZGVsLm1hcCB3aGljaCBzaG91bGQg
ZGVmaW5lDQp0aGUgbmV3IGZ1bmN0aW9uLg0KDQoNCkp1ZXJnZW4NCg==
--------------IYP6TtmdnVCWEa5NYAwiEmVR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------IYP6TtmdnVCWEa5NYAwiEmVR--

--------------mdcjMNvxzTpVfimRWy4KDUVZ--

--------------4yk10507j6h1jUkHG8ZqU8Vz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQuYRAFAwAAAAAACgkQsN6d1ii/Ey/9
UQf9GAYbrRxg5BEQZ9Hh0Zpihh5MjH79/FibaBJRfZwiNRcbQjWaiX5IGxpMpb3eIyIoLdodIAQ2
BnR6QL/H4RF/ibDEMIsccC6TqUCxA4RjAmMTW7NyJr/xw+Pk2VE4YpaZfhEh/skSbKDWITnpVRXj
jEX1ri3EbBg7tHlcQ4nAEc3Q4M60o/QoxT5ANJ8vD/zf1Tkz3gF9F2F26Mvg8DGFN3fGGRZ49jU6
2n1mfcf0l5F3waOrs0rfixO0clsw/sNlPekZWUSXFuAggnvyeJDqatu1VZG+GK0CPaZeTnUDntTn
xyJVOjlfrhFwaGPqGKvcFedXMeiu7HAC4slfQ2U84g==
=4SkI
-----END PGP SIGNATURE-----

--------------4yk10507j6h1jUkHG8ZqU8Vz--

