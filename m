Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD7A6D7B32
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 13:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518483.805091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk1FL-0006Ml-D5; Wed, 05 Apr 2023 11:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518483.805091; Wed, 05 Apr 2023 11:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk1FL-0006JP-AQ; Wed, 05 Apr 2023 11:24:11 +0000
Received: by outflank-mailman (input) for mailman id 518483;
 Wed, 05 Apr 2023 11:24:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pk1FJ-0006Ix-Nu
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 11:24:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60f995d9-d3a4-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 13:24:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 01ACB22161;
 Wed,  5 Apr 2023 11:24:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE27A13A31;
 Wed,  5 Apr 2023 11:24:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XviXLFZaLWT9IgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 11:24:06 +0000
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
X-Inumbo-ID: 60f995d9-d3a4-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680693847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oUbQqR93vbZJC0urz3kBptj/FjpSXr9L+EvtWJIzkAY=;
	b=ezl7dZOyS77RQ86UNc7n8IlIi5lpR0FyYMjVG9l1Cf5GWUeRcyQOZJ8jU0cd5TjdNlJ94l
	9lCyJ3o6zwcLlKrhnVg3Owaq+PyqRmfz6Je6gx/VRJ620F4w+6GSyvNoK3ugFohdnh1tgG
	2u3UZc5fN6qZhr0n6v7UeNOMtii8Wtc=
Message-ID: <563ff69f-0e9d-c90a-d18c-b3c351575716@suse.com>
Date: Wed, 5 Apr 2023 13:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/2] xen: update CONFIG_DEBUG_INFO help text
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230403162823.30681-1-jgross@suse.com>
 <20230403162823.30681-3-jgross@suse.com>
 <358e9788-b930-5c51-1e89-232be43f83e5@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <358e9788-b930-5c51-1e89-232be43f83e5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3BvgmbWaZapsVCTU88DTFarK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3BvgmbWaZapsVCTU88DTFarK
Content-Type: multipart/mixed; boundary="------------hTOaozWB0FeTq5Wz2qESremc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <563ff69f-0e9d-c90a-d18c-b3c351575716@suse.com>
Subject: Re: [PATCH v2 2/2] xen: update CONFIG_DEBUG_INFO help text
References: <20230403162823.30681-1-jgross@suse.com>
 <20230403162823.30681-3-jgross@suse.com>
 <358e9788-b930-5c51-1e89-232be43f83e5@suse.com>
In-Reply-To: <358e9788-b930-5c51-1e89-232be43f83e5@suse.com>

--------------hTOaozWB0FeTq5Wz2qESremc
Content-Type: multipart/mixed; boundary="------------wL7lCk1Jbl1XcOSznPXSa8r6"

--------------wL7lCk1Jbl1XcOSznPXSa8r6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDQuMjMgMTE6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wNC4yMDIz
IDE4OjI4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL0tjb25maWcuZGVi
dWcNCj4+ICsrKyBiL3hlbi9LY29uZmlnLmRlYnVnDQo+PiBAQCAtMTUsOCArMTUsMTQgQEAg
Y29uZmlnIERFQlVHX0lORk8NCj4+ICAgCWJvb2wgIkNvbXBpbGUgWGVuIHdpdGggZGVidWcg
aW5mbyINCj4+ICAgCWRlZmF1bHQgREVCVUcNCj4+ICAgCWhlbHANCj4+IC0JICBJZiB5b3Ug
c2F5IFkgaGVyZSB0aGUgcmVzdWx0aW5nIFhlbiB3aWxsIGluY2x1ZGUgZGVidWdnaW5nIGlu
Zm8NCj4+IC0JICByZXN1bHRpbmcgaW4gYSBsYXJnZXIgYmluYXJ5IGltYWdlLg0KPj4gKwkg
IFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gYnVpbGQgWGVuIHdpdGggZGVidWcgaW5mb3Jt
YXRpb24uIFRoaXMNCj4+ICsJICBpbmZvcm1hdGlvbiBpcyBuZWVkZWQgZS5nLiBmb3IgZG9p
bmcgY3Jhc2ggZHVtcCBhbmFseXNpcyBvZiB0aGUNCj4+ICsJICBoeXBlcnZpc29yIHZpYSB0
aGUgImNyYXNoIiB0b29sLg0KPj4gKwkgIFNheWluZyBZIHdpbGwgaW5jcmVhc2UgdGhlIHNp
emUgb2YgdGhlIHhlbi1zeW1zIGFuZCB4ZW4uZWZpDQo+PiArCSAgYmluYXJpZXMuIEluIGNh
c2UgdGhlIHNwYWNlIG9uIHRoZSBFRkkgYm9vdCBwYXJ0aXRpb24gaXMgcmF0aGVyDQo+PiAr
CSAgbGltaXRlZCwgeW91IG1heSB3YW50IHRvIG1ha2UgdXNlIG9mIHRoZSBJTlNUQUxMX0VG
SV9TVFJJUCBtYWtlDQo+PiArCSAgdmFyaWFibGUgd2hlbiBidWlsZGluZyB0aGUgaHlwZXJ2
aXNvciwgaW4gb3JkZXIgdG8gc3RyaXAgeGVuLmVmaQ0KPj4gKwkgIGJlZm9yZSBpbnN0YWxs
aW5nIGl0IHRvIHRoZSBFRkkgcGFydGl0aW9uLg0KPiANCj4gSG1tLCBJTlNUQUxMX0VGSV9T
VFJJUCBpcyBvbmx5IGEgY291cnRlc3kgdG8gZGV2ZWxvcGVycyB3YW50aW5nIHRvIGluc3Rh
bGwNCj4geGVuLmVmaSBkaXJlY3RseSBpbnRvIHRoZSBFRkkgcGFydGl0aW9uLiBJdCB3b3Vs
ZG4ndCBhZmZlY3QgdGhlIG5vcm1hbA0KPiBmbG93LCBhbmQgaGVuY2UgSSB0aGluayB0aGlz
IHdhbnRzIGV4cHJlc3NpbmcgaGVyZSBzdWNoIHRoYXQgYm90aCBraW5kcyBvZg0KPiBwZW9w
bGUgaGF2ZSBhdCBsZWFzdCBhIGhpbnQgd2hhdCB0aGV5IG5lZWQgdG8gZG8uIEkuZS4gaW4g
dGhlIG5vcm1hbCBjYXNlDQo+IHRoZXknZCBuZWVkIHRvIGFkanVzdCB0aGUgd2F5IHhlbi5l
ZmkgaXMgInByb3BhZ2F0ZWQiIGZyb20gaXRzIGluc3RhbGxlZA0KPiBsb2NhdGlvbiBvbnRv
IHRoZSBFRkkgcGFydGl0aW9uLCB0byBkbyB0aGUgZGVzaXJlZCBzdHJpcHBpbmcgYXQgdGhh
dCB0aW1lLg0KDQpXb3VsZCB5b3UgYmUgZmluZSB3aXRoOg0KDQogICBJbiBjYXNlIHRoZSBz
cGFjZSBvbiB0aGUgRUZJIGJvb3QgcGFydGl0aW9uIGlzIHJhdGhlcg0KICAgbGltaXRlZCwg
eW91IG1heSB3YW50IHRvIGluc3RhbGwgYSBzdHJpcHBlZCB2YXJpYW50IG9mIHhlbi5lZmkg
aW4NCiAgIHRoZSBFRkkgYm9vdCBwYXJ0aXRpb24gKGxvb2sgZm9yICJJTlNUQUxMX0VGSV9T
VFJJUCIgaW4NCiAgIGRvY3MvbWlzYy9lZmkucGFuZG9jIGZvciBtb3JlIGluZm9ybWF0aW9u
IC0gd2hlbiBub3QgdXNpbmcNCiAgICJtYWtlIGluc3RhbGwteGVuIiBmb3IgaW5zdGFsbGlu
ZyB4ZW4uZWZpLCBzdHJpcHBpbmcgbmVlZHMgdG8gYmUNCiAgIGRvbmUgb3V0c2lkZSB0aGUg
WGVuIGJ1aWxkIGVudmlyb25tZW50KS4NCg0KDQpKdWVyZ2VuDQo=
--------------wL7lCk1Jbl1XcOSznPXSa8r6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------wL7lCk1Jbl1XcOSznPXSa8r6--

--------------hTOaozWB0FeTq5Wz2qESremc--

--------------3BvgmbWaZapsVCTU88DTFarK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQtWlYFAwAAAAAACgkQsN6d1ii/Ey+O
sgf9EmalaxAcqPyJFCxRiUgtTIOgegw1DREeJU+Ds1jGSIz8LoXi8rOJcFj6o+wxtocr67njyeQ2
zb7alst8y00MFFEyUh3Afnke+apjKZ+nIfkYdWrZopTneqcdVDgUr+1COTKiFm5ad6hnMclL7lE9
qSLQTA85Vm4C37k2wQ3BAseVDMMHrcmeUI0FGmPpPTwUT6hi2Ts0/WXqxZh8GU+oB95yMzODX9l1
LG0ilJQr73ZUVn61jm2yFhF3pN5tRX0ttXYLkqDCje76HYWaOWhjYLovt0+/R7dkPDJd7MzqtxtO
ya/gHS0J8Lxci3RUcRo1heb0JoIuSb99wHhQ+kq4TA==
=s4PX
-----END PGP SIGNATURE-----

--------------3BvgmbWaZapsVCTU88DTFarK--

