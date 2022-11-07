Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BED761ECFB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 09:35:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439128.693102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orxad-0000WY-Vm; Mon, 07 Nov 2022 08:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439128.693102; Mon, 07 Nov 2022 08:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orxad-0000Tv-Sp; Mon, 07 Nov 2022 08:34:43 +0000
Received: by outflank-mailman (input) for mailman id 439128;
 Mon, 07 Nov 2022 08:34:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bDd0=3H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1orxac-0000Tp-Jd
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 08:34:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05c54c15-5e77-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 09:34:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F401322427;
 Mon,  7 Nov 2022 08:34:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD75213494;
 Mon,  7 Nov 2022 08:34:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NOmrMCDDaGMiLgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 07 Nov 2022 08:34:40 +0000
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
X-Inumbo-ID: 05c54c15-5e77-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667810081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VAJ1kO+fnmAEV0aeqESovxRSl7wGOzE6VFgV/ESFKVQ=;
	b=HqQhkaah43E6NnmTP6X50qB/NNnaAIPTx5cxBVU6gKcMKB69SOfdt13K/IOnsAurk6Qrjt
	WJqFjEsE94xLNwQarVaoNAGBQvjlH6uTX/d2Q3d8qx3G+E5CSE34R7qYKQ8afo9uGaGyTP
	Evxvf0zzUSmvWjFI1zUZ470WmFjq0RU=
Message-ID: <a55a6433-d49f-2963-0f79-ee98441afe5f@suse.com>
Date: Mon, 7 Nov 2022 09:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-14-jgross@suse.com>
 <32f61945-08fa-f095-02c4-9d52b66b6c04@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 13/20] tools/xenstore: don't allow creating too many nodes
 in a transaction
In-Reply-To: <32f61945-08fa-f095-02c4-9d52b66b6c04@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cyTn1bPdAMQvATvJseGesfTm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cyTn1bPdAMQvATvJseGesfTm
Content-Type: multipart/mixed; boundary="------------Ua0ymXJLDP8Hkftms8yohfFb";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <a55a6433-d49f-2963-0f79-ee98441afe5f@suse.com>
Subject: Re: [PATCH 13/20] tools/xenstore: don't allow creating too many nodes
 in a transaction
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-14-jgross@suse.com>
 <32f61945-08fa-f095-02c4-9d52b66b6c04@xen.org>
In-Reply-To: <32f61945-08fa-f095-02c4-9d52b66b6c04@xen.org>

--------------Ua0ymXJLDP8Hkftms8yohfFb
Content-Type: multipart/mixed; boundary="------------1m3wt6NNR08pSjT8e9FY0OT0"

--------------1m3wt6NNR08pSjT8e9FY0OT0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTEuMjIgMjM6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzExLzIwMjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
aGUgYWNjb3VudGluZyBmb3IgdGhlIG51bWJlciBvZiBub2RlcyBvZiBhIGRvbWFpbiBpbiBh
biBhY3RpdmUNCj4+IHRyYW5zYWN0aW9uIGlzIG5vdCB3b3JraW5nIGNvcnJlY3RseSwgYXMg
aXQgYWxsb3dzIHRvIGNyZWF0ZSBhcmJpdHJhcnkNCj4+IG51bWJlciBvZiBub2Rlcy4gVGhl
IHRyYW5zYWN0aW9uIHdpbGwgZmluYWxseSBmYWlsIGR1ZSB0byBleGNlZWRpbmcNCj4+IHRo
ZSBudW1iZXIgb2Ygbm9kZXMgcXVvdGEsIGJ1dCBiZWZvcmUgY2xvc2luZyB0aGUgdHJhbnNh
Y3Rpb24gYW4NCj4+IHVucHJpdmlsZWdlZCBndWVzdCBjb3VsZCBjYXVzZSBYZW5zdG9yZSB0
byB1c2UgYSBsb3Qgb2YgbWVtb3J5Lg0KPiANCj4gSSBoYXZlIGFscmVhZHkgbWFkZSBzb21l
IG9mIGNvbW1lbnRzIG9uIHRoZSBzZWN1cml0eSBNTCB3aGVuIHRoaXMgd2FzIGluaXRpYWxs
eSANCj4gc2V0LiBUaGUgYXJndW1lbnRzIHN0aWxsIGRvbid0IHNvdW5kIHJpZ2h0IHRvIG1l
Lg0KPiANCj4gRm9yIGEgZmlyc3QsIHNpbmNlIFhTQS0zMjYsIHdlIGhhdmUgYSBjYXAgaW4g
cGxhY2UgZm9yIHRoZSBtZW1vcnkgYSBkb21haW4gY2FuIA0KPiBjb25zdW1lLiBTbyB0aGlz
IHN1cmVseSBjYW4ndCBiZSBhICJsb3Qgb2YgbWVtb3J5Ii4gT3RoZXJ3aXNlIHdlIGFyZSBz
YXlpbmcgdGhhdCANCj4gb3VyIGxpbWl0ICh0aGVyZSBhcmUgb3RoZXIgd2F5IHRvIGhpdCBp
dCkgd2VyZSB3cm9uZy4uLg0KDQpZZWFoLCBtYXliZSBJIHNob3VsZCByZXdvcmsgdGhlIGNv
bW1pdCBtZXNzYWdlLg0KDQpUaGUgcmVhc29uIEkgc3RpbGwgd2FudCB0byBrZWVwIHRoZSBw
YXRjaCBpcyB0aGF0IGluIGEgdHJhbnNhY3Rpb24gd2l0aG91dCBhbnkNCmNvbmZsaWN0cyBh
bmQgd2l0aG91dCBoaXR0aW5nIGFueSB0cmFuc2FjdGlvbiBzcGVjaWZpYyBsaW1pdHMgKG51
bWJlciBvZiBub2Rlcw0KYWNjZXNzZWQpLCB0aGUgZXJyb3JzIHJldHVybmVkIGR1ZSB0byBh
IHNpbmdsZSBvcGVyYXRpb24gc2hvdWxkIGJlIHRoZSBzYW1lIGFzDQp3aXRoIHRoZSBzYW1l
IG9wZXJhdGlvbiBwZXJmb3JtZWQgb3V0c2lkZSBhIHRyYW5zYWN0aW9uLg0KDQo+IEluIGFk
ZGl0aW9uIHRvIHRoYXQsIHRoaXMgaXMgcXVpdGUgcG9pbnRsZXNzIHRvIGNoZWNrIHRoZSBu
dW1iZXIgb2YgZW50cnkgYSANCj4gZG9tYWluIGN1cnJlbnRseSBvd25lZCBiZWNhdXNlIHRo
aXMgY2FuIGNoYW5nZSBiZWZvcmUgdGhlIHRyYW5zYWN0aW9uIGlzIA0KPiBjb21taXR0ZWQg
YnkgYW5vdGhlciAiZXh0ZXJuYWwiIGNvbW1hbmQuIFRoZXJlZm9yZSwgdGhpcyB3b3VsZCBh
ZGQgc29tZSANCj4gcmFuZG9tbmVzcyBpbiB0aGUgY29tbWFuZCB3aGljaCBjb3VsZCBtYWtl
IG1vcmUgZGlmZmljdWx0IHRvIGRpYWdub3NlLg0KDQpJbiB0aGUgc2NvcGUgb2YgdGhlIHRy
YW5zYWN0aW9uIHRoZSB0ZXN0cyBhcmUgY29ycmVjdC4NCg0KPiBMYXN0bHksIHRoZXJlIGFy
ZSBvdGhlciB2ZXJ5IGVhc3kgd2F5IHRvIHVzZSBtZW1vcnkgKGp1c3QgY3JlYXRlIG11bHRp
cGxlIA0KPiB0cmFuc2FjdGlvbiBpbiBwYXJhbGxlbCkuDQo+IA0KPiBTbyBiYXNlZCBvbiB0
aGUgY29tbWl0IG1lc3NhZ2UsIHRoZSBjaGFuZ2UgZG9lc24ndCBoZWxwIGF0IGFsbCB0byBt
YWtlIGJldHRlciANCj4gWGVuc3RvcmVkLg0KPiANCj4gTm90ZSB0aGF0IEkgZG9uJ3QgcGFy
dGljdWxhcmx5IG1pbmQgdGhlIGNvZGUgY2hhbmdlIChldmVuIHRob3VnaCBpdCBhZGRzIG1v
cmUgDQo+IGNvbXBsZXhpdHkpLiBJIGp1c3Qgc3Ryb25nbHkgZGlzbGlrZSB0aGUgY3VycmVu
dCBqdXN0aWZpY2F0aW9ucy4NCj4gDQo+IEF0IHRoZSBtb21lbnQsIEkgY2FuJ3QgZmluZCBh
IGp1c3RpZmljYXRpb24gdGhhdCB3b3VsZCBtYWtlIHRoZSBjaGFuZ2Ugd2hvcnRod2hpbGUu
DQoNClNlZSBhYm92ZSByZWFzb25pbmcuDQoNCg0KSnVlcmdlbg0KDQo=
--------------1m3wt6NNR08pSjT8e9FY0OT0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------1m3wt6NNR08pSjT8e9FY0OT0--

--------------Ua0ymXJLDP8Hkftms8yohfFb--

--------------cyTn1bPdAMQvATvJseGesfTm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNowyAFAwAAAAAACgkQsN6d1ii/Ey8T
jQgAmZ8iQFQaOJoLEX9g5scOQnb3ufn9fTWwLyTeKv2HrjJvGnYBhN9RhT/jPq+UM2uGVVp+yiU9
TYyIaOv7PYO19LzD7uzTqN58AvglYbNnAT+tZ/5JTZnoVjqn47scistbRWOAIJASweXLDEPaKtnF
I9puGQr8hRUFhZXrTofthJ3k0BDgD3RjVeU9st1M0oCrB9FzpTlA0pRz6ATo60pbxyfIkVlvj4d5
UHq83w7WnXg8k73MWo+cVqz7wAgDLah8WdlrAPlm8mKvPyx1SafL8Xa/XbLahxutsZX7L2r/iJqO
njW4aSDwQYADWoQr1qrGzNTg28SVDKi3+Q/8sJGOWA==
=Yk+J
-----END PGP SIGNATURE-----

--------------cyTn1bPdAMQvATvJseGesfTm--

