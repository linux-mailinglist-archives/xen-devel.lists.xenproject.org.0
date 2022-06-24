Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4436F5591D3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 07:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355251.582804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4bnw-0007AY-TX; Fri, 24 Jun 2022 05:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355251.582804; Fri, 24 Jun 2022 05:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4bnw-000778-Qh; Fri, 24 Jun 2022 05:24:28 +0000
Received: by outflank-mailman (input) for mailman id 355251;
 Fri, 24 Jun 2022 05:24:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4bnv-000772-OR
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 05:24:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9d08d0d-f37d-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 07:24:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA12F1F8BA;
 Fri, 24 Jun 2022 05:24:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71BDB1348D;
 Fri, 24 Jun 2022 05:24:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +vlbGolKtWJEGgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Jun 2022 05:24:25 +0000
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
X-Inumbo-ID: e9d08d0d-f37d-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656048265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6TJRhLuJaWdbXlhI1KpE3+ulGYwdGJw1cpvWy/tWWG4=;
	b=CAJbtgYJef3+J+whW99oxubEHtOReOdz7Q3ahIo/J57Z21T9iq03gJPmTADMEMZnGBrYNe
	ExRdkQmSpedF+RXu4nfnvEcjYLm3HKjcI95/WPNlwtvRxEAqzg/bGfESmF084K4a4t261b
	YOO4UjULjEySav/SSHpp9RbBC9FaeQE=
Message-ID: <9fdf6101-7486-67bf-8aa8-c4d2c59991c9@suse.com>
Date: Fri, 24 Jun 2022 07:24:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/4] tools/xenstore: add documentation for new
 set/get-quota commands
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220527072427.20327-1-jgross@suse.com>
 <20220527072427.20327-4-jgross@suse.com>
 <a3eb8018-2e32-e451-7d97-885a5d4fd336@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a3eb8018-2e32-e451-7d97-885a5d4fd336@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lfjNIdFY2Y5z2aXx80Z5atUd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lfjNIdFY2Y5z2aXx80Z5atUd
Content-Type: multipart/mixed; boundary="------------VOos6BvbRIwtgwx0HstYvEnw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <9fdf6101-7486-67bf-8aa8-c4d2c59991c9@suse.com>
Subject: Re: [PATCH v2 3/4] tools/xenstore: add documentation for new
 set/get-quota commands
References: <20220527072427.20327-1-jgross@suse.com>
 <20220527072427.20327-4-jgross@suse.com>
 <a3eb8018-2e32-e451-7d97-885a5d4fd336@xen.org>
In-Reply-To: <a3eb8018-2e32-e451-7d97-885a5d4fd336@xen.org>

--------------VOos6BvbRIwtgwx0HstYvEnw
Content-Type: multipart/mixed; boundary="------------02trPqep2ZWvQyYJWiFXGix0"

--------------02trPqep2ZWvQyYJWiFXGix0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDYuMjIgMjA6MzQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI3LzA1LzIwMjIgMDg6MjQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
ZGQgZG9jdW1lbnRhdGlvbiBmb3IgdHdvIG5ldyBYZW5zdG9yZSB3aXJlIGNvbW1hbmRzIFNF
VF9RVU9UQSBhbmQNCj4+IEdFVF9RVU9UQSB1c2VkIHRvIHNldCBvciBxdWVyeSB0aGUgZ2xv
YmFsIFhlbnN0b3JlIHF1b3RhIG9yIHRob3NlIG9mDQo+PiBhIGdpdmVuIGRvbWFpbi4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+
PiAtLS0NCj4+IE5vdGUgdGhhdCBpdCBtaWdodCBiZSBhIGdvb2QgaWRlYSB0byBhZGQgc3Vw
cG9ydCB0byB0aGUgWGVuc3RvcmUNCj4+IG1pZ3JhdGlvbiBwcm90b2NvbCB0byB0cmFuc2Zl
ciBxdW90YSBkYXRhIChnbG9iYWwgYW5kL29yIHBlciBkb21haW4pLg0KPiANCj4gSSB0aGlu
ayB0aGlzIGlzIG5lZWRlZCBiZWNhdXNlIGEgdXNlciBtYXkgaGF2ZSBjb25maWd1cmVkIGEg
ZG9tYWluIHdpdGggcXVvdGFzIA0KPiBhYm92ZSB0aGUgZGVmYXVsdC4gQWZ0ZXIgTGl2ZS1V
cGRhdGUsIHdlIHdvdWxkIGhhdmUgYSBzaG9ydCB3aW5kb3cgd2hlcmUgdGhlIA0KPiBkb21h
aW4gbWF5IG5vdCBmdW5jdGlvbiBwcm9wZXJseS4NCj4gDQo+IEkgdGhpbmsgaXQgd291bGQg
YmUgZ29vZCB0byBkb2N1bWVudGF0aW9uIHRoZSBtaWdyYXRpb24gcGFydCBpbiB0aGlzIHBh
dGNoLiBCdXQgDQo+IGlmIHlvdSB3YW50IGRvIGl0IHNlcGFyYXRlbHkgdGhlbjoNCj4gDQo+
IFJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KDQpUaGFu
a3MuDQoNCkkgdGhpbmsgSSB3aWxsIGFkZCBhbm90aGVyIHBhdGNoIGRvY3VtZW50aW5nIGFs
bCBvZiB0aGUgbmVlZGVkIG1pZ3JhdGlvbg0Kc3RyZWFtIGFkZGl0aW9ucy4NCg0KDQpKdWVy
Z2VuDQoNCg==
--------------02trPqep2ZWvQyYJWiFXGix0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------02trPqep2ZWvQyYJWiFXGix0--

--------------VOos6BvbRIwtgwx0HstYvEnw--

--------------lfjNIdFY2Y5z2aXx80Z5atUd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK1SokFAwAAAAAACgkQsN6d1ii/Ey+z
Rwf/dMCzPSJtOfRCm/Q8VtJY+fJT9kXeUGr07KrrIzf3T4JF2aoCqBMkUTonVb8qTnSJCaq6dl9D
+OP291+6qNsqDkKldxGFZR+L/A8TQdMnLrimRFpgR6mEm1SUZ8usr0H9xsolKdlxrlhrSfqot85W
L8XBcmrSKWIl8iTTj0lWI0zM3fkZk1oeDE7ziYEPYwWVV5OeTtQsN7BgVwZMyuNHraHrUM+NH8ZM
TWQUVDOMT4O9B/iutpJRgaXYFEzrXzKl7LRfRMTsHh7gP1nZSQvGwjebm6EBxXlRUWoc+Xlsa6Ng
DmemGYebbXmj76TfyR9HjB+jOtH9BAxbCGGZ1YEhbQ==
=gIS/
-----END PGP SIGNATURE-----

--------------lfjNIdFY2Y5z2aXx80Z5atUd--

