Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6EC6E3FDB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 08:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521752.810588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poISg-0002sV-6J; Mon, 17 Apr 2023 06:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521752.810588; Mon, 17 Apr 2023 06:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poISg-0002qB-2h; Mon, 17 Apr 2023 06:35:38 +0000
Received: by outflank-mailman (input) for mailman id 521752;
 Mon, 17 Apr 2023 06:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yHEP=AI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1poISe-0002q5-6L
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 06:35:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e315093-dcea-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 08:35:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 702BB1F38D;
 Mon, 17 Apr 2023 06:35:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 441E013319;
 Mon, 17 Apr 2023 06:35:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WB4nD7XoPGTJBwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 17 Apr 2023 06:35:33 +0000
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
X-Inumbo-ID: 0e315093-dcea-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1681713333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gfi+IABHGpYlqP7Ea7r8GTDv04KE6VV7UiF+gCL1X3o=;
	b=sUT2V1Rm0ZGnZp38E8Y9ll4NYNO8hseIlBYh4TB+QAylwWq2UahTFkkEKGgFEcfr1a7wPW
	JXDSGtZdjD8S85TH85ZrCKD/V4qk0WJun7ZJENt5NzA3NVei0P/0BHjUHGuGuhLptBtSnd
	zKAR/L9fkXTfKzgTXVpS2oaiKts8MAQ=
Message-ID: <fda641f1-e87e-3dc0-85a5-acf91d6f39ff@suse.com>
Date: Mon, 17 Apr 2023 08:35:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Alexander Kanavin <alex@linutronix.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230412090104.3794213-1-alex@linutronix.de>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xenstore/xenstored_control.c: correctly print
 time_t
In-Reply-To: <20230412090104.3794213-1-alex@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------e8RkAns0TqfJFeVgiQRV8lNg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------e8RkAns0TqfJFeVgiQRV8lNg
Content-Type: multipart/mixed; boundary="------------2PINZutKOFs6uaGlQkIzQ4ZC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Alexander Kanavin <alex@linutronix.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <fda641f1-e87e-3dc0-85a5-acf91d6f39ff@suse.com>
Subject: Re: [PATCH] tools/xenstore/xenstored_control.c: correctly print
 time_t
References: <20230412090104.3794213-1-alex@linutronix.de>
In-Reply-To: <20230412090104.3794213-1-alex@linutronix.de>

--------------2PINZutKOFs6uaGlQkIzQ4ZC
Content-Type: multipart/mixed; boundary="------------xPXyoIDaEOCo32SxzBFdH5zG"

--------------xPXyoIDaEOCo32SxzBFdH5zG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDQuMjMgMTE6MDEsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiBPbiAzMiBi
aXQgc3lzdGVtcyB3aXRoIDY0IGJpdCB0aW1lX3QgKGhlbGxvLCBZMjAzOCBwcm9ibGVtKSwN
Cj4gdGhlIGZvbGxvd2luZyBlcnJvciBvY2N1cnMgb3RoZXJ3aXNlOg0KPiANCj4gfCB4ZW5z
dG9yZWRfY29udHJvbC5jOiBJbiBmdW5jdGlvbiAnbHVfcmVqZWN0X3JlYXNvbic6DQo+IHwg
eGVuc3RvcmVkX2NvbnRyb2wuYzo2NDY6NzA6IGVycm9yOiBmb3JtYXQgJyVsZCcgZXhwZWN0
cyBhcmd1bWVudCBvZiB0eXBlICdsb25nIGludCcsIGJ1dCBhcmd1bWVudCA1IGhhcyB0eXBl
ICd0aW1lX3QnIHtha2EgJ2xvbmcgbG9uZyBpbnQnfSBbLVdlcnJvcj1mb3JtYXQ9XQ0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5k
ZT4NCj4gLS0tDQo+ICAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvbnRyb2wuYyB8IDQg
KystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvbnRy
b2wuYyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb250cm9sLmMNCj4gaW5kZXggY2Jk
NjI1NTZjMy4uODY4Mzk0N2QyNSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVu
c3RvcmVkX2NvbnRyb2wuYw0KPiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29u
dHJvbC5jDQo+IEBAIC02NjgsMTAgKzY2OCwxMCBAQCBzdGF0aWMgY29uc3QgY2hhciAqbHVf
cmVqZWN0X3JlYXNvbihjb25zdCB2b2lkICpjdHgpDQo+ICAgCWxpc3RfZm9yX2VhY2hfZW50
cnkoY29ubiwgJmNvbm5lY3Rpb25zLCBsaXN0KSB7DQo+ICAgCQlpZiAoY29ubi0+dGFfc3Rh
cnRfdGltZSAmJg0KPiAgIAkJICAgIChub3cgLSBjb25uLT50YV9zdGFydF90aW1lID49IGx1
X3N0YXR1cy0+dGltZW91dCkpIHsNCj4gLQkJCXJldCA9IHRhbGxvY19hc3ByaW50ZihjdHgs
ICIlc1xuRG9tYWluICV1OiAlbGQgcyIsDQo+ICsJCQlyZXQgPSB0YWxsb2NfYXNwcmludGYo
Y3R4LCAiJXNcbkRvbWFpbiAldTogJWpkIHMiLA0KPiAgIAkJCQkJICAgICAgcmV0ID8gOiAi
RG9tYWlucyB3aXRoIGxvbmcgcnVubmluZyB0cmFuc2FjdGlvbnM6IiwNCj4gICAJCQkJCSAg
ICAgIGNvbm4tPmlkLA0KPiAtCQkJCQkgICAgICBub3cgLSBjb25uLT50YV9zdGFydF90aW1l
KTsNCj4gKwkJCQkJICAgICAgKGludG1heF90KW5vdyAtIGNvbm4tPnRhX3N0YXJ0X3RpbWUp
Ow0KPiAgIAkJfQ0KPiAgIAl9DQo+ICAgDQoNCkknZCByYXRoZXIgaGF2ZSBzb21ldGhpbmcg
bGlrZToNCg0KZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb250cm9s
LmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29udHJvbC5jDQppbmRleCBjYmQ2MjU1
NmMzLi5mOTQ1MmQ2M2I0IDEwMDY0NA0KLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVk
X2NvbnRyb2wuYw0KKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvbnRyb2wuYw0K
QEAgLTY2NiwxMiArNjY2LDEyIEBAIHN0YXRpYyBjb25zdCBjaGFyICpsdV9yZWplY3RfcmVh
c29uKGNvbnN0IHZvaWQgKmN0eCkNCiAgICAgICAgIHRpbWVfdCBub3cgPSB0aW1lKE5VTEwp
Ow0KDQogICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KGNvbm4sICZjb25uZWN0aW9ucywg
bGlzdCkgew0KLSAgICAgICAgICAgICAgIGlmIChjb25uLT50YV9zdGFydF90aW1lICYmDQot
ICAgICAgICAgICAgICAgICAgIChub3cgLSBjb25uLT50YV9zdGFydF90aW1lID49IGx1X3N0
YXR1cy0+dGltZW91dCkpIHsNCisgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHRkaWZm
ID0gbm93IC0gY29ubi0+dGFfc3RhcnRfdGltZTsNCisNCisgICAgICAgICAgICAgICBpZiAo
Y29ubi0+dGFfc3RhcnRfdGltZSAmJiB0ZGlmZiA+PSBsdV9zdGF0dXMtPnRpbWVvdXQpIHsN
CiAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSB0YWxsb2NfYXNwcmludGYoY3R4LCAi
JXNcbkRvbWFpbiAldTogJWxkIHMiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXQgPyA6ICJEb21haW5zIHdpdGggbG9uZyANCnJ1bm5pbmcg
dHJhbnNhY3Rpb25zOiIsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29ubi0+aWQsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbm93IC0gY29ubi0+dGFfc3RhcnRfdGltZSk7DQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29ubi0+aWQsIHRkaWZmKTsNCiAg
ICAgICAgICAgICAgICAgfQ0KICAgICAgICAgfQ0KDQoNCkp1ZXJnZW4NCg==
--------------xPXyoIDaEOCo32SxzBFdH5zG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------xPXyoIDaEOCo32SxzBFdH5zG--

--------------2PINZutKOFs6uaGlQkIzQ4ZC--

--------------e8RkAns0TqfJFeVgiQRV8lNg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQ86LQFAwAAAAAACgkQsN6d1ii/Ey9o
/wf/WaxV1xrZRmgp+3aTIMV9RguxozXwIBaLeHzkAH9AxdPCwmJsg3qzyE20Sf5oyf7mzyZ5aqqH
XZhD09BybqFiQlu+1HIhBGMdqh9avOIwBeU2jahIiWXzGw/Wni7777ib1eSgWWHPgp64gbnxLymd
V2aFAIYU9TZnRhoYiXca00NjMwYChnZN/joHfbxhM6Cvq8QSgAcpqoIi7nA5ZGH8eloMB+u/NAI3
Gglc/toyFctFhFPPse4d0R36gc1jhSq7z6XP07tzWEPObJiXcoqqFIhDntWSJ277xxGYQlvFYh9K
5JbPMJTUhYR/IFMO32ABKYZQcY2eGQSA0C4ltFooYw==
=TJ0w
-----END PGP SIGNATURE-----

--------------e8RkAns0TqfJFeVgiQRV8lNg--

