Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A17745D9E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 15:43:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558089.871909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGJog-0001yp-Ut; Mon, 03 Jul 2023 13:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558089.871909; Mon, 03 Jul 2023 13:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGJog-0001vf-R8; Mon, 03 Jul 2023 13:42:10 +0000
Received: by outflank-mailman (input) for mailman id 558089;
 Mon, 03 Jul 2023 13:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ukTE=CV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qGJof-0001vZ-P6
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 13:42:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 671e4e33-19a7-11ee-b237-6b7b168915f2;
 Mon, 03 Jul 2023 15:42:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 509DB219BE;
 Mon,  3 Jul 2023 13:42:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35FCC13276;
 Mon,  3 Jul 2023 13:42:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sLqlCy/QomR7IwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 03 Jul 2023 13:42:07 +0000
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
X-Inumbo-ID: 671e4e33-19a7-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688391727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KDhh5FG/dyHuQMTe3c5cc2HhGzLW1okef93kXWumym4=;
	b=hShXidb6slpC+iPSdqDppTJh1duohh/9cHaUDsGHAtbzOrTi3XF70ihwC87fd24c+t4uHE
	X4lry0n6KiOsyghf7vPzmdfGzRAEgbRyR1YS1mzlXz52uzCiz44UrkosNJMVvq/00WMhXr
	yk5QPUdY0+VM12TKFFGCBNnIWES8VAE=
Message-ID: <46d4253c-551e-4d7a-2a60-7ce57594d85b@suse.com>
Date: Mon, 3 Jul 2023 15:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [linux-linus test] 181682: regressions - FAIL
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-181682-mainreport@xen.org>
 <6296a02e-863b-879d-6993-1a828e71fac2@suse.com>
In-Reply-To: <6296a02e-863b-879d-6993-1a828e71fac2@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------I5wJgGrsWv0vqWJgEprOeGPF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------I5wJgGrsWv0vqWJgEprOeGPF
Content-Type: multipart/mixed; boundary="------------FSp5redWEW0SrnLwSkM0a3lN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Message-ID: <46d4253c-551e-4d7a-2a60-7ce57594d85b@suse.com>
Subject: Re: [linux-linus test] 181682: regressions - FAIL
References: <osstest-181682-mainreport@xen.org>
 <6296a02e-863b-879d-6993-1a828e71fac2@suse.com>
In-Reply-To: <6296a02e-863b-879d-6993-1a828e71fac2@suse.com>

--------------FSp5redWEW0SrnLwSkM0a3lN
Content-Type: multipart/mixed; boundary="------------7oTm0v08JYx0X0fEtSAsmLeG"

--------------7oTm0v08JYx0X0fEtSAsmLeG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDcuMjMgMDc6MzUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDAzLjA3LjIz
IDA0OjExLCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6DQo+PiBmbGlnaHQgMTgxNjgy
IGxpbnV4LWxpbnVzIHJlYWwgW3JlYWxdDQo+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTgxNjgyLw0KPj4NCj4+IFJlZ3Jlc3Npb25zIDot
KA0KPj4NCj4+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5n
LA0KPj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46DQo+IA0KPiAu
Li4NCj4gDQo+PiDCoCB0ZXN0LWFtZDY0LWFtZDY0LXhswqDCoMKgwqDCoMKgwqDCoMKgIDEy
IGRlYmlhbi1pbnN0YWxswqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFpbCBSRUdSLiB2cy4gMTgw
Mjc4DQo+IA0KPiBFcnJvcnMgZHVyaW5nIGluc3RhbGxhdGlvbiBvZiAuZGViIGZpbGVzLiBX
b3JyeWluZyBtZXNzYWdlcyBpbiB0aGUgc2VyaWFsIGxvZw0KPiBhcmU6DQo+IA0KPiBbwqDC
oMKgIDIuOTc3MDkxXSBCYWQgRlBVIHN0YXRlIGRldGVjdGVkIGF0IHJlc3RvcmVfZnByZWdz
X2Zyb21fZnBzdGF0ZSsweDUyLzB4YzAsIA0KPiByZWluaXRpYWxpemluZyBGUFUgcmVnaXN0
ZXJzLg0KPiANCj4gdHJhcHM6IGRwa2ctZGViWzE0MTNdIHRyYXAgaW52YWxpZCBvcGNvZGUg
aXA6N2Y1YzBhMDE2OTNmIHNwOjdmZmUzZGFmNWQ5OCANCj4gZXJyb3I6MCBpbiBsaWJjLTIu
Mjguc29bN2Y1YzA5ZWUwMDAwKzE0NzAwMF0NCj4gDQo+IE9sYWYgaGFzIHNlZW4gc2ltaWxh
ciBmYWlsdXJlcyBsYXN0IHdlZWssIHNvIHdlIGhhdmUgYSByZXByb2R1Y2VyIGF0IGhhbmQu
DQoNClBhdGNoIHNlbnQgdG8gTEtNTDoNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8yMDIzMDcwMzEzMDAzMi4yMjkxNi0xLWpncm9zc0BzdXNlLmNvbS9ULyN1DQoNCg0KSnVl
cmdlbg0K
--------------7oTm0v08JYx0X0fEtSAsmLeG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------7oTm0v08JYx0X0fEtSAsmLeG--

--------------FSp5redWEW0SrnLwSkM0a3lN--

--------------I5wJgGrsWv0vqWJgEprOeGPF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSi0C4FAwAAAAAACgkQsN6d1ii/Ey8G
Swf/Qi50VAeedSnWe8Aem1e8p8sglU9NGCbZ0nAhUORhs2iH98FFMk/j8jAuF2g7N1mcSfGZHj1P
l6U6C4d71AnlV62uorM8iQLzoAdtBfE9ybYENQ0jpkkwqFKO+Jgeq+u+pnCV7ZNpdMT9E5iWp/cu
zjK5yI08284CV/eM/0YKQtaHTh6Ipln694/YhDn4iWszLZadgqLPKizhy18KKm8hMd4Ys3qGVFL9
3sZrBokucNPW2JK3OjJNvh7WDcU5WA+zTgITN4hY1oTCwI/0gQIEljhbTIpywJeRbbMsKmc1q+NE
KoMpMf/f29QzRHjnzTlMYYi9ez/ORsAZWXuFyMOhtQ==
=IWY4
-----END PGP SIGNATURE-----

--------------I5wJgGrsWv0vqWJgEprOeGPF--

