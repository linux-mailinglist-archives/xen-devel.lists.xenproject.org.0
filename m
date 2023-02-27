Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4516A43D9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502593.774454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeCu-000440-2n; Mon, 27 Feb 2023 14:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502593.774454; Mon, 27 Feb 2023 14:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeCu-00041n-0E; Mon, 27 Feb 2023 14:10:24 +0000
Received: by outflank-mailman (input) for mailman id 502593;
 Mon, 27 Feb 2023 14:10:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQU0=6X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pWeCs-00041h-8i
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 14:10:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7860901a-b6a8-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 15:10:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 881961FD63;
 Mon, 27 Feb 2023 14:10:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CB1A13912;
 Mon, 27 Feb 2023 14:10:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v3coEcy5/GPTfgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Feb 2023 14:10:20 +0000
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
X-Inumbo-ID: 7860901a-b6a8-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677507020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wEskT/EQiXxFO9rrM0C+jXOFLRO2wLZnir9+Rn7dIcI=;
	b=sWJWW8mhNgMN5b1jF/35gVkTbsg2Uv4AhdN69Rlh9sYRgnf9EzzHlAt1qujdZfmWt/ad3f
	BbfOvm87ha2sxkpRWvcWTlM4Jw6RrvqMYKr93nGdvSr3+YsxfJQYiqQahGBPBkyzblxihY
	aVw53CL0zE4g6Iwx8wb5M4uEsVcL1KU=
Message-ID: <18c102d3-7f19-9774-370e-654c7b0b727a@suse.com>
Date: Mon, 27 Feb 2023 15:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] tools: add offsetof() to xen-tools/libs.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230227120957.10037-1-jgross@suse.com>
 <20230227120957.10037-4-jgross@suse.com>
 <8865a525-b55d-9b4f-ad2c-fe1f70afd0ba@suse.com>
 <809b25b3-1e8e-43ee-dc3a-1a54a938c9f7@suse.com>
 <da345d46-3027-f0fa-bef7-04494da35ac0@suse.com>
 <6a888edc-0b5b-117d-a216-ff28ad7bdc41@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <6a888edc-0b5b-117d-a216-ff28ad7bdc41@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SZq1cpJCjn23uZP0tz7Axc27"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SZq1cpJCjn23uZP0tz7Axc27
Content-Type: multipart/mixed; boundary="------------XEftNcsfbB6L18k10llmbvUx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <18c102d3-7f19-9774-370e-654c7b0b727a@suse.com>
Subject: Re: [PATCH 3/3] tools: add offsetof() to xen-tools/libs.h
References: <20230227120957.10037-1-jgross@suse.com>
 <20230227120957.10037-4-jgross@suse.com>
 <8865a525-b55d-9b4f-ad2c-fe1f70afd0ba@suse.com>
 <809b25b3-1e8e-43ee-dc3a-1a54a938c9f7@suse.com>
 <da345d46-3027-f0fa-bef7-04494da35ac0@suse.com>
 <6a888edc-0b5b-117d-a216-ff28ad7bdc41@citrix.com>
In-Reply-To: <6a888edc-0b5b-117d-a216-ff28ad7bdc41@citrix.com>

--------------XEftNcsfbB6L18k10llmbvUx
Content-Type: multipart/mixed; boundary="------------jQd72Luk2Z0w2LdC4ILYnJ0v"

--------------jQd72Luk2Z0w2LdC4ILYnJ0v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDIuMjMgMTU6MDYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI3LzAyLzIw
MjMgMTI6NDMgcG0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjcuMDIuMjAyMyAxMzoz
NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+PiBPbiAyNy4wMi4yMyAxMzozMSwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDI3LjAyLjIwMjMgMTM6MDksIEp1ZXJnZW4gR3Jvc3Mg
d3JvdGU6DQo+Pj4+PiAtLS0gYS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5oDQo+
Pj4+PiArKysgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5oDQo+Pj4+PiBAQCAt
MzAsOSArMzAsNiBAQCBlbnVtIHsNCj4+Pj4+ICAgICNkZWZpbmUgU0VMX0RBVEEzMiAgICAg
ICAgICAweDAwMjANCj4+Pj4+ICAgICNkZWZpbmUgU0VMX0NPREU2NCAgICAgICAgICAweDAw
MjgNCj4+Pj4+ICAgIA0KPj4+Pj4gLSN1bmRlZiBvZmZzZXRvZg0KPj4+Pj4gLSNkZWZpbmUg
b2Zmc2V0b2YodCwgbSkgKCh1bnNpZ25lZCBsb25nKSYoKHQgKikwKS0+bSkNCj4+Pj4+IC0N
Cj4+Pj4+ICAgICN1bmRlZiBOVUxMDQo+Pj4+PiAgICAjZGVmaW5lIE5VTEwgKCh2b2lkKikw
KQ0KPj4+Pj4gICAgDQo+Pj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUvaW5jbHVk
ZS9zdGRkZWYuaCBiL3Rvb2xzL2Zpcm13YXJlL2luY2x1ZGUvc3RkZGVmLmgNCj4+Pj4+IGlu
ZGV4IGM3Zjk3NDYwOGEuLjkyNmFlMTJmYTUgMTAwNjQ0DQo+Pj4+PiAtLS0gYS90b29scy9m
aXJtd2FyZS9pbmNsdWRlL3N0ZGRlZi5oDQo+Pj4+PiArKysgYi90b29scy9maXJtd2FyZS9p
bmNsdWRlL3N0ZGRlZi5oDQo+Pj4+PiBAQCAtMSwxMCArMSwxMCBAQA0KPj4+Pj4gICAgI2lm
bmRlZiBfU1REREVGX0hfDQo+Pj4+PiAgICAjZGVmaW5lIF9TVERERUZfSF8NCj4+Pj4+ICAg
IA0KPj4+Pj4gKyNpbmNsdWRlIDx4ZW4tdG9vbHMvbGlicy5oPg0KPj4+PiBJJ20gbm90IGNv
bnZpbmNlZCBmaXJtd2FyZS8gZmlsZXMgY2FuIHZhbGlkbHkgaW5jbHVkZSB0aGlzIGhlYWRl
ci4NCj4+PiBUaGlzIGZpbGUgb25seSBjb250YWlucyBtYWNyb3Mgd2hpY2ggZG9uJ3QgY2Fs
bCBhbnkgZXh0ZXJuYWwgZnVuY3Rpb25zLg0KPj4+DQo+Pj4gV291bGQgeW91IGJlIGZpbmUg
d2l0aCBtZSBhZGRpbmcgYSByZWxhdGVkIGNvbW1lbnQgdG8gaXQ/DQo+PiBJZiBpdCB3YXMg
dG8gYmUgdXNhYmxlIGxpa2UgdGhpcywgdGhhdCB3b3VsZCBiZSBhIHByZXJlcSwgYnV0IHBl
cnNvbmFsbHkNCj4+IEkgZG9uJ3QgdmlldyB0aGlzIGFzIHN1ZmZpY2llbnQuIFRoZSBlbnZp
cm9ubWVudCBjb2RlIHJ1bnMgaW4gdGhhdCBsaXZlcw0KPj4gdW5kZXIgZmlybXdhcmUvIGlz
IHNpbXBseSBkaWZmZXJlbnQgKGh2bWxvYWRlciwgZm9yIGV4YW1wbGUsIGlzIDMyLWJpdA0K
Pj4gbm8gbWF0dGVyIHRoYXQgdGhlIHRvb2xzdGFjayB3b3VsZCBub3JtYWxseSBiZSA2NC1i
aXQpLCBzbyB0byBtZSBpdA0KPj4gZmVlbHMgbGlrZSBzZXR0aW5nIHVwIGEgdHJhcCBmb3Ig
b3Vyc2VsdmVzLiBJZiBBbmRyZXcgb3IgUm9nZXIgYXJlIGZ1bGx5DQo+PiBjb252aW5jZWQg
dGhpcyBpcyBhIGdvb2QgbW92ZSwgSSB3b24ndCBiZSBzdGFuZGluZyBpbiB0aGUgd2F5IC4u
Lg0KPiANCj4gV2Ugc3RpbGwgc3VwcG9ydCAzMmJpdCBidWlsZHMgb2YgdGhlIHRvb2xzdGFj
ayBvbiBtdWx0aXBsZQ0KPiBhcmNoaXRlY3R1cmVzLCBzbyBJIGRvbid0IHNlZSBiaXRuZXNz
IGFzIGFuIGFyZ3VtZW50IGFnYWluc3QuDQo+IA0KPiBJIGFtIHNsaWdodGx5IHVuZWFzeSBh
ZGRpbmcgYSBoZWFkZXIgbGlrZSB0aGlzLCBidXQgaXQgcmVhbGx5IGlzIG9ubHkNCj4gY29t
bW9uIG1hY3JvcyBhbmQgSSBkb24ndCBzZWUgaG93IGl0IGNvdWxkIHBvc3NpYmx5IGNoYW5n
ZSBmcm9tIHRoYXQNCj4gZ2l2ZW4gdGhlIGV4aXN0aW5nIHVzZXMuwqAgT1RPSCwgcmVtb3Zp
bmcgdGhpbmdzIGxpa2UgdGhlIHByb2JsZW1hdGljDQo+IGRlZmluaXRpb24gb2Ygb2Zmc2V0
b2YoKSBpcyBhbiBpbXByb3ZlbWVudC4NCj4gDQo+IEknZCBwcm9iYWJseSB0ZW50YXRpdmVs
eSBhY2sgdGhpcyBwYXRjaCwgc2VlaW5nIGFzIGl0IGlzIGEgbWlub3INCj4gaW1wcm92bGVt
ZW50LCBidXQgSSB0aGluayB0aGVyZSdzIGEgbWlkZGxlIG9wdGlvbiB0b28uwqAgUmVuYW1l
IGxpYnMuaCB0bw0KPiBtYWNyb3MuaCBvciBjb21tb24tbWFjcm9zLmg/wqAgSU1PIHRoYXQg
d291bGQgYmUgc29tZXRoaW5nIHRoYXQncyBmYXINCj4gbW9yZSBvYnZpb3VzbHkgc2FmZSB0
byBpbmNsdWRlIGludG8gZmlybXdhcmUvLCBhbmQgc29tZXRoaW5nIHJhdGhlciBtb3JlDQo+
IGRlc2NyaXB0aXZlIGF0IGFsbCBvZiBpdHMgaW5jbHVkZSBzaXRlcy4NCj4gDQo+IFRob3Vn
aHRzPw0KDQpJJ20gZmluZSB3aXRoIHRoYXQuDQoNCk15IHByZWZlcmVuY2Ugd291bGQgYmUg
ImNvbW1vbi1tYWNyb3MuaCIuDQoNCg0KSnVlcmdlbg0KDQo=
--------------jQd72Luk2Z0w2LdC4ILYnJ0v
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------jQd72Luk2Z0w2LdC4ILYnJ0v--

--------------XEftNcsfbB6L18k10llmbvUx--

--------------SZq1cpJCjn23uZP0tz7Axc27
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP8ucsFAwAAAAAACgkQsN6d1ii/Ey/E
2Qf9HqUP0vC5pMiEMvV4y6msqqh4B9sU1QQnsPOfrjeb4EfavAu6ClrCuN5VsGa2BWOGxJPbEpAH
T3FVDoEVN380UPtaN5r/kTAkDzDNEg2yv5gDoaO0udstptVxg5RnDiAwxnaulFsMMZplv/HQXGka
GCiyYei9IXb1nyQl8VXXya9d7d/yqL0UT4HQeNSdn7wHXOy6JQ0ZDLiupidub+idXPE22aLzNmlc
JmGkdCPQYoFSG73338ANDy8EbSYoFjxBx2OUr/GIrYArxh7qVHsNhbvNr3AZDNUQgoI/EvmP+TZ/
wGF72fb07JN+T9QL7Qy/ttYrpy9ml357HVXUNzzykA==
=D3eL
-----END PGP SIGNATURE-----

--------------SZq1cpJCjn23uZP0tz7Axc27--

