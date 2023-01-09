Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54166294F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 16:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473725.734454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEti9-0004Am-Ai; Mon, 09 Jan 2023 15:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473725.734454; Mon, 09 Jan 2023 15:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEti9-00048I-7t; Mon, 09 Jan 2023 15:05:17 +0000
Received: by outflank-mailman (input) for mailman id 473725;
 Mon, 09 Jan 2023 15:05:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CfuE=5G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pEti7-00048B-53
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 15:05:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0499697b-902f-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 16:05:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D18E14680;
 Mon,  9 Jan 2023 15:05:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA32C134AD;
 Mon,  9 Jan 2023 15:05:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fK85KCgtvGMGQwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 09 Jan 2023 15:05:12 +0000
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
X-Inumbo-ID: 0499697b-902f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673276712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r5AchZgkjBMvT1rTdbO0/ZY4pyGy39ipbS0uUdkYcRY=;
	b=ALlw8jrDaBsAMeOsxe37gz788mxvsiIal84uC3vh8oCPb/RUOGaMrHPWS4u/XZ7YaTrojO
	/0vL7JTxDXcpiY4JVHHOHWSEoBC2rfvC7jt/VeA1fco6NMz+r9weMsFMOgQlN3Lxf7gIPR
	Wxpn6kaoTqLV/lIjIHJInWbL6UGGQMA=
Message-ID: <055adce8-ceba-983a-19cc-b09ec30bb3c3@suse.com>
Date: Mon, 9 Jan 2023 16:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/4] xen/blkback: some cleanups
Content-Language: en-US
To: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org
References: <20221216145816.27374-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221216145816.27374-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Bn9el70qiXK9dBtQDHvkBxHs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Bn9el70qiXK9dBtQDHvkBxHs
Content-Type: multipart/mixed; boundary="------------5FtRzSy4gpSehjOHS0zh00HX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org
Message-ID: <055adce8-ceba-983a-19cc-b09ec30bb3c3@suse.com>
Subject: Re: [PATCH 0/4] xen/blkback: some cleanups
References: <20221216145816.27374-1-jgross@suse.com>
In-Reply-To: <20221216145816.27374-1-jgross@suse.com>

--------------5FtRzSy4gpSehjOHS0zh00HX
Content-Type: multipart/mixed; boundary="------------KfBHdy9WwI9ryEeh1hcoeXvF"

--------------KfBHdy9WwI9ryEeh1hcoeXvF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTIuMjIgMTU6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFNvbWUgc21hbGwg
Y2xlYW51cCBwYXRjaGVzIEkgaGFkIGx5aW5nIGFyb3VuZCBmb3Igc29tZSB0aW1lIG5vdy4N
Cj4gDQo+IEp1ZXJnZW4gR3Jvc3MgKDQpOg0KPiAgICB4ZW4vYmxrYmFjazogZml4IHdoaXRl
IHNwYWNlIGNvZGUgc3R5bGUgaXNzdWVzDQo+ICAgIHhlbi9ibGtiYWNrOiByZW1vdmUgc3Rh
bGUgcHJvdG90eXBlDQo+ICAgIHhlbi9ibGtiYWNrOiBzaW1wbGlmeSBmcmVlX3BlcnNpc3Rl
bnRfZ250cygpIGludGVyZmFjZQ0KPiAgICB4ZW4vYmxrYmFjazogbW92ZSBibGtpZl9nZXRf
eDg2XypfcmVxKCkgaW50byBibGtiYWNrLmMNCj4gDQo+ICAgZHJpdmVycy9ibG9jay94ZW4t
YmxrYmFjay9ibGtiYWNrLmMgfCAxMjYgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0K
PiAgIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmggIHwgMTAzICstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMTggaW5zZXJ0aW9ucygr
KSwgMTExIGRlbGV0aW9ucygtKQ0KPiANCg0KUGluZz8NCg0KDQpKdWVyZ2VuDQo=
--------------KfBHdy9WwI9ryEeh1hcoeXvF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------KfBHdy9WwI9ryEeh1hcoeXvF--

--------------5FtRzSy4gpSehjOHS0zh00HX--

--------------Bn9el70qiXK9dBtQDHvkBxHs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmO8LSgFAwAAAAAACgkQsN6d1ii/Ey8T
rgf/YPspae1H6xxWZbx8KKP2yS3WylDZF0YoQUBMlTxslcwhIiRltIckPFalUVdJclpwj8v2DyXK
gIqKYpP1LJvXxIwty70hNd7lsWtSUeG633XCeEmkm/UlxGtk901ELOiPC6Pz4kHOS2Q+24CumPyV
Cto1pzmm4K0PiXaAZyLLJ1B9GBpKnoOBJoL4H9Gxoq3lNr+FATjxbIQaPNS45hKx9qFhlVqAsDUX
s+KMdJQsyhXcIakEzwBiqpZ0A4DAP7I8zHuoMeELoPR7DpZB+rPh8MlobYvQfv/eR1hIRjlq8zeB
5UV+XYYQGFDp1Z2p4QHR4IerT9sRCNCqyiQ8/AlYjw==
=sGDi
-----END PGP SIGNATURE-----

--------------Bn9el70qiXK9dBtQDHvkBxHs--

