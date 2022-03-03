Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60F4CB83D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 09:02:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282813.481628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPgPk-0008Sp-Rr; Thu, 03 Mar 2022 08:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282813.481628; Thu, 03 Mar 2022 08:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPgPk-0008Pg-OH; Thu, 03 Mar 2022 08:02:20 +0000
Received: by outflank-mailman (input) for mailman id 282813;
 Thu, 03 Mar 2022 08:02:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhVD=TO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nPgPj-0008Pa-KN
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 08:02:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eb33222-9ac8-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 09:02:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 867DA1F37E;
 Thu,  3 Mar 2022 08:02:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F6F5132C1;
 Thu,  3 Mar 2022 08:02:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PQakFQl2IGLrQQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Mar 2022 08:02:17 +0000
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
X-Inumbo-ID: 3eb33222-9ac8-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646294537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=arZstT6hCOBBaIX/lDq+R0r527Gi0dsNOT+iD7/dAfA=;
	b=AT2SaNP9vD27s+IvmUVi0sMajjfylvY47WnUHA+y++y0Sx5VT+QHR+lvD9ald4l5pSmc+R
	QEGTmmfKoG3aD+ejoP8UUpuUox1d/C85S9sHnSIhXzka6/S6tNB4rj3Jkxz/BtNb0x4wAI
	G4AABQFUw3+/r4Wj26f0O0DcI+fOdtQ=
Message-ID: <0b497cb4-a5d5-c853-aa17-c3b06e1395d3@suse.com>
Date: Thu, 3 Mar 2022 09:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v2 11/29] tools/xenstore: Cleanup makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
 <20220225151321.44126-12-anthony.perard@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220225151321.44126-12-anthony.perard@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4Fy8NGlIsdmQyLxbu8jfH2Dh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4Fy8NGlIsdmQyLxbu8jfH2Dh
Content-Type: multipart/mixed; boundary="------------MBt0d0w3XJlBoKyvChNU2iQw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Message-ID: <0b497cb4-a5d5-c853-aa17-c3b06e1395d3@suse.com>
Subject: Re: [XEN PATCH v2 11/29] tools/xenstore: Cleanup makefile
References: <20220225151321.44126-1-anthony.perard@citrix.com>
 <20220225151321.44126-12-anthony.perard@citrix.com>
In-Reply-To: <20220225151321.44126-12-anthony.perard@citrix.com>

--------------MBt0d0w3XJlBoKyvChNU2iQw
Content-Type: multipart/mixed; boundary="------------yjND3TdLOvO29g27iRduXv90"

--------------yjND3TdLOvO29g27iRduXv90
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDIuMjIgMTY6MTMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBSZWdyb3VwICpG
TEFHUyB0b2dldGhlciwgdXNlICQoTERMSUJTKS4NCj4gDQo+IFJlbW92ZSAkKExETElCU194
ZW5zdG9yZWQpIHdoaWNoIHdhcyB0aGUgd3JvbmcgbmFtZSBuYW1lIGFzIGl0IGRvZXNuJ3QN
Cj4gZGVjcmliZSBob3cgdG8gbGluayB0byBhIHBvdGVudGlhbCBsaWJ4ZW5zdG9yZWQuc28s
IGluc3RlYWQgYWRkIHRoZQ0KPiB2YWx1ZSB0byAkKExETElCUykgb2YgeGVuc3RvcmVkLg0K
PiANCj4gQWRkIFNZU1RFTURfTElCUyBpbnRvICQoTERMSUJTKSBpbnN0ZWFkIG9mICQoTERG
TEFHUykuDQo+IA0KPiBSZW1vdmUgdGhlICItSS4iIGZyb20gJChDRkxBR1MpLCBpdCBzaG91
bGRuJ3QgYmUgbmVlZGVkLg0KPiANCj4gUmVtb3ZlZCAkKENGTEFHUy15KSBhbmQgJChMREZM
QUdTLXkpLiAkKENGTEFHUy15KSBpcyBhbHJlYWR5IGluY2x1ZGVkDQo+IGluICQoQ0ZMQUdT
KSBhbmQgYm90aCBhcmVuJ3QgdXNlZCBhbnl3YXkuDQo+IA0KPiBSZW5hbWUgQUxMX1RBUkdF
VFMgdG8gVEFSR0VUUy4NCj4gT25seSBhZGQgcHJvZ3JhbW1lcyB3ZSB3YW50IHRvIGJ1aWxk
IGluICQoVEFSR0VUUyksIG5vdCBwaG9ueS10YXJnZXRzDQo+IChyZXBsYWNlICJjbGllbnRz
IikuDQo+IA0KPiBTdG9yZSBhbGwgYHhlbnN0b3JlZGAgb2JqcyBpbnRvICQoWEVOU1RPUkVE
X09CSlMteSkuDQo+IA0KPiBSZXBsYWNlIG9uZSAkPCBieSAkXiBldmVuIGlmIHRoZXJlJ3Mg
b25seSBvbmUgZGVwZW5kZW5jeSwNCj4gKHhlbnN0b3JlLWNvbnRyb2wpLg0KPiANCj4gY2xl
YW46ICJpbml0LXhlbnN0b3JlLWRvbWFpbiIgaXNuJ3QgYnVpbHQgaGVyZSBhbnkgbW9yZSwg
c28gc3RvcA0KPiB0cnlpbmcgdG8gcmVtb3ZlIGl0LCByZW1vdmUgJChUQVJHRVRTKS4gQWxz
byByZWdyb3VwIGFsbCBmaWxlcyB0byBiZQ0KPiByZW1vdmVkIGluIG9uZSBjb21tYW5kLCB1
c2luZyAkKFJNKS4NCj4gDQo+IERyb3AgJChNQUpPUikgYW5kICQoTUlOT1IpLCB0aGV5IGFy
ZW4ndCB1c2VkIGFueW1vcmUuDQo+IA0KPiBEcm9wICIuU0VDT05EQVJZOiIsIGl0IGRvZXNu
J3QgYXBwZWFyIHRoZXJlJ3MgaW50ZXJtZWRpYXRlIGZpbGVzIHRoYXQNCj4gd291bGQgYmUg
ZGVsZXRlZCBhbnltb3JlLg0KPiANCj4gRHJvcCAidGFyYmFsbDoiIHRhcmdldC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXgu
Y29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0K
DQoNCkp1ZXJnZW4NCg==
--------------yjND3TdLOvO29g27iRduXv90
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------yjND3TdLOvO29g27iRduXv90--

--------------MBt0d0w3XJlBoKyvChNU2iQw--

--------------4Fy8NGlIsdmQyLxbu8jfH2Dh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIgdggFAwAAAAAACgkQsN6d1ii/Ey+W
6wf/SzkZB9XMZvG+c9rT/vCIDJsWGWaFfHv4JRPLFqYNqOq0sMXxEXFNtITCI5iIGeAuRc959Sb9
RRwXkNKaVN+KnfnTHBRa51bq1tKUR/LoruyucmAj6v1Wyl5P0HE7dgbTkjT9Ipz0lE6dwJDwOeqI
tJGxpjKlSjydqpFoCYTtR5wEFcTSBt51pWWqtbhXgmUolQWWOwXhpcMorsjBy5h+G3rDpB/oAC6g
Bohpvt0fx0oFtniv4f62z4dxGxLOfQ4M0sy3+hKo/FJdQ5ngdj2wOZEyt7QKpX6/3g/m/h5HZNow
L/rxQRmP9JncRkevV57zoGMD0ZxPZpRQZOZoBUxnqg==
=qlrZ
-----END PGP SIGNATURE-----

--------------4Fy8NGlIsdmQyLxbu8jfH2Dh--

