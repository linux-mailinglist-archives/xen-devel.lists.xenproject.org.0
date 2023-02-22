Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF4369F068
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 09:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499267.770337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUkcX-0000RM-T7; Wed, 22 Feb 2023 08:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499267.770337; Wed, 22 Feb 2023 08:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUkcX-0000OA-PH; Wed, 22 Feb 2023 08:37:01 +0000
Received: by outflank-mailman (input) for mailman id 499267;
 Wed, 22 Feb 2023 08:37:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WsoH=6S=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pUkcX-0000O4-3q
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 08:37:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1274ca40-b28c-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 09:36:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 233DF228F9;
 Wed, 22 Feb 2023 08:36:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC3E9133E0;
 Wed, 22 Feb 2023 08:36:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K06/NyrU9WNDQwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Feb 2023 08:36:58 +0000
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
X-Inumbo-ID: 1274ca40-b28c-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677055019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FSvkwpS+jevzLkevzDTODVOyCqQ74bUHwd9/ScJ05bA=;
	b=NzkbiouZrk7ZuJbF2HKFeDCMIIIoYAK+/CpuCM8u5jR+RrF1sYrTh3Zf4hFHeImbwq1vIW
	fg8mlEOlefinO9qtm2HElQ2SaTm+i8/mNJx7queAd07ro0lV8SjWUuVZ5siWAwqTrZO6BG
	5GduDMOo3p9ibSmU55qiK8nLG0LN0dY=
Message-ID: <28c5c478-b1b6-c8e1-ce9c-287e8afc604a@suse.com>
Date: Wed, 22 Feb 2023 09:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
 <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
 <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
 <20151614-96ca-0875-29a0-8099953b7e61@xen.org>
 <e90591bd-1242-0721-242b-5db2565349f8@suse.com>
 <5fc2636e-45b0-e515-d901-18dc5fc214eb@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
In-Reply-To: <5fc2636e-45b0-e515-d901-18dc5fc214eb@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9XTjrhiQF0Bj5j3V9YUY1SW7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9XTjrhiQF0Bj5j3V9YUY1SW7
Content-Type: multipart/mixed; boundary="------------TMLBY3hUp3T9eul5peV8Eq4Q";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Message-ID: <28c5c478-b1b6-c8e1-ce9c-287e8afc604a@suse.com>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
 <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
 <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
 <20151614-96ca-0875-29a0-8099953b7e61@xen.org>
 <e90591bd-1242-0721-242b-5db2565349f8@suse.com>
 <5fc2636e-45b0-e515-d901-18dc5fc214eb@xen.org>
In-Reply-To: <5fc2636e-45b0-e515-d901-18dc5fc214eb@xen.org>

--------------TMLBY3hUp3T9eul5peV8Eq4Q
Content-Type: multipart/mixed; boundary="------------HdBmljjmTIy142tzzkiK21Qy"

--------------HdBmljjmTIy142tzzkiK21Qy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDIuMjMgMjM6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDIxLzAyLzIwMjMgMDg6MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyMC4wMi4yMyAxOTowMSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IFNvIEkgaGF2ZSBy
ZWNyZWF0ZWQgYW4gWFRGIHRlc3Qgd2hpY2ggSSB0aGluayBtYXRjaCB3aGF0IHlvdSB3cm90
ZSBbMV0uDQo+Pj4NCj4+PiBJdCBpcyBpbmRlZWQgZmFpbGluZyB3aXRob3V0IHlvdXIgcGF0
Y2guIEJ1dCB0aGVuIHRoZXJlIGFyZSBzdGlsbCBzb21lIHdlaXJkIA0KPj4+IGJlaGF2aW9y
IGhlcmUuDQo+Pj4NCj4+PiBJIHdvdWxkIGV4cGVjdCB0aGUgY3JlYXRpb24gb2YgdGhlIG5v
ZGUgd291bGQgYWxzbyBmYWlsIGlmIGluc3RlYWQgb2YgDQo+Pj4gcmVtb3ZpbmcgdGhlIG5v
ZGUgaWYgcmVtb3ZlZCBvdXRzaWRlIG9mIHRoZSB0cmFuc2FjdGlvbi4NCj4+Pg0KPj4+IFRo
aXMgaXMgbm90IHRoZSBjYXNlIGJlY2F1c2Ugd2UgYXJlIGxvb2tpbmcgYXQgdGhlIGN1cnJl
bnQgcXVvdGEuIFNvIA0KPj4+IHNob3VsZG4ndCB3ZSBzbmFwc2hvdCB0aGUgZ2xvYmFsIGNv
dW50Pw0KPj4NCj4+IEFzIHdlIGRvbid0IGRvIGEgZ2xvYmFsIHNuYXBzaG90IG9mIHRoZSBk
YXRhIGJhc2UgZm9yIGEgdHJhbnNhY3Rpb24gKHRoaXMgd2FzDQo+PiBjaGFuZ2VkIGR1ZSB0
byBodWdlIG1lbW9yeSBuZWVkcywgYmFkIHBlcmZvcm1hbmNlLCBhbmQgYSBoaWdoZXIgdHJh
bnNhY3Rpb24NCj4+IGZhaWx1cmUgcmF0ZSksIA0KPiANCj4gSSBhbSBhIGJpdCBzdXJwcmlz
ZWQgdGhhdCB0aGUgb25seSB3YXkgdG8gZG8gcHJvcGVyIHRyYW5zYWN0aW9uIGlzIHRvIGhh
dmUgYSANCj4gZ2xvYmFsIHNuYXBzaG90LiBJbnN0ZWFkLCB5b3UgY291bGQgaGF2ZSBhbiBv
dmVybGF5Lg0KDQpJIGRpZG4ndCBzYXkgdGhhdCBhIGdsb2JhbCBzbmFwc2hvdCBpcyB0aGUg
b25seSB3YXkuIEFuZCB3ZSBhcmUgdXNpbmcgYW4NCm92ZXJsYXkuDQoNCj4gDQo+PiBJIGRv
bid0IHRoaW5rIHdlIHNob3VsZCBzbmFwc2hvdCB0aGUgY291bnQgZWl0aGVyLg0KPiANCj4g
QnV0IHRoYXQgd291bGQgbWVhbiB0aGF0IHRoZSBxdW90YSB3aWxsIGNoYW5nZSBkZXBlbmRp
bmcgb24gbW9kaWZpY2F0aW9uIG9mIHRoZSANCj4gZ2xvYmFsIGRhdGFiYXNlIHdoaWxlIHRo
ZSB0cmFuc2FjdGlvbiBpcyBpbmZsaWdodC4NCg0KSSByZWFsbHkgZG9uJ3Qgc2VlIHRoZSBw
cm9ibGVtIHdpdGggdGhhdC4gQnV0IGl0IHNlZW1zIG91ciB2aWV3cyBhcmUgZGlmZmVyZW50
DQppbiB0aGlzIGNhc2UuDQoNCj4gSSBndWVzcyB0aGlzIGlzIG5vdCBiZXR0ZXIgbm9yIHdv
cnNlIHRoYXQgdGhlIGN1cnJlbnQgc2l0dWF0aW9uLiBCdXQgaXQgaXMgc3RpbGwgDQo+IHJl
YWxseSBjb25mdXNpbmcgZm9yIGEgY2xpZW50IGJlY2F1c2U6DQo+ICDCoCAxKSBUaGUgZXJy
b3IgY291bGQgaGFwcGVuIGF0IHJhbmRvbSBwb2ludA0KDQpZZXMsIGxpa2Ugd2l0aG91dCBh
IHRyYW5zYWN0aW9uLg0KDQo+ICDCoCAyKSBZb3UgbWF5IHNlZSBhbiBpbmNvbnNpc3RlbnQg
ZGF0YWJhc2UgYXMgbm9kZXMgYXJlIG9ubHkgY2FjaGVkIHdoZW4gdGhleSANCj4gYXJlIGZp
cnN0IGFjY2Vzc2VkDQoNCkl0IGlzbid0IGluY29uc2lzdGVudCBhdCBhbGwuIFRoZSBzYW1l
IGNvdWxkIGhhcHBlbiBpZiBzdWNoIG90aGVyIG5vZGVzIGFyZQ0KYWRkZWQvbW9kaWZpZWQv
cmVtb3ZlZCBqdXN0IGEgbWljcm9zZWNvbmQgYmVmb3JlIHlvdSBzdGFydCB0aGUgdHJhbnNh
Y3Rpb24uDQpZb3Ugd29uJ3QgYmUgYWJsZSB0byB0ZWxsIHRoZSBkaWZmZXJlbmNlLiBZb3Ug
Y2FuIG9ubHkgcmVhc29uIGFib3V0IG5vZGVzDQpiZWluZyBhY2Nlc3NlZCBpbiB0aGUgdHJh
bnNhY3Rpb24sIGFuZCB0aG9zZSBhcmUgdHJhbnNhY3Rpb24tbG9jYWwuDQoNCj4+IEEgdHJh
bnNhY3Rpb24gaXMgcGVyZm9ybWVkIGF0b21pY2FsbHkgYXQgdGhlIHRpbWUgaXQgaXMgZmlu
aXNoZWQuIFRoZXJlZm9yZQ0KPj4gc2VlaW5nIHRoZSBjdXJyZW50IGdsb2JhbCBzdGF0ZSBp
bnNpZGUgdGhlIHRyYW5zYWN0aW9uICh3aXRoIHRoZSB0cmFuc2FjdGlvbg0KPj4gcHJpdmF0
ZSBzdGF0ZSBvbiB0b3AgbGlrZSBhbiBvdmVybGF5KSBpcyBhYnNvbHV0ZWx5IGZpbmUgSU1P
Lg0KPiANCj4gVG8gbWUgaXQgaXMganVzdCBzaG93aW5nIHRoYXQgb3VyIGNvbmNlcHQgb2Yg
dHJhbnNhY3Rpb24gaXMgdmVyeSBicm9rZW4gaW4gQyANCj4gWGVuc3RvcmVkLiBJIGFtIGN1
cmlvdXMgdG8ga25vdyB3aGV0aGVyIE9YZW5zdG9yZWQgaXMgYmVoYXZpbmcgdGhlIHNhbWUg
d2F5Lg0KDQpJIGRvbid0IGtub3cgZWl0aGVyLg0KDQo+IEFueXdheSwgSSBhZ3JlZSB0aGlz
IGlzIG5vdCBiZXR0ZXIgbm9yIHdvcnNlIHRoYW4gdGhlIGN1cnJlbnQgc2l0dWF0aW9uLiBT
byBJIA0KPiB3aWxsIGFja2VkIHRoaXMgcGF0Y2g6DQo+IA0KPiBBY2tlZC1ieTogSnVsaWVu
IEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4NCg0K

--------------HdBmljjmTIy142tzzkiK21Qy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------HdBmljjmTIy142tzzkiK21Qy--

--------------TMLBY3hUp3T9eul5peV8Eq4Q--

--------------9XTjrhiQF0Bj5j3V9YUY1SW7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP11CoFAwAAAAAACgkQsN6d1ii/Ey8O
xAf9FIhmdZ+hymGVKd96T4IqdggSbS1azOlr1EFU/zndFyfEofNpsocVve1mCRZt08OLplSiXaL8
8gxhS77iHnYTqEY7j8GMPYR9CLgW930y/OkauSuwa37dkLwW0UcjM5RhfHBbkHFU75LFl9DUguMR
HMTznPmJWFkgfWvPzmG9cLS6+JcSDUJQ8hJCiw1guUTJ/VBAHYqe8VTC0MNB8cfOuQP+Y7SAAsJe
HfIoOHlM5/55V8Ke5Dzb3UVeA96eyAIkCTW4uEszY8/48BCVystghcmORmAvsaUdtQF4qYT7e3gG
C2We+s6orCMzuoFgja34nUXqZo51aIH0me4RNAc2Bw==
=PdUq
-----END PGP SIGNATURE-----

--------------9XTjrhiQF0Bj5j3V9YUY1SW7--

