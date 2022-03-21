Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C084E2125
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 08:19:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292764.497149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWCKN-000228-0r; Mon, 21 Mar 2022 07:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292764.497149; Mon, 21 Mar 2022 07:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWCKM-000206-U9; Mon, 21 Mar 2022 07:19:42 +0000
Received: by outflank-mailman (input) for mailman id 292764;
 Mon, 21 Mar 2022 07:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hCO=UA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nWCKL-0001zx-M0
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 07:19:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44dd6149-a8e7-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 08:19:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A4AD7210E4;
 Mon, 21 Mar 2022 07:19:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D380139FF;
 Mon, 21 Mar 2022 07:19:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hsA+GQonOGJCHAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 21 Mar 2022 07:19:38 +0000
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
X-Inumbo-ID: 44dd6149-a8e7-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647847178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l4PMcKDvfkYHMlFhrt3HIe//FTWKPvfabPmb3lbkqy4=;
	b=aDkKg37a97TIzQnGLswtEw8Z0hqhhp2W2zH9OZNWNhZA4u/xk1fgH/8amrhu+wclc7PGLQ
	dnLcIMPezDd+rG/di3NI/8/oY3NwO3iAvK61X0bzc9G5eHfn7bLE0IoDMX5Sfmgzq8cam0
	pPGVskkFUYblruRiVPXH6k2V0qSmUGw=
Message-ID: <2a2eefb4-8071-107b-ba03-5e70f31a477f@suse.com>
Date: Mon, 21 Mar 2022 08:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/3] tools/xenstore: add documentation for new
 set/get-feature commands
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220316161017.3579-1-jgross@suse.com>
 <20220316161017.3579-2-jgross@suse.com>
 <d44b8e44-4e7e-c395-da9c-916ec641a687@xen.org>
 <96c31b21-3f96-4f17-07d6-64c7186ce2dd@suse.com>
 <110ecc17-4d36-c5d1-675b-a4e072ea0ee0@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <110ecc17-4d36-c5d1-675b-a4e072ea0ee0@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bgzMAhXfOnxKHGtIOyFEDOHK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bgzMAhXfOnxKHGtIOyFEDOHK
Content-Type: multipart/mixed; boundary="------------O8N6Ta4iiQTHJ0J80cVMFHos";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <2a2eefb4-8071-107b-ba03-5e70f31a477f@suse.com>
Subject: Re: [PATCH 1/3] tools/xenstore: add documentation for new
 set/get-feature commands
References: <20220316161017.3579-1-jgross@suse.com>
 <20220316161017.3579-2-jgross@suse.com>
 <d44b8e44-4e7e-c395-da9c-916ec641a687@xen.org>
 <96c31b21-3f96-4f17-07d6-64c7186ce2dd@suse.com>
 <110ecc17-4d36-c5d1-675b-a4e072ea0ee0@xen.org>
In-Reply-To: <110ecc17-4d36-c5d1-675b-a4e072ea0ee0@xen.org>

--------------O8N6Ta4iiQTHJ0J80cVMFHos
Content-Type: multipart/mixed; boundary="------------osLV1oFDlD00QvkP0H9g09cb"

--------------osLV1oFDlD00QvkP0H9g09cb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDMuMjIgMTk6NDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE3LzAzLzIwMjIgMTE6MTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxNy4wMy4yMiAxMjowNywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IE9uIDE2LzAzLzIw
MjIgMTY6MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IEFkZCBkb2N1bWVudGF0aW9u
IGZvciB0d28gbmV3IFhlbnN0b3JlIHdpcmUgY29tbWFuZHMgU0VUX0ZFQVRVUkUgYW5kDQo+
Pj4+IEdFVF9GRUFUVVJFIHVzZWQgdG8gc2V0IG9yIHF1ZXJ5IHRoZSBYZW5zdG9yZSBmZWF0
dXJlcyB2aXNpYmxlIGluIHRoZQ0KPj4+PiByaW5nIHBhZ2Ugb2YgYSBnaXZlbiBkb21haW4u
DQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IMKgIGRvY3MvbWlzYy94ZW5zdG9yZS1yaW5nLnR4dCB8
wqAgMSArDQo+Pj4+IMKgIGRvY3MvbWlzYy94ZW5zdG9yZS50eHTCoMKgwqDCoMKgIHwgMTIg
KysrKysrKysrKysrDQo+Pj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbnN0b3JlLXJpbmcudHh0
IGIvZG9jcy9taXNjL3hlbnN0b3JlLXJpbmcudHh0DQo+Pj4+IGluZGV4IGY5MWFjY2I1YjAu
LmJkMDAwZjY5NGUgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RvY3MvbWlzYy94ZW5zdG9yZS1yaW5n
LnR4dA0KPj4+PiArKysgYi9kb2NzL21pc2MveGVuc3RvcmUtcmluZy50eHQNCj4+Pj4gQEAg
LTY4LDYgKzY4LDcgQEAgTWFza8KgwqDCoCBEZXNjcmlwdGlvbg0KPj4+DQo+Pj4gSSBmaW5k
IGEgYml0IG9kZCB3ZSBkZXNjcmliZSB0aGUgZmVhdHVyZSBpbiB0ZXJtIG9mIG1hc2sgcmF0
aGVyIGJpdC4gVGhpcyANCj4+PiB3aWxsIGdldCBtb3JlIGRpZmZpY3VsdCB0byByZWFkIGFz
IHdlIGFkZCBtb3JlIGJpdHMuDQo+Pg0KPj4gTWF5YmUgdGhpcyBpcyBpbiBvcmRlciB0byBh
dm9pZCBiaWcvbGl0dGxlIGVuZGlhbiBpc3N1ZXMgKHdoaWNoIGJpdCBpcw0KPj4gYml0IDA/
KQ0KPiANCj4gQm90aCBlbmQgaGF2ZSB0byB0YWxrIHRoZSBzYW1lIGVuZGlhbmVzcy4gT3Ro
ZXJ3aXNlLCBvbmUgbWF5IHJlYWQgdGhlIHdyb25nIHZhbHVlLg0KPiANCj4gU28gbG9uZyB0
aGV5IGFyZSB1c2luZyB0aGUgc2FtZSBlbmRpYW5lc3MsIGJpdCAwIGlzIG5vdCBnb2luZyB0
byBiZSBtYXR0ZXIuDQo+IA0KPj4+PiDCoCBUaGUgIkNvbm5lY3Rpb24gc3RhdGUiIGZpZWxk
IGlzIHVzZWQgdG8gcmVxdWVzdCBhIHJpbmcgY2xvc2UgYW5kIHJlY29ubmVjdC4NCj4+Pj4g
wqAgVGhlICJDb25uZWN0aW9uIHN0YXRlIiBmaWVsZCBvbmx5IGNvbnRhaW5zIHZhbGlkIGRh
dGEgaWYgdGhlIHNlcnZlciBoYXMNCj4+Pj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW5z
dG9yZS50eHQgYi9kb2NzL21pc2MveGVuc3RvcmUudHh0DQo+Pj4+IGluZGV4IGVhM2Q4YmUx
NzcuLjMxZTNkNTNjNTIgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RvY3MvbWlzYy94ZW5zdG9yZS50
eHQNCj4+Pj4gKysrIGIvZG9jcy9taXNjL3hlbnN0b3JlLnR4dA0KPj4+PiBAQCAtMzMyLDYg
KzMzMiwxOCBAQCBTRVRfVEFSR0VUwqDCoMKgwqDCoMKgwqAgPGRvbWlkPnw8dGRvbWlkPnwN
Cj4+Pj4gwqDCoMKgwqDCoCB4ZW5zdG9yZWQgcHJldmVudHMgdGhlIHVzZSBvZiBTRVRfVEFS
R0VUIG90aGVyIHRoYW4gYnkgZG9tMC4NCj4+Pj4gK0dFVF9GRUFUVVJFwqDCoMKgwqDCoMKg
wqAgPGRvbWlkPnzCoMKgwqDCoMKgwqDCoCA8dmFsdWU+fA0KPj4+DQo+Pj4gRGlkIHlvdSBp
bmRlbnRlZCB0byBhZGQgbWFueSBzcGFjZXMgYmVmb3JlIDx2YWx1ZT4/DQo+Pj4NCj4+Pj4g
K1NFVF9GRUFUVVJFwqDCoMKgwqDCoMKgwqAgPGRvbWlkPnw8dmFsdWU+fA0KPj4+PiArwqDC
oMKgIFJldHVybnMgb3Igc2V0cyB0aGUgY29udGVudHMgb2YgdGhlICJmZWF0dXJlIiBmaWVs
ZCBsb2NhdGVkIGF0DQo+Pj4+ICvCoMKgwqAgb2Zmc2V0IDIwNjQgb2YgdGhlIFhlbnN0b3Jl
IHJpbmcgcGFnZSBvZiB0aGUgZG9tYWluIHNwZWNpZmllZCBieQ0KPj4+PiArwqDCoMKgIDxk
b21pZD4uIDx2YWx1ZT4gaXMgYSBkZWNpbWFsIG51bWJlciBiZWluZyBhIGxvZ2ljYWwgb3Ig
b2YgdGhlDQo+Pj4+ICvCoMKgwqAgZmVhdHVyZSBiaXRzIGFzIGRlZmluZWQgaW4gZG9jcy9t
aXNjL3hlbnN0b3JlLXJpbmcudHh0LiBUcnlpbmcNCj4+Pj4gK8KgwqDCoCB0byBzZXQgYSBi
aXQgZm9yIGEgZmVhdHVyZSBub3QgYmVpbmcgc3VwcG9ydGVkIGJ5IHRoZSBydW5uaW5nDQo+
Pj4+ICvCoMKgwqAgWGVuc3RvcmUgd2lsbCBiZSBkZW5pZWQuDQo+Pj4gSG93IHdpbGwgdGhl
IGNhbGxlciBrbm93IHdoaWNoIGZlYXR1cmUgaXMgc3VwcG9ydGVkPyBBbHNvLCB3aGF0IGhh
cHBlbiBpZiBhIA0KPj4+IGNsaWVudCBkZWNpZGVkIHRvIG92ZXJ3cml0ZSAnZmVhdHVyZSc/
IENvdWxkIHRoZSByZXN1bHQgcG90ZW50aWFsbHkgcHJldmVudCANCj4+PiBtaWdyYXRpb24v
bGl2ZXVwZGF0ZSBvciBlbHNlPw0KPj4NCj4+IFRoZSBjYWxsZXIgY291bGQgdXNlICJHRVRf
RkVBVFVSRSAwIiB0byBzZWUgdGhlIGF2YWlsYWJsZSBmZWF0dXJlcywgYXNzdW1pbmcNCj4+
IHRoYXQgbm9ib2R5IHdvdWxkIGhhdmUgY2hhbmdlZCBkb20wJ3MgZmVhdHVyZXMuDQo+Pg0K
Pj4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgd2Ugc2hvdWxkIHByZXZlbnQgZG9tMCdzIGZlYXR1
cmVzIHRvIGJlIG92ZXJ3cml0dGVuLg0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0
ZXIgdG8gaGF2ZSBhIHNlcGFyYXRlICJkb21pZCIgKG1heWJlICJzZXJ2ZXIiIG9yIA0KPiAi
Z2xvYmFsIikgdG8gcmV0cmlldmUgZmVhdHVyZXMgc3VwcG9ydGVkIGJ5IHRoZSBzZXJ2ZXIu
DQo+IA0KPiBUaGlzIHdvdWxkIGdpdmUgdXMgc29tZSBmbGV4aWJpbGl0eSB0byB1cGRhdGUg
ZG9tMCBmZWF0dXJlcyBpbiB0aGUgZnV0dXJlIGlmIHRoZSANCj4gbmVlZHMgYXJpc2UgKHRo
ZSBmaXJzdCBpbXBsZW1lbnRhdGlvbiBtYXkgZm9yYmlkIGl0KS4NCg0KRmluZSB3aXRoIG1l
Lg0KDQoNCkp1ZXJnZW4NCg==
--------------osLV1oFDlD00QvkP0H9g09cb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------osLV1oFDlD00QvkP0H9g09cb--

--------------O8N6Ta4iiQTHJ0J80cVMFHos--

--------------bgzMAhXfOnxKHGtIOyFEDOHK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmI4JwkFAwAAAAAACgkQsN6d1ii/Ey+a
vgf+NsBl66//CZe/yi02T4vw6ZYn/bLdipZRw8VJ2K5v3mzd05Ixe9LIZ/bEy8CD3sS34lp3OF93
DaTp66LAseNcpU9wA1oxLxD5x4od5E1FWK2RaJe4lX8e3V/5sifkelOX4pKmI0sCNuuKjShn26Yk
Sr2YNTfabj1gxWbizXpXL7yYVqfb4HOe6MGJ15PyOxhEKhGYuK0vNBdAyR5X8yvdisA3AoRwtJE2
INwyyuMmnFzUtq6tezEmiABkU41sPehU3vsPDy1z2VgsOyRoagNtXYpG+k8yhRGuycgwO992Jw4z
gCSweO04uyHA+mb2X9z1jh8Y5DS3dqqQvcWHeswcSg==
=hgCZ
-----END PGP SIGNATURE-----

--------------bgzMAhXfOnxKHGtIOyFEDOHK--

