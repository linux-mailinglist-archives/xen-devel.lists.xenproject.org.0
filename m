Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B637652D41B
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 15:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332984.556752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrgGh-00050n-Nv; Thu, 19 May 2022 13:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332984.556752; Thu, 19 May 2022 13:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrgGh-0004y2-KP; Thu, 19 May 2022 13:32:43 +0000
Received: by outflank-mailman (input) for mailman id 332984;
 Thu, 19 May 2022 13:32:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vBWN=V3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nrgGg-0004xu-9j
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 13:32:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27f0069b-d778-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 15:32:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC2D41FD43;
 Thu, 19 May 2022 13:32:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A238313AF8;
 Thu, 19 May 2022 13:32:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c+BCJvhGhmIYKwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 19 May 2022 13:32:40 +0000
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
X-Inumbo-ID: 27f0069b-d778-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652967160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1BbGET/6ToU1vbmwg/Y15gVpYaOfmLXmpSzSQWkmUxE=;
	b=FR6b2dOOMPM0wISijoqbZK6ONIpJ566l/AJfHd8VN/E3t9OSzsD0HJXAs955rlR/OEYGC0
	/Qy5Etvl6o4PVkJSg8ni4gvZeDFl5Ml8pODVhOiZUNie09UBdLPXLHl/RBGhfYu1Ocr7fj
	4B6hLHU2bXkNMDKHJol8MO1rQIn+f6s=
Message-ID: <9b3c46f8-737b-b145-4abf-a08b34d4e932@suse.com>
Date: Thu, 19 May 2022 15:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] tools/libs/ctrl: add and export xc_memory_op
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <5c72f793978997970888254a9050e97b34cbb3c7.1652966447.git.tamas.lengyel@intel.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <5c72f793978997970888254a9050e97b34cbb3c7.1652966447.git.tamas.lengyel@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8bTg0scaOKBxD10tWCdeDa8L"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8bTg0scaOKBxD10tWCdeDa8L
Content-Type: multipart/mixed; boundary="------------4Mqp7auokwklZQvbey7xdyIl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9b3c46f8-737b-b145-4abf-a08b34d4e932@suse.com>
Subject: Re: [PATCH] tools/libs/ctrl: add and export xc_memory_op
References: <5c72f793978997970888254a9050e97b34cbb3c7.1652966447.git.tamas.lengyel@intel.com>
In-Reply-To: <5c72f793978997970888254a9050e97b34cbb3c7.1652966447.git.tamas.lengyel@intel.com>

--------------4Mqp7auokwklZQvbey7xdyIl
Content-Type: multipart/mixed; boundary="------------C0Rb8uTJH4l5JfFCZG3j0Mak"

--------------C0Rb8uTJH4l5JfFCZG3j0Mak
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDUuMjIgMTU6MjcsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gQWRkIGFuZCBl
eHBvcnQgeGNfbWVtb3J5X29wIHNvIHRoYXQgZG9fbWVtb3J5X29wIGNhbiBiZSB1c2VkIGJ5
IHRvb2xzIGxpbmtpbmcNCj4gd2l0aCBsaWJ4Yy4gVGhpcyBpcyBlZmZlY3RpdmVseSBpbiB0
aGUgc2FtZSBzcGlyaXQgYXMgdGhlIGV4aXN0aW5nIHhjX2RvbWN0bA0KPiBhbmQgeGNfc3lz
Y3RsIGZ1bmN0aW9ucywgd2hpY2ggYXJlIGFscmVhZHkgZXhwb3J0ZWQuDQo+IA0KPiBJbiB0
aGlzIHBhdGNoIHdlIG1vdmUgZG9fbWVtb3J5X29wIGludG8geGNfcHJpdmF0ZS5oIGFzIGEg
c3RhdGljIGlubGluZSBmdW5jdGlvbg0KPiBhbmQgY29udmVydCBpdHMgJ2NtZCcgaW5wdXQg
ZnJvbSBpbnQgdG8gdW5zaWduZWQgaW50IHRvIGFjY3VyYXRlbHkgcmVmbGVjdCB3aGF0DQo+
IHRoZSBoeXBlcnZpc29yIGV4cGVjdHMuIE5vIG90aGVyIGNoYW5nZXMgYXJlIG1hZGUgdG8g
dGhlIGZ1bmN0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0
YW1hcy5sZW5neWVsQGludGVsLmNvbT4NCj4gLS0tDQo+ICAgdG9vbHMvaW5jbHVkZS94ZW5j
dHJsLmggICAgICB8ICAxICsNCj4gICB0b29scy9saWJzL2N0cmwveGNfcHJpdmF0ZS5jIHwg
NjMgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgdG9vbHMvbGli
cy9jdHJsL3hjX3ByaXZhdGUuaCB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS94ZW5jdHJsLmggYi90
b29scy9pbmNsdWRlL3hlbmN0cmwuaA0KPiBpbmRleCA5NWJkNWVjYTY3Li40ODRlMzU0NDEy
IDEwMDY0NA0KPiAtLS0gYS90b29scy9pbmNsdWRlL3hlbmN0cmwuaA0KPiArKysgYi90b29s
cy9pbmNsdWRlL3hlbmN0cmwuaA0KPiBAQCAtMTU5Nyw2ICsxNTk3LDcgQEAgaW50IHhjX3Zt
dHJhY2Vfc2V0X29wdGlvbih4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3QgZG9taWQsDQo+
ICAgDQo+ICAgaW50IHhjX2RvbWN0bCh4Y19pbnRlcmZhY2UgKnhjaCwgc3RydWN0IHhlbl9k
b21jdGwgKmRvbWN0bCk7DQo+ICAgaW50IHhjX3N5c2N0bCh4Y19pbnRlcmZhY2UgKnhjaCwg
c3RydWN0IHhlbl9zeXNjdGwgKnN5c2N0bCk7DQo+ICtsb25nIHhjX21lbW9yeV9vcCh4Y19p
bnRlcmZhY2UgKnhjaCwgdW5zaWduZWQgaW50IGNtZCwgdm9pZCAqYXJnLCBzaXplX3QgbGVu
KTsNCj4gICANCj4gICBpbnQgeGNfdmVyc2lvbih4Y19pbnRlcmZhY2UgKnhjaCwgaW50IGNt
ZCwgdm9pZCAqYXJnKTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvY3RybC94
Y19wcml2YXRlLmMgYi90b29scy9saWJzL2N0cmwveGNfcHJpdmF0ZS5jDQo+IGluZGV4IGMw
NDIyNjYyZjAuLjZhMjQ3ZDJiMWYgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2xpYnMvY3RybC94
Y19wcml2YXRlLmMNCj4gKysrIGIvdG9vbHMvbGlicy9jdHJsL3hjX3ByaXZhdGUuYw0KPiBA
QCAtMzI2LDY0ICszMjYsNiBAQCBpbnQgeGNfZmx1c2hfbW11X3VwZGF0ZXMoeGNfaW50ZXJm
YWNlICp4Y2gsIHN0cnVjdCB4Y19tbXUgKm1tdSkNCj4gICAgICAgcmV0dXJuIGZsdXNoX21t
dV91cGRhdGVzKHhjaCwgbW11KTsNCj4gICB9DQo+ICAgDQo+IC1sb25nIGRvX21lbW9yeV9v
cCh4Y19pbnRlcmZhY2UgKnhjaCwgaW50IGNtZCwgdm9pZCAqYXJnLCBzaXplX3QgbGVuKQ0K
DQpXaHkgZG9uJ3QgeW91IGp1c3QgcmVuYW1lIHRoaXMgZnVuY3Rpb24gYW5kIG1vZGlmeSB0
aGUgdXNlcnMgdG8gdXNlIHRoZQ0KbmV3IG5hbWU/DQoNCg0KSnVlcmdlbg0K
--------------C0Rb8uTJH4l5JfFCZG3j0Mak
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------C0Rb8uTJH4l5JfFCZG3j0Mak--

--------------4Mqp7auokwklZQvbey7xdyIl--

--------------8bTg0scaOKBxD10tWCdeDa8L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKGRvgFAwAAAAAACgkQsN6d1ii/Ey+e
cAf/fbpegsi4c5GRrh4iSKd4WryDUckh8LA/Cxxa6E9ckE85mjBqePUChVCK9E6YDl/GLLag9xXH
crIVuVHacre0f7/3KATGPtasQG6MJloOsQG1dkAlPgXbl5XRIr7+wB+I7nkvhgZ5vvyHALFxj7OK
XCavr1MqoNa3is0urqMOx5EzdbH9peQ/bs72gUKbNev6RglXFPOxBfh2nyKGs0sHHhBDWmHamgex
TQ/AAwScN4mro25GIE3w6BifhVh8IyjH2k45mPeP9ceppcaNIAGnWtp3/7y1UBjN/o4Il2ogihaL
CpD+hkbYL3Kd0oZblIzx3jkDtmpiTmk/vcTFP3+EpA==
=f9Bt
-----END PGP SIGNATURE-----

--------------8bTg0scaOKBxD10tWCdeDa8L--

