Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E862B780C15
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 14:46:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586181.917396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWyrj-0004xj-IJ; Fri, 18 Aug 2023 12:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586181.917396; Fri, 18 Aug 2023 12:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWyrj-0004uv-EG; Fri, 18 Aug 2023 12:46:11 +0000
Received: by outflank-mailman (input) for mailman id 586181;
 Fri, 18 Aug 2023 12:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZyU=ED=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qWyri-0004uZ-7s
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 12:46:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 328a9fcf-3dc5-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 14:46:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9DF111F893;
 Fri, 18 Aug 2023 12:46:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C19D138F0;
 Fri, 18 Aug 2023 12:46:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WpHvFA1o32Q9DgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 18 Aug 2023 12:46:05 +0000
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
X-Inumbo-ID: 328a9fcf-3dc5-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692362765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PfbCLGvo1xGn31rJMVoRC5qSUUtTBF81YvHoHArMgJs=;
	b=R1ak5bMWj0BpeDMJ/lLQQ+rgI+aB2sq7CEgFfw1JoAsWHJIUylKnsrPmcfyLuM13UTGZJ5
	khMgL8YYaxBGB7TIs450wRD9n5naU6FpSssWpcyAxxG7zJHXmkn7v2+LweuH9vjXAirQR0
	3MPYs6izEzdCjcEq4z0F70CsV75MUls=
Message-ID: <1b425c55-529a-43d8-8550-c35388be6e29@suse.com>
Date: Fri, 18 Aug 2023 14:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/19] tools/xenstore: move xenstored sources into
 dedicated directory
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-20-jgross@suse.com>
 <b9fc2c2e-7914-4484-92bf-403fbc0d9fee@xen.org>
 <0408a2b8-54f8-40dd-af42-d19a23df9143@suse.com>
 <19059e45-bd74-4404-96ee-4e3ac8b09022@xen.org>
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
In-Reply-To: <19059e45-bd74-4404-96ee-4e3ac8b09022@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tfNv9CsGWqMK0AW060ZJp6FI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tfNv9CsGWqMK0AW060ZJp6FI
Content-Type: multipart/mixed; boundary="------------VSqsF0ozaFuQcMJmcBNTfN4S";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <1b425c55-529a-43d8-8550-c35388be6e29@suse.com>
Subject: Re: [PATCH v4 19/19] tools/xenstore: move xenstored sources into
 dedicated directory
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-20-jgross@suse.com>
 <b9fc2c2e-7914-4484-92bf-403fbc0d9fee@xen.org>
 <0408a2b8-54f8-40dd-af42-d19a23df9143@suse.com>
 <19059e45-bd74-4404-96ee-4e3ac8b09022@xen.org>
In-Reply-To: <19059e45-bd74-4404-96ee-4e3ac8b09022@xen.org>

--------------VSqsF0ozaFuQcMJmcBNTfN4S
Content-Type: multipart/mixed; boundary="------------mLzb5PCUxNrIBPPE1HpO4Riq"

--------------mLzb5PCUxNrIBPPE1HpO4Riq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDguMjMgMTQ6NDIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE4LzA4LzIwMjMgMTM6MTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxOC4wOC4yMyAxMzoyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAxNC8wOC8yMDIzIDA4OjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBJbiB0b29scy94ZW5zdG9yZSB0aGVyZSBhcmUgbGl2aW5nIHhlbnN0b3JlZCBhbmQg
eGVuc3RvcmUgY2xpZW50cy4NCj4+Pj4gVGhleSBhcmUgbm8gbG9uZ2VyIHNoYXJpbmcgYW55
dGhpbmcgYXBhcnQgZnJvbSB0aGUgInhlbnN0b3JlIiBpbiB0aGVpcg0KPj4+PiBuYW1lcy4N
Cj4+Pj4NCj4+Pj4gTW92ZSB0aGUgeGVuc3RvcmVkIHNvdXJjZXMgaW50byBhIG5ldyBkaXJl
Y3RvcnkgdG9vbHMveGVuc3RvcmVkIHdoaWxlDQo+Pj4+IGRyb3BwaW5nIHRoZSAieGVuc3Rv
cmVkXyIgcHJlZml4IGZyb20gdGhlaXIgbmFtZXMuIFRoaXMgd2lsbCBtYWtlIGl0DQo+Pj4+
IGNsZWFyZXIgdGhhdCB4ZW5zdG9yZSBjbGllbnRzIGFuZCB4ZW5zdG9yZWQgYXJlIGluZGVw
ZW5kZW50IGZyb20gZWFjaA0KPj4+PiBvdGhlci4NCj4+Pg0KPj4+IEluIHRlcm0gb2YgbmFt
aW5nLCBJIHdvdWxkIHByZWZlciBpZiB3ZSBmb2xsb3cgd2hhdCB3YXMgZG9uZSBmb3IgdGhl
IGNvbnNvbGUuIA0KPj4+IEkuZToNCj4+Pg0KPj4+IHhlbnN0b3JlL2NsaWVudDogQWxsIHRo
ZSBjbGllbnRzDQo+Pj4geGVuc3RvcmUvZGFlbW9uOiBDIFhlbnN0b3JlZA0KPj4+DQo+Pj4g
VGhpcyB3b3VsZCBhdm9pZCB0aGUgb25lIGNoYXJhY3RlciBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIHR3byBkaXJlY3Rvcmllcy4NCj4+DQo+PiBZZXMsIHRoYXQgd291bGQgYmUgdGhlIGFs
dGVybmF0aXZlIChhcGFydCBmcm9tIHJlbmFtaW5nIHRoZSB4ZW5zdG9yZSBkaXJlY3RvcnkN
Cj4+IHRvIHNvbWV0aGluZyBkaWZmZXJlbnQsIGUuZy4geHMtY2xpZW50cykuDQo+IA0KPiB4
cy1jbGllbnRzIHdvdWxkIGJlIE9LLiBJIGd1ZXNzIHlvdSBkaWRuJ3Qgc3VnZ2VzdCB4ZW5z
dG9yZS1jbGllbnRzIGJlY2F1c2UgaXQgDQo+IGlzIHRvbyBsb25nPw0KDQpJIHdhcyBtb3Jl
IHRoaW5raW5nIGFib3V0IHBhdGggbmFtZSBjb21wbGV0aW9uIHdoZW4gdHlwaW5nLiBVc2lu
ZyB4cy1jbGllbnRzDQp3b3VsZCBhbGxvdyB0byB1c2UgdGhlIDx0YWI+IGFmdGVyIHRoZSBz
ZWNvbmQgY2hhcmFjdGVyIGFscmVhZHkuIDotKQ0KDQo+IA0KPj4NCj4+IFRoZSByZWFzb24g
SSB3YXMgbGVhbmluZyB0b3dhcmRzIG15IHNvbHV0aW9uIHdhcyB0aGF0IHRoZSBjbGllbnRz
IGFyZSBtZWFudCB0bw0KPj4gYmUgdXNlZCB3aXRoIGFueSB4ZW5zdG9yZWQgaW1wbGVtZW50
YXRpb24uIFRoaXMgd291bGRuJ3QgYmUgcmVmbGVjdGVkIGJ5IHVzaW5nDQo+PiBhIGNvbW1v
biB0b29scy94ZW5zdG9yZSBwYXJlbnQgZGlyZWN0b3J5IGZvciB0aGUgY2xpZW50cyBhbmQg
QyB4ZW5zdG9yZWQuDQo+IA0KPiBZb3UgaGF2ZSBhIHBvaW50LiBJIHdhcyBhbHNvIHRyeWlu
ZyB0byBhdm9pZCB0byBoYXZlIHRvbyBtYW55IGRpcmVjdG95IGluIHRvb2xzLiANCj4gQnV0
IHdlIGFscmVhZHkgaGF2ZSAncWVtdS10cmFkJyBhbmQgJ3FlbXUtdXBzdHJlYW0nLi4uDQo+
IA0KPj4NCj4+IEluIHRoZSBlbmQgSSBjb3VsZCBsaXZlIHdpdGggeW91ciBwcm9wb3NhbCwg
dG9vLg0KPiANCj4gTXkgbWFpbiBjb25jZXJuIHdpdGggeW91ciBwcm9wb3NhbCB3YXMgdGhl
IG9uZSBjaGFyYWN0ZXIgZGlmZmVyZW5jZSBpbiB0aGUgbmFtZS4gDQo+IHhlbnN0b3JlZCBh
bmQgeHMtY2xpZW50cy94ZW5zdG9yZS1jbGllbnRzIHdvdWxkIHdvcmsgZm9yIG1lLg0KDQpP
a2F5LCB0aGFua3MuDQoNCldpdGggYWJvdmUgcmVhc29uaW5nIEknbSBsZWFuaW5nIHRvd2Fy
ZHMgeHMtY2xpZW50cy4NCg0KDQpKdWVyZ2VuDQo=
--------------mLzb5PCUxNrIBPPE1HpO4Riq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mLzb5PCUxNrIBPPE1HpO4Riq--

--------------VSqsF0ozaFuQcMJmcBNTfN4S--

--------------tfNv9CsGWqMK0AW060ZJp6FI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTfaAwFAwAAAAAACgkQsN6d1ii/Ey9n
gQf+KVnG4jKYi/krs8uy7Wocapv/8IF/uTmOwWLRPJYaQ2l8uXZpQxNDAqoTVO6sGtruKVrBPa1z
UTFMwO2CbZeQjChpxjtN9/Z7zVQe0NhSxACrSiGM0sV94bUrUE5Tgavoj0R+xc8A8YEqSFcvAQZL
INQzuBiL1DjCBL2jSmG46kdEVs0AqkVeo14fR3I4f9WhBZBfk84Nq7nDJgpSqaxuGO/0rioDKvf6
zsUC0M6xj5n19gPMybsOj18qAx2YRZB/Et4UQv6P7N4ZoRz3B0w2UIXW35fseK3NXly30Wlq227q
TV4SM5coph6smfevSGtK37VQ6uw7JCjKKBxlGFnBjg==
=K+sf
-----END PGP SIGNATURE-----

--------------tfNv9CsGWqMK0AW060ZJp6FI--

