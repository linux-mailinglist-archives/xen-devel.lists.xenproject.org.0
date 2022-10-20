Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C5606199
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426796.675494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVZ8-0005YU-0m; Thu, 20 Oct 2022 13:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426796.675494; Thu, 20 Oct 2022 13:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVZ7-0005Vw-Sp; Thu, 20 Oct 2022 13:26:29 +0000
Received: by outflank-mailman (input) for mailman id 426796;
 Thu, 20 Oct 2022 13:26:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tgfI=2V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1olVZ6-00040W-On
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:26:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd034d3d-507a-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 15:26:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B009224DF;
 Thu, 20 Oct 2022 13:26:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1ABD913AF5;
 Thu, 20 Oct 2022 13:26:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vNYyBYNMUWMARAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Oct 2022 13:26:27 +0000
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
X-Inumbo-ID: cd034d3d-507a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666272387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=YpvYm802qw2Y9fkEp0cRacbmc6NWv8VBCJJBtQImmuQ=;
	b=LENFSgC7uA3dk0GyAU6CXT6Uv4YLkExmP2Xc57RjNbIDpnBfmWkPYpYEKi2EVPxEVHDSfm
	WzeLo3r3NjxrX75JTGjvMB+LiOzR4xlvo/lEn8+Be5DY2hCl8yUY7/0HbZnj/YoN2H1vaV
	F/hLlNVcDkOIQuZ+c2YDcSszuxJlWHU=
Message-ID: <6cccc8b6-4073-69bb-e414-2b38d5081004@suse.com>
Date: Thu, 20 Oct 2022 15:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
From: Juergen Gross <jgross@suse.com>
Subject: Xen RTDS scheduler locking
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qRkJvCgTU0x8KhjlOfYkBltF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qRkJvCgTU0x8KhjlOfYkBltF
Content-Type: multipart/mixed; boundary="------------pZg04xQ3wErRbbHMMIlCcpmG";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <6cccc8b6-4073-69bb-e414-2b38d5081004@suse.com>
Subject: Xen RTDS scheduler locking

--------------pZg04xQ3wErRbbHMMIlCcpmG
Content-Type: multipart/mixed; boundary="------------1dPTtYcDRihDwhvOtzt0Zjgm"

--------------1dPTtYcDRihDwhvOtzt0Zjgm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TG9va2luZyBhdCB0ZXN0IGZhaWx1cmVzIHdpdGggUlREUyBzY2hlZHVsZXIgaW4gWGVuIFsx
XSBJIHRoaW5rIEkndmUgZm91bmQNCmEgbWFqb3IgaXNzdWUgd2l0aCBsb2NraW5nIGluIHRo
ZSBSVERTIHNjaGVkdWxlcjoNCg0Kc3ZjLT5mbGFncyBzZWVtcyB0byBiZSBub3QgcHJvdGVj
dGVkIHByb3Blcmx5LCBhcyBkaWZmZXJlbnQgbG9ja3MgYXJlDQp1c2VkIHdoZW4gZG9pbmcg
bm9uLWF0b21pYyB1cGRhdGVzOiBwcnYtPmxvY2sgKHRoZSBSVERTIGdsb2JhbCBsb2NrKSwN
Cm9yIHRoZSBwZXItc2NoZWR1bGVyLXJlc291cmNlIHNjaGVkdWxpbmcgbG9jay4NCg0KSSdt
IG5vdCBzdXJlIHdoYXQgd291bGQgYmUgdGhlIGJlc3Qgd2F5IHRvIGZpeCB0aGF0LiBPbmUg
cmF0aGVyIGVhc3kgd2F5DQptaWdodCBiZSB0byBsZXQgdGhlIHNjaGVkdWxpbmcgbG9jayBw
b2ludGVyIHBvaW50IGF0IHBydi0+bG9jayAobWVyZ2luZw0Kb2YgdGhlIHR3byBsb2Nrcyks
IHdoaWNoIGlzIGVhc3kgZG9hYmxlIChjcmVkaXQyIGlzIHVzaW5nIGEgc2ltaWxhciBzY2hl
bWUNCnRvIG1ha2UgdGhlIHNjaGVkdWxpbmcgbG9jayBwZXItcnVucXVldWUpLiBJJ20gbm90
IHN1cmUgd2hldGhlciB0aGlzDQp3b3VsZG4ndCByZXN1bHQgaW4gaWxsZWdhbCBsb2NrIG5l
c3RpbmcgKHRyeWluZyB0byBncmFiIHBydi0+bG9jayBpbnNpZGUNCnRoZSBzY2hlZHVsaW5n
IGxvY2spLCB0aG91Z2guDQoNClRob3VnaHRzPw0KDQoNCkp1ZXJnZW4NCg0KWzFdOiANCmh0
dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNzM0ODgv
dGVzdC1hcm1oZi1hcm1oZi14bC1ydGRzL3NlcmlhbC1jdWJpZXRydWNrLXBpY2Fzc28ubG9n
DQo=
--------------1dPTtYcDRihDwhvOtzt0Zjgm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------1dPTtYcDRihDwhvOtzt0Zjgm--

--------------pZg04xQ3wErRbbHMMIlCcpmG--

--------------qRkJvCgTU0x8KhjlOfYkBltF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNRTIIFAwAAAAAACgkQsN6d1ii/Ey+p
/gf+LV25j3R0pEC9AZinvv1BCrBqw4lpvF9x11nkM4q9LMQK/L1Wzr1Q9wNvoEhxAddFiKeO5lm8
ZI/0gn8JU1anxiFdWa6zMz/fLoBGfyTghYsoxyXhQS68034+/qvzb2GZl+0AWNPlm6GfcRWcb4pX
gfGZ7GHNK3M9a9RJxshMgtgco7hX9fjQXGN/uA+zI45QLEa1Dk75s9pVsI2idRGd5R7LXntiRHqD
nciw/IBZmpQuGLuE815H93i+J8+MkPL74ac385wu7yeRYp+0OZqQSVIfr5Oz+jlyCi7kGLcZTuCc
T8Ixwd//VCuLkWOLQLTiUtehXRr5tTQVoeYvMcvSCg==
=V5FF
-----END PGP SIGNATURE-----

--------------qRkJvCgTU0x8KhjlOfYkBltF--

