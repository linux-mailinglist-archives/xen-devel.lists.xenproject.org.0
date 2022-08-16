Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E05951EC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 07:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387945.624428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNp1n-0005hT-6q; Tue, 16 Aug 2022 05:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387945.624428; Tue, 16 Aug 2022 05:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNp1n-0005fB-4E; Tue, 16 Aug 2022 05:22:11 +0000
Received: by outflank-mailman (input) for mailman id 387945;
 Tue, 16 Aug 2022 05:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NQK8=YU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNp1l-0005f5-8u
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 05:22:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ee6a4f7-1d23-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 07:22:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA93121036;
 Tue, 16 Aug 2022 05:22:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75FB013AAE;
 Tue, 16 Aug 2022 05:22:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i/QkG34p+2KKGAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 16 Aug 2022 05:22:06 +0000
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
X-Inumbo-ID: 5ee6a4f7-1d23-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660627326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GlhF+uLxn3oDBK2CqjAfRfb1UGnGDSonWhMGNAdvicM=;
	b=h0cy4/HfrbY2dqjMTIM04n5jTdxcX5X35EuT/PwAIlZz1cBh7lapJkFwDFlI1gA9vt6W5k
	ps60zHWn96tSw9r1Pfwm/0LAIa/WDBbr89nnu75GvaFPeBuflrHj+nQ23s2LG1tsqWoacy
	QZ8DLhm1MKPuQ495ztWqcxOGLXp7sMQ=
Message-ID: <db2ee8d6-a58a-20d1-bed6-72885cbd9268@suse.com>
Date: Tue, 16 Aug 2022 07:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] add SPDX to arch/arm/*.c
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org, jbeulich@suse.com, wl@xen.org,
 roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2208121758520.3790@ubuntu-linux-20-04-desktop>
 <a604ce43-2b3f-7ac3-36a1-913a66f036d2@xen.org>
 <alpine.DEB.2.22.394.2208151319370.3790@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2208151319370.3790@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3ClqqxTFZALl2R8DfhTpM3xo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3ClqqxTFZALl2R8DfhTpM3xo
Content-Type: multipart/mixed; boundary="------------sYCH0tcwQJUF7Sr6zpUZGJ29";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org, jbeulich@suse.com, wl@xen.org,
 roger.pau@citrix.com
Message-ID: <db2ee8d6-a58a-20d1-bed6-72885cbd9268@suse.com>
Subject: Re: [PATCH] add SPDX to arch/arm/*.c
References: <alpine.DEB.2.22.394.2208121758520.3790@ubuntu-linux-20-04-desktop>
 <a604ce43-2b3f-7ac3-36a1-913a66f036d2@xen.org>
 <alpine.DEB.2.22.394.2208151319370.3790@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2208151319370.3790@ubuntu-linux-20-04-desktop>

--------------sYCH0tcwQJUF7Sr6zpUZGJ29
Content-Type: multipart/mixed; boundary="------------2oZFkjRTKlci1xjYIXBwuG01"

--------------2oZFkjRTKlci1xjYIXBwuG01
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDguMjIgMjI6MzIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gKyBYZW4g
bWFpbnRhaW5lcnMgYW5kIGNvbW1pdHRlcnMNCj4gDQo+IA0KPiBGb3IgY29udGV4dCwgSSB3
cm90ZSBhIHBhdGNoIHRvIGludHJvZHVjZSBTUERYIHRhZ3Mgc3RhcnRpbmcgZnJvbQ0KPiBh
cmNoL2FybS8qLmMuDQoNCkRvbid0IHdlIHdhbnQgc29tZXRoaW5nIGxpa2UgdGhlIGtlcm5l
bCdzIExJQ0VOU0VTIGRpcmVjdG9yeSBpbiBvcmRlciB0bw0KaGF2ZSBzb21ldGhpbmcgdGhl
IFNQRFggbGluZXMgcmVmZXIgdG8/IENPUFlJTkcgc2hvdWxkIG1heWJlIGFkYXB0ZWQsIHRv
by4NCg0KDQpKdWVyZ2VuDQo=
--------------2oZFkjRTKlci1xjYIXBwuG01
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2oZFkjRTKlci1xjYIXBwuG01--

--------------sYCH0tcwQJUF7Sr6zpUZGJ29--

--------------3ClqqxTFZALl2R8DfhTpM3xo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL7KX4FAwAAAAAACgkQsN6d1ii/Ey8G
/ggAlerbrVUSJ8r5oHujP9oTbQDrJ2JByPA9f3jdYgl93Co4jWixVyvH7sVsazQxR7OFdMuvEf86
XB7LINpuCCJ2vFGT6GvDjpXphYP1ZKfwTZGbCj0SJ1JGCcYH/HO6S4rn/bb9Ji1EIO+PellBmBHZ
djk4tXNob9pEzlktHOBDq6Ci6yE3qzYNjAZFkeM3i+cC/kCHwFrAyMzOG5D710I5qYXB9X8V7c0I
/kyNCMi+tup4he7gsjH9lqh7MWlreN2qXdLC2iH0ymotk1WG0PhgmiVHZ5izYIu3SSLiPdhABl7/
NUjKSfO1Maz4sVrpb5T3DLN37J+qDil/rMyIdOWtRA==
=5rs/
-----END PGP SIGNATURE-----

--------------3ClqqxTFZALl2R8DfhTpM3xo--

