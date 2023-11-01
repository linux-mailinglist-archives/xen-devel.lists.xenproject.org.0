Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F148B7DE028
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 12:08:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626382.976632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy94v-0000dE-5r; Wed, 01 Nov 2023 11:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626382.976632; Wed, 01 Nov 2023 11:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy94v-0000Zv-2F; Wed, 01 Nov 2023 11:08:05 +0000
Received: by outflank-mailman (input) for mailman id 626382;
 Wed, 01 Nov 2023 11:08:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy94u-0000Zp-AU
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 11:08:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec5fc521-78a6-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 12:08:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 740891F74A;
 Wed,  1 Nov 2023 11:08:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E5C113460;
 Wed,  1 Nov 2023 11:08:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V6KvEZExQmU/MQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 11:08:01 +0000
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
X-Inumbo-ID: ec5fc521-78a6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698836881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1Je6nSkY4hjCXmdDMfXQTZU4HV600TIPKTlXaqU718M=;
	b=GrgZ/+mxRMXEN2nV2kqmilR935jhL9VhosOXk4Fo5oiAQQ06dGVLmS2crahZVS89anWwiQ
	FrveyM8XiOEbRPp8MWLF1WTAqPdr62s72G4fYXN4AYmdjwRXRndAluDS781Ej6XB/SuETt
	mghrZmXMTk5VdyVrHWVcj7n5zBOazjE=
Message-ID: <7b3ce122-023a-4f6a-9de4-b40795957c50@suse.com>
Date: Wed, 1 Nov 2023 12:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/29] tools/xenstored: rename xenbus_evtchn()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-19-jgross@suse.com>
 <0d94c15f-e65b-42cd-b57b-f524179520c7@xen.org>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <0d94c15f-e65b-42cd-b57b-f524179520c7@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------O9iS8dAddEzF3d9ehkYb3NVP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------O9iS8dAddEzF3d9ehkYb3NVP
Content-Type: multipart/mixed; boundary="------------UeeRwZ1C0s8ZWLiEGQYg9Qdt";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <7b3ce122-023a-4f6a-9de4-b40795957c50@suse.com>
Subject: Re: [PATCH 18/29] tools/xenstored: rename xenbus_evtchn()
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-19-jgross@suse.com>
 <0d94c15f-e65b-42cd-b57b-f524179520c7@xen.org>
In-Reply-To: <0d94c15f-e65b-42cd-b57b-f524179520c7@xen.org>

--------------UeeRwZ1C0s8ZWLiEGQYg9Qdt
Content-Type: multipart/mixed; boundary="------------81dA6Z0I8gfPJMiS77ENMSzt"

--------------81dA6Z0I8gfPJMiS77ENMSzt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTEuMjMgMTE6NDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzExLzIwMjMgMDk6MzMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBS
ZW5hbWUgdGhlIHhlbmJ1c19ldnRjaG4oKSBmdW5jdGlvbiB0byBnZXRfeGVuYnVzX2V2dGNo
bigpIGluIG9yZGVyIHRvDQo+PiBhdm9pZCB0d28gZXh0ZXJuYWxseSB2aXNpYmxlIHN5bWJv
bHMgd2l0aCB0aGUgc2FtZSBuYW1lIHdoZW4gWGVuc3RvcmUtDQo+PiBzdHViZG9tIGlzIGJl
aW5nIGJ1aWx0IHdpdGggYSBNaW5pLU9TIHdpdGggQ09ORklHX1hFTkJVUyBzZXQuDQo+IFRo
aXMgd29ya3MgcmlnaHQgbm93LCBidXQgd2hhdCBndWFyYW50ZWUgdXMgdGhhdCBNaW5pLU9T
IHdpbGwgbm90IGNoYW5nZSBvdGhlciANCj4gc3ltYm9scyBhbmQgY2xhc2ggd2l0aCB0aGUg
b25lIHByb3ZpZGVkIGJ5IFhlbnN0b3JlZCBhZ2Fpbj8NCj4gDQo+IEZ1cnRoZXJtb3JlLCB0
ZWNobmljYWxseSwgdGhpcyBpcyBhIHByb2JsZW0gZm9yIGFsbCB0aGUgb3RoZXIgc29mdHdh
cmUgbGlua2VkIA0KPiB3aXRoIE1pbmktT1MuIFNvIHdvdWxkbid0IGl0IGJlIGJldHRlciB0
byBtb2RpZnkgdGhlIE1pbmktT1MgYnVpbGQgc3lzdGVtIHRvIA0KPiBwcmVmaXggYWxsIHRo
ZSBzeW1ib2xzIG9mIHRoZSBsaW5rZWQgYmluYXJ5IChoZXJlIFhlbnN0b3JlZCk/DQoNCkhv
dyB3b3VsZCB0aGF0IHdvcms/DQoNCiBGcm9tIE1pbmktT1MgcG9pbnQgb2YgdmlldyBsaWJy
YXJpZXMgYXJlIG5vdCBkaXN0aW5ndWlzaGFibGUgZnJvbSB0aGUNCmxpbmtlZCBhcHBsaWNh
dGlvbi4gVGhpcyB3b3VsZCBtZWFuIHRoZSBidWlsZCBzeXN0ZW0gd291bGQgcHJlZml4IHRo
ZQ0KbGlicmFyeSBzeW1ib2xzIGFzIHdlbGwsIHdoaWxlIHRoZSBhcHBsaWNhdGlvbiB3b3Vs
ZCB0cnkgdG8gcmVmZXJlbmNlDQp0aGUgdGhlIHVuLXByZWZpeGVkIGxpYnJhcnkgc3ltYm9s
cy4NCg0KSSB0aGluayB0aGUgb25seSB3YXkgdG8gYXZvaWQgdGhpcyBraW5kIG9mIHByb2Js
ZW0gd291bGQgYmUgdG8gaGF2ZSBhDQpwb3NpdGl2ZSBsaXN0IG9mIGV4cG9ydGVkIE1pbmkt
T1Mgc3ltYm9scyBhbmQgdG8gaGlkZSBhbGwgb3RoZXIgc3ltYm9scw0KZnJvbSBsaW5rZWQg
bGlicmFyaWVzIGFuZCB0aGUgYXBwLg0KDQpJIGNhbiBsb29rIGludG8gdGhpcywgYnV0IEkn
ZCBsaWtlIHRvIGRvIHRoaXMgd29yayBvdXRzaWRlIG9mIHRoaXMNCnNlcmllcyBpbiBvcmRl
ciBub3QgdG8gYmxvY2sgaXRzIGRldmVsb3BtZW50IGZvciBhbiB1bmtub3duIGFtb3VudCBv
Zg0KdGltZS4NCg0KDQpKdWVyZ2VuDQo=
--------------81dA6Z0I8gfPJMiS77ENMSzt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------81dA6Z0I8gfPJMiS77ENMSzt--

--------------UeeRwZ1C0s8ZWLiEGQYg9Qdt--

--------------O9iS8dAddEzF3d9ehkYb3NVP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVCMZAFAwAAAAAACgkQsN6d1ii/Ey9e
CQf+NvOccrmVTg3p1ADEKtRHslsdjpIFLvvgY+Bo8NRKSHtN/rH0wueHhiFlRy12vARNxRdDnT3Z
Z6Dvy3eH0Pf5+mpsoJF0IIxiRpR+NZWTDgn5ge9rDpRurVWoO5P+sXaUrs8plF7AkV8qMwmIYGd8
7WcUKQFoZBqEqIHRW079RTeP0IXdRBjH9Voui69HMus4K+6ZqJLPi5MEoT6Bx7mQDKEWboob+ng/
AplOlJU3Kv8L2K97uQHbUzMNLp9Je2Pd6DRZ3q1Ecto9IRaDuAEQoagEkWX9etfUMHiM/4Wbdp1M
jG294rEJ0HKFAOvaS9fTiNPf8Rh2goMZxfNol1f+/g==
=IM7Q
-----END PGP SIGNATURE-----

--------------O9iS8dAddEzF3d9ehkYb3NVP--

