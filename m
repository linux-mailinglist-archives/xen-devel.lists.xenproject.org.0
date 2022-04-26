Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50D35101F2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 17:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314020.531882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njNAG-0002W9-BZ; Tue, 26 Apr 2022 15:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314020.531882; Tue, 26 Apr 2022 15:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njNAG-0002UJ-8F; Tue, 26 Apr 2022 15:31:44 +0000
Received: by outflank-mailman (input) for mailman id 314020;
 Tue, 26 Apr 2022 15:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YDip=VE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njNAE-0002U9-Eb
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 15:31:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f861761c-c575-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 17:31:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB0121F388;
 Tue, 26 Apr 2022 15:31:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B303813AD5;
 Tue, 26 Apr 2022 15:31:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u5RYKlwQaGJ7aAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 26 Apr 2022 15:31:40 +0000
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
X-Inumbo-ID: f861761c-c575-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650987100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=04SFVKgCeYCKWYZR9XGSPFG9GG/Fo/laSe4hlrKtfJo=;
	b=eq3SuacIsh4FoEIo8jf5SrdKs+WZCJ+OwETCV8MmNXyHaa1wpm/yWZcXXGM7CmsNYIs2kC
	6NX/Le4f5R893LOlb6MX6JIERQ3vsOamkIyKiVrQLIu+MAxPzWrH8SGfZX23CRUWs8N5XC
	EsAL0EiKIBda6sEf3E3++pKpBzItxOc=
Message-ID: <7041654b-1fe2-b3a3-fb87-7a4d4d3dad8f@suse.com>
Date: Tue, 26 Apr 2022 17:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20220426090810.28616-1-jgross@suse.com>
 <2942e8ed-e839-c3d7-69af-25f926d11da0@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/public: add new macro to ring.h
In-Reply-To: <2942e8ed-e839-c3d7-69af-25f926d11da0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XF6tThLcAogi91YjYKBF4DVS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XF6tThLcAogi91YjYKBF4DVS
Content-Type: multipart/mixed; boundary="------------0QzTqAK0jY90Wh0WhmSXuagA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <7041654b-1fe2-b3a3-fb87-7a4d4d3dad8f@suse.com>
Subject: Re: [PATCH] xen/public: add new macro to ring.h
References: <20220426090810.28616-1-jgross@suse.com>
 <2942e8ed-e839-c3d7-69af-25f926d11da0@suse.com>
In-Reply-To: <2942e8ed-e839-c3d7-69af-25f926d11da0@suse.com>

--------------0QzTqAK0jY90Wh0WhmSXuagA
Content-Type: multipart/mixed; boundary="------------uaiJ0CzkVQXnu79mW1S0SoqO"

--------------uaiJ0CzkVQXnu79mW1S0SoqO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDQuMjIgMTE6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4wNC4yMDIy
IDExOjA4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVi
bGljL2lvL3JpbmcuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3JpbmcuaA0K
Pj4gQEAgLTE4NCw2ICsxODQsMTEgQEAgdHlwZWRlZiBzdHJ1Y3QgX19uYW1lIyNfYmFja19y
aW5nIF9fbmFtZSMjX2JhY2tfcmluZ190DQo+PiAgIA0KPj4gICAjZGVmaW5lIEZST05UX1JJ
TkdfSU5JVChfciwgX3MsIF9fc2l6ZSkgRlJPTlRfUklOR19BVFRBQ0goX3IsIF9zLCAwLCBf
X3NpemUpDQo+PiAgIA0KPj4gKyNkZWZpbmUgWEVOX0ZST05UX1JJTkdfSU5JVChfciwgX3Ms
IF9fc2l6ZSkgZG8geyAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICsgICAgU0hBUkVE
X1JJTkdfSU5JVChfcyk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcDQo+PiArICAgIEZST05UX1JJTkdfSU5JVChfciwgX3MsIF9fc2l6ZSk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4gK30gd2hpbGUgKDApDQo+
IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QgZm9yIHRoZSBjb21tZW50IGFyb3VuZCBs
aW5lIDEwMCB0byBhbHNvDQo+IGhhdmUgYSByZWZlcmVuY2UgdG8gdGhpcy4NCg0KT2theS4N
Cg0KPiBBcyB0byBzdHlsZTogQ291bGQgSSB0YWxrIHlvdSBpbnRvIG5vdCBmdXJ0aGVyIHBy
b2xpZmVyYXRpbmcgdGhlDQo+IGluYXBwcm9wcmlhdGUgdXNlIG9mIHVuZGVyc2NvcmUtcHJl
Zml4ZWQgbmFtZXMgYXMgbWFjcm8gcGFyYW1ldGVycz8NCj4gRXZlbiBtb3JlIHNvIG9uZSB3
aXRoIGEgZG91YmxlIHVuZGVyc2NvcmU/DQoNCk9rYXkuDQoNCj4gQXMgdG8gZnVuY3Rpb25h
bGl0eTogSSB0YWtlIGl0IHRoYXQgaXQgaXMgbm90IHZpZXdlZCBhcyBhbiBpc3N1ZQ0KPiB0
aGF0IG1hbnkgb2YgdGhlIG1hY3JvcyBoZXJlIGV2YWx1YXRlIHRoZWlyIGFyZ3VtZW50cyBt
dWx0aXBsZQ0KPiB0aW1lcz8NCg0KSSBkb24ndCB0aGluayB0aGlzIGlzIHByb2JsZW1hdGlj
Lg0KDQoNCkp1ZXJnZW4NCg==
--------------uaiJ0CzkVQXnu79mW1S0SoqO
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------uaiJ0CzkVQXnu79mW1S0SoqO--

--------------0QzTqAK0jY90Wh0WhmSXuagA--

--------------XF6tThLcAogi91YjYKBF4DVS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJoEFwFAwAAAAAACgkQsN6d1ii/Ey9B
SAf/Urz7t5V+WagqRW5kN0EGk2TWRo53CnEQSxgc2FVk41YJY0gRxn5SiULF+6ueiRMkxXd7+tc3
3ykyPoiz6pHCHSowOt8ynxtzJ6G/k4sVaBwckoOujIaXzN3Uhbqo0lX9n+J2BMtm6MJ2mi9kW9un
XPGE51zr2Nf86Xz7iDgRkBqF4zKmD1fYjftY7j8OqFy1EfOigLXKfqIwo9KQw9WLOS/0LNmL5mhP
UDEPrYZFtoAYY2LocLyqdZglhR2KMgOQu7xx3BO7t77GzE2nasV4Y7Qdn/x65lgNUvbbNp+04p48
J8ZWa+ZZ0ZxIKv58/VdFACAS9Dqeav/TD9wpxOiygg==
=nll9
-----END PGP SIGNATURE-----

--------------XF6tThLcAogi91YjYKBF4DVS--

