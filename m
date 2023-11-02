Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060B7DED27
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 08:15:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626732.977244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyRvY-0004gS-VP; Thu, 02 Nov 2023 07:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626732.977244; Thu, 02 Nov 2023 07:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyRvY-0004eB-ST; Thu, 02 Nov 2023 07:15:40 +0000
Received: by outflank-mailman (input) for mailman id 626732;
 Thu, 02 Nov 2023 07:15:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WoC4=GP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qyRvX-0004e5-Gz
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 07:15:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f1c3f0a-794f-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 08:15:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 10B0E1F74D;
 Thu,  2 Nov 2023 07:15:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE705138EC;
 Thu,  2 Nov 2023 07:15:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +NlyOJhMQ2UxKwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 02 Nov 2023 07:15:36 +0000
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
X-Inumbo-ID: 9f1c3f0a-794f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698909337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3oM/WXWlOfofFMIAK4enqo5aYIL/3bVumnzEpM+AV9M=;
	b=IzJYPPe0MtgObr9gUXTypDBhMOsmF6D8PVqnu9c8hHfodHXylUeHF8/BchHSzEtgQfhsuS
	G8NeSHPZ5Zp9/cJAzItZx8lYPt1u4uXOYUNNj6qNJhp4lr+1igXFBQwups0Ciy/UfkystN
	TbY0d1yEBJI6K3UHenR9KkqCeWXcvnc=
Message-ID: <04a721e4-ba3c-4fda-b8c9-9c45ec179c2d@suse.com>
Date: Thu, 2 Nov 2023 08:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/29] xen/public: add some more 9pfs xenstore paths
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-2-jgross@suse.com>
 <CAKf6xpurEpafOr=UkDhK=5yQs+j3Og0ar6ixGNoRcz6KZt+9LA@mail.gmail.com>
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
In-Reply-To: <CAKf6xpurEpafOr=UkDhK=5yQs+j3Og0ar6ixGNoRcz6KZt+9LA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NkF8Q29L3eKHo0dNAYn7rIw7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NkF8Q29L3eKHo0dNAYn7rIw7
Content-Type: multipart/mixed; boundary="------------RVtsMv0YbLmJgTUNLVNd34IH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <04a721e4-ba3c-4fda-b8c9-9c45ec179c2d@suse.com>
Subject: Re: [PATCH 01/29] xen/public: add some more 9pfs xenstore paths
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-2-jgross@suse.com>
 <CAKf6xpurEpafOr=UkDhK=5yQs+j3Og0ar6ixGNoRcz6KZt+9LA@mail.gmail.com>
In-Reply-To: <CAKf6xpurEpafOr=UkDhK=5yQs+j3Og0ar6ixGNoRcz6KZt+9LA@mail.gmail.com>

--------------RVtsMv0YbLmJgTUNLVNd34IH
Content-Type: multipart/mixed; boundary="------------sp4N3Sg1UMU0MJOkkGlv2mgW"

--------------sp4N3Sg1UMU0MJOkkGlv2mgW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTEuMjMgMTk6MzEsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgNzoyNOKAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gQWRkIHNvbWUgb3B0aW9uYWwgYWRkaXRpb25hbCBiYWNrZW5kIHBh
dGhzIGZvciA5cGZzIFBWIGRldmljZXMuIFRob3NlDQo+PiBwYXRocyB3aWxsIGJlIHN1cHBv
cnRlZCBieSB0aGUgbmV3IHhlbmxvZ2QgOXBmcyBiYWNrZW5kLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gICB4
ZW4vaW5jbHVkZS9wdWJsaWMvaW8vOXBmcy5oIHwgMzQgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vOXBmcy5oIGIveGVu
L2luY2x1ZGUvcHVibGljL2lvLzlwZnMuaA0KPj4gaW5kZXggOWFkMjc3MzA4Mi4uYWM0YmYw
NDM0YiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby85cGZzLmgNCj4+
ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby85cGZzLmgNCj4+IEBAIC03MSw2ICs3MSw0
MCBAQA0KPj4gICAgKiAgICAgICAgICAgICAgICAgY3JlYXRlZCBvbiB0aGUgZ3Vlc3QgKG5v
IHVzZXIgb3duZXJzaGlwIHNxdWFzaCBvciByZW1hcCkNCj4+ICAgICogICAgICAgICBPbmx5
ICJub25lIiBpcyBzdXBwb3J0ZWQgaW4gdGhpcyB2ZXJzaW9uIG9mIHRoZSBwcm90b2NvbC4N
Cj4+ICAgICoNCj4+ICsgKiAgICBtYXgtZmlsZXMNCj4+ICsgKiAgICAgICAgIFZhbHVlczog
ICAgICAgIDx1aW50MzJfdD4NCj4+ICsgKg0KPj4gKyAqICAgICAgICAgVGhlIG1heGltdW0g
bnVtYmVyIG9mIGZpbGVzIChpbmNsdWRpbmcgZGlyZWN0b3JpZXMpIGFsbG93ZWQgZm9yDQo+
PiArICogICAgICAgICB0aGlzIGRldmljZS4gQmFja2VuZCBzdXBwb3J0IG9mIHRoaXMgbm9k
ZSBpcyBvcHRpb25hbC4gSWYgdGhlIG5vZGUNCj4+ICsgKiAgICAgICAgIGlzIG5vdCBwcmVz
ZW50IG9yIHRoZSB2YWx1ZSBpcyB6ZXJvIHRoZSBudW1iZXIgb2YgZmlsZXMgaXMgbm90DQo+
PiArICogICAgICAgICBsaW1pdGVkLg0KPj4gKyAqDQo+PiArICogICAgbWF4LW9wZW4tZmls
ZXMNCj4+ICsgKiAgICAgICAgIFZhbHVlczogICAgICAgIDx1aW50MzJfdD4NCj4+ICsgKg0K
Pj4gKyAqICAgICAgICAgVGhlIG1heGltdW0gbnVtYmVyIG9mIGZpbGVzIHRoZSBndWVzdCBp
cyBhbGxvd2VkIHRvIGhhdmUgb3BlbmVkDQo+PiArICogICAgICAgICBjb25jdXJyZW50bHku
IE11bHRpcGxlIGNvbmN1cnJlbnQgb3BlbnMgb2YgdGhlIHNhbWUgZmlsZSBhcmUgY291bnRl
ZA0KPj4gKyAqICAgICAgICAgaW5kaXZpZHVhbGx5LiBCYWNrZW5kIHN1cHBvcnQgb2YgdGhp
cyBub2RlIGlzIG9wdGlvbmFsLiBJZiB0aGUgbm9kZQ0KPj4gKyAqICAgICAgICAgaXMgbm90
IHByZXNlbnQgb3IgdGhlIHZhbHVlIGlzIHplcm8gYSBiYWNrZW5kIHNwZWNpZmljIGRlZmF1
bHQgaXMNCj4+ICsgKiAgICAgICAgIGFwcGxpZWQuDQo+PiArICoNCj4+ICsgKiAgICBtYXgt
c3BhY2UNCj4+ICsgKiAgICAgICAgIFZhbHVlczogICAgICAgIDx1aW50MzJfdD4NCj4+ICsg
Kg0KPj4gKyAqICAgICAgICAgVGhlIG1heGltdW0gZmlsZSBzcGFjZSBpbiBNaUJzIHRoZSBn
dWVzdCBpcyBhbGxvd2VkIHRvIHVzZSBmb3IgdGhpcw0KPj4gKyAqICAgICAgICAgZGV2aWNl
LiBCYWNrZW5kIHN1cHBvcnQgb2YgdGhpcyBub2RlIGlzIG9wdGlvbmFsLiBJZiB0aGUgbm9k
ZSBpcw0KPj4gKyAqICAgICAgICAgbm90IHByZXNlbnQgb3IgdGhlIHZhbHVlIGlzIHplcm8g
dGhlIHNwYWNlIGlzIG5vdCBsaW1pdGVkLg0KPj4gKyAqDQo+PiArICogICAgYXV0by1kZWxl
dGUNCj4+ICsgKiAgICAgICAgIFZhbHVlczogICAgICAgIDxib29sPg0KPj4gKyAqDQo+PiAr
ICogICAgICAgICBXaGVuIHNldCB0byAiMSIgdGhlIGJhY2tlbmQgd2lsbCBkZWxldGUgdGhl
IGZpbGUgd2l0aCB0aGUgb2xkZXN0DQo+PiArICogICAgICAgICBtb2RpZmljYXRpb24gZGF0
ZSBiZWxvdyA8cGF0aD4gaW4gY2FzZSB0aGUgYWxsb3dlZCBtYXhpbXVtIGZpbGUNCj4+ICsg
KiAgICAgICAgIHNwYWNlIChzZWUgPG1heC1zcGFjZT4pIG9yIGZpbGUgbnVtYmVyIChzZWUg
PG1heC1maWxlcz4pIGlzIGJlaW5nDQo+PiArICogICAgICAgICBleGNlZWRlZCBkdWUgdG8g
Z3Vlc3QgYWN0aXZpdHkgKGNyZWF0aW9uIG9yIGV4dGVuc2lvbiBvZiBmaWxlcykuDQo+PiAr
ICogICAgICAgICBGaWxlcyBjdXJyZW50bHkgb3BlbmVkIGJ5IHRoZSBndWVzdCB3b24ndCBi
ZSBkZWxldGVkLiBCYWNrZW5kDQo+PiArICogICAgICAgICBzdXBwb3J0IG9mIHRoaXMgbm9k
ZSBpcyBvcHRpb25hbC4NCj4+ICsgKg0KPiANCj4gVGhlc2Ugc2VlbSByZWFzb25hYmxlLCBi
dXQgaXQgbG9va3MgbGlrZSB4ZW5sb2dkIG9ubHkgaW1wbGVtZW50cw0KPiBtYXgtb3Blbi1m
aWxlcy4gIFRoZXkgYXJlIGFsbCBtYXJrZWQgb3B0aW9uYWwsIHNvIEkgZ3Vlc3MgaXQncyBv
a2F5IHRvDQo+IGluY2x1ZGUgdGhlbS4gIElzIHRoZXJlIGEgcGxhbiB0byBpbXBsZW1lbnQg
dGhlbT8gIE1heWJlIGhvbGQgb2ZmDQo+IHVudGlsIGFuIGltcGxlbWVudGF0aW9uIGNvbWVz
IGFsb25nPw0KDQpTZWUgdGhlIGNvdmVyIGxldHRlciBvZiB0aGUgc2VyaWVzLg0KDQoNCkp1
ZXJnZW4NCg==
--------------sp4N3Sg1UMU0MJOkkGlv2mgW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------sp4N3Sg1UMU0MJOkkGlv2mgW--

--------------RVtsMv0YbLmJgTUNLVNd34IH--

--------------NkF8Q29L3eKHo0dNAYn7rIw7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVDTJgFAwAAAAAACgkQsN6d1ii/Ey99
Dwf+K3GftvWntr2foQrV2bjkbi59oKznbwU00pHi3o62dyFCl/tsiUpO9mqn4kO1FKmwKr63mS+n
0gWFqwjKMidaa5GzQvKYgqFwQMVuGl13Z4d+J6t8MADX8DtevgHYHlWbZYLiiYZ29dBCiNvDm1eV
WzDvvYc1pGV40LD227IX6faTnAerUHpXAfg4LgZADGz5srTqui43iEH5nlXyWqkURGEz/3k60HUK
eIa2BThLNjG3czKN98QLyKr7Ci2vtn2sc+VD+0C6pDjGR4Obb5XczyprCNdSjbEE5SqCxbbbVPAZ
lTaan4wI3qnRUOQeIJ8PYnfZZ67/1gUhSmPmC/V0kQ==
=/xuk
-----END PGP SIGNATURE-----

--------------NkF8Q29L3eKHo0dNAYn7rIw7--

