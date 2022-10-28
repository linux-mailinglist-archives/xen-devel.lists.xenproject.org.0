Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4B7610AB9
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 08:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431415.684307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJDC-0005wN-05; Fri, 28 Oct 2022 06:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431415.684307; Fri, 28 Oct 2022 06:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJDB-0005uV-T7; Fri, 28 Oct 2022 06:51:25 +0000
Received: by outflank-mailman (input) for mailman id 431415;
 Fri, 28 Oct 2022 06:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ooJDA-0005uP-Is
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 06:51:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef2e2934-568c-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 08:51:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 55EAB1F921;
 Fri, 28 Oct 2022 06:51:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CDCC51377D;
 Fri, 28 Oct 2022 06:51:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4wylMOl7W2PESgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Oct 2022 06:51:21 +0000
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
X-Inumbo-ID: ef2e2934-568c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666939882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h5k7lKh7CDfIxFHjHAAvrPqXcRUX/v7MaVm45cX1eFc=;
	b=PhnRV8EPaqZC+DhonO/r32S6mSTAaLzoU4KoIftXX9BT385Nmuz/MPygp04IiDd19Zm5yN
	x3AIU0WHaVrRQrqQOgGVwqxGNzf8OVwOkOrVGf3DYNBLOKDulWa5WDFTYhBY5adwytIPYO
	B+6JnGUqlU6oGAfO7ZYyCkwgDmtJHWw=
Message-ID: <61534be4-a2a0-bda3-7e0d-e5ff00f89d86@suse.com>
Date: Fri, 28 Oct 2022 08:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Feedback for postponing the 4.17 release to a week later
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>
References: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DqW3jnHdLXosqFNSWcWBUMva"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DqW3jnHdLXosqFNSWcWBUMva
Content-Type: multipart/mixed; boundary="------------QLTWUCuotKkWw7zlMOHQNdT0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>
Message-ID: <61534be4-a2a0-bda3-7e0d-e5ff00f89d86@suse.com>
Subject: Re: Feedback for postponing the 4.17 release to a week later
References: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>

--------------QLTWUCuotKkWw7zlMOHQNdT0
Content-Type: multipart/mixed; boundary="------------akGzOmXFJkBju7f0GRrjeyEP"

--------------akGzOmXFJkBju7f0GRrjeyEP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMTAuMjIgMDY6NDMsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+IEhpIGFsbCwNCj4gDQo+
IFNpbmNlIHRoZXJlIHdpbGwgYmUgYSBiYXRjaCBvZiBYU0FzIHJlbGVhc2VkIG9uIE5vdi4g
MSBbMV0gYW5kIHRoZSBvcmlnaW5hbCBkYXRlIGZvcg0KPiB0aGUgNC4xNyByZWxlYXNlIHdh
cyBzdXBwb3NlZCB0byBiZSBOb3YuIDIsIEkgYW0gdGhpbmtpbmcgdG8gcG9zdHBvbmUgdGhl
IDQuMTcNCj4gcmVsZWFzZSB0byBhIHdlZWsgbGF0ZXIgKE5vdi4gMTEpIHRvIGdpdmUgYSBs
aXR0bGUgYml0IGxvbmdlciB0aW1lIHNvIHRoYXQ6DQo+IA0KPiAtIFRoZSBzZWN1cml0eSB0
ZWFtIHdvbid0IGRvIGFueXRoaW5nIGluIHJ1c2guDQo+IC0gV2UgY2FuIGhhdmUgbW9yZSBm
ZWVkYmFjayBhZnRlciBtZXJnaW5nIHRoZXNlIFhTQXMuDQo+IC0gSW5jbHVkZSBtb3JlIHJl
bGVhc2UtcmVsZXZhbnQgYnVnZml4ZXMuDQo+IA0KPiBNYXkgSSBwbGVhc2UgaGF2ZSBzb21l
IGZlZWRiYWNrIG9uIHRoaXMgcHJvcG9zYWw/IFRoYW5rcyB2ZXJ5IG11Y2ghDQoNClRoZSBh
bHRlcm5hdGl2ZXMgd291bGQgYmU6DQoNCi0gbm90IGluY2x1ZGluZyB0aGUgWFNBcyBpbiA0
LjE3IChJTU8gYSBiYWQgaWRlYSkNCi0gZG9uJ3QgZG8gZmluYWwgdGVzdHMgd2l0aCB0aGUg
WFNBcyBpbmNsdWRlZCAoYW5vdGhlciBiYWQgaWRlYSkNCg0KVGhpcyBpcyBhIGNsZWFyIGlu
ZGljYXRpb24gZm9yIG1lIHRvIGRlbGF5IHRoZSByZWxlYXNlLCBsaWtlIHdlIGRpZCBpbg0K
c2ltaWxhciBjYXNlcyBpbiB0aGUgcGFzdCBzZXZlcmFsIHRpbWVzLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------akGzOmXFJkBju7f0GRrjeyEP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------akGzOmXFJkBju7f0GRrjeyEP--

--------------QLTWUCuotKkWw7zlMOHQNdT0--

--------------DqW3jnHdLXosqFNSWcWBUMva
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNbe+kFAwAAAAAACgkQsN6d1ii/Ey+U
dwf9HaxcBmAlAAcW9mxngJRqUwESjAHSdxMGXO3MVXz5jWpvByhCB5EqN0ZSexbl2jxVhGgEWAz9
qETzkT/vxqJPV19Kf2UGMuHHmD7n/jw7cTdRyL6D7d2lLQX+U4XK1TcSVx5EQjR8n3O/9tdNhUBq
8xZ5NvTdIjO9o2csfkUBa/0KockzpLNYDs82j7jafsJo4bAdzYcGXvnbPxJ/rvdP6+KEBTI8FzuJ
VxwU10B0zjJWQjuAnLFKIv80r3oJ7nPdGwUqoCVyoQ+fPz53XxPWpyyNYAuGo01majvg5y9KISNo
wAMEHbQiKSYb4qWk0w7L4SgEvy5N7XXkkokljxea9A==
=kpst
-----END PGP SIGNATURE-----

--------------DqW3jnHdLXosqFNSWcWBUMva--

