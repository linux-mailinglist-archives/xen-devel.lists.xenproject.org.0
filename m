Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B7B5E9A07
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 09:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411414.654333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ociAi-0000Fm-Hi; Mon, 26 Sep 2022 07:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411414.654333; Mon, 26 Sep 2022 07:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ociAi-0000DP-F0; Mon, 26 Sep 2022 07:04:56 +0000
Received: by outflank-mailman (input) for mailman id 411414;
 Mon, 26 Sep 2022 07:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ba90=Z5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ociAh-0000DJ-AL
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 07:04:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 856363f8-3d69-11ed-9647-05401a9f4f97;
 Mon, 26 Sep 2022 09:04:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 582B721FDF;
 Mon, 26 Sep 2022 07:04:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3885E139BD;
 Mon, 26 Sep 2022 07:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dWknDBVPMWPFLgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 26 Sep 2022 07:04:53 +0000
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
X-Inumbo-ID: 856363f8-3d69-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664175893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=383tKbIORzI1H9zfDGWRtd+RfgH59qGXSaCnMCQVsig=;
	b=HW1FmQtjfNh1AKXFUPC4XCg+i0x9ipItddYrBDAOKF94ukMIWCFmpYO4QM6Hxr+TJQ6nWL
	6w7jnmVLnpbBUwCuNDSN65HQL1nJ6Cu1BtVdzvU2F6QX5ryT1A6ZFax9CG3zNpRUKeZFbC
	wkJfSwOKHZMvxoqYMe5KQkGnYFlA+Os=
Message-ID: <12ef0abb-2158-faf7-76d7-61e165060d0c@suse.com>
Date: Mon, 26 Sep 2022 09:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YyxmQf+q0BqsX8Nb@mail-itl>
 <cb4829d0-ca64-9f41-8a0f-48cf6ce84040@suse.com>
 <767eeb85-40ab-70f6-2d0f-f81af0a65f6e@suse.com>
 <192f76e1-4f5a-34e7-84e7-a78da531607a@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Design session "grant v3"
In-Reply-To: <192f76e1-4f5a-34e7-84e7-a78da531607a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PfxmkzBrU7vcsAkgFckMCu8H"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PfxmkzBrU7vcsAkgFckMCu8H
Content-Type: multipart/mixed; boundary="------------AFg0d5zVGksTmmsatDsYIh67";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <12ef0abb-2158-faf7-76d7-61e165060d0c@suse.com>
Subject: Re: Design session "grant v3"
References: <YyxmQf+q0BqsX8Nb@mail-itl>
 <cb4829d0-ca64-9f41-8a0f-48cf6ce84040@suse.com>
 <767eeb85-40ab-70f6-2d0f-f81af0a65f6e@suse.com>
 <192f76e1-4f5a-34e7-84e7-a78da531607a@suse.com>
In-Reply-To: <192f76e1-4f5a-34e7-84e7-a78da531607a@suse.com>

--------------AFg0d5zVGksTmmsatDsYIh67
Content-Type: multipart/mixed; boundary="------------r7sMqSS8ZqNi1Ty98nvfm00l"

--------------r7sMqSS8ZqNi1Ty98nvfm00l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDkuMjIgMDg6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wOS4yMDIy
IDExOjMxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjIuMDkuMjIgMjA6NDMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIyLjA5LjIwMjIgMTU6NDIsIE1hcmVrIE1hcmN6
eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+Pj4gWWFubjogICBjYW4gYmFja2VuZCByZWZ1
c2UgcmV2b2tpbmc/DQo+Pj4+IErDvHJnZW46IGl0IHNob3VsZG4ndCBiZSB0aGlzIHdheSwg
YnV0IHJldm9rZSBjb3VsZCBiZSBjb250cm9sbGVkIGJ5IGZlYXR1cmUgZmxhZzsgcmV2b2tl
IGNvdWxkIHBhc3Mgc2NyYXRjaCBwYWdlIHBlciByZXZva2UgY2FsbCAobW9yZSBmbGV4aWJs
ZSBjb250cm9sKQ0KPj4+DQo+Pj4gQSBzaW5nbGUgc2NyYXRjaCBwYWdlIGNvbWVzIHdpdGgg
dGhlIHJpc2sgb2YgZGF0YSBjb3JydXB0aW9uLCBhcyBhbGwNCj4+PiBJL08gd291bGQgYmUg
ZGlyZWN0ZWQgdGhlcmUuIEEgc2luayBwYWdlIChmb3IgbWVtb3J5IHdyaXRlcykgd291bGQN
Cj4+PiBsaWtlbHkgYmUgb2theSwgYnV0IGRldmljZSB3cml0ZXMgKG1lbW9yeSByZWFkcykg
Y2FuJ3QgYmUgZG9uZSBmcm9tDQo+Pj4gYSBzdXJyb2dhdGUgcGFnZS4NCj4+DQo+PiBJIGRv
bid0IHNlZSB0aGF0IHByb2JsZW0uDQo+Pg0KPj4gSW4gY2FzZSB0aGUgZ3JhbnQgaXMgcmV2
b2tlZCBkdWUgdG8gYSBtYWxpY2lvdXMvYnVnZ3kgYmFja2VuZCwgeW91IGNhbid0DQo+PiB0
cnVzdCB0aGUgSS9PIGRhdGEgYW55d2F5Lg0KPiANCj4gSSBhZ3JlZSBmb3IgdGhlIG1hbGlj
aW91cyBjYXNlLCBidXQgSSdtIGxlc3MgY2VydGFpbiB3aGVuIGlzIGNvbWUgdG8NCj4gYnVn
Z3kgYmFja2VuZHMuIFNvbWUgYnVncyAobGlrZSBub3QgdW5tYXBwaW5nIGEgZ3JhbnQpIGFy
ZW4ndCBwdXR0aW5nDQo+IHRoZSBkYXRhIGF0IHJpc2suDQoNCkluIGNhc2UgdGhlIGRhdGEg
cGFnZSBjYW4ndCBiZSB1c2VkIGZvciBhbnl0aGluZyBlbHNlLCB3aGF0IHdvdWxkIGJlIHRo
ZQ0KcG9pbnQgb2YgcmV2b2tpbmcgdGhlIGdyYW50PyBUaGUgcGFnZSB3b3VsZCBsZWFrIGlu
IGJvdGggY2FzZXMgKHJldm9raW5nDQpvciBub3QpLg0KDQo+IA0KPj4+PiBKw7xyZ2VuOiB3
ZSBzaG91bGQgY29uc2lkZXIgaW50ZXJmYWNlIHRvIG1hcHBpbmcgbGFyZ2UgcGFnZXMgKCJt
YXAgdGhpcyBhcmVhIGFzIGEgbGFyZ2UgcGFnZSBpZiBiYWNrZW5kIHNoYXJlZCBpdCBhcyBs
YXJnZSBwYWdlIikNCj4+Pg0KPj4+IHMvYmFja2VuZC9mcm9udGVuZC8gSSBndWVzcz8NCj4+
DQo+PiBZZXMuDQo+Pg0KPj4gQnV0IGxhcmdlIHBhZ2VzIGhhdmUgYW5vdGhlciBkb3duc2lk
ZTogVGhlIGJhY2tlbmQgbmVlZHMgdG8ga25vdyBpdCBpcyBhIGxhcmdlDQo+PiBwYWdlLCBv
dGhlcndpc2UgaXQgbWlnaHQgZ2V0IGNvbmZ1c2VkLiBTbyB3aGlsZSB0aGlzIHNvdW5kcyBs
aWtlIGEgbmljZSBpZGVhLCBpdA0KPj4gaXMgY3VtYmVyc29tZSBpbiBwcmFjdGljZS4gQnV0
IG1heWJlIHNvbWVvbmUgaXMgY29taW5nIHVwIHdpdGggYSBuaWNlIGlkZWEgaG93DQo+PiB0
byBzb2x2ZSB0aGF0Lg0KPiANCj4gQ291bGRuJ3QgdGhhdCBzaW1wbHkgYmUgYSBuZXcgR1RG
X3N1cGVycGFnZSBmbGFnLCB3aXRoIHRoZSBzaXplDQo+IGVuY29kZWQgYWxvbmcgdGhlIGxp
bmVzIG9mIEFNRCBJT01NVXMgZW5jb2RlIHN1cGVycGFnZXMgKHNldHRpbmcgYWxsDQo+IGJ1
dCB0aGUgdG9wLW1vc3Qgb2YgdGhlIGJpdHMgbm90IHVzZWQgZm9yIHRoZSBhY3R1YWwgZnJh
bWUgYWRkcmVzcykNCj4gaW4gdGhlIGFkZHJlc3MgcGFydCBvZiB0aGUgZW50cnk/DQoNCk9m
IGNvdXJzZSB0aGF0IHdvdWxkIGJlIHBvc3NpYmxlLCBidXQgdXNpbmcgdGhlIGZlYXR1cmUg
d291bGQgYmUgbGltaXRlZA0KdG8gYmFja2VuZHMgaGF2aW5nIGJlZW4gbW9kaWZpZWQgdG8g
dGVzdCB0aGF0IG5ldyBmbGFnLiBJbiB0aGUgZW5kIGJvdGgNCnNpZGVzIHdvdWxkIG5lZWQg
dG8gbmVnb3RpYXRlIHRoZSBmZWF0dXJlIHVzYWJpbGl0eS4NCg0KDQpKdWVyZ2VuDQo=
--------------r7sMqSS8ZqNi1Ty98nvfm00l
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------r7sMqSS8ZqNi1Ty98nvfm00l--

--------------AFg0d5zVGksTmmsatDsYIh67--

--------------PfxmkzBrU7vcsAkgFckMCu8H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMxTxQFAwAAAAAACgkQsN6d1ii/Ey/K
eAf/Sg79JT0uieERNcD20EFLKz5YWp156BsJDnqVtJtHEnTyyR+U7Y6acinVReCyge7JDZrllNeB
7IAaAZc2158eJcrtF6NqA/96A2Xze7tV5xwQSWqlYE9K1WHm3J79IbEXocHjqRO57oDOEraYnjuv
xuqU5PAMY/zKdVFuGDqmBgg6JTo5Etl3IwaSegY3j5dGnVzOapM/o2Dc3TW5ISwLmxYmkv9AkZVJ
YXw9yq+6B0LfMHvf2afA8QgHi47/DSKJWTHxfMIytUaYNRWFN8QWjcJEq2s4SYKNxHpEr5w87g9A
pN7oc/EPmOLhstYrXHrGLRyXAzXllNBinUY+jr/bBQ==
=F7gi
-----END PGP SIGNATURE-----

--------------PfxmkzBrU7vcsAkgFckMCu8H--

