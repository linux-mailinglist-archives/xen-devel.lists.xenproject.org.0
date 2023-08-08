Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86547739C4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579607.907657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKCU-0000vp-Jj; Tue, 08 Aug 2023 10:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579607.907657; Tue, 08 Aug 2023 10:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKCU-0000tm-HB; Tue, 08 Aug 2023 10:44:30 +0000
Received: by outflank-mailman (input) for mailman id 579607;
 Tue, 08 Aug 2023 10:44:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw+Y=DZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qTKCT-0000tg-35
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:44:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c3174c7-35d8-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 12:44:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 44D2B22492;
 Tue,  8 Aug 2023 10:44:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16F4F139D1;
 Tue,  8 Aug 2023 10:44:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CtPSA4sc0mQDPgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Aug 2023 10:44:27 +0000
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
X-Inumbo-ID: 8c3174c7-35d8-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691491467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JQt/6oSGcQmeP+N1n6U41fB3kJA/D3HeA5RfDDxn/bk=;
	b=bU45MmruvdYA8Vy3jmkMxGHclvpwbeSDxWfZz6OfYOwyG/SAnAk8DR3OTWXHcr0Kxp+cSs
	GsyEoptgKEAHlRyHLeF+TZ1AEKnXcG4bfkNdmP5s0fCxPuSZcT9f8Oi49+T3Ht1Xc2WDgg
	46EDXMsiYG/PGYL06Ke85vBOUUgPbrw=
Message-ID: <c9eabc45-b511-257e-1b39-0002b5b71444@suse.com>
Date: Tue, 8 Aug 2023 12:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools: add configure option for libfsimage
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20230804060000.27710-1-jgross@suse.com>
 <20230804060000.27710-3-jgross@suse.com>
 <4679e0f5-f5ea-4182-887c-0fe65539f9c2@perard>
 <a14dfa26-c8cd-debd-e069-74d4c11d228d@citrix.com>
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
In-Reply-To: <a14dfa26-c8cd-debd-e069-74d4c11d228d@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Euz5ftqUSIiz00qhiAls9s8i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Euz5ftqUSIiz00qhiAls9s8i
Content-Type: multipart/mixed; boundary="------------uJ8vfuxMDRk7ZgE0k7s1dmKD";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <c9eabc45-b511-257e-1b39-0002b5b71444@suse.com>
Subject: Re: [PATCH 2/2] tools: add configure option for libfsimage
References: <20230804060000.27710-1-jgross@suse.com>
 <20230804060000.27710-3-jgross@suse.com>
 <4679e0f5-f5ea-4182-887c-0fe65539f9c2@perard>
 <a14dfa26-c8cd-debd-e069-74d4c11d228d@citrix.com>
In-Reply-To: <a14dfa26-c8cd-debd-e069-74d4c11d228d@citrix.com>

--------------uJ8vfuxMDRk7ZgE0k7s1dmKD
Content-Type: multipart/mixed; boundary="------------I0mXE28OvUUKOAOS0VwzC8rl"

--------------I0mXE28OvUUKOAOS0VwzC8rl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDguMjMgMTI6NDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA4LzA4LzIw
MjMgMTE6MzUgYW0sIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4gT24gRnJpLCBBdWcgMDQs
IDIwMjMgYXQgMDg6MDA6MDBBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+PiBU
aGUgb25seSBpbi10cmVlIHVzZXIgb2YgbGliZnNpbWFnZSBpcyBweWdydWIuIE5vdyB0aGF0
IGl0IGlzIHBvc3NpYmxlDQo+Pj4gdG8gZGlzYWJsZSB0aGUgYnVpbGQgb2YgcHlncnViLCB0
aGUgc2FtZSBzaG91bGQgYmUgcG9zc2libGUgZm9yDQo+Pj4gbGliZnNpbWFnZS4NCj4+Pg0K
Pj4+IEFkZCBhbiBvcHRpb24gZm9yIGNvbnRyb2xsaW5nIHRoZSBidWlsZCBvZiBsaWJmc2lt
YWdlLiBUaGUgZGVmYXVsdCBpcw0KPj4+IG9uIGlmIHB5Z3J1YiBpcyBiZWluZyBidWlsdCwg
YW5kIG9mZiBpZiBpdCBpc24ndC4gV2l0aG91dCBweWdydWIgdGhlDQo+Pj4gYnVpbGQgb2Yg
bGliZnNpbWFnZSBjYW4gYmUgZW5hYmxlZCB2aWEgLS1lbmFibGUtbGliZnNpbWFnZS4NCj4+
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4N
Cj4+PiAtLS0NCj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvY29uZmlndXJlLmFjIGIvdG9vbHMv
Y29uZmlndXJlLmFjDQo+Pj4gaW5kZXggOTk0N2JjZWZjNi4uYWVhMjRlYjk4MiAxMDA2NDQN
Cj4+PiAtLS0gYS90b29scy9jb25maWd1cmUuYWMNCj4+PiArKysgYi90b29scy9jb25maWd1
cmUuYWMNCj4+PiBAQCAtMTg1LDYgKzE4NSwxOSBAQCBBU19JRihbdGVzdCAieCRlbmFibGVf
cm9tYmlvcyIgPSAieHllcyJdLCBbDQo+Pj4gICBdKQ0KPj4+ICAgQUNfU1VCU1Qocm9tYmlv
cykNCj4+PiAgIA0KPj4+ICtBQ19BUkdfRU5BQkxFKFtsaWJmc2ltYWdlXSwNCj4+PiArICAg
IEFTX0hFTFBfU1RSSU5HKFstLWVuYWJsZS1saWJmc2ltYWdlXSwNCj4+PiArICAgICAgICAg
ICAgICAgICAgIFtFbmFibGUgbGliZnNpbWFnZSwgKERFRkFVTFQgaXMgb24gaWYgcHlncnVi
IGlzIGVuYWJsZWQsDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgb3RoZXJ3aXNlIG9mZild
KSwsWw0KPj4+ICsgICAgQVNfSUYoW3Rlc3QgIngkZW5hYmxlX3B5Z3J1YiIgPSAieG5vIl0s
IFsNCj4+PiArICAgICAgICBlbmFibGVfbGliZnNpbWFnZT0ibm8iDQo+Pj4gKyAgICBdLCBb
DQo+Pj4gKyAgICAgICAgZW5hYmxlX2xpYmZzaW1hZ2U9InllcyINCj4+PiArICAgIF0pDQo+
Pj4gK10pDQo+Pj4gK0FTX0lGKFt0ZXN0ICJ4JGVuYWJsZV9saWJmc2ltYWdlIiA9ICJ4eWVz
Il0sIFtsaWJmc2ltYWdlPXldLCBbbGliZnNpbWFnZT1uXSkNCj4+PiArQUNfU1VCU1QobGli
ZnNpbWFnZSkNCj4+PiArDQo+PiBTaG91bGQgd2UgaXNzdWUgYW4gZXJyb3IgaWYgb25lIGRv
ZXMgIi0tZGlzYWJsZS1saWJmc2ltYWdlDQo+PiAtLWVuYWJsZS1weWdydWIiID8gT3IganVz
dCBsZXQgdGhlIGJ1aWxkIG9mIHB5Z3J1YiBmYWlscz8NCj4gDQo+IEluIHN1Y2ggYSBjYXNl
LCBpdCB3b3VsZG4ndCBiZSBhIGJ1aWxkIGZhaWx1cmUuwqAgSXQgd291bGQgZmFpbCBhdA0K
PiBydW50aW1lIHdpdGggYW4gSW1wb3J0RXJyb3IuDQoNCkluZGVlZC4NCg0KSSdsbCB1cGRh
dGUgdGhlIHBhdGNoIHRvIGZhaWwgY29uZmlndXJlIGluIHN1Y2ggYSBjYXNlLg0KDQoNCkp1
ZXJnZW4NCg0K
--------------I0mXE28OvUUKOAOS0VwzC8rl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------I0mXE28OvUUKOAOS0VwzC8rl--

--------------uJ8vfuxMDRk7ZgE0k7s1dmKD--

--------------Euz5ftqUSIiz00qhiAls9s8i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTSHIoFAwAAAAAACgkQsN6d1ii/Ey/M
ogf9E/YGsiVwG/jrhJtqgxORkOgPb8rrJNB9L9FwZwAxeY97l+HGorptsz2V+cQV5WG1oHsYBZvt
UArlBWAaZ49PLOOSJByL1kYTxjtTpIdybq6KJmKO4B+nc9JS70JKMYwHrBye0g3/jsZQG6D5ZGK/
lyAkzbY+T0WEFCEk1ID14LEZluQHTCzZnWeFMdf6pisnUhKQIy/zamI3JULgc/cyA24Wm0xKgwQq
dB0x5F6oLXsjNoUQm3HOhuR8pgb+nTdfBDTOZxc35NKbgcQXXzTbc4HCLGBR1sm/ZiMnuQCqhDDD
A4PRnVEyU38rYi8oH77fzJBDZeeJSAqomB2GwAA9nQ==
=ZS32
-----END PGP SIGNATURE-----

--------------Euz5ftqUSIiz00qhiAls9s8i--

