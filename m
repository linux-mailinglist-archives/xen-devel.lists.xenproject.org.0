Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24C53746C
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 08:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338334.563097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvZ5h-0002Bg-Jz; Mon, 30 May 2022 06:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338334.563097; Mon, 30 May 2022 06:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvZ5h-00029X-H3; Mon, 30 May 2022 06:41:25 +0000
Received: by outflank-mailman (input) for mailman id 338334;
 Mon, 30 May 2022 06:41:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e3+D=WG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nvZ5g-00029R-I8
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 06:41:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84d2630f-dfe3-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 08:41:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 930081F8A8;
 Mon, 30 May 2022 06:41:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 526E013AFD;
 Mon, 30 May 2022 06:41:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mFmPEhFnlGLdXgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 May 2022 06:41:21 +0000
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
X-Inumbo-ID: 84d2630f-dfe3-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653892881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=71IJN/uvPmtGbzax6AW8Uvan1VSTvj6QtEu8AQf7oeU=;
	b=RWYOW5ZU7DwS+tbReR7dwWeCaGBMDKJP+lqaYwDDH6LB+b+xa5JRwwW+bBWV/BXYtxgDyd
	EnrTtu+t0wOUFbBFTYNIcHyW7BCdoY2YPsCfY/Iubmnn8sVPVGUHbq9WPAFQpB+AXdMQC9
	TDoE516dUv6LB5IIt2pBO5oyO2Ab7A0=
Message-ID: <00c0b10c-a35d-6729-5b4f-424febd9d5a3@suse.com>
Date: Mon, 30 May 2022 08:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jennifer Herbert <jennifer.herbert@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20220525184153.6059-1-demi@invisiblethingslab.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen/gntdev: Avoid blocking in unmap_grant_pages()
In-Reply-To: <20220525184153.6059-1-demi@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JsLfkxePRUaQci00CUJuEKC0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JsLfkxePRUaQci00CUJuEKC0
Content-Type: multipart/mixed; boundary="------------4n1k394n10VIXl50CWi9p4Ih";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jennifer Herbert <jennifer.herbert@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-ID: <00c0b10c-a35d-6729-5b4f-424febd9d5a3@suse.com>
Subject: Re: [PATCH v2] xen/gntdev: Avoid blocking in unmap_grant_pages()
References: <20220525184153.6059-1-demi@invisiblethingslab.com>
In-Reply-To: <20220525184153.6059-1-demi@invisiblethingslab.com>

--------------4n1k394n10VIXl50CWi9p4Ih
Content-Type: multipart/mixed; boundary="------------0RU3jj5DFajfimWsnYd00sbd"

--------------0RU3jj5DFajfimWsnYd00sbd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDUuMjIgMjA6NDEsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4gdW5tYXBf
Z3JhbnRfcGFnZXMoKSBjdXJyZW50bHkgd2FpdHMgZm9yIHRoZSBwYWdlcyB0byBubyBsb25n
ZXIgYmUgdXNlZC4NCj4gSW4gaHR0cHM6Ly9naXRodWIuY29tL1F1YmVzT1MvcXViZXMtaXNz
dWVzL2lzc3Vlcy83NDgxLCB0aGlzIGxlYWQgdG8gYQ0KPiBkZWFkbG9jayBhZ2FpbnN0IGk5
MTU6IGk5MTUgd2FzIHdhaXRpbmcgZm9yIGdudGRldidzIE1NVSBub3RpZmllciB0bw0KPiBm
aW5pc2gsIHdoaWxlIGdudGRldiB3YXMgd2FpdGluZyBmb3IgaTkxNSB0byBmcmVlIGl0cyBw
YWdlcy4gIEkgYWxzbw0KPiBiZWxpZXZlIHRoaXMgaXMgcmVzcG9uc2libGUgZm9yIHZhcmlv
dXMgZGVhZGxvY2tzIEkgaGF2ZSBleHBlcmllbmNlZCBpbg0KPiB0aGUgcGFzdC4NCj4gDQo+
IEF2b2lkIHRoZXNlIHByb2JsZW1zIGJ5IG1ha2luZyB1bm1hcF9ncmFudF9wYWdlcyBhc3lu
Yy4gIFRoaXMgcmVxdWlyZXMNCj4gbWFraW5nIGl0IHJldHVybiB2b2lkLCBhcyBhbnkgZXJy
b3JzIHdpbGwgbm90IGJlIGF2YWlsYWJsZSB3aGVuIHRoZQ0KPiBmdW5jdGlvbiByZXR1cm5z
LiAgRm9ydHVuYXRlbHksIHRoZSBvbmx5IHVzZSBvZiB0aGUgcmV0dXJuIHZhbHVlIGlzIGEN
Cj4gV0FSTl9PTigpLCB3aGljaCBjYW4gYmUgcmVwbGFjZWQgYnkgYSBXQVJOX09OIHdoZW4g
dGhlIGVycm9yIGlzDQo+IGRldGVjdGVkLiAgQWRkaXRpb25hbGx5LCBhIGZhaWxlZCBjYWxs
IHdpbGwgbm90IHByZXZlbnQgZnVydGhlciBjYWxscw0KPiBmcm9tIGJlaW5nIG1hZGUsIGJ1
dCB0aGlzIGlzIGhhcm1sZXNzLg0KPiANCj4gQmVjYXVzZSB1bm1hcF9ncmFudF9wYWdlcyBp
cyBub3cgYXN5bmMsIHRoZSBncmFudCBoYW5kbGUgd2lsbCBiZSBzZW50IHRvDQo+IElOVkFM
SURfR1JBTlRfSEFORExFIHRvbyBsYXRlIHRvIHByZXZlbnQgbXVsdGlwbGUgdW5tYXBzIG9m
IHRoZSBzYW1lDQo+IGhhbmRsZS4gIEluc3RlYWQsIGEgc2VwYXJhdGUgYm9vbCBhcnJheSBp
cyBhbGxvY2F0ZWQgZm9yIHRoaXMgcHVycG9zZS4NCj4gVGhpcyB3YXN0ZXMgbWVtb3J5LCBi
dXQgc3R1ZmZpbmcgdGhpcyBpbmZvcm1hdGlvbiBpbiBwYWRkaW5nIGJ5dGVzIGlzDQo+IHRv
byBmcmFnaWxlLiAgRnVydGhlcm1vcmUsIGl0IGlzIG5lY2Vzc2FyeSB0byBncmFiIGEgcmVm
ZXJlbmNlIHRvIHRoZQ0KPiBtYXAgYmVmb3JlIG1ha2luZyB0aGUgYXN5bmNocm9ub3VzIGNh
bGwsIGFuZCByZWxlYXNlIHRoZSByZWZlcmVuY2Ugd2hlbg0KPiB0aGUgY2FsbCByZXR1cm5z
Lg0KDQpJIHRoaW5rIHRoZXJlIGlzIGV2ZW4gbW9yZSBzeW5jaW5nIG5lZWRlZDoNCg0KLSBJ
biB0aGUgZXJyb3IgcGF0aCBvZiBnbnRkZXZfbW1hcCgpIHVubWFwX2dyYW50X3BhZ2VzKCkg
aXMgYmVpbmcgY2FsbGVkIGFuZA0KICAgaXQgaXMgYXNzdW1lZCwgbWFwIGlzIGF2YWlsYWJs
ZSBhZnRlcndhcmRzIGFnYWluLiBUaGlzIHNob3VsZCBiZSByYXRoZXIgZWFzeQ0KICAgdG8g
YXZvaWQgYnkgYWRkaW5nIGEgY291bnRlciBvZiBhY3RpdmUgbWFwcGluZ3MgdG8gc3RydWN0
IGdudGRldl9ncmFudF9tYXANCiAgIChudW1iZXIgb2YgcGFnZXMgbm90IGJlaW5nIHVubWFw
cGVkIHlldCkuIEluIGNhc2UgdGhpcyBjb3VudGVyIGlzIG5vdCB6ZXJvDQogICBnbnRkZXZf
bW1hcCgpIHNob3VsZCBiYWlsIG91dCBlYXJseS4NCg0KLSBnbnRkZXZfcHV0X21hcCgpIGlz
IGNhbGxpbmcgdW5tYXBfZ3JhbnRfcGFnZXMoKSBpbiBjYXNlIHRoZSByZWZjb3VudCBoYXMN
CiAgIGRyb3BwZWQgdG8gemVyby4gVGhpcyBjYWxsIGNhbiBzZXQgdGhlIHJlZmNvdW50IHRv
IDEgYWdhaW4sIHNvIHRoZXJlIGlzDQogICBhbm90aGVyIGRlbGF5IG5lZWRlZCBiZWZvcmUg
ZnJlZWluZyBtYXAuIEkgdGhpbmsgdW5tYXBfZ3JhbnRfcGFnZXMoKSBzaG91bGQNCiAgIHJl
dHVybiBpbiBjYXNlIHRoZSBjb3VudCBvZiBtYXBwZWQgcGFnZXMgaXMgemVybyAoc2VlIGFi
b3ZlKSwgdGh1cyBhdm9pZGluZw0KICAgdG8gaW5jcmVtZW50IHRoZSByZWZjb3VudCBvZiBt
YXAgaWYgbm90aGluZyBpcyB0byBiZSBkb25lLiBUaGlzIHdvdWxkIGVuYWJsZQ0KICAgZ250
ZGV2X3B1dF9tYXAoKSB0byBqdXN0IHJldHVybiBhZnRlciB0aGUgY2FsbCBvZiB1bm1hcF9n
cmFudF9wYWdlcygpIGluIGNhc2UNCiAgIHRoZSByZWZjb3VudCBoYXMgYmVlbiBpbmNyZW1l
bnRlZCBhZ2Fpbi4NCg0KDQpKdWVyZ2VuDQo=
--------------0RU3jj5DFajfimWsnYd00sbd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0RU3jj5DFajfimWsnYd00sbd--

--------------4n1k394n10VIXl50CWi9p4Ih--

--------------JsLfkxePRUaQci00CUJuEKC0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKUZxAFAwAAAAAACgkQsN6d1ii/Ey/M
nAgAiYz1TCudfsk6bf8+Ckl+7deE9VZbL85q3NM8vev40dbLLD2ranezAEaUT8UgBJxIKtJ4flx9
DuGbA+N58cEHvPNRIg4/E3zzAr92Cnzff6AF4HEGiZ1ZFVI8XASzccv9LLgvo11DkccIfunVKhHU
quqf+0cyyK1RhskoYn/qdVGqUr7CG2W3BoiNOrYjndR8rJBh7zhj7Xx1RiHjMSGi/7pXOeK9oPxW
s3FhBMdQAdP+ccO6pzGtgt+fecxgZZ1/U/DqN1D0mMzUoNANSwVpELFGqq37pbuFhrCMkVoDa2wM
KisFTnpTsv9derB35pOTRV9/rQXc6a7tmmpkmi2SJw==
=g5Al
-----END PGP SIGNATURE-----

--------------JsLfkxePRUaQci00CUJuEKC0--

