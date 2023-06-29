Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE3742383
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 11:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556707.869423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoIt-0006eV-Ll; Thu, 29 Jun 2023 09:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556707.869423; Thu, 29 Jun 2023 09:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoIt-0006cj-J6; Thu, 29 Jun 2023 09:51:07 +0000
Received: by outflank-mailman (input) for mailman id 556707;
 Thu, 29 Jun 2023 09:51:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3M7h=CR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qEoIs-0006cd-AI
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 09:51:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7406c5ea-1662-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 11:51:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6390921874;
 Thu, 29 Jun 2023 09:51:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 348E213905;
 Thu, 29 Jun 2023 09:51:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hCrwCgRUnWQJCwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 29 Jun 2023 09:51:00 +0000
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
X-Inumbo-ID: 7406c5ea-1662-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688032260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pjAWZ44ueg1kKn4yA6E7gI6pungwi1Ls1XP9FPc4Xps=;
	b=Rs8oqeLIFf6kn107NN0X4RzKDzkFbj80H/HJWPhEN8pQUVjYWs1xMKirHfx6Yls542xlrd
	tfue4rhTaNSCJhQOPykzhU667eGJUs2LhoAcLQmwj/WaKJWAhW2XZxDpxYdd0Tp721Shyc
	Y48JPViysMx7Vdt3d3sjBzao3VMgEDQ=
Message-ID: <83fb7f2c-5eb9-7c72-00ca-52880df5aa86@suse.com>
Date: Thu, 29 Jun 2023 11:50:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 05/11] tools/xenstore: rename do_tdb_write() and change
 parameter type
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-6-jgross@suse.com>
 <b555be99-b1b9-af51-98cd-7464e0df4b69@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b555be99-b1b9-af51-98cd-7464e0df4b69@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------z0uuCp8QKatANjToYAMDI19X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------z0uuCp8QKatANjToYAMDI19X
Content-Type: multipart/mixed; boundary="------------yRhTfkao4CBcdXMMlQXjw5EO";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <83fb7f2c-5eb9-7c72-00ca-52880df5aa86@suse.com>
Subject: Re: [PATCH 05/11] tools/xenstore: rename do_tdb_write() and change
 parameter type
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-6-jgross@suse.com>
 <b555be99-b1b9-af51-98cd-7464e0df4b69@xen.org>
In-Reply-To: <b555be99-b1b9-af51-98cd-7464e0df4b69@xen.org>

--------------yRhTfkao4CBcdXMMlQXjw5EO
Content-Type: multipart/mixed; boundary="------------TEV0Plb9ix8iUwAx9CT7KlWb"

--------------TEV0Plb9ix8iUwAx9CT7KlWb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDYuMjMgMTQ6MjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzA1LzIwMjMgMTA6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBA
QCAtMzk1LDE4ICszOTMsMTggQEAgc3RhdGljIGludCBmaW5hbGl6ZV90cmFuc2FjdGlvbihz
dHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwNCj4+IMKgwqDCoMKgwqAgd2hpbGUgKChpID0gbGlz
dF90b3AoJnRyYW5zLT5hY2Nlc3NlZCwgc3RydWN0IGFjY2Vzc2VkX25vZGUsIGxpc3QpKSkg
ew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChpLT50YV9ub2RlKSB7DQo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzZXRfdGRiX2tleShpLT50cmFuc19uYW1lLCAmdGFfa2V5KTsN
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEgPSB0ZGJfZmV0Y2godGRiX2N0eCwg
dGFfa2V5KTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF90ZGJfa2V5KGktPnRy
YW5zX25hbWUsICZrZXkpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGF0YSA9IHRk
Yl9mZXRjaCh0ZGJfY3R4LCBrZXkpOw0KPiANCj4gVGhpcyBjaGFuZ2UgY29uZnVzZWQgbWUg
YmVjYXVzZSB5b3UgYXJlIGp1c3QgcmVuYW1pbmcgdGhlIGtleSB2YXJpYWJsZS4gVGhpcyAN
Cj4gZmVlbHMgdW5yZWxhdGVkIHRvIHRoaXMgcGF0Y2ggKHllcywgSSBrbm93IHRoYXQgdGhl
IHZhcmlhYmxlICdrZXknIGlzIG5vdCB1c2VkIA0KPiBhbnltb3JlKS4gU28gSSB3b3VsZCBy
YXRoZXIgcHJlZmVyIGlmIHlvdSBkb24ndCBjaGFuZ2UgdGhlIG5hbWUuDQoNCk9rYXksIEkn
bGwga2VlcCB0YV9rZXkuDQoNCg0KSnVlcmdlbg0KDQo=
--------------TEV0Plb9ix8iUwAx9CT7KlWb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------TEV0Plb9ix8iUwAx9CT7KlWb--

--------------yRhTfkao4CBcdXMMlQXjw5EO--

--------------z0uuCp8QKatANjToYAMDI19X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSdVAMFAwAAAAAACgkQsN6d1ii/Ey+M
kggAkqZ2bTP4ZDXuNQHVHCfxrFMdrUYDg65H5NCYhjFZ3sToWft6t2dXsykW1rJxYX8ToAjIQf9W
+TS86tBNJP/i8RlPjGw83kDnyjvJS5BpkcJkuuLVtzBnZ6dO3wSCUWabD3FH5SToaSPNZP7mIW9n
Ae9sDoAc6Oy8i7Rnw7gWqwW5HlifZYpZQp5HG9fZkO9n6BQSb35c0zvXGf4GZGBqrCJU3WhedN7h
xAc4pv85kUoD6gNpVAgaAI2nxwqDK0hAPN2jqDoh4NahMm8UYhOtJPrQOLQJLp9J7sVKE6VHjwzL
CJgDGlBeLeUC7a7ERUFofTPHuQ9SMHgR1piJATkPBA==
=icul
-----END PGP SIGNATURE-----

--------------z0uuCp8QKatANjToYAMDI19X--

