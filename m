Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C38599499
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 07:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390005.627151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOudl-00084L-TF; Fri, 19 Aug 2022 05:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390005.627151; Fri, 19 Aug 2022 05:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOudl-00081e-QX; Fri, 19 Aug 2022 05:33:53 +0000
Received: by outflank-mailman (input) for mailman id 390005;
 Fri, 19 Aug 2022 05:33:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJ7l=YX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oOudk-00081Y-6L
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 05:33:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 815ed42a-1f80-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 07:33:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 473DB5CA74;
 Fri, 19 Aug 2022 05:33:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E27A913AC1;
 Fri, 19 Aug 2022 05:33:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XXmrNb0g/2IGKAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 19 Aug 2022 05:33:49 +0000
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
X-Inumbo-ID: 815ed42a-1f80-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660887230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXDa3hx4Vm9MFcE1vAjDFgt7HSkr1LsaGdqe0teRZi4=;
	b=t+HTQzqTulnZIAStezyT80KOzATAUUbAaD4CBH9YnA+9UO5oKZd7mSw3duIpsTaxTyUHAA
	q/uqN96irTYqmOok9d1CzzYDfP13FjP3wEc0Cl6iWixnnoa9dWpfNlfSxfuX+3fs5qZgd6
	4gwi02cBhRCKCkOfc3st4oIxBQvGJjQ=
Message-ID: <d75ac983-2414-c8d8-ea93-8b511b1702ea@suse.com>
Date: Fri, 19 Aug 2022 07:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/3] introduce SPDX
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: julien@xen.org, wl@xen.org, jbeulich@suse.com, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------opCtZCcxg4Mb3PnqHSYFq4Od"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------opCtZCcxg4Mb3PnqHSYFq4Od
Content-Type: multipart/mixed; boundary="------------hUi4m1UkseH0pcrJTAcqh8C2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: julien@xen.org, wl@xen.org, jbeulich@suse.com, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
Message-ID: <d75ac983-2414-c8d8-ea93-8b511b1702ea@suse.com>
Subject: Re: [PATCH v2 0/3] introduce SPDX
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>

--------------hUi4m1UkseH0pcrJTAcqh8C2
Content-Type: multipart/mixed; boundary="------------W9LzjQPOwL7k0VUXJcy61gb4"

--------------W9LzjQPOwL7k0VUXJcy61gb4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDguMjIgMDA6MDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gSGkgYWxs
LA0KPiANCj4gVGhpcyBzbWFsbCBzZXJpZXMgaW50cm9kdWNlcyBTUERYIHRhZ3MgdG8gWGVu
Og0KPiANCj4gMSkgYWRkIGEgbWVudGlvbiB0byBTUERYIGluIENPRElOR19TVFlMRQ0KPiAy
KSBhZGQgYSBMSUNFTlNFUyBkaXJlY3Rvcnkgd2l0aCBsaWNlbnNlcyBhbmQgU1BEWCB0YWdz
DQo+IDMpIGFkZHMgdGhlIFNQRFggc2luZ2xlLWxpbmUgY29tbWVudCB0byBhcmNoL2FybS8q
LmMNCj4gDQo+IE5vdGUgdGhhdCBhcmNoL2FybS8qLmMgaXMganVzdCBhIHN0YXJ0LiBBbHNv
LCB0byBtYWtlIHRoZSBjaGFuZ2VzIGFzDQo+IG1lY2hhbmljYWwgYXMgcG9zc2libGUgSSBy
ZXN0cmljdGVkIG15c2VsZiB0bzoNCj4gLSBhZGRpbmcgdGhlIHNpbmdsZS1saW5lIGNvbW1l
bnQgYXQgdGhlIHRvcCBvZiB0aGUgZmlsZQ0KPiAtIHJlbW92aW5nIHRoZSBjb3B5cmlnaHQg
bGluZXMgKHdoZW4gcHJlc2VudCkgZnJvbSB0aGUgdG9wIG9mIHRoZSBmaWxlDQo+ICAgIGhl
YWRlcg0KPiANCj4gSSBwdXJwb3NlZGx5IHJlc3RyYWluZWQgbXlzZWxmIHRvIGRvIG90aGVy
IGNsZWFudXBzIHRvIHRoZSBoZWFkZXJzOiB0aGlzDQo+IHNlcmllcyBhbHJlYWR5IHRvdWNo
ZXMgbWFueSBmaWxlcyBhbmQgSSBwcmVmZXIgdG8ga2VlcCB0aGVzZSBjaGFuZ2VzIGFzDQo+
IG1lY2hhbmljYWwgYXMgcG9zc2libGUuIEZ1cnRoZXIgaW1wcm92ZW1lbnRzIChzdHlsZSBp
bXByb3ZlbWVudCwNCj4gcmVtb3Zpbmcgd2hhdCdzIGxlZnQgb2YgdGhlIGhlYWRlciwgcmVt
b3ZpbmcgY29weXJpZ2h0IGxpbmVzLCBldGMuKSBjYW4NCj4gYmUgZG9uZSB3aXRoIHN1YnNl
cXVlbnQgcGF0Y2hlcyBtb3JlIGVhc2lseS4NCj4gDQo+IExpY2Vuc2UgY2hhbmdlcyBhcmUg
bm90IGludGVudGlvbmFsLg0KDQpGb3IgdGhlIHNlcmllczoNCg0KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------W9LzjQPOwL7k0VUXJcy61gb4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------W9LzjQPOwL7k0VUXJcy61gb4--

--------------hUi4m1UkseH0pcrJTAcqh8C2--

--------------opCtZCcxg4Mb3PnqHSYFq4Od
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL/IL0FAwAAAAAACgkQsN6d1ii/Ey8H
HwgAhmlsotZ05quHx7gdJ8zl9pDoqZaqMcy3w2DkGT7eFeCkAAZTr9O6eZ0rS53h5+RXUJ795qBv
VZ5u4DX+OPNScfsRhTkIPi0X8NimsyPezKOy3oaD9w9tFwS1Vh7lteqSlynHKQEUSMB9oKDGKDov
gMmkgCVHCRQXvovJ5DE5BY8vJaQLOpJuesTytvd/1Lm7mPCcFeSALgYYaicll+ffznTDi3MzypMq
ob4hfTQ0tWZVe+uhmR6J0PNmdc4uu4UiXlwbyvKRCGvCfpn589zR+QcpgGNDtXGkFJbXjWGvJkxf
f99WtyhO2S/BPzuOmRbHaKJZGs1/lzXpciu2OOq1aw==
=MVPf
-----END PGP SIGNATURE-----

--------------opCtZCcxg4Mb3PnqHSYFq4Od--

