Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78757FD994
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 15:36:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643941.1004532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Lfl-000586-3X; Wed, 29 Nov 2023 14:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643941.1004532; Wed, 29 Nov 2023 14:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Lfl-00056J-0l; Wed, 29 Nov 2023 14:36:17 +0000
Received: by outflank-mailman (input) for mailman id 643941;
 Wed, 29 Nov 2023 14:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q0oM=HK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r8Lfk-00056D-EF
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 14:36:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a646edeb-8ec4-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 15:36:15 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5CDC91F8C0;
 Wed, 29 Nov 2023 14:36:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19F681388B;
 Wed, 29 Nov 2023 14:36:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uS8UBV1MZ2UdXAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 29 Nov 2023 14:36:13 +0000
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
X-Inumbo-ID: a646edeb-8ec4-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701268573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=izMMQ9l+iOIDAjX+eipjD7IhJecmU+ScpBeWIXlza8Q=;
	b=lDKa1dyikLKbxA1Jk/1mzHz9B+eX5lKvG96N3gNbjzlCyWnuW90fHfBPFZiWuWwHXIyNT5
	XWyxaOHj16nJGkcw+EcqyvGHeohwSkeY9xmdvc1/aOBjVpoh1dKx4v0OjV/XqU8djrAtVy
	po30a+tVXPSQhQwqL4z+ehhUI6J01iM=
Message-ID: <6509a26d-4b21-4c5f-82f5-12bbd3f9aa35@suse.com>
Date: Wed, 29 Nov 2023 15:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config.mk: drop -Wdeclaration-after-statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Alexander Kanavin <alex@linutronix.de>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
References: <20231128174729.3880113-1-alex@linutronix.de>
 <fcb1cc57-b985-4711-a234-4aaa380b9abe@suse.com>
 <81043e30-c9fd-4c5e-ad63-0e42edea733d@linutronix.de>
 <5a469665-54b2-4904-9604-ad686fbbb05e@xen.org>
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
In-Reply-To: <5a469665-54b2-4904-9604-ad686fbbb05e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------b0UK0zm06A0v74K5G3L85m5y"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.99
X-Spamd-Result: default: False [-1.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.00)[25.39%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------b0UK0zm06A0v74K5G3L85m5y
Content-Type: multipart/mixed; boundary="------------CiSyxas4BtA05MHhfhjYUtrF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Alexander Kanavin <alex@linutronix.de>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <6509a26d-4b21-4c5f-82f5-12bbd3f9aa35@suse.com>
Subject: Re: [PATCH] Config.mk: drop -Wdeclaration-after-statement
References: <20231128174729.3880113-1-alex@linutronix.de>
 <fcb1cc57-b985-4711-a234-4aaa380b9abe@suse.com>
 <81043e30-c9fd-4c5e-ad63-0e42edea733d@linutronix.de>
 <5a469665-54b2-4904-9604-ad686fbbb05e@xen.org>
In-Reply-To: <5a469665-54b2-4904-9604-ad686fbbb05e@xen.org>

--------------CiSyxas4BtA05MHhfhjYUtrF
Content-Type: multipart/mixed; boundary="------------k05oRovA5vK20XGqZv3avgaI"

--------------k05oRovA5vK20XGqZv3avgaI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMTEuMjMgMTE6NDcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiAr
IEFudGhvbnkgZm9yIHRoZSB0b29scw0KPiArIEp1ZXJnZW4gZm9yIFhlbnN0b3JlZA0KPiAN
Cj4gT24gMjkvMTEvMjAyMyAxMTozNCwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+PiBP
biAxMS8yOS8yMyAwODo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pg0KPj4+IE9uIDI4LjEx
LjIwMjMgMTg6NDcsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPj4+PiBTdWNoIGNvbnN0
cnVjdHMgYXJlIGZ1bGx5IGFsbG93ZWQgYnkgQzk5Og0KPj4+PiBodHRwczovL2djYy5nbnUu
b3JnL29ubGluZWRvY3MvZ2NjLTEyLjIuMC9nY2MvTWl4ZWQtTGFiZWxzLWFuZC1EZWNsYXJh
dGlvbnMuaHRtbCNNaXhlZC1MYWJlbHMtYW5kLURlY2xhcmF0aW9ucw0KPj4+IFRoZXJlJ3Mg
bW9yZSB0byB0aGlzOiBJdCBtYXkgYWxzbyBiZSBhIHBvbGljeSBvZiBvdXJzIChvciBvZiBh
bnkgc3ViLWNvbXBvbmVudCkNCj4+PiB0byBkZW1hbmQgdGhhdCBkZWNsYXJhdGlvbnMgYW5k
IHN0YXRlbWVudHMgYXJlIHByb3Blcmx5IHNlcGFyYXRlZC4gVGhpcyB3b3VsZA0KPj4+IHRo
ZXJlZm9yZSBuZWVkIGRpc2N1c3NpbmcgZmlyc3QuDQo+Pg0KPj4gVGhlIGVycm9yIGlzIGNv
bWluZyBmcm9tIHB5dGhvbiAzLjEyIGhlYWRlcnMgYW5kIG5vdCBmcm9tIGFueXRoaW5nIGlu
IHhlbiANCj4+IHRyZWUsIG5vPyBBcyB5b3UgZG9uJ3QgaGF2ZSBjb250cm9sIG92ZXIgdGhv
c2UgaGVhZGVycywgSSdtIG5vdCBzdXJlIHdoYXQgDQo+PiBvdGhlciBzb2x1dGlvbiB0aGVy
ZSBjb3VsZCBiZS4NCj4gDQo+IFdlIHNlZW0gdG8gYWRkIC1Xbm8tZGVjbGFyYXRpb24tYWZ0
ZXItc3RhdGVtZW50IGZvciBzb21lIGNvbXBvbmVudHMgaW4gdG9vbHMvLiANCj4gU28gb25l
IHBvc3NpYmlsaXR5IHdvdWxkIGJlIHRvIG1vdmUgdGhlIGZsYWdzIHRvIGFuIGh5cGVydmlz
b3Igc3BlY2lmaWMgbWFrZWZpbGUgDQo+IChpbiB4ZW4vKS4NCj4gDQo+IEFudGhvbnkvSnVl
cmdlbiwgZG8geW91IGhhdmUgYW55IGNvbmNlcm4gaWYgdGhlIHRvb2xzIGFyZSBidWlsdCB3
aXRob3V0IA0KPiAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudD8NCg0KSSBjb3VsZCBs
aXZlIHdpdGggdGhhdC4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------k05oRovA5vK20XGqZv3avgaI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------k05oRovA5vK20XGqZv3avgaI--

--------------CiSyxas4BtA05MHhfhjYUtrF--

--------------b0UK0zm06A0v74K5G3L85m5y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVnTFwFAwAAAAAACgkQsN6d1ii/Ey8h
KAf+LdcOg0CDCuDgKYrvWbIWhh//Yqu13mFVwlOf7M3K2/IMyYwljSiRmhBqvK4TAlDTrARzCKsb
gusEZBKi9uyjbm9sksPtsemroxtuo+njlwYX1YJVM26Dx32m6Z/RT8g/M3Ong+tGVE12thl/7clf
qxO0bu8nPsjYt/ffEojqPrj7/40oL+BJThLfGTTwihv2WTr/WRLzeehrRCz3/lMjGpvMwqIAvTAY
gTif/Ays1R4DFGBS5OfSWRUbQxFzPrcgJUricbBjdw0poagEYaYht338o2g2ktX7qwyYHOyFRz8u
3Qu0kUrJFmxY2o26MRpK1cAHv9xbQr7MoE7r9R6/3w==
=g2j7
-----END PGP SIGNATURE-----

--------------b0UK0zm06A0v74K5G3L85m5y--

