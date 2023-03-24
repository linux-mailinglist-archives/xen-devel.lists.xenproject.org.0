Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C6E6C786B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 08:07:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514180.796186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfbWH-0007nI-Ig; Fri, 24 Mar 2023 07:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514180.796186; Fri, 24 Mar 2023 07:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfbWH-0007l1-F9; Fri, 24 Mar 2023 07:07:25 +0000
Received: by outflank-mailman (input) for mailman id 514180;
 Fri, 24 Mar 2023 07:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jsbp=7Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfbWF-0007ko-Fx
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 07:07:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85c7acd7-ca12-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 08:07:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 294B621871;
 Fri, 24 Mar 2023 07:07:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0124133E5;
 Fri, 24 Mar 2023 07:07:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hhUWOShMHWQgUwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Mar 2023 07:07:20 +0000
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
X-Inumbo-ID: 85c7acd7-ca12-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679641641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J1NWPl9smk5r3yC3PtRygKHrFtw/5J7mHaN+wbg6Ifc=;
	b=JBobQeYpAih9WL4shdw+NnGhODhsdH2Pr6KR85vHVe66U5+7FeiQxgNLUn9lrQGa7EmrkB
	Ob7gRx5RAQbcT1qZJHVmK/eo97FkAr2BlNc+rUrm0KGoFR3zFMWnxxgwhcqBEtaKXZDc7N
	AV78QdsD/ShPr+Ouqd82giSW7w5IX6A=
Message-ID: <0b1181a1-5a96-b3e8-ffd8-6f256ebbceae@suse.com>
Date: Fri, 24 Mar 2023 08:07:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: aperard@xenbits.xen.org, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org
References: <E1pfV8U-0006eX-2p@osstest.test-lab.xenproject.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [adhoc test] 179901: regressions - trouble:
 blocked/broken/fail/pass
In-Reply-To: <E1pfV8U-0006eX-2p@osstest.test-lab.xenproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2BAuv09Ci92Wh0rBOPveyB97"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2BAuv09Ci92Wh0rBOPveyB97
Content-Type: multipart/mixed; boundary="------------JA5rKQf2N1r3Uiia7EmD4yO7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: aperard@xenbits.xen.org, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org
Message-ID: <0b1181a1-5a96-b3e8-ffd8-6f256ebbceae@suse.com>
Subject: Re: [adhoc test] 179901: regressions - trouble:
 blocked/broken/fail/pass
References: <E1pfV8U-0006eX-2p@osstest.test-lab.xenproject.org>
In-Reply-To: <E1pfV8U-0006eX-2p@osstest.test-lab.xenproject.org>

--------------JA5rKQf2N1r3Uiia7EmD4yO7
Content-Type: multipart/mixed; boundary="------------8d7NZRgNDZO7SXvDT9dHIZbG"

--------------8d7NZRgNDZO7SXvDT9dHIZbG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDMuMjMgMDE6MTgsIGFwZXJhcmRAeGVuYml0cy54ZW4ub3JnIHdyb3RlOg0KPiBb
YWRob2MgcGxheV0gPG9zc3Rlc3QgbWFzdGVyIC9kZXYvcHRzLzE2Pg0KPiBoYXJuZXNzIGVk
MWQ4ZGU0OiBQRFUvSVBNSTogQmUgbGVzcyBhZ2dyZXNzaXZlIHdpdGggSVBNSSBjb21tYW5k
cw0KPiAxNzk5MDE6IHJlZ3Jlc3Npb25zIC0gdHJvdWJsZTogYmxvY2tlZC9icm9rZW4vZmFp
bC9wYXNzDQo+IA0KPiBmbGlnaHQgMTc5OTAxIGxpbnV4LWxpbnVzIHBsYXkgW3BsYXldDQo+
IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNzk5
MDEvDQo+IA0KPiBSZWdyZXNzaW9ucyA6LSgNCg0KSXQgc2VlbXMgdGhlIGdyYW50IGNvcHkg
ZmFpbHVyZXMgYXJlIGdvbmUsIGJ1dCB0aGUgdGVzdHMgYXJlIHN0aWxsIGZhaWxpbmcuDQoN
CkkgaGF2ZSBzcG90dGVkOg0KDQpbICAgMTguMjU4MDMwXSBuZXQgZXRoMDogUmVzcG9uc2Ug
Zm9yIGluYWN0aXZlIHJlcXVlc3QNClsgICAxOC4yNTgwODBdIG5ldCBldGgwOiBEaXNhYmxl
ZCBmb3IgZnVydGhlciB1c2UNCg0KaW4gDQpodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9q
ZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTc5OTAxL3Rlc3QtYW1kNjQtYW1kNjQteGwvZWxibGlu
ZzEtLS12YXItbG9nLXhlbi1jb25zb2xlLWd1ZXN0LWRlYmlhbi5ndWVzdC5vc3N0ZXN0Lmxv
Zw0KDQpUaGlzIGlzIGNsZWFybHkgYW4gZXhwbGFuYXRpb24gZm9yIHRoZSBmYWlsZWQgdGVz
dHMuIEknbSBsb29raW5nIGludG8gaXQuDQoNCg0KSnVlcmdlbg0K
--------------8d7NZRgNDZO7SXvDT9dHIZbG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------8d7NZRgNDZO7SXvDT9dHIZbG--

--------------JA5rKQf2N1r3Uiia7EmD4yO7--

--------------2BAuv09Ci92Wh0rBOPveyB97
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQdTCgFAwAAAAAACgkQsN6d1ii/Ey8x
AQf/R3/AivZDFuEhOcaTuDToAeGuCje3t6XwgpFwuqFDlxo0czAm3ACy46K1c4bnnjPO0ynieJLS
ycrs2iO4+MqcF17Mm1YTqa0VcAiZ8VNejDqesqoYj1Us1NE+hTZ8G1Nqc/5Szg5ZGKUKp83qf98b
4z8zmfm0G3l7XLdwd5TJbh9Jaw5VnrTVVxeOQ1d1/zMU5j8FPDUaxZpYM7wthjwias+/V77/2zU7
hOfoBlDyXxwTCZ7Ppk5QeYPawDCFLoZZY0nQYwkKRhBSSRKGroKEU6FyLUhEm4HyD57lgtn1B9jX
vVRezdhodwykHj3xLVUFT9GlbzJT5Zsm+LHpAude4g==
=Lk6q
-----END PGP SIGNATURE-----

--------------2BAuv09Ci92Wh0rBOPveyB97--

