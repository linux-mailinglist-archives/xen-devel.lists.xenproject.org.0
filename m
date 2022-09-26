Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB695E9C1D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 10:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411477.654408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjYe-0004TK-LA; Mon, 26 Sep 2022 08:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411477.654408; Mon, 26 Sep 2022 08:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjYe-0004QN-Hz; Mon, 26 Sep 2022 08:33:44 +0000
Received: by outflank-mailman (input) for mailman id 411477;
 Mon, 26 Sep 2022 08:33:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ba90=Z5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ocjYd-0004QH-06
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 08:33:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed1c22ec-3d75-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 10:33:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3C1F022001;
 Mon, 26 Sep 2022 08:33:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C66713486;
 Mon, 26 Sep 2022 08:33:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bzQGBeVjMWNWWgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 26 Sep 2022 08:33:41 +0000
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
X-Inumbo-ID: ed1c22ec-3d75-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664181221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6rP0yXpgcrrq7vSubzt3KTL5aYMu8qIC94GTh73U0k=;
	b=HsMqsfSC2i5kH9q+R7WNu5UaHovVO+XHWWi1ZAmsNe5sSOKfS+aKGWks4X7R6jQaVMZL8U
	uvZnlkd8kFja/ozLionREtWKlQLbB9inGIOJ51h5UOoRYxGFqjcb+TdZiMA1bPT0ubFk2G
	au7IaRQsME1HSAi02L0s+hLC4v/BmxA=
Message-ID: <8de37e96-cf67-2306-b586-dd45019a536d@suse.com>
Date: Mon, 26 Sep 2022 10:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YyszY+qHOVkCTe92@mail-itl>
 <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
 <bbb0a75f-4687-3e18-6219-ee32de298664@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Design session PVH dom0
In-Reply-To: <bbb0a75f-4687-3e18-6219-ee32de298664@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8wznQtuFLUDfP7ZKCaEBwT8C"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8wznQtuFLUDfP7ZKCaEBwT8C
Content-Type: multipart/mixed; boundary="------------2l9jkCod0Tzd9bRIm3dbVX0I";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <8de37e96-cf67-2306-b586-dd45019a536d@suse.com>
Subject: Re: Design session PVH dom0
References: <YyszY+qHOVkCTe92@mail-itl>
 <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
 <bbb0a75f-4687-3e18-6219-ee32de298664@suse.com>
In-Reply-To: <bbb0a75f-4687-3e18-6219-ee32de298664@suse.com>

--------------2l9jkCod0Tzd9bRIm3dbVX0I
Content-Type: multipart/mixed; boundary="------------uPP5skHFGdm6JveACLpENDp4"

--------------uPP5skHFGdm6JveACLpENDp4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDkuMjIgMDk6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wOS4yMDIy
IDEwOjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjEuMDkuMjIgMTc6NTMsIE1h
cmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+PiBTZXNzaW9uIGRlc2NyaXB0
aW9uIChieSBKYW4pOg0KPj4+IEluIHRoZSBjb3Vyc2Ugb2Ygd29ya2luZyBvbiBhbiBYU0Eg
SSBoYWQgdG8gZmluYWxseSBnZXQgUFZIIERvbTAgd29yayBvbiBhdCBsZWFzdCBvbmUgb2Yg
bXkgc3lzdGVtcywgaW4gYSBtaW5pbWFsIGZhc2hpb24uIFRoaXMgaGFkIHR1cm5lZCB1cCBh
IG51bWJlciBvZiBpc3N1ZXMsIHNvbWUgb2Ygd2hpY2ggaGF2ZSBzaW5jZSByZW1haW5lZCBw
ZW5kaW5nLiBUaGVyZWZvcmUgSeKAmWQgbGlrZSB0byBnYWluIHVuZGVyc3RhbmRpbmcgb24g
d2hldGhlciB0aGVyZSBpcyBhbnkgZnV0dXJlIHRvIHRoaXMgbW9kZSBvZiBEb20wIG9wZXJh
dGlvbiwgYW5kIGlmIHNvIHdoZW4gaXQgY2FuIGJlIGV4cGVjdGVkIHRvIGJlIGJldHRlciB0
aGFuIHRlY2ggcHJldmlldyBvciBldmVuIGp1c3QgZXhwZXJpbWVudGFsLg0KPj4NCj4+IC4u
Lg0KPj4NCj4+PiBKw7xyZ2VuOiBQVkggZG9tMCBwZXJmb3JtYW5jZT8NCj4+Pg0KPj4+IFJv
Z2VyOiBpdCdzIGJhZDsgbW9zdGx5IHJlbGV2YW50IGlzIHFlbXUgaW50ZXJmYWNlcw0KPj4+
DQo+Pj4gR2VvcmdlOiBvbmx5IGZvciBzYWZldHkgY2VydGlmaWNhdGlvbnM/IHBlcmZvcm1h
bmNlIHBlbmFsdHkgbWF5IGJlIG9rYXkNCj4+Pg0KPj4+IErDvHJnZW46IGh5cGVyY2FsbHMg
Y2FuIGJlIGltcHJvdmVkICh2aXJ0dWFsIGJ1ZmZlcnM/KQ0KPj4NCj4+IFNvbWUgbW9yZSB0
aG91Z2h0cyBvbiB0aGlzIHRvcGljOiBIYXZpbmcgaHlwZXJjYWxsIHZhcmlhbnRzIHdpdGgg
cGh5c2ljYWxseQ0KPj4gYWRkcmVzc2VkIGJ1ZmZlcnMgd2lsbCBoZWxwLCBidXQgdGhlcmUg
aXMgYW4gYWRkaXRpb25hbCBjb21wbGV4aXR5OiB3aGF0DQo+PiBhYm91dCBoeXBlcmNhbGxz
IHdpdGggcmVhbGx5IGxhcmdlIGJ1ZmZlcnMgKGUuZy4gdGhlIGJpdG1hcCBmb3IgbW9kaWZp
ZWQNCj4+IHBhZ2VzIGZvciBndWVzdCBtaWdyYXRpb24pLiBJbiBvcmRlciB0byBhdm9pZCBo
YXZpbmcgdG8gYWxsb2NhdGUgaHVnZQ0KPj4gcGh5c2ljYWxseSBjb250aWd1b3VzIGJ1ZmZl
cnMgZm9yIHRob3NlIHB1cnBvc2VzIHdlJ2QgcHJvYmFibHkgbmVlZA0KPj4gc29tZXRoaW5n
IGxpa2Ugc2NhdHRlci9nYXRoZXIgbGlzdHMgZm9yIGh5cGVyY2FsbCBidWZmZXJzLg0KPiAN
Cj4gTm90IHN1cmUuIEknZCByYXRoZXIgc2VlIHVzIGFkZCBuZXcgKHN1YiloeXBlcmNhbGxz
IGZvciBzdWNoIG5vbi1zdGFuZGFyZA0KPiBjYXNlcy4gRS5nLiB0aGUgYml0bWFwIGV4YW1w
bGUgeW91IGdpdmUgd291bGQgYmUgYW1lbmRlZCBieSBhIG5ldyBmbGF2b3INCj4gaGF2aW5n
IHRoZSBjYWxsZXIgcGFzcyBpbiBhbiBhcnJheSBvZiBHRk5zIChwZXJoYXBzLCBhcyB5b3Ug
c2F5LCB3aXRoDQo+IGZ1cnRoZXIgaW5kaXJlY3Rpb24gdG8gZGVhbCB3aXRoIHRoYXQgYXJy
YXkgYWxzbyBncm93aW5nIGxhcmdlKS4gSSdkDQo+IHJlYWxseSBsaWtlIHRvIGtlZXAgdGhl
IGNvbW1vbiBjYXNlIHNpbXBsZS4NCg0KVGhlIHF1ZXN0aW9uIGlzIGhvdyBtYW55IGh5cGVy
Y2FsbHMgd291bGQgYmUgaGl0IGJ5IHRoZSBub3QgY29tbW9uIGNhc2UuDQoNClRha2luZyBh
IHF1aWNrIGdsYW5jZSBJIHNwb3R0ZWQ6DQoNCi0gZ3JhbnRfdGFibGVfb3AgKHN1Ym9wcyBz
ZXR1cF90YWJsZSBhbmQgZ2V0X3N0YXR1c19mcmFtZXMpDQotIG1lbW9yeV9vcCAoc2V2ZXJh
bCBzdWItb3BzKQ0KLSBtdWx0aWNhbGwgKG1haW4gbGlzdCBvZiBjYWxscykNCi0gY29uc29s
ZV9pbyAoY29uc29sZSBkYXRhKQ0KLSBtbXVleHRfb3AgKHNvbWUgb3BzIGFsbG93IGxpc3Rz
KQ0KLSB4c21fb3AgKG5vdCBzdXJlIGEgYnVmZmVyIGNhbiBzcGFuIHBhZ2VzLCBidXQgaW50
ZXJmYWNlIHdvdWxkIGFsbG93IGl0KQ0KLSBwaHlzZGV2X29wIChzdWJvcCBzZXRfaW9iaXRt
YXApDQotIGh2bV9vcCAoYWx0cDJtIGhhbmRsaW5nKQ0KLSBzeXNjdGwgKG11bHRpcGxlIHN1
Yi1vcHMpDQotIGRvbWN0bCAobXVsdGlwbGUgc3ViLW9wcykNCi0gaHlwZnMgKG5vZGUgZGF0
YSBjYW4gZXhjZWVkIHBhZ2Ugc2l6ZSkNCg0KRG8gd2UgcmVhbGx5IHdhbnQgdG8gc3BlY2lh
bCBjYXNlIGFsbCBvZiB0aG9zZT8NCg0KPj4gQW5kIHRob3NlIG1pZ2h0DQo+PiB3YW50IHRv
IGJlIHN1cHBvcnRlZCBpbiBhIGdlbmVyaWMgd2F5LiBBZGRpdGlvbmFsbHk6IHdoYXQgaWYg
c3VjaCBhIFNHLWxpc3QNCj4+IHdvdWxkIGV4Y2VlZCB0aGUgc2l6ZSBvZiBhIHBhZ2U/IFRo
ZSBkaXJ0eSBiaXRtYXAgb2YgYSBndWVzdCB3aXRoIDY0IEdCIG9mDQo+PiBSQU0gd291bGQg
YWxyZWFkeSBuZWVkIDUxMiBwYWdlcywgc28gdGhlIFNHLWxpc3QgZm9yIHRoYXQgYml0bWFw
IHdvdWxkIGFscmVhZHkNCj4+IGZpbGwgYSBjb21wbGV0ZSBwYWdlIGFzc3VtaW5nIG9ubHkg
OCBieXRlIGZvciBvbmUgU0ctZW50cnkgKHdoaWNoIHdvdWxkIGxpbWl0DQo+PiB0aGUgZ2Vu
ZXJhbCB1c2FiaWxpdHkgYWxyZWFkeSkuDQo+Pg0KPj4gTXkgZmF2b3JpdGUgc29sdXRpb24g
d291bGQgYmUgc29tZSBraW5kIG9mIGJ1ZmZlciBhZGRyZXNzIHF1YWxpZmllciBmb3IgZWFj
aA0KPj4gYnVmZmVyIChlLmcuIHZpcnR1YWwsIHBoeXNpY2FsLCBTRy1saXN0LCBtYXliZSBu
ZXN0ZWQgU0ctbGlzdCkuIFNvIHRoZSBuZXcNCj4+IGh5cGVyY2FsbHMgd291bGQgbm90IG1l
YW4gInBoeXNpY2FsIGJ1ZmZlciBhZGRyZXNzZXMiLCBidXQgInF1YWxpZmllZCBidWZmZXIN
Cj4+IGFkZHJlc3NlcyIuIEJ5IHJlcXVpcmluZyBhIG1pbmltdW0gb2YgNC1ieXRlIGFsaWdu
bWVudCBmb3IgZWFjaCBidWZmZXIgKGNhbiB3ZQ0KPj4gZG8gdGhhdCwgYXQgbGVhc3QgZm9y
IHRoZSBuZXcgaHlwZXJjYWxscz8pIHRoaXMgd291bGQgbGVhdmUgdGhlIDIgbG93ZXN0IGJp
dHMNCj4+IG9mIGEgYnVmZmVyIGFkZHJlc3MgZm9yIHRoZSBuZXcgcXVhbGlmaWVyLiBJZiBi
eSBhbnkgbWVhbnMgYW4gdW5hbGlnbmVkIGJ1ZmZlcg0KPj4gaXMgbmVlZGVkIHNvbWV0aW1l
cywgaXQgY291bGQgc3RpbGwgYmUgYWNoaWV2ZWQgdmlhIGEgc2luZ2xlLWVudHJ5IFNHLWxp
c3QuDQo+IA0KPiBXaGlsZSB0aGlzIG1pZ2h0IGJlIGFuIG9wdGlvbiwgSSdtIG5vdCBzdXJl
IEknZCBiZSByZWFsbHkgaGFwcHkgd2l0aCBzdWNoDQo+IHJlLXVzZSBvZiB0aGUgbG93IGFk
ZHJlc3MgYml0cywgbm9yIHdpdGggdGhlIGltcGxpZWQgZnVydGhlciByZXN0cmljdGlvbg0K
PiBvbiBidWZmZXIgYWxpZ25tZW50IChtb3N0IHN0cnVjdC1zIHdlIHVzZSBhcmUgNC1ieXRl
IGFsaWduZWQgYXQgbGVhc3QsDQo+IGJ1dCBJIGRvbid0IHRoaW5rIGl0J3MgYWxsIG9mIHRo
ZW0sIHBsdXMgd2UgYWxzbyBoYXZlIGd1ZXN0IGhhbmRsZXMgdG8NCj4gZS5nLiBhcnJheXMg
b2YgY2hhcikuDQoNClRoZSB1bmFsaWduZWQgY2FzZXMgY291bGQgYmUgaGFuZGxlZCBkeW5h
bWljYWxseSB2aWEgdGhlIHNpbmdsZS1lbnRyeQ0KU0ctbGlzdC4NCg0KDQpKdWVyZ2VuDQo=

--------------uPP5skHFGdm6JveACLpENDp4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------uPP5skHFGdm6JveACLpENDp4--

--------------2l9jkCod0Tzd9bRIm3dbVX0I--

--------------8wznQtuFLUDfP7ZKCaEBwT8C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMxY+QFAwAAAAAACgkQsN6d1ii/Ey8y
mQf/VHPRvIJg/xrDuS+UaKeh0cuwxRY4izKaINM6p1k/krWlOFc2w5+h1fevvjutPAR5Nm42Zq1G
2xAskPF8fS8MCPcZVPeXw2ohrQ5W1z+2Y3otr1jN4eynS1fr+wARfw12OkZ+JGoP9oKxdBoxZdtz
5QWtfRjDrBhD9tWrIJ7hp4MHOBkPw1C1nmZpABSCrNQ+5eAfhtUBC3YANMvO27fq4nhpJleQvinF
GKgL8DLVYd1gv97x5B2OWe5k6VBeI/phfy7dMhWlABbDbehB2u6JbbF5mD26We+LWhnhWjK+wDEJ
hZut00mXLwiETTIxbHCa6eEP+/7yppKDWaXpV+i6cA==
=t2bc
-----END PGP SIGNATURE-----

--------------8wznQtuFLUDfP7ZKCaEBwT8C--

