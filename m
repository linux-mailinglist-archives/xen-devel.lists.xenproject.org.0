Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DBB780B97
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 14:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586118.917338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWyMh-0006pM-0Z; Fri, 18 Aug 2023 12:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586118.917338; Fri, 18 Aug 2023 12:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWyMg-0006nE-UE; Fri, 18 Aug 2023 12:14:06 +0000
Received: by outflank-mailman (input) for mailman id 586118;
 Fri, 18 Aug 2023 12:14:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZyU=ED=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qWyMf-0006n8-2y
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 12:14:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7eb450a-3dc0-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 14:14:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB0651F891;
 Fri, 18 Aug 2023 12:14:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92B99138F0;
 Fri, 18 Aug 2023 12:14:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GDdMIYlg32SKfAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 18 Aug 2023 12:14:01 +0000
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
X-Inumbo-ID: b7eb450a-3dc0-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692360841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FPLroij2Ls7B41Ho+t7bL6a1trqG0brLPM9DRleB2vE=;
	b=GxFFDdEW7Z7jiZ1V8kxMQsyyvqTlaop3i5ahIu73iQjWPvP4uszIITSrpTtknqJgUTRamn
	Nv0atVjUNV0RNksVaL8ZeQ7Ky/MDhq+dvPEI+0a8eyXYLQUgHR+d9kJc9wR1lJtIjOJhUP
	atzvGzrAZkax52Bs4aX3EoejTDmt8M4=
Message-ID: <0408a2b8-54f8-40dd-af42-d19a23df9143@suse.com>
Date: Fri, 18 Aug 2023 14:14:00 +0200
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
In-Reply-To: <b9fc2c2e-7914-4484-92bf-403fbc0d9fee@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EzZmFZWt2O6Q0S6OofppjAO3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EzZmFZWt2O6Q0S6OofppjAO3
Content-Type: multipart/mixed; boundary="------------ujprtDg40eS1Wf9AQ0BKAtPi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <0408a2b8-54f8-40dd-af42-d19a23df9143@suse.com>
Subject: Re: [PATCH v4 19/19] tools/xenstore: move xenstored sources into
 dedicated directory
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-20-jgross@suse.com>
 <b9fc2c2e-7914-4484-92bf-403fbc0d9fee@xen.org>
In-Reply-To: <b9fc2c2e-7914-4484-92bf-403fbc0d9fee@xen.org>

--------------ujprtDg40eS1Wf9AQ0BKAtPi
Content-Type: multipart/mixed; boundary="------------syCmj3meBJOM2oxRhH3aiv8d"

--------------syCmj3meBJOM2oxRhH3aiv8d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDguMjMgMTM6MjIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE0LzA4LzIwMjMgMDg6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJ
biB0b29scy94ZW5zdG9yZSB0aGVyZSBhcmUgbGl2aW5nIHhlbnN0b3JlZCBhbmQgeGVuc3Rv
cmUgY2xpZW50cy4NCj4+IFRoZXkgYXJlIG5vIGxvbmdlciBzaGFyaW5nIGFueXRoaW5nIGFw
YXJ0IGZyb20gdGhlICJ4ZW5zdG9yZSIgaW4gdGhlaXINCj4+IG5hbWVzLg0KPj4NCj4+IE1v
dmUgdGhlIHhlbnN0b3JlZCBzb3VyY2VzIGludG8gYSBuZXcgZGlyZWN0b3J5IHRvb2xzL3hl
bnN0b3JlZCB3aGlsZQ0KPj4gZHJvcHBpbmcgdGhlICJ4ZW5zdG9yZWRfIiBwcmVmaXggZnJv
bSB0aGVpciBuYW1lcy4gVGhpcyB3aWxsIG1ha2UgaXQNCj4+IGNsZWFyZXIgdGhhdCB4ZW5z
dG9yZSBjbGllbnRzIGFuZCB4ZW5zdG9yZWQgYXJlIGluZGVwZW5kZW50IGZyb20gZWFjaA0K
Pj4gb3RoZXIuDQo+IA0KPiBJbiB0ZXJtIG9mIG5hbWluZywgSSB3b3VsZCBwcmVmZXIgaWYg
d2UgZm9sbG93IHdoYXQgd2FzIGRvbmUgZm9yIHRoZSBjb25zb2xlLiBJLmU6DQo+IA0KPiB4
ZW5zdG9yZS9jbGllbnQ6IEFsbCB0aGUgY2xpZW50cw0KPiB4ZW5zdG9yZS9kYWVtb246IEMg
WGVuc3RvcmVkDQo+IA0KPiBUaGlzIHdvdWxkIGF2b2lkIHRoZSBvbmUgY2hhcmFjdGVyIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvIGRpcmVjdG9yaWVzLg0KDQpZZXMsIHRoYXQgd291
bGQgYmUgdGhlIGFsdGVybmF0aXZlIChhcGFydCBmcm9tIHJlbmFtaW5nIHRoZSB4ZW5zdG9y
ZSBkaXJlY3RvcnkNCnRvIHNvbWV0aGluZyBkaWZmZXJlbnQsIGUuZy4geHMtY2xpZW50cyku
DQoNClRoZSByZWFzb24gSSB3YXMgbGVhbmluZyB0b3dhcmRzIG15IHNvbHV0aW9uIHdhcyB0
aGF0IHRoZSBjbGllbnRzIGFyZSBtZWFudCB0bw0KYmUgdXNlZCB3aXRoIGFueSB4ZW5zdG9y
ZWQgaW1wbGVtZW50YXRpb24uIFRoaXMgd291bGRuJ3QgYmUgcmVmbGVjdGVkIGJ5IHVzaW5n
DQphIGNvbW1vbiB0b29scy94ZW5zdG9yZSBwYXJlbnQgZGlyZWN0b3J5IGZvciB0aGUgY2xp
ZW50cyBhbmQgQyB4ZW5zdG9yZWQuDQoNCkluIHRoZSBlbmQgSSBjb3VsZCBsaXZlIHdpdGgg
eW91ciBwcm9wb3NhbCwgdG9vLg0KDQo+IA0KPiBXaGF0IGRvIHRoZSBvdGhlciB0aGlua3M/
DQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCj4+IC0tLQ0KPj4gQWZ0ZXIgdGhlIGxhcmdlIG92ZXJoYXVsIG9mIHhlbnN0b3Jl
ZCBJIHRoaW5rIHN1Y2ggYSByZW9yZyB3b3VsZCBtYWtlDQo+PiBzZW5zZSB0byBnbyBpbnRv
IHRoZSBzYW1lIFhlbiB2ZXJzaW9uLiBEZWxheWluZyBpdCB1bnRpbCB0aGUgbmV4dA0KPj4g
dmVyc2lvbiB3b3VsZCBtYWtlIHBvdGVudGlhbCBiYWNrcG9ydHMgZm9yIDQuMTggaGFyZGVy
Lg0KPiANCj4gKzEuDQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=
--------------syCmj3meBJOM2oxRhH3aiv8d
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------syCmj3meBJOM2oxRhH3aiv8d--

--------------ujprtDg40eS1Wf9AQ0BKAtPi--

--------------EzZmFZWt2O6Q0S6OofppjAO3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTfYIkFAwAAAAAACgkQsN6d1ii/Ey93
qwf/RQsgvu3Lf55lw6Cm9h1zexiRbWGuL4iJTBbPJpEdRrZNdQvOl9sfSUnGAXF5RkfnE3aIVOC8
b0J14eBg7t8yxT1O/0+rZaxH8GR6lAW6lcLpRUqDSXg1bDk3u0025zbaox52UnvR+nFOdIEqZTc/
j9tlHr66GNLFTUG822rGLDqhiMBy/4WhAKHF+sF90ZxytX6CEyPSpbuh3WJLqpa+o540so+6PbpB
6J2f3AD9YWLSbHLh5/7F69bihsFXioNJnkUl0muIWPUTNOTy5xNeqbBt4y9mluq/fBGhvc5RyQ/J
dym+0g+QNg3K1SD2x4I+h0YoMjf0jqUxSScIJMLuVg==
=Xtxf
-----END PGP SIGNATURE-----

--------------EzZmFZWt2O6Q0S6OofppjAO3--

