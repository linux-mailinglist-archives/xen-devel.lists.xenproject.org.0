Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A2861ED13
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 09:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439140.693123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orxg8-0002o6-VN; Mon, 07 Nov 2022 08:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439140.693123; Mon, 07 Nov 2022 08:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orxg8-0002l6-Sh; Mon, 07 Nov 2022 08:40:24 +0000
Received: by outflank-mailman (input) for mailman id 439140;
 Mon, 07 Nov 2022 08:40:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bDd0=3H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1orxg7-0002kx-7D
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 08:40:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0dc2feb-5e77-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 09:40:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A02AB1F889;
 Mon,  7 Nov 2022 08:40:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5990813494;
 Mon,  7 Nov 2022 08:40:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6EJ+FHXEaGNnMQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 07 Nov 2022 08:40:21 +0000
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
X-Inumbo-ID: d0dc2feb-5e77-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667810421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gADfYUPeeETCnvisZexZvN1ta8XwRls4wpPuMJJT0Tg=;
	b=BhOS7WfFV0KhqD96WqwaFZ4SHSxj7PVHEX7g9YOJI08h3ZqA2Wbia2PBpikl1aq9yUrxzp
	jRFjZVZ9dTkKcLNr9Zej+Vs8Nji0tbqD644Jyxz5AgNuPyYtfM+fEEuPwB1yE79WkzAC3u
	lt08HtriLyxGqU+eIamdoIIXgUdqDQ4=
Message-ID: <b30b1e57-a3aa-efd8-faf2-dd99aa5c1db0@suse.com>
Date: Mon, 7 Nov 2022 09:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 19/20] tools/xenstore: introduce trace classes
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-20-jgross@suse.com>
 <33e9e356-e8d7-2dfc-a71d-ecbf50a00786@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <33e9e356-e8d7-2dfc-a71d-ecbf50a00786@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pbDxS0JbVOEUNQiM6zhNs7J1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pbDxS0JbVOEUNQiM6zhNs7J1
Content-Type: multipart/mixed; boundary="------------rN6gimbh8h7jppmFNZvwb0bl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <b30b1e57-a3aa-efd8-faf2-dd99aa5c1db0@suse.com>
Subject: Re: [PATCH 19/20] tools/xenstore: introduce trace classes
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-20-jgross@suse.com>
 <33e9e356-e8d7-2dfc-a71d-ecbf50a00786@xen.org>
In-Reply-To: <33e9e356-e8d7-2dfc-a71d-ecbf50a00786@xen.org>

--------------rN6gimbh8h7jppmFNZvwb0bl
Content-Type: multipart/mixed; boundary="------------cpvG7r54gDdudMUYImV0jAlS"

--------------cpvG7r54gDdudMUYImV0jAlS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTEuMjIgMjM6MTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IEkgaGF2ZW4ndCB5ZXQgbG9vayBhdCB0aGUgY29kZSBpdHNlbGYuIEkgd2FudGVk
IHRvIGNvbW1lbnQgb24gdGhlIGV4dGVybmFsIA0KPiBpbnRlcmZhY2VzLg0KPiANCj4gDQo+
IE9uIDAxLzExLzIwMjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBNYWtlIHRo
ZSB4ZW5zdG9yZWQgaW50ZXJuYWwgdHJhY2UgY29uZmlndXJhYmxlIGJ5IGFkZGluZyBjbGFz
c2VzDQo+PiB3aGljaCBjYW4gYmUgc3dpdGNoZWQgb24gYW5kIG9mZiBpbmRlcGVuZGVudGx5
IGZyb20gZWFjaCBvdGhlci4NCj4+DQo+PiBEZWZpbmUgdGhlIGZvbGxvd2luZyBjbGFzc2Vz
Og0KPj4NCj4+IC0gb2JqOiBDcmVhdGlvbiBhbmQgZGVsZXRpb24gb2YgaW50ZXJlc3Rpbmcg
Im9iamVjdHMiICh3YXRjaCwNCj4+IMKgwqAgdHJhbnNhY3Rpb24sIGNvbm5lY3Rpb24pDQo+
PiAtIGlvOiBpbmNvbWluZyByZXF1ZXN0cyBhbmQgb3V0Z29pbmcgcmVzcG9uc2VzDQo+PiAt
IHdybDogd3JpdGUgbGltaXRpbmcNCj4+DQo+PiBQZXIgZGVmYXVsdCAib2JqIiBhbmQgImlv
IiBhcmUgc3dpdGNoZWQgb24uDQo+Pg0KPj4gRW50cmllcyB3cml0dGVuIHZpYSB0cmFjZSgp
IHdpbGwgYWx3YXlzIGJlIHByaW50ZWQgKGlmIHRyYWNpbmcgaXMgb24NCj4+IGF0IGFsbCku
DQo+Pg0KPj4gUmVuYW1lIHRoZSBtaXNuYW1lZCB4ZW5zdG9yZS1jb250cm9sIGNvbW1hbmRz
ICJsb2dmaWxlIiB0byAidHJhY2VmaWxlIg0KPj4gYW5kICJsb2ciIHRvICJ0cmFjZSIuDQo+
IA0KPiBXaGlsZSBJIHVuZGVyc3RhbmQgdGhpcyBtYXkgYmUgbWlzbmFtZWQsIHRoaXMgYWxz
byBtZWFucyB0aGF0IHRoZXJlIGlzIGFuIEFCSSANCj4gYnJlYWthZ2UgYmV0d2VlbiBjdXJy
ZW50IFhlbnN0b3JlZCBhbmQgdGhlIGZ1dHVyZSBvbmUuDQo+IA0KPiBJIGFtIG5vdCBjb252
aW5jZWQgdGhpcyBpcyBqdXN0aWZpZWQuIFRoZXJlZm9yZSwgSSB0aGluayB3ZSBzaG91bGQg
YXQgbWluaW11bSANCj4ga2VlcCB0aGUgY29tcGF0aWJpbGl0eS4NCg0KSG1tLCBJIGNhbiBz
ZWUgeW91ciBwb2ludC4gR2l2ZW4gdGhhdCB0aGlzIG1pZ2h0IGJlIG9uZSBvZiB0aGUgbW9z
dA0KY29tbW9uIHVzZWQgeGVuc3RvcmUtY29udHJvbCBjb21tYW5kcyBJJ20gbm90IG9wcG9z
ZWQgdG8ga2VlcCB0aGUgY3VycmVudA0KbmFtZXMuDQoNCj4gDQo+Pg0KPj4gQWRkIHRoZSBj
YXBhYmlsaXR5IHRvIGNvbnRyb2wgdGhlIHRyYWNlIHNldHRpbmdzIHZpYSB0aGUgInRyYWNl
Ig0KPj4gY29tbWFuZCBhbmQgdmlhIGEgbmV3ICItLXRyYWNlLWNvbnRyb2wiIGNvbW1hbmQg
bGluZSBvcHRpb24uDQo+Pg0KPj4gQWRkIGEgbWlzc2luZyB0cmFjZV9jcmVhdGUoKSBjYWxs
IGZvciBjcmVhdGluZyBhIHRyYW5zYWN0aW9uLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gwqAgZG9jcy9taXNj
L3hlbnN0b3JlLnR4dMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTggKysr
KysrKy0tLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb250cm9sLmPCoMKg
wqDCoCB8IDQxICsrKysrKysrKysrKysrKysrKystLS0tLQ0KPj4gwqAgdG9vbHMveGVuc3Rv
cmUveGVuc3RvcmVkX2NvcmUuY8KgwqDCoMKgwqDCoMKgIHwgNDQgKysrKysrKysrKysrKysr
KysrKysrKystLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmjCoMKg
wqDCoMKgwqDCoCB8wqAgNiArKysrDQo+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRf
ZG9tYWluLmPCoMKgwqDCoMKgIHwgMjcgKysrKysrKystLS0tLS0tLQ0KPj4gwqAgdG9vbHMv
eGVuc3RvcmUveGVuc3RvcmVkX3RyYW5zYWN0aW9uLmMgfMKgIDEgKw0KPj4gwqAgNiBmaWxl
cyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQgYi9kb2NzL21pc2MveGVuc3Rv
cmUudHh0DQo+PiBpbmRleCA0NDQyOGFlM2E3Li45ZGIwMzg1MTIwIDEwMDY0NA0KPj4gLS0t
IGEvZG9jcy9taXNjL3hlbnN0b3JlLnR4dA0KPj4gKysrIGIvZG9jcy9taXNjL3hlbnN0b3Jl
LnR4dA0KPj4gQEAgLTQwOSwxNCArNDA5LDggQEAgQ09OVFJPTMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPGNvbW1hbmQ+fFs8cGFyYW1ldGVycz58XQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGVycm9yIHN0cmluZyBpbiBjYXNlIG9mIGZhaWx1cmUuIC1zIGNhbiByZXR1cm4gIkJVU1ki
IGluIGNhc2UNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBvZiBhbiBhY3RpdmUgdHJhbnNhY3Rp
b24sIGEgcmV0cnkgb2YgLXMgY2FuIGJlIGRvbmUgaW4gdGhhdA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGNhc2UuDQo+PiAtwqDCoMKgIGxvZ3xvbg0KPj4gLcKgwqDCoMKgwqDCoMKgIHR1
cm4geGVuc3RvcmUgbG9nZ2luZyBvbg0KPj4gLcKgwqDCoCBsb2d8b2ZmDQo+PiAtwqDCoMKg
wqDCoMKgwqAgdHVybiB4ZW5zdG9yZSBsb2dnaW5nIG9mZg0KPj4gLcKgwqDCoCBsb2dmaWxl
fDxmaWxlLW5hbWU+DQo+PiAtwqDCoMKgwqDCoMKgwqAgbG9nIHRvIHNwZWNpZmllZCBmaWxl
DQo+IA0KPiBUZWNobmljYWxseSB4ZW5zdG9yZS50eHQgaXMgbWVhbnQgdG8gZGVzY3JpYmUg
YW4gaW50ZXJmYWNlIHRoYXQgaXMgDQo+IGltcGxlbWVudGF0aW9uIGFnbm9zdGljcy4gQ2Fu
IHlvdSBvdXRsaW5lIGluIHRoZSBkb2N1bWVudGF0aW9uIHdoeSByZW1vdmluZyB0aGVtIA0K
PiBpcyBmaW5lPw0KPiANCj4+IMKgwqDCoMKgwqAgbWVtcmVwb3J0fFs8ZmlsZS1uYW1lPl0N
Cj4+IC3CoMKgwqDCoMKgwqDCoCBwcmludCBtZW1vcnkgc3RhdGlzdGljcyB0byBsb2dmaWxl
IChubyA8ZmlsZS1uYW1lPg0KPj4gK8KgwqDCoMKgwqDCoMKgIHByaW50IG1lbW9yeSBzdGF0
aXN0aWNzIHRvIHRyYWNlZmlsZSAobm8gPGZpbGUtbmFtZT4NCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBzcGVjaWZpZWQpIG9yIHRvIHNwZWNpZmljIGZpbGUNCj4+IMKgwqDCoMKgwqAgcHJp
bnR8PHN0cmluZz4NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludCA8c3RyaW5nPiB0byBz
eXNsb2cgKHhlbnN0b3JlIHJ1bnMgYXMgZGFlbW9uKSBvcg0KPj4gQEAgLTQzMiw2ICs0MjYs
MTYgQEAgQ09OVFJPTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGNvbW1hbmQ+fFs8cGFyYW1l
dGVycz58XQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRoZSBkb21haW4gPGRvbWlkPg0KPj4g
wqDCoMKgwqDCoCBxdW90YS1zb2Z0fFtzZXQgPG5hbWU+IDx2YWw+XQ0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGxpa2UgdGhlICJxdW90YSIgY29tbWFuZCwgYnV0IGZvciBzb2Z0LXF1b3Rh
Lg0KPj4gK8KgwqDCoCB0cmFjZXxbK3wtPHN3aXRjaD5dDQo+IA0KPiBUaGUgcmVnZXggaGVy
ZSBpcyBhIGJpdCBhbWJpZ3VvdXMgYmVjYXVzZSBpdCB0ZWNobmljYWxseSBtZWFucyBlaXRo
ZXIgIisiIG9yIA0KPiAiLTxzd2l0Y2g+Ii4gRnVydGhlcm1vcmUsIHdpdGhpbiB0aGlzIGRv
Y3MsIHRoZXJlIGFyZSBjYXNlIHdoZXJlIHwgaXMgaW5jbHVkZWQgDQo+IGluIGJldHdlZW4g
W10gdG8gaW5kaWNhdGUgdGhlIHRoaXMgaXMgdGVybWluYXRlZCBieSBhIFwwLg0KPiANCj4g
U28gaXQgd291bGQgYmUgYmV0dGVyIHRvIGRlZmluZSBpdCBvdmVyIDMgbGluZXM6DQo+IA0K
PiB0cmFjZQ0KPiB0cmFjZXwrPHN3aXRjaD4NCj4gdHJhY2V8LTxzd2l0Y2g+DQo+IA0KPiBJ
IHRoaW5rIGl0IHdvdWxkIGJlIGZpbmUgaWYgdGhlcmUgaXMgb25seSBvbmUgcGFyYWdyYXBo
IG9mIGV4cGxhbmF0aW9uIGZvciB0aGUgMy4NCg0KT2theS4NCg0KDQpKdWVyZ2VuDQo=
--------------cpvG7r54gDdudMUYImV0jAlS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------cpvG7r54gDdudMUYImV0jAlS--

--------------rN6gimbh8h7jppmFNZvwb0bl--

--------------pbDxS0JbVOEUNQiM6zhNs7J1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNoxHUFAwAAAAAACgkQsN6d1ii/Ey/H
Ygf+KNJ3VIaM/uHgF/O9t5eOYrVwLbwfrzYIQ8jMkl4nhh7WKVmm4d39nn4Xb0vi3gL6Y1ZRJIaT
kcXLVRoPLgXl75Mgejy6BMNylM3bEb/8uxmFbRyctWD6RITpGxeaIE46jS+zArFvFhcAPLoCs097
ZzeVxYnmwHKsOvg2c4oYgiP+Tae7/f/CenRSgw4GJcEcn8A79JwSefOm9sJQXUbljq+r47W1R2A/
1oudsiqgO5CLzjPli1yNY2rIETdM9nPByQ6FQjO5pxJO0uFAGqjLjsGMpZ/Wgo3vpP3e393i7eP3
zra6Ltfwc592Hq6VDscn1sYkCeX5m1ZqNaycIx2V+A==
=LQ73
-----END PGP SIGNATURE-----

--------------pbDxS0JbVOEUNQiM6zhNs7J1--

