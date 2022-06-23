Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470C55762C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:02:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354640.581849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Iix-000643-LB; Thu, 23 Jun 2022 09:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354640.581849; Thu, 23 Jun 2022 09:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Iix-00061M-GG; Thu, 23 Jun 2022 09:02:03 +0000
Received: by outflank-mailman (input) for mailman id 354640;
 Thu, 23 Jun 2022 09:02:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4Iiw-00061G-6C
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:02:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24948abd-f2d3-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 11:02:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 817DC21DE4;
 Thu, 23 Jun 2022 09:02:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6196813461;
 Thu, 23 Jun 2022 09:02:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sRcuFggstGKgGAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Jun 2022 09:02:00 +0000
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
X-Inumbo-ID: 24948abd-f2d3-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655974920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4DP/2IsHCFdAw6qHyPAW0gTEI0KLh60BvH4sq5H7Xgg=;
	b=W4Yl9N+0TxfH3Y9icLxMLshyfVnn1Qoa3GFM2RZ4aWnklVtv7tbHVgyd6V1VE7c8TWUwZz
	PXqHXuw7l7LY8EhgLFv8bLmT6ZiEuVV9ikrXKnDx7eLLo42G0qFW0lb5iwHa9xu5GSLg8E
	5xgSGkJWPO7XJkjFgEcERwIXTapiSy8=
Message-ID: <17124274-05e5-52c4-5505-9de9ad95db55@suse.com>
Date: Thu, 23 Jun 2022 11:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
 <922ee651-c211-6e46-7986-6d0f74164e57@suse.com>
 <b74d7347-113b-c608-1346-8f75f1a77cb9@suse.com>
 <53bb13f6-04ec-0ed0-2c19-9c7947654989@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Problem loading linux 5.19 as PV dom0
In-Reply-To: <53bb13f6-04ec-0ed0-2c19-9c7947654989@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4UWtt0HYQ0jRSW400tu08J6a"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4UWtt0HYQ0jRSW400tu08J6a
Content-Type: multipart/mixed; boundary="------------ff80WqD6Reakmw04RyHrebFu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <17124274-05e5-52c4-5505-9de9ad95db55@suse.com>
Subject: Re: Problem loading linux 5.19 as PV dom0
References: <5c396832-3102-ff5b-c198-c037ee87d83f@suse.com>
 <922ee651-c211-6e46-7986-6d0f74164e57@suse.com>
 <b74d7347-113b-c608-1346-8f75f1a77cb9@suse.com>
 <53bb13f6-04ec-0ed0-2c19-9c7947654989@suse.com>
In-Reply-To: <53bb13f6-04ec-0ed0-2c19-9c7947654989@suse.com>

--------------ff80WqD6Reakmw04RyHrebFu
Content-Type: multipart/mixed; boundary="------------XNAo5TeMVPRvod1rflvzBYyD"

--------------XNAo5TeMVPRvod1rflvzBYyD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDYuMjIgMTA6NDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wNi4yMDIy
IDEwOjA2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjMuMDYuMjIgMDk6NTUsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIyLjA2LjIwMjIgMTg6MDYsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IEEgTGludXgga2VybmVsIDUuMTkgY2FuIG9ubHkgYmUgbG9hZGVk
IGFzIGRvbTAsIGlmIGl0IGhhcyBiZWVuDQo+Pj4+IGJ1aWx0IHdpdGggQ09ORklHX0FNRF9N
RU1fRU5DUllQVCBlbmFibGVkLiBUaGlzIGlzIGR1ZSB0byB0aGUNCj4+Pj4gZmFjdCB0aGF0
IG90aGVyd2lzZSB0aGUgKHJlbGV2YW50KSBsYXN0IHNlY3Rpb24gb2YgdGhlIGJ1aWx0DQo+
Pj4+IGtlcm5lbCBoYXMgdGhlIE5PTE9BRCBmbGFnIHNldCAoaXQgaXMgc3RpbGwgbWFya2Vk
IHdpdGgNCj4+Pj4gU0hGX0FMTE9DKS4NCj4+Pj4NCj4+Pj4gSSB0aGluayBhdCBsZWFzdCB0
aGUgaHlwZXJ2aXNvciBuZWVkcyB0byBiZSBjaGFuZ2VkIHRvIHN1cHBvcnQNCj4+Pj4gdGhp
cyBsYXlvdXQuIE90aGVyd2lzZSBpdCB3aWxsIHB1dCB0aGUgaW5pdGlhbCBwYWdlIHRhYmxl
cyBmb3INCj4+Pj4gZG9tMCBhdCB0aGUgc2FtZSBwb3NpdGlvbiBhcyB0aGlzIGxhc3Qgc2Vj
dGlvbiwgbGVhZGluZyB0bw0KPj4+PiBlYXJseSBjcmFzaGVzLg0KPj4+DQo+Pj4gSXNuJ3Qg
WGVuIHVzaW5nIHRoZSBiekltYWdlIGhlYWRlciB0aGVyZSwgcmF0aGVyIHRoYW4gYW55IEVM
Rg0KPj4+IG9uZT8gSW4gd2hpY2ggY2FzZSBpdCB3b3VsZCBtYXR0ZXIgaG93IHRoZSBOT0xP
QUQgc2VjdGlvbiBpcw0KPj4NCj4+IEZvciBhIFBWIGtlcm5lbD8gTm8sIEkgZG9uJ3QgdGhp
bmsgc28uDQo+IA0KPiBBY3R1YWxseSBpdCdzIGEgbWl4IChhbmQgdGhlIHNhbWUgZm9yIFBW
IGFuZCBQVkgpIC0gdGhlIGJ6SW1hZ2UNCj4gaGVhZGVyIGlzIHBhcnNlZCB0byBnZXQgYXQg
dGhlIGVtYmVkZGVkIEVMRiBoZWFkZXIuIFhlbm9MaW51eCB3YXMNCj4gd2hhdCB3b3VsZC9j
b3VsZCBiZSBsb2FkZWQgYXMgcGxhaW4gRUxGLg0KPiANCj4+PiBhY3R1YWxseSByZXByZXNl
bnRlZCBpbiB0aGF0IGhlYWRlci4gQ2FuIHlvdSBwcm92aWRlIGEgZHVtcCAob3INCj4+PiBi
aW5hcnkgcmVwcmVzZW50YXRpb24pIG9mIGJvdGggaGVhZGVycz8NCj4+DQo+PiBQcm9ncmFt
IEhlYWRlcjoNCj4+ICAgICAgIExPQUQgb2ZmICAgIDB4MDAwMDAwMDAwMDIwMDAwMCB2YWRk
ciAweGZmZmZmZmZmODEwMDAwMDAgcGFkZHINCj4+IDB4MDAwMDAwMDAwMTAwMDAwMCBhbGln
biAyKioyMQ0KPj4gICAgICAgICAgICBmaWxlc3ogMHgwMDAwMDAwMDAxNDVlMTE0IG1lbXN6
IDB4MDAwMDAwMDAwMTQ1ZTExNCBmbGFncyByLXgNCj4+ICAgICAgIExPQUQgb2ZmICAgIDB4
MDAwMDAwMDAwMTgwMDAwMCB2YWRkciAweGZmZmZmZmZmODI2MDAwMDAgcGFkZHINCj4+IDB4
MDAwMDAwMDAwMjYwMDAwMCBhbGlnbiAyKioyMQ0KPj4gICAgICAgICAgICBmaWxlc3ogMHgw
MDAwMDAwMDAwNmI3MDAwIG1lbXN6IDB4MDAwMDAwMDAwMDZiNzAwMCBmbGFncyBydy0NCj4+
ICAgICAgIExPQUQgb2ZmICAgIDB4MDAwMDAwMDAwMjAwMDAwMCB2YWRkciAweDAwMDAwMDAw
MDAwMDAwMDAgcGFkZHINCj4+IDB4MDAwMDAwMDAwMmNiNzAwMCBhbGlnbiAyKioyMQ0KPj4g
ICAgICAgICAgICBmaWxlc3ogMHgwMDAwMDAwMDAwMDMxMmE4IG1lbXN6IDB4MDAwMDAwMDAw
MDAzMTJhOCBmbGFncyBydy0NCj4+ICAgICAgIExPQUQgb2ZmICAgIDB4MDAwMDAwMDAwMjBl
OTAwMCB2YWRkciAweGZmZmZmZmZmODJjZTkwMDAgcGFkZHINCj4+IDB4MDAwMDAwMDAwMmNl
OTAwMCBhbGlnbiAyKioyMQ0KPj4gICAgICAgICAgICBmaWxlc3ogMHgwMDAwMDAwMDAwMWZk
MDAwIG1lbXN6IDB4MDAwMDAwMDAwMDMxNzAwMCBmbGFncyByd3gNCj4gDQo+IDIwZTkwMDAg
KyAzMTcwMDAgPSAyNDAwMDANCj4gDQo+PiAgICAgICBOT1RFIG9mZiAgICAweDAwMDAwMDAw
MDE2NWRmMTAgdmFkZHIgMHhmZmZmZmZmZjgyNDVkZjEwIHBhZGRyDQo+PiAweDAwMDAwMDAw
MDI0NWRmMTAgYWxpZ24gMioqMg0KPj4gICAgICAgICAgICBmaWxlc3ogMHgwMDAwMDAwMDAw
MDAwMjA0IG1lbXN6IDB4MDAwMDAwMDAwMDAwMDIwNCBmbGFncyAtLS0NCj4+DQo+Pg0KPj4g
U2VjdGlvbnM6DQo+PiBJZHggTmFtZSAgICAgICAgICBTaXplICAgICAgVk1BICAgICAgICAg
ICAgICAgTE1BICAgICAgICAgICAgICAgRmlsZSBvZmYgIEFsZ24NCj4+IC4uLg0KPj4gICAg
MzAgLnNtcF9sb2NrcyAgICAwMDAwOTAwMCAgZmZmZmZmZmY4MmVkYzAwMCAgMDAwMDAwMDAw
MmVkYzAwMCAgMDIyZGMwMDAgIDIqKjINCj4+ICAgICAgICAgICAgICAgICAgICAgQ09OVEVO
VFMsIEFMTE9DLCBMT0FELCBSRUFET05MWSwgREFUQQ0KPj4gICAgMzEgLmRhdGFfbm9zYXZl
ICAwMDAwMTAwMCAgZmZmZmZmZmY4MmVlNTAwMCAgMDAwMDAwMDAwMmVlNTAwMCAgMDIyZTUw
MDAgIDIqKjINCj4+ICAgICAgICAgICAgICAgICAgICAgQ09OVEVOVFMsIEFMTE9DLCBMT0FE
LCBEQVRBDQo+PiAgICAzMiAuYnNzICAgICAgICAgIDAwMTFhMDAwICBmZmZmZmZmZjgyZWU2
MDAwICAwMDAwMDAwMDAyZWU2MDAwICAwMjJlNjAwMCAgMioqMTINCj4+ICAgICAgICAgICAg
ICAgICAgICAgQUxMT0MNCj4gDQo+IDJlZTYwMDAgKyAxMWEwMDAgPSAyNDAwMDANCj4gDQo+
PiAgICAzMyAuYnJrICAgICAgICAgIDAwMDI2MDAwICBmZmZmZmZmZjgzMDAwMDAwICBmZmZm
ZmZmZjgzMDAwMDAwICAwMDAwMDAwMCAgMioqMA0KPj4gICAgICAgICAgICAgICAgICAgICBB
TExPQw0KPiANCj4gVGhpcyBzcGFjZSBpc24ndCBjb3ZlcmVkIGJ5IGFueSBwcm9ncmFtIGhl
YWRlci4gV2hpY2ggaW4gdHVybiBtYXkgYmUgYQ0KPiByZXN1bHQgb2YgaXRzIExNQSBtYXRj
aGluZyBpdHMgVk1BLCB1bmxpa2UgZm9yIGFsbCBvdGhlciBzZWN0aW9ucy4NCj4gTG9va3Mg
bGlrZSBhIGxpbmtlciBzY3JpcHQgb3IgbGlua2VyIGlzc3VlIHRvIG1lOiBXaGlsZSAuLi4N
Cj4gDQo+PiBBbmQgdGhlIHJlbGF0ZWQgbGlua2VyIHNjcmlwdCBwYXJ0Og0KPj4NCj4+ICAg
ICAgICAgICBfX2VuZF9vZl9rZXJuZWxfcmVzZXJ2ZSA9IC47DQo+Pg0KPj4gICAgICAgICAg
IC4gPSBBTElHTihQQUdFX1NJWkUpOw0KPj4gICAgICAgICAgIC5icmsgKE5PTE9BRCkgOiBB
VChBRERSKC5icmspIC0gTE9BRF9PRkZTRVQpIHsNCj4gDQo+IC4uLiB0aGlzIEFUKCkgbG9v
a3MgY29ycmVjdCB0byBtZSwgSSdtIHVuY2VydGFpbiBvZiB0aGUgdXNlIG9mIE5PTE9BRC4N
Cj4gTm90ZSB0aGF0IC5ic3MgZG9lc24ndCBoYXZlIE5PTE9BRCwgbWF0Y2hpbmcgdGhlIHZh
c3QgbWFqb3JpdHkgb2YgdGhlDQo+IGxpbmtlciBzY3JpcHRzIGxkIGl0c2VsZiBoYXMuDQoN
ClllYWgsIGJ1dCB0aGUgZmlsZXN6IGFuZCBtZW1zeiB2YWx1ZXMgb2YgdGhlIC5ic3MgcmVs
YXRlZCBwcm9ncmFtIGhlYWRlcg0KZGlmZmVyIGEgbG90IChiYXNpY2FsbHkgYnkgdGhlIC5i
c3Mgc2l6ZSBwbHVzIHNvbWUgYWxpZ25tZW50KSwgYW5kIHRoZQ0KLmJzcyBzZWN0aW9uIGZs
YWdzIGNsZWFybHkgc2F5IHRoYXQgaXRzIGF0dHJpYnV0ZXMgbWF0Y2ggdGhvc2Ugb2YgLmJy
ay4NCg0KSSdtIG5vdCBzdXJlIHdoeSB0aGUgbGlua2VyIHdvdWxkbid0IGFkZCAuYnJrIHRv
IHRoZSBzYW1lIHBncm9ncmFtDQpoZWFkZXIgZW50cnkgYXMgLmJzcywgYnV0IG1heWJlIHRo
YXQgaXMgc29tZSAuYnNzIHNwZWNpYWwgaGFuZGxpbmcuDQoNCkluIHRoZSBlbmQgSSB0aGlu
ayB0aGlzIG1pZ2h0IGJlIGEgbGlua2VyIGlzc3VlLCBidXQgZXZlbiBpbiB0aGlzIGNhc2UN
CndlIHNob3VsZCByZWFsbHkgY29uc2lkZXIgdG8gaGFuZGxlIGl0LCBhcyBvdGhlcndpc2Ug
d2UnZCBqdXN0IHNheQ0KImhleSwgZHVlIHRvIGEgbGlua2VyIHByb2JsZW0gd2UgZG9uJ3Qg
c3VwcG9ydCBMaW51eCA1LjE5IGluIFBWIG1vZGUiLg0KDQpJbiB0aGUgZW5kIHdlIGNhbid0
IGNvbnRyb2wgd2hpY2ggbGlua2VyIHZlcnNpb25zIGFyZSB1c2VkIHRvIGxpbmsNCnRoZSBr
ZXJuZWwuDQoNCg0KSnVlcmdlbg0K
--------------XNAo5TeMVPRvod1rflvzBYyD
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------XNAo5TeMVPRvod1rflvzBYyD--

--------------ff80WqD6Reakmw04RyHrebFu--

--------------4UWtt0HYQ0jRSW400tu08J6a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK0LAcFAwAAAAAACgkQsN6d1ii/Ey/k
xgf6Al255mvkXh6uQzjcAJ81skub5Gj5xpI4v5SGPfA84ybL44dzO9J86PJiiIkSF7tHqJdBYzHu
SJplF5RjVm8omCZiXZgMhwacOii2lngZ5o15FfzWd4Q5kiojEQzUhQRK5FGB0dP/Qp9zXxy0pNdl
k5F2Q/Eny9UQdTqApcm9TVPfqPCf7RkdZG3tK62z4GBfqwQfmtualCyQ8voRqtPBD3nV867kp4CW
vmfVYSTCd8wjTuju/LoZoJ9EjXwvQbs1F8KvHLycc223qUiapGgrTPo95RhEOCPIOlWv9xxiMNG7
GzvQfKJ6QDUOWwG/P5E6NWzxwZMEi1vfcOMk9/L9ig==
=VScz
-----END PGP SIGNATURE-----

--------------4UWtt0HYQ0jRSW400tu08J6a--

