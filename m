Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4985E9D5D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 11:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411545.654496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ockH4-0004ee-80; Mon, 26 Sep 2022 09:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411545.654496; Mon, 26 Sep 2022 09:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ockH4-0004cq-55; Mon, 26 Sep 2022 09:19:38 +0000
Received: by outflank-mailman (input) for mailman id 411545;
 Mon, 26 Sep 2022 09:19:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ba90=Z5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ockH2-0004ck-0v
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 09:19:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5604e7a8-3d7c-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 11:19:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 545062210A;
 Mon, 26 Sep 2022 09:19:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 353B8139BD;
 Mon, 26 Sep 2022 09:19:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 63VOC6ZuMWPdcAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 26 Sep 2022 09:19:34 +0000
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
X-Inumbo-ID: 5604e7a8-3d7c-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664183974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MLXxIPG8Gh6ps8xY2agspRgVOvO5rxBk83aobXiB0mQ=;
	b=uZaVAgVWSm4OHe3wE/B6ziWsxAlE8Dmxs7Zl6LJ1Pdi8vvATjZ1QB5niZkKsP1Y6k4p158
	i+fvqfxyJv+xAKfzX0DQH7JKkHNXaNXWHE54ihycaMf/X4APbhAHgFxlEB4noyFuMatGzP
	Wz1LzAck7svGlnPhoXDbpbkuZGfjR/g=
Message-ID: <98f14fa6-4b5e-fde8-fceb-d37cf82ca00f@suse.com>
Date: Mon, 26 Sep 2022 11:19:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Design session "grant v3"
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YyxmQf+q0BqsX8Nb@mail-itl>
 <cb4829d0-ca64-9f41-8a0f-48cf6ce84040@suse.com>
 <767eeb85-40ab-70f6-2d0f-f81af0a65f6e@suse.com>
 <192f76e1-4f5a-34e7-84e7-a78da531607a@suse.com>
 <12ef0abb-2158-faf7-76d7-61e165060d0c@suse.com>
 <c29c23ce-1255-3b40-2353-b243ff04007a@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <c29c23ce-1255-3b40-2353-b243ff04007a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4hkbPGnoFs54dmpMRE6LXgbW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4hkbPGnoFs54dmpMRE6LXgbW
Content-Type: multipart/mixed; boundary="------------2OZ4U2IU8w4SOcz0oWBVCssH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <98f14fa6-4b5e-fde8-fceb-d37cf82ca00f@suse.com>
Subject: Re: Design session "grant v3"
References: <YyxmQf+q0BqsX8Nb@mail-itl>
 <cb4829d0-ca64-9f41-8a0f-48cf6ce84040@suse.com>
 <767eeb85-40ab-70f6-2d0f-f81af0a65f6e@suse.com>
 <192f76e1-4f5a-34e7-84e7-a78da531607a@suse.com>
 <12ef0abb-2158-faf7-76d7-61e165060d0c@suse.com>
 <c29c23ce-1255-3b40-2353-b243ff04007a@suse.com>
In-Reply-To: <c29c23ce-1255-3b40-2353-b243ff04007a@suse.com>

--------------2OZ4U2IU8w4SOcz0oWBVCssH
Content-Type: multipart/mixed; boundary="------------xXUDwe8VtxLeQeHayrFAxqWy"

--------------xXUDwe8VtxLeQeHayrFAxqWy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDkuMjIgMDk6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4wOS4yMDIy
IDA5OjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjYuMDkuMjIgMDg6NTcsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIzLjA5LjIwMjIgMTE6MzEsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDIyLjA5LjIyIDIwOjQzLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDIyLjA5LjIwMjIgMTU6NDIsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSB3cm90ZToNCj4+Pj4+PiBZYW5uOiAgIGNhbiBiYWNrZW5kIHJlZnVzZSByZXZva2luZz8N
Cj4+Pj4+PiBKw7xyZ2VuOiBpdCBzaG91bGRuJ3QgYmUgdGhpcyB3YXksIGJ1dCByZXZva2Ug
Y291bGQgYmUgY29udHJvbGxlZCBieSBmZWF0dXJlIGZsYWc7IHJldm9rZSBjb3VsZCBwYXNz
IHNjcmF0Y2ggcGFnZSBwZXIgcmV2b2tlIGNhbGwgKG1vcmUgZmxleGlibGUgY29udHJvbCkN
Cj4+Pj4+DQo+Pj4+PiBBIHNpbmdsZSBzY3JhdGNoIHBhZ2UgY29tZXMgd2l0aCB0aGUgcmlz
ayBvZiBkYXRhIGNvcnJ1cHRpb24sIGFzIGFsbA0KPj4+Pj4gSS9PIHdvdWxkIGJlIGRpcmVj
dGVkIHRoZXJlLiBBIHNpbmsgcGFnZSAoZm9yIG1lbW9yeSB3cml0ZXMpIHdvdWxkDQo+Pj4+
PiBsaWtlbHkgYmUgb2theSwgYnV0IGRldmljZSB3cml0ZXMgKG1lbW9yeSByZWFkcykgY2Fu
J3QgYmUgZG9uZSBmcm9tDQo+Pj4+PiBhIHN1cnJvZ2F0ZSBwYWdlLg0KPj4+Pg0KPj4+PiBJ
IGRvbid0IHNlZSB0aGF0IHByb2JsZW0uDQo+Pj4+DQo+Pj4+IEluIGNhc2UgdGhlIGdyYW50
IGlzIHJldm9rZWQgZHVlIHRvIGEgbWFsaWNpb3VzL2J1Z2d5IGJhY2tlbmQsIHlvdSBjYW4n
dA0KPj4+PiB0cnVzdCB0aGUgSS9PIGRhdGEgYW55d2F5Lg0KPj4+DQo+Pj4gSSBhZ3JlZSBm
b3IgdGhlIG1hbGljaW91cyBjYXNlLCBidXQgSSdtIGxlc3MgY2VydGFpbiB3aGVuIGlzIGNv
bWUgdG8NCj4+PiBidWdneSBiYWNrZW5kcy4gU29tZSBidWdzIChsaWtlIG5vdCB1bm1hcHBp
bmcgYSBncmFudCkgYXJlbid0IHB1dHRpbmcNCj4+PiB0aGUgZGF0YSBhdCByaXNrLg0KPj4N
Cj4+IEluIGNhc2UgdGhlIGRhdGEgcGFnZSBjYW4ndCBiZSB1c2VkIGZvciBhbnl0aGluZyBl
bHNlLCB3aGF0IHdvdWxkIGJlIHRoZQ0KPj4gcG9pbnQgb2YgcmV2b2tpbmcgdGhlIGdyYW50
PyBUaGUgcGFnZSB3b3VsZCBsZWFrIGluIGJvdGggY2FzZXMgKHJldm9raW5nDQo+PiBvciBu
b3QpLg0KPiANCj4gU3VyZSwgYnV0IGRvbid0IHlvdSBhZ3JlZSBpdCB3b3VsZCBiZSBiZXR0
ZXIgZm9yIHRoZSBndWVzdCB0byBoYXZlIGEgd2F5DQo+IHRvIGNsZWFubHkgc2h1dCBkb3du
IGluIGNhc2UgaXQgbm90aWNlcyBhIG1pc2JlaGF2aW5nIGJhY2tlbmQsIHJhdGhlcg0KPiB0
aGFuIGhhdmluZyBpdHMgZGF0YSBjb3JydXB0ZWQgaW4gdGhlIHByb2Nlc3M/IE9mIGNvdXJz
ZSBhIGd1ZXN0IHdvbid0DQo+IGJlIGFibGUgdG8gdGVsbCBtYWxpY2lvdXMgZnJvbSBidWdn
eSwgYnV0IHdoYXQgdG8gZG8gaW4gc3VjaCBhIGNhc2UNCj4gb3VnaHQgdG8gYmUgYSBndWVz
dCBwb2xpY3ksIG5vdCBiZWhhdmlvciBmb3JjZWQgdXBvbiBpdCBmcm9tIHRoZSBvdXRzaWRl
Lg0KDQpJdCBjb3VsZCAoYmFzZWQgb24gaXRzIHBvbGljeSkgZWl0aGVyIHJldm9rZSBvciBu
b3QuDQoNCj4gVGhlbiBhZ2FpbiBJIGd1ZXNzICJwYXNzIHNjcmF0Y2ggcGFnZSBwZXIgcmV2
b2tlIGNhbGwiIGlzIG1lYW50IHRvIGNvdmVyDQo+IHRoYXQgYWxyZWFkeSwgaS5lLiBsZWF2
aW5nIGl0IHRvIHRoZSBndWVzdCBob3cgdG8gYWN0dWFsbHkgZGVhbCB3aXRoIGENCj4gZmFp
bGVkIHJldm9rZS4NCg0KQ29ycmVjdC4NCg0KPiANCj4+Pj4+PiBKw7xyZ2VuOiB3ZSBzaG91
bGQgY29uc2lkZXIgaW50ZXJmYWNlIHRvIG1hcHBpbmcgbGFyZ2UgcGFnZXMgKCJtYXAgdGhp
cyBhcmVhIGFzIGEgbGFyZ2UgcGFnZSBpZiBiYWNrZW5kIHNoYXJlZCBpdCBhcyBsYXJnZSBw
YWdlIikNCj4+Pj4+DQo+Pj4+PiBzL2JhY2tlbmQvZnJvbnRlbmQvIEkgZ3Vlc3M/DQo+Pj4+
DQo+Pj4+IFllcy4NCj4+Pj4NCj4+Pj4gQnV0IGxhcmdlIHBhZ2VzIGhhdmUgYW5vdGhlciBk
b3duc2lkZTogVGhlIGJhY2tlbmQgbmVlZHMgdG8ga25vdyBpdCBpcyBhIGxhcmdlDQo+Pj4+
IHBhZ2UsIG90aGVyd2lzZSBpdCBtaWdodCBnZXQgY29uZnVzZWQuIFNvIHdoaWxlIHRoaXMg
c291bmRzIGxpa2UgYSBuaWNlIGlkZWEsIGl0DQo+Pj4+IGlzIGN1bWJlcnNvbWUgaW4gcHJh
Y3RpY2UuIEJ1dCBtYXliZSBzb21lb25lIGlzIGNvbWluZyB1cCB3aXRoIGEgbmljZSBpZGVh
IGhvdw0KPj4+PiB0byBzb2x2ZSB0aGF0Lg0KPj4+DQo+Pj4gQ291bGRuJ3QgdGhhdCBzaW1w
bHkgYmUgYSBuZXcgR1RGX3N1cGVycGFnZSBmbGFnLCB3aXRoIHRoZSBzaXplDQo+Pj4gZW5j
b2RlZCBhbG9uZyB0aGUgbGluZXMgb2YgQU1EIElPTU1VcyBlbmNvZGUgc3VwZXJwYWdlcyAo
c2V0dGluZyBhbGwNCj4+PiBidXQgdGhlIHRvcC1tb3N0IG9mIHRoZSBiaXRzIG5vdCB1c2Vk
IGZvciB0aGUgYWN0dWFsIGZyYW1lIGFkZHJlc3MpDQo+Pj4gaW4gdGhlIGFkZHJlc3MgcGFy
dCBvZiB0aGUgZW50cnk/DQo+Pg0KPj4gT2YgY291cnNlIHRoYXQgd291bGQgYmUgcG9zc2li
bGUsIGJ1dCB1c2luZyB0aGUgZmVhdHVyZSB3b3VsZCBiZSBsaW1pdGVkDQo+PiB0byBiYWNr
ZW5kcyBoYXZpbmcgYmVlbiBtb2RpZmllZCB0byB0ZXN0IHRoYXQgbmV3IGZsYWcuIEluIHRo
ZSBlbmQgYm90aA0KPj4gc2lkZXMgd291bGQgbmVlZCB0byBuZWdvdGlhdGUgdGhlIGZlYXR1
cmUgdXNhYmlsaXR5Lg0KPiANCj4gSXNuJ3QgaXQgdG8gYmUgZXhwZWN0ZWQgdGhhdCB0aGlz
IG1pZ2h0IG5lZWQgbmVnb3RpYXRpbmc/IFN0cmljdGx5IHNwZWFraW5nDQo+IGl0IG1pZ2h0
IG5vdCBuZWVkIHRvIGJlOiBUaGUgYmFja2VuZCdzIG1hcCByZXF1ZXN0IChmb3IgYSBzdWZm
aWNpZW50bHkNCj4gbGFyZ2UgbnVtYmVyIG9mIGdyYW50cyBhbGwgaW4gb25lIGdvKSBjb3Vs
ZCBiZSBjaGVja2VkIGZvciBiZWluZyBhbGwNCj4gY29udGlndW91cyBpbiB0aGUgYXBwbGlj
YWJseSBhZGRyZXNzIHNwYWNlcy4gVGhhdCB3b3VsZG4ndCByZXF1aXJlIHRoZQ0KPiBmcm9u
dGVuZCB0byBhZHZlcnRpc2UgYW55dGhpbmcuIEJ1dCBhbiB1bmF3YXJlIGZyb250ZW5kIHdv
dWxkbid0IGJlIHZlcnkNCj4gbGlrZWx5IHRvIHByb2R1Y2Ugc3VpdGFibGUgSS9PIHJlcXVl
c3RzIGluIHRoZSBmaXJzdCBwbGFjZSwgSSBzdXNwZWN0Lg0KDQpZZXMuIEFuZCBhbiB1bmF3
YXJlIGJhY2tlbmQgd291bGRuJ3QgYmUgdmVyeSBsaWtlbHkgdG8gbWFwIDUxMiBncmFudHMg
aW4gb25lDQpnbyBmb3IgbWFraW5nIHVzZSBvZiB0aGUgbGFyZ2UgcGFnZSB3aXRob3V0IGlu
dGVuZGluZyB0byBkbyBzby4NCg0KDQpKdWVyZ2VuDQo=
--------------xXUDwe8VtxLeQeHayrFAxqWy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------xXUDwe8VtxLeQeHayrFAxqWy--

--------------2OZ4U2IU8w4SOcz0oWBVCssH--

--------------4hkbPGnoFs54dmpMRE6LXgbW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMxbqUFAwAAAAAACgkQsN6d1ii/Ey8z
ZggAi1zw/GYL/zxVLqDcdWKtfGnxJ7aaFVYKhiJiFbj63gALtCiVrRrHCiybB8XsPZypNSvmggup
4a5B1sxHNVTt7NTHb1ccvlnzgs67AMSGIAgGEZxR/NjLgohHpbtpX5mm/Bq8td1ANtt0OBjTolVV
b4Ld2+Surxi7VR5fwLVyvkwyAv/gYjCZzuSAHmtM9N+RRSQfNB/R/tKeB1ncEUiDq/Ump7TEma+z
x86L/JzDdaZwZ3nI+N3UwcJ1fzhkyurzk3b8iK/wfoSNmmCpwPA26YuG0EfyhFz/WFdUuccv0ixv
4yudNIbJnLYqsKjkKY9yLXVvkDHjvMSYg6vaikILjw==
=5VUe
-----END PGP SIGNATURE-----

--------------4hkbPGnoFs54dmpMRE6LXgbW--

