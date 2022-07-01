Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B9562ABE
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 07:13:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358839.588221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o78yI-0006jx-29; Fri, 01 Jul 2022 05:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358839.588221; Fri, 01 Jul 2022 05:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o78yH-0006hX-Us; Fri, 01 Jul 2022 05:13:37 +0000
Received: by outflank-mailman (input) for mailman id 358839;
 Fri, 01 Jul 2022 05:13:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o78yG-0006g9-C7
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 05:13:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e3129ec-f8fc-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 07:13:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 349C81F9B6;
 Fri,  1 Jul 2022 05:13:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0199D139E9;
 Fri,  1 Jul 2022 05:13:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fTkfOn2CvmKufgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 01 Jul 2022 05:13:33 +0000
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
X-Inumbo-ID: 8e3129ec-f8fc-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656652414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c4tgpwUfFuaroKJMxuhzxSG5SGxV/r5LwiMxraJ28yk=;
	b=IFjs59x+7Fc/PebFdupeIftX3bgKlL60ZHecy6sETUQbjbYO3Y29U7bU/l39qM52tmSUc/
	1Q+KYe8bXQzANKTU4FUlBjFrtKff68GBWVP36JgFewFx0fmWMyO/yr742FYA5iStEVzypj
	8fgqyq3kGn9iu/opWfypvmGZED7GyC0=
Message-ID: <dc57c0a4-899b-a76b-6adc-cf5947beeb8b@suse.com>
Date: Fri, 1 Jul 2022 07:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] public/io: xs_wire: Document that new errors should be
 added at the end
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Julien Grall <jgrall@amazon.com>
References: <20220630183655.44391-1-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220630183655.44391-1-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ywmOAaGtReiFWWf6CTU1H2Tz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ywmOAaGtReiFWWf6CTU1H2Tz
Content-Type: multipart/mixed; boundary="------------LM5A4AMuEmQIKy3vjnX0rXJK";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Julien Grall <jgrall@amazon.com>
Message-ID: <dc57c0a4-899b-a76b-6adc-cf5947beeb8b@suse.com>
Subject: Re: [PATCH v3] public/io: xs_wire: Document that new errors should be
 added at the end
References: <20220630183655.44391-1-julien@xen.org>
In-Reply-To: <20220630183655.44391-1-julien@xen.org>

--------------LM5A4AMuEmQIKy3vjnX0rXJK
Content-Type: multipart/mixed; boundary="------------0LT7VvJH7HKHRyqc1HmsVMyJ"

--------------0LT7VvJH7HKHRyqc1HmsVMyJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDYuMjIgMjA6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IFNvbWUgdG9vbHMgKGUuZy4geGVu
c3RvcmVkKSBhbHdheXMgZXhwZWN0IEVJTlZBTCB0byBiZSBmaXJzdCBpbiB4c2RfZXJyb3Jz
Lg0KPiANCj4gVG8gYmUgY29uc2VydmF0aXZlLCBtYW5kYXRlIHRoYXQgbmV3IGVycm9ycyBz
aG91bGQgYmUgYWRkZWQgYXQgdGhlIGVuZA0KPiBvZiB0aGUgYXJyYXkuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KDQpSZXZpZXdl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==

--------------0LT7VvJH7HKHRyqc1HmsVMyJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0LT7VvJH7HKHRyqc1HmsVMyJ--

--------------LM5A4AMuEmQIKy3vjnX0rXJK--

--------------ywmOAaGtReiFWWf6CTU1H2Tz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK+gn0FAwAAAAAACgkQsN6d1ii/Ey+p
kgf/bxd2qJEMyKWbl/72+vZfZtH7sJUuwI34Yph9hcm3MTu+3trkNonwUOoAroaeGs1UVobghhfc
cgBnym1Usdb9Nz1Py1/gza0IaFBCdRM3TK/V7kaswZpoeFXAr2InX2wbe2+E5/rZyl9mSkipbuvf
DluUB47N1ny3K9030nUa+hZdzu9EqKy8pgBvjhY5zI1sdP0S723j+WUHt3pTuIbKCeNgvj2/makt
U6AeFiqAG5JofP4HgDB7fDsBUoI2dzrG5hL8OxnoPXghPXzbom19TXxxWNnJQeYDPLILtxp7lGD2
DjJ2G3/B7I22IQLGr8rXnOY7g1wHrr2LIcGttvDhEg==
=m5sR
-----END PGP SIGNATURE-----

--------------ywmOAaGtReiFWWf6CTU1H2Tz--

