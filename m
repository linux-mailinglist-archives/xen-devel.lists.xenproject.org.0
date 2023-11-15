Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648D67EBFB7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 10:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633533.988404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3CXM-0006bM-RU; Wed, 15 Nov 2023 09:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633533.988404; Wed, 15 Nov 2023 09:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3CXM-0006Zh-NQ; Wed, 15 Nov 2023 09:50:20 +0000
Received: by outflank-mailman (input) for mailman id 633533;
 Wed, 15 Nov 2023 09:50:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzjc=G4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r3CXL-0006Zb-RG
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 09:50:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61b8fcda-839c-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 10:50:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4448B204E3;
 Wed, 15 Nov 2023 09:50:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B16E139B7;
 Wed, 15 Nov 2023 09:50:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id shAoAViUVGW1OgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Nov 2023 09:50:16 +0000
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
X-Inumbo-ID: 61b8fcda-839c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700041816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s42qWuhl8D+gywZ3U57xvvGE/jE062pz5yhOqyKIe2A=;
	b=N9b5HQiomXiY2+2Y1v9X7Xtzx2XBFVAxxl/3+iyAdjCtMk1IPOANLNh92REzfw0bRZC/kP
	0IrfN1DmPAa9GGRe1FnA/GqrFgMcr7XdsiJg4pk4SaU7Fe/+WZ2ZelDQnUkolw//fQXsgb
	wTJoLFgcuXrptfrbVnUVM3zPlFnD1yE=
Message-ID: <255acc99-4d9b-4734-9d9a-ed73d584bb1b@suse.com>
Date: Wed, 15 Nov 2023 10:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] tools/xenstored: remove "-N" command line option
Content-Language: en-US
To: Edwin Torok <edwin.torok@cloud.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231113124309.10862-1-jgross@suse.com>
 <20231113124309.10862-5-jgross@suse.com>
 <dca79398-a793-483a-83da-8dea2b28c49f@citrix.com>
 <3AB123DE-1F6C-4252-BF4C-0AE89FB8508B@cloud.com>
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
In-Reply-To: <3AB123DE-1F6C-4252-BF4C-0AE89FB8508B@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3h0E9sp6K7VFSpcUUTVUimeS"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.99
X-Spamd-Result: default: False [-7.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 TO_DN_ALL(0.00)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3h0E9sp6K7VFSpcUUTVUimeS
Content-Type: multipart/mixed; boundary="------------flTnMR9IZn5Dzs94Xp7FzCbA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Edwin Torok <edwin.torok@cloud.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <255acc99-4d9b-4734-9d9a-ed73d584bb1b@suse.com>
Subject: Re: [PATCH 4/5] tools/xenstored: remove "-N" command line option
References: <20231113124309.10862-1-jgross@suse.com>
 <20231113124309.10862-5-jgross@suse.com>
 <dca79398-a793-483a-83da-8dea2b28c49f@citrix.com>
 <3AB123DE-1F6C-4252-BF4C-0AE89FB8508B@cloud.com>
In-Reply-To: <3AB123DE-1F6C-4252-BF4C-0AE89FB8508B@cloud.com>

--------------flTnMR9IZn5Dzs94Xp7FzCbA
Content-Type: multipart/mixed; boundary="------------2SY54LYoTaW5fMz90MzO5DD7"

--------------2SY54LYoTaW5fMz90MzO5DD7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMTEuMjMgMDk6MzEsIEVkd2luIFRvcm9rIHdyb3RlOg0KPiANCj4gDQo+PiBPbiAx
NCBOb3YgMjAyMywgYXQgMjI6MTEsIEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIDEzLzExLzIwMjMgMTI6NDMgcG0sIEp1ZXJn
ZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gVGhlICItTiIgKGRvIG5vdCBkYWVtb25pemUpIGNvbW1h
bmQgbGluZSBvcHRpb24gaXMgb2YgcXVlc3Rpb25hYmxlIHVzZToNCj4+PiBpdHMgc29sZSBw
dXJwb3NlIHNlZW1zIHRvIGJlIHRvIGFpZCBkZWJ1Z2dpbmcgb2YgeGVuc3RvcmVkIGJ5IG1h
a2luZyBpdA0KPj4+IGVhc2llciB0byBzdGFydCB4ZW5zdG9yZWQgdW5kZXIgZ2RiLCBvciB0
byBzZWUgYW55IGRlYnVnIG1lc3NhZ2VzDQo+Pj4gZWFzaWx5Lg0KPj4+DQo+Pj4gRGVidWcg
bWVzc2FnZXMgY2FuIGFzIHdlbGwgYmUgc2VudCB0byBzeXNsb2coKSwgd2hpbGUgZ2RiIGNh
biBiZQ0KPj4+IGF0dGFjaGVkIHRvIHRoZSBkYWVtb24gZWFzaWx5LiBUaGUgb25seSBub3Qg
Y292ZXJlZCBjYXNlIGlzIGFuIGVycm9yDQo+Pj4gd2hpbGUgaW5pdGlhbGl6aW5nIHhlbnN0
b3JlZCwgYnV0IHRoaXMgY291bGQgYmUgaGFuZGxlZCBlLmcuIGJ5IHNhdmluZw0KPj4+IGEg
Y29yZSBkdW1wLCB3aGljaCBjYW4gYmUgYW5hbHl6ZWQgbGF0ZXIuDQo+Pj4NCj4+PiBUaGUg
Y2FsbCBvZiB0YWxsb2NfZW5hYmxlX2xlYWtfcmVwb3J0X2Z1bGwoKSBkb25lIG9ubHkgd2l0
aCAiLU4iDQo+Pj4gc3BlY2lmaWVkIGlzIG5vIGxvbmdlciBuZWVkZWQsIGFzIHRoZSBzYW1l
IGNhbiBiZSBhY2hpZXZlZCB2aWENCj4+PiAieGVuc3RvcmUtY29udHJvbCBtZW1yZXBvcnQi
Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KPj4NCj4+IENDIEVkdmluLg0KPj4NCj4+IFRoZXJlJ3MgYSBwYXRjaCBvdXQgdG8g
c3BlY2lmaWNhbGx5IHVzZSB0aGlzIG9wdGlvbiAodW5kZXIgc3lzdGVtZCkgdG8NCj4+IGZp
eCBhIGJ1ZyB3ZSBmb3VuZC4NCj4+DQo+PiBJIGNhbid0IHJlY2FsbCB0aGUgZGV0YWlscywg
YnV0IEkgc2VlbSB0byByZWNhbGwgaXQgd2Fzbid0IHNwZWNpZmljIHRvDQo+PiBveGVuc3Rv
cmVkLg0KPj4NCj4gDQo+IA0KPiBUaGUgcGF0Y2ggaXMgaGVyZSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy94ZW4tZGV2ZWwvRUNGQTE1QTctOURDOC00NDc2LThEMEItNDRBNkQxMjE5MkQ2
QGNsb3VkLmNvbS8NCj4gDQo+IEl0IGlzIGFib3V0IG5vdCBsb3Npbmcgc3RkZXJyIHdoZW4g
cnVuIHVuZGVyIHN5c3RlbWQgKHdlbGwgeW91IGNhbiB1c2Ugc3lzbG9nIGJ1dCB3aGF0IGlm
IHlvdXIgY29ubmVjdGlvbiB0byBzeXNsb2cgZmFpbHMgb3IgeW91IGZhaWwgYmVmb3JlIGdl
dHRpbmcgdG8gdGhlIHBvaW50IG9mIHBhcnNpbmcgd2hpY2ggc3lzbG9nIHRvIHVzZSkuDQo+
IEFsdGVybmF0aXZlbHkgd2UgY291bGQgaGF2ZSBhICJkb24ndCByZWRpcmVjdCBzdGRlcnIg
dG8gL2Rldi9udWxsIiBmbGFnLA0KPiBidXQgc3VjaCByZWRpcmVjdGlvbnMgYXJlIHVzdWFs
bHkgZXhwZWN0ZWQgd2hlbiBkYWVtb25pemluZy4NCj4gDQo+IEl0J2QgYmUgZ29vZCBpZiB0
aGUgLS1uby1mb3JrIGZsYWcgY291bGQgYmUgcmV0YWluZWQgZm9yIEMgeGVuc3RvcmVkLCBj
dXJyZW50bHkgdGhlcmUgaXMgYSBDSSBmYWlsdXJlIG9uIGEgbm9uLXN5c3RlbWQgc3lzdGVt
IHRoYXQgSSdtIHRyeWluZyB0byBmaXggKGEgYml0IGJsaW5kbHkgYmVjYXVzZSBJIGRvbid0
IGhhdmUgc3VjaCBhIHN5c3RlbSBteXNlbGYpLCBidXQgZnJvbSBteSB0ZXN0aW5nIHRoZSBm
bGFnIGRvZXMgd29yayBvbiBhIHN5c3RlbWQgc3lzdGVtIHdpdGggQyB4ZW5zdG9yZWQuDQo+
IA0KPiBUaGUgcGF0Y2ggaXMgbW90aXZhdGVkIGJ5IGhhdmluZyBzb21lIHVuZGVidWdnYWJs
ZSBpc3N1ZXMgaW4gb3hlbnN0b3JlZCB3aGVyZSBpdCBqdXN0IGV4aXRzIHdpdGhvdXQgd3Jp
dGluZyBhbnkgbWVzc2FnZXMgYW5kIHdpdGhvdXQgZHVtcGluZyBjb3JlLCBzbyBieSByZXRh
aW5pbmcgdGhlIHN0ZGVyciBwYXRoIHdlIHNob3VsZCBoYXZlIGFuIG91dHB1dCBvZiBsYXN0
IHJlc29ydCBpbiBjYXNlIHNvbWV0aGluZyBnb2VzIHNvIHdyb25nIHRoYXQgdGhlIHN5c2xv
ZyBlcnJvciBoYW5kbGVyIGNhbm5vdCBmdW5jdGlvbi4NCg0KVXNpbmcgdGhlIC0tbm8tZm9y
ayBhcyBpbiB5b3VyIHBhdGNoIHdvdWxkIG1lYW4gdGhhdCBzZXR0aW5nIHRoZSBvb21fc2Nv
cmUgaW4NCnRoZSBsYXVjaF94ZW5zdG9yZSBzY3JpcHQgd291bGRuJ3QgYmUgZXhlY3V0ZWQg
YW55IGxvbmdlciwgcmlnaHQ/DQoNCg0KSnVlcmdlbg0K
--------------2SY54LYoTaW5fMz90MzO5DD7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2SY54LYoTaW5fMz90MzO5DD7--

--------------flTnMR9IZn5Dzs94Xp7FzCbA--

--------------3h0E9sp6K7VFSpcUUTVUimeS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVUlFcFAwAAAAAACgkQsN6d1ii/Ey8V
ZQf/eb5upRn+iR3svFTp/WLQdE2QSU4ebrbt9KifsP3E2fdLVro99W/bdTPqmM7VyeWWTUKx6XhO
pspPTCwBLrhUSa5MNxgXnCTVaHHSeKWtFa5m8KdmMzJ7Yjo4aLc+F5kIju7C81ZvTXAZB2aALeVZ
E2/A9V2Kri8AluiY1h7JhGDdz6/mGI1D2M39eACWVBdi5nZOVO/T2+XkvqwCyOE6gCtlK4sABsZ9
EeJzaqAqDtw5bIVIOED7ZNk6uabzYp0NUR37EF199/YJpOGues5i9N/eJxdXLW5a0I1c9wXt3gNK
u55SCDNl2Q1LIzE9o0C3mqJUPBOmgH+siMFFAqRO0A==
=S0B2
-----END PGP SIGNATURE-----

--------------3h0E9sp6K7VFSpcUUTVUimeS--

