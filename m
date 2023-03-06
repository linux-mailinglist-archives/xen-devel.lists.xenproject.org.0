Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F86AB6D2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 08:13:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506664.779758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ525-0005Hw-Ll; Mon, 06 Mar 2023 07:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506664.779758; Mon, 06 Mar 2023 07:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ525-0005Ee-Iw; Mon, 06 Mar 2023 07:13:17 +0000
Received: by outflank-mailman (input) for mailman id 506664;
 Mon, 06 Mar 2023 07:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kIMi=66=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZ524-0005EI-85
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 07:13:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c48e208-bbee-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 08:13:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 22B1F21EB3;
 Mon,  6 Mar 2023 07:13:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A06913513;
 Mon,  6 Mar 2023 07:13:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SGQ1IImSBWTyJgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Mar 2023 07:13:13 +0000
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
X-Inumbo-ID: 5c48e208-bbee-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678086794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YvDMhSXmiGVzbLzei78fgWHA9om6Y2kLxVX8sxZc5Gw=;
	b=bKDgHjtxGNG6fq67wCumi1sHfMM0tgk7FIUhaw+ZqSzBRxSQjsWuss0R4q1hdi0XGRNJaj
	nDSerQOpEefdoe4JKVVe7XAcQf/L55lu0xNZyK8YQZHkSIlhze4rhNlNYFNbPMDGYBE8ZG
	+1XRnAJ1Pv7fTJCav/Cf8zRycj//udo=
Message-ID: <30f30ce8-697b-2df2-143d-d182d53760cc@suse.com>
Date: Mon, 6 Mar 2023 08:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] tools: rename xen-tools/libs.h file to
 common-macros.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20230227154153.31080-1-jgross@suse.com>
 <20230227154153.31080-2-jgross@suse.com>
 <07780c4a-48ff-9c63-9f73-39d8e272a6bd@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <07780c4a-48ff-9c63-9f73-39d8e272a6bd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------j41H5dxvaQGy1AYlSTp6Kk4H"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------j41H5dxvaQGy1AYlSTp6Kk4H
Content-Type: multipart/mixed; boundary="------------WkBSwxi9p5IDAUC2Us7JgSzE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <30f30ce8-697b-2df2-143d-d182d53760cc@suse.com>
Subject: Re: [PATCH v2 1/4] tools: rename xen-tools/libs.h file to
 common-macros.h
References: <20230227154153.31080-1-jgross@suse.com>
 <20230227154153.31080-2-jgross@suse.com>
 <07780c4a-48ff-9c63-9f73-39d8e272a6bd@suse.com>
In-Reply-To: <07780c4a-48ff-9c63-9f73-39d8e272a6bd@suse.com>

--------------WkBSwxi9p5IDAUC2Us7JgSzE
Content-Type: multipart/mixed; boundary="------------jGWdJtZYKimcYxNOtN25KN0Z"

--------------jGWdJtZYKimcYxNOtN25KN0Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDIuMjMgMTY6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNy4wMi4yMDIz
IDE2OjQxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvdG9vbHMvaW5jbHVkZS94
ZW4tdG9vbHMvbGlicy5oDQo+PiArKysgYi90b29scy9pbmNsdWRlL3hlbi10b29scy9jb21t
b24tbWFjcm9zLmgNCj4+IEBAIC0xLDUgKzEsMTMgQEANCj4+IC0jaWZuZGVmIF9fWEVOX1RP
T0xTX0xJQlNfXw0KPj4gLSNkZWZpbmUgX19YRU5fVE9PTFNfTElCU19fDQo+PiArI2lmbmRl
ZiBfX1hFTl9UT09MU19DT01NT05fTUFDUk9TX18NCj4+ICsjZGVmaW5lIF9fWEVOX1RPT0xT
X0NPTU1PTl9NQUNST1NfXw0KPj4gKw0KPj4gKy8qDQo+PiArICogQ2F1dGlvbjoNCj4+ICsg
Kg0KPj4gKyAqIFRoaXMgaGVhZGVyIG11c3QgYmUgY29tcGxldGVseSBzZWxmLWNvbnRhaW5l
ZC4gVGhlcmUgYXJlIG5vIGV4dGVybmFsDQo+PiArICogcmVmZXJlbmNlcyB0byB2YXJpYWJs
ZXMgb3IgZnVuY3Rpb25zIGFsbG93ZWQsIGFzIHRoZSBmaWxlIG1pZ2h0IGJlIGluY2x1ZGVk
DQo+PiArICogZm9yIGRpZmZlcmVudCBydW50aW1lIGVudmlyb25tZW50cywgc3VjaCBhcyBm
aXJtd2FyZSBvciBub3JtYWwgcHJvZ3JhbXMuDQo+PiArICovDQo+IA0KPiBNYXkgSSBhc2sg
dG8gZ28gYSB0aW55IHN0ZXAgZnVydGhlcjogcy9ub3JtYWwvdGFyZ2V0IGFuZCBidWlsZCBo
b3N0LyBvcg0KPiBzb21ldGhpbmcgYWxpa2U/DQoNCkZpbmUgd2l0aCBtZS4NCg0KDQpKdWVy
Z2VuDQoNCg==
--------------jGWdJtZYKimcYxNOtN25KN0Z
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------jGWdJtZYKimcYxNOtN25KN0Z--

--------------WkBSwxi9p5IDAUC2Us7JgSzE--

--------------j41H5dxvaQGy1AYlSTp6Kk4H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQFkokFAwAAAAAACgkQsN6d1ii/Ey8i
UQf+LV/FIqbyaf/Q3ejvWAe6IyyoqEHUjoeeIhkwJRCExrEkhb+D/Qi9s9BNa/DxryFZFNmgao7t
V5Q1eu7pxGe6oAXtWwIzdoPzNjgdpnAo0QVTEmEf6RSI+oDsimi74CNnBSc6Zvr5cyXVmPa+gejD
5KvA43F87UAGmBYVjHduo1unGSoHOcBlDCCEejafyqKDAhLdXBu5EtsZczUC5F9txIQE8b45TTKt
Vd1OtyYDtRLY1hD4E9Sh1tRCmjjm61nLY3b/oVmdyy0+ZhdgC+j/6KiUDOOB+t/efB0FMvZltOI9
HU7PNOW59TT000/IU2UZApSaaqhKorKLlzeq0pnAuQ==
=vBLy
-----END PGP SIGNATURE-----

--------------j41H5dxvaQGy1AYlSTp6Kk4H--

