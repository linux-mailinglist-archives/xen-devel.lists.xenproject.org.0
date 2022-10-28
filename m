Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B42610F2A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 12:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431902.684561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooN2X-0006NO-E6; Fri, 28 Oct 2022 10:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431902.684561; Fri, 28 Oct 2022 10:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooN2X-0006KW-BA; Fri, 28 Oct 2022 10:56:41 +0000
Received: by outflank-mailman (input) for mailman id 431902;
 Fri, 28 Oct 2022 10:56:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ooN2V-0006KQ-AU
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 10:56:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30fff563-56af-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 12:56:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0669121A59;
 Fri, 28 Oct 2022 10:56:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B610513A6E;
 Fri, 28 Oct 2022 10:56:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ma7nKmS1W2MvSAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Oct 2022 10:56:36 +0000
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
X-Inumbo-ID: 30fff563-56af-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666954597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y+pzUQWrSPJMKcGCvx5iWaKBsT+Mz7M8rB9qZ9ADrVg=;
	b=IuyhB2yOZC+Ty6FStCjSmlt97uBlq7FmwYV0uMEIfbVnY4WUZLbZusVGRlJPAYrx8+wbDH
	BiuXYb67QV4mdLtpFIMuPPOUOjCNpsHSwFbBPhIlqpeDCd394ogXFOYDRNEyQVaRC2wjFm
	e63n3nKeZT1Ml9TyZSLhGPJE3SUuqwk=
Message-ID: <301b11d2-ed2f-8e00-1c0c-4c2211eb3f38@suse.com>
Date: Fri, 28 Oct 2022 12:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221021145357.17931-1-jgross@suse.com>
 <Y1rKLJP/p+E+eVi7@mail-itl> <4977c33a-fe11-172a-11be-17acb01d61bb@suse.com>
 <901fa58e-6693-ca2e-9231-447f989d614d@citrix.com> <Y1utZequY2IC9Apw@mail-itl>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH-for-4.17] xen/sched: migrate timers to correct cpus after
 suspend
In-Reply-To: <Y1utZequY2IC9Apw@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dyY9gXJnoU90HCMTI0K9FZUx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dyY9gXJnoU90HCMTI0K9FZUx
Content-Type: multipart/mixed; boundary="------------tVKpkSfc72PZx5fweGhqJxXu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Henry Wang <Henry.Wang@arm.com>
Message-ID: <301b11d2-ed2f-8e00-1c0c-4c2211eb3f38@suse.com>
Subject: Re: [PATCH-for-4.17] xen/sched: migrate timers to correct cpus after
 suspend
References: <20221021145357.17931-1-jgross@suse.com>
 <Y1rKLJP/p+E+eVi7@mail-itl> <4977c33a-fe11-172a-11be-17acb01d61bb@suse.com>
 <901fa58e-6693-ca2e-9231-447f989d614d@citrix.com> <Y1utZequY2IC9Apw@mail-itl>
In-Reply-To: <Y1utZequY2IC9Apw@mail-itl>

--------------tVKpkSfc72PZx5fweGhqJxXu
Content-Type: multipart/mixed; boundary="------------p0Pnm2fL2DbFuql9tnB8BgQv"

--------------p0Pnm2fL2DbFuql9tnB8BgQv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMTAuMjIgMTI6MjIsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gRnJpLCBPY3QgMjgsIDIwMjIgYXQgMTA6MTI6MzZBTSArMDAwMCwgQW5kcmV3IENv
b3BlciB3cm90ZToNCj4+IE9uIDI4LzEwLzIwMjIgMTE6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6DQo+Pj4gT24gMjcuMTAuMjIgMjA6MTMsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSB3cm90ZToNCj4+Pg0KPj4+IFRoaXMgaXMgdmVyeSB3ZWlyZC4gVGhlIGRhdGEgc3VnZ2Vz
dHMgdGhhdCB0aGUgc2NoZWR1bGluZyByZXNvdXJjZQ0KPj4+IHBvaW50ZXINCj4+PiBmb3Ig
Y3B1IDEgd2FzIE5VTEwsIGJ1dCBJIGNhbid0IHNlZSBob3cgdGhpcyBjYW4gYmUgdGhlIGNh
c2Ugd2l0aG91dA0KPj4+IGNhdXNpbmcNCj4+PiBzaW1pbGFyIGNyYXNoZXMgd2l0aG91dCB0
aGlzIHBhdGNoLg0KPj4+DQo+Pj4gQXJlIHRoZXJlIGFueSBhZGRpdGlvbmFsIHBhdGNoZXMg
cmVsYXRlZCB0byBjcHUgb24vb2ZmbGluaW5nIG9yDQo+Pj4gc3VzcGVuZC9yZXN1bWUNCj4+
PiBpbiB0aGUgaHlwZXJ2aXNvcj8NCj4gDQo+IE5vIHN1Y2ggcGF0Y2hlcywgaXQgd2FzIHRo
aXM6DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9tYXJtYXJlay94ZW4vY29tbWl0cy9tYXN0ZXIt
Y3JlZGl0LXRpbWVycw0KPiANCj4+IFF1YmVzT1MgcnVucyB3aXRoIHNtdD0wIGJ5IGRlZmF1
bHQuwqAgU2libGluZ3Mgb3VnaHQgdG8gYmUgcGFya2VkIGF0IHRoaXMNCj4+IHBvaW50Lg0K
PiANCj4gWWVzLCBpbmRlZWQgdGhpcyB0ZXN0IHdhcyB3aXRoIHNtdD1vZmYuDQoNCkFoLCB0
aGlzIGlzIHN1YnRsZS4gVGhlIENQVV9PTkxJTkUgbm90aWZpZXJzIGFyZSBjYWxsZWQgZm9y
IHRoZSBzaWJsaW5ncywNCnRvbywgcmVzdWx0aW5nIGluIGFib3ZlIGVycm9yLg0KDQpQcmVw
YXJpbmcgVjIgb2YgdGhlIHBhdGNoLg0KDQoNCkp1ZXJnZW4NCg==
--------------p0Pnm2fL2DbFuql9tnB8BgQv
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------p0Pnm2fL2DbFuql9tnB8BgQv--

--------------tVKpkSfc72PZx5fweGhqJxXu--

--------------dyY9gXJnoU90HCMTI0K9FZUx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNbtWQFAwAAAAAACgkQsN6d1ii/Ey9+
Igf/Vj33ldZyQKaRSBXqcToUGGSQ1Tuzxmwb8wJSQ/mt7y6p76KZUJudBuy3oMjFiTsK7HNEbZ0K
m0yXIZHv1VirQHnBjjCtGfIjXUhNhcA6aU11xxHeLzBMDwhKbiI7Yxt5nPPuOs63Y6udnXFaiJa/
ZVqPTvh4z7/gyMwIiruOR9S6mv1GBfUY5emw/v02KSXx4CR6cdTJ+hoRoozYEvwPDGFcJIPagMh0
Nkn59DTXKjIxSnjxe26IaKGsR9SD4P/OlqBpgImRofiDFeaFE0opP7SKoCaa1I5wPs+P+NDYuS4N
UjFTEz8w/vYl2trwyRnY+s0HcSCasn8udp+ud2aqzw==
=My0V
-----END PGP SIGNATURE-----

--------------dyY9gXJnoU90HCMTI0K9FZUx--

