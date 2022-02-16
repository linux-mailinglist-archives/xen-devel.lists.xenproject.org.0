Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765534B80B8
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 07:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273699.468958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKDre-0003VS-6p; Wed, 16 Feb 2022 06:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273699.468958; Wed, 16 Feb 2022 06:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKDre-0003ST-3K; Wed, 16 Feb 2022 06:32:34 +0000
Received: by outflank-mailman (input) for mailman id 273699;
 Wed, 16 Feb 2022 06:32:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BoLq=S7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nKDrc-0003S4-0c
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 06:32:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37816dcb-8ef2-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 07:32:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6081A212C3;
 Wed, 16 Feb 2022 06:32:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2439413A3E;
 Wed, 16 Feb 2022 06:32:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id izAFB36aDGJ7IQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Feb 2022 06:32:30 +0000
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
X-Inumbo-ID: 37816dcb-8ef2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644993150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GwxMg2UkWH0rNV1uqw/Ax9X7A7CDk4lDSvqL8KM86I0=;
	b=Fx66wrg18CIFMlgkEP6I3zF8IyMd2uoo/xMvaoVgNzPT1bKSlHSitOPNSLyVHTTDRMp53w
	t4eLVIJGcl8b5EwKgDrFNvuRK3+qDQoq6RJBez2mFASQEAhcZ+IE2wX7+zrJdi6AOLC63k
	WhBtxklU1T39yT5DuELrsAG7Jp5neLY=
Message-ID: <aa39b1ee-feb7-b9b0-9d14-01a5356f7129@suse.com>
Date: Wed, 16 Feb 2022 07:32:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] docs: add some clarification to xenstore-migration.md
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220210112652.6237-1-jgross@suse.com>
 <6dd022ea-192b-3a5b-e02c-2368e769339f@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <6dd022ea-192b-3a5b-e02c-2368e769339f@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kbhIom36OKq4KruNfQlrbTp0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kbhIom36OKq4KruNfQlrbTp0
Content-Type: multipart/mixed; boundary="------------RQrnluHG3x0zIzYCJQ8vA7Sh";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <aa39b1ee-feb7-b9b0-9d14-01a5356f7129@suse.com>
Subject: Re: [PATCH] docs: add some clarification to xenstore-migration.md
References: <20220210112652.6237-1-jgross@suse.com>
 <6dd022ea-192b-3a5b-e02c-2368e769339f@xen.org>
In-Reply-To: <6dd022ea-192b-3a5b-e02c-2368e769339f@xen.org>

--------------RQrnluHG3x0zIzYCJQ8vA7Sh
Content-Type: multipart/mixed; boundary="------------0vibqX66EMfA1rmGDQ49Vlyi"

--------------0vibqX66EMfA1rmGDQ49Vlyi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjIgMjE6NDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzAyLzIwMjIgMTE6MjYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
aGUgWGVuc3RvcmUgbWlncmF0aW9uIGRvY3VtZW50IGlzIG1pc3NpbmcgdGhlIHNwZWNpZmlj
YXRpb24gdGhhdCBhDQo+PiBub2RlIHJlY29yZCBtdXN0IGJlIHByZWNlZGVkIGJ5IHRoZSBy
ZWNvcmQgb2YgaXRzIHBhcmVudCBub2RlIGluIGNhc2UNCj4+IG9mIGxpdmUgdXBkYXRlLg0K
Pj4NCj4+IEFkZCB0aGF0IG1pc3NpbmcgcGFydC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IMKgIGRvY3MvZGVz
aWducy94ZW5zdG9yZS1taWdyYXRpb24ubWQgfCA0ICsrKysNCj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9kZXNpZ25z
L3hlbnN0b3JlLW1pZ3JhdGlvbi5tZCANCj4+IGIvZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1p
Z3JhdGlvbi5tZA0KPj4gaW5kZXggNWYxMTU1MjczZS4uMzllMzFjOTg0YiAxMDA2NDQNCj4+
IC0tLSBhL2RvY3MvZGVzaWducy94ZW5zdG9yZS1taWdyYXRpb24ubWQNCj4+ICsrKyBiL2Rv
Y3MvZGVzaWducy94ZW5zdG9yZS1taWdyYXRpb24ubWQNCj4+IEBAIC0zMTYsNiArMzE2LDEw
IEBAIGEgX2NvbW1pdHRlZF8gbm9kZSAoZ2xvYmFsbHkgdmlzaWJsZSBpbiANCj4+IHhlbnN0
b3JlZCkgb3IgYSBfcGVuZGluZ18gbm9kZSAoY3JlYXRlZA0KPj4gwqAgb3IgbW9kaWZpZWQg
YnkgYSB0cmFuc2FjdGlvbiBmb3Igd2hpY2ggdGhlcmUgaXMgYWxzbyBhIA0KPj4gYFRSQU5T
QUNUSU9OX0RBVEFgDQo+PiDCoCByZWNvcmQgcHJldmlvdXNseSBwcmVzZW50KS4NCj4+ICtJ
biB0aGUgbGl2ZSB1cGRhdGUgY2FzZSB0aGUgX2NvbW1pdHRlZF8gbm9kZXMgbXVzdCBiZSBp
biBhIHRvcC1kb3duIA0KPj4gc2VxdWVuY2UsDQo+PiAraS5lLiB0aGUgZmlyc3Qgbm9kZSBu
ZWVkcyB0byBiZSBgL2AsIGFuZCBlYWNoIG90aGVyIG5vZGUgaW4gdGhlIA0KPj4gc3RyZWFt
IG11c3QNCj4+ICtjb21lIF9hZnRlcl8gaXRzIHBhcmVudCBub2RlLg0KPiANCj4gSSB3b3Vs
ZCBhY3R1YWxseSBleHBlY3QgdGhlIHNhbWUgcmVzdHJpY3Rpb24gdG8gYXBwbHkgZm9yIHRo
ZSANCj4gbm9uLWxpdmV1cGRhdGUgY2FzZS4gSS5lLiB3ZSB3YW50IHRoZSBwYXJlbnQgdG8g
ZWl0aGVyIGV4aXN0IGluIHRoZSB0cmVlIA0KPiBvciB0aGUgcmVjb3JkIGZvciB0aGUgcGFy
ZW50IHRvIGJlIGJlZm9yZSBpbiB0aGUgc3RyZWFtLg0KDQpIbW0sIHRydWUuIEknbGwgcmVw
aHJhc2UgdGhhdC4NCg0KDQpKdWVyZ2VuDQo=
--------------0vibqX66EMfA1rmGDQ49Vlyi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0vibqX66EMfA1rmGDQ49Vlyi--

--------------RQrnluHG3x0zIzYCJQ8vA7Sh--

--------------kbhIom36OKq4KruNfQlrbTp0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIMmn0FAwAAAAAACgkQsN6d1ii/Ey8v
BQgAh6uhnweQpWcOFm+/PYzuQShcmbdpAcBZlZIHklaYhwickt1YNM5KOsOnoo/2IM4QsuuSvcWj
1NaFmC5jwjX1F3d5jNIwJSfuHwfii3bLlZdOogAHIPYzmxn+39/MW9qjCTrwr+K/oOQFvynolMm2
sh6Abw9RJc4Qbncbeqh3ysdfBSMD2F9VczZwWaWTDsF32f63W8yvcsSZ5vNOXR6cfY26+melTjlQ
Mb7TfdEfoQH87ledYKqvTN01zfTmC4z6/LkkLADgqbkGDD5NA+sitS/LU4a/JPiwBtZr2wBcHbHw
5adBGA+stxwrJXd+VUjpp0CGkdv2abLCCh1K+hZVig==
=+N1n
-----END PGP SIGNATURE-----

--------------kbhIom36OKq4KruNfQlrbTp0--

