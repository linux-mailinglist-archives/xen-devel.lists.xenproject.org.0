Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C74C4F83B7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 17:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300923.513449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncUFi-0004Zt-0B; Thu, 07 Apr 2022 15:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300923.513449; Thu, 07 Apr 2022 15:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncUFh-0004Y4-SX; Thu, 07 Apr 2022 15:40:53 +0000
Received: by outflank-mailman (input) for mailman id 300923;
 Thu, 07 Apr 2022 15:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mzit=UR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ncUFf-0004Xu-Qr
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 15:40:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a06e212-b689-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 17:40:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3C7A121601;
 Thu,  7 Apr 2022 15:40:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D2D213A66;
 Thu,  7 Apr 2022 15:40:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C2GcBQIGT2JndgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Apr 2022 15:40:50 +0000
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
X-Inumbo-ID: 1a06e212-b689-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649346050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WmMQRF8GDKs+n1pSDhCsYjhWRKXUz2BWsXbXtBibKGQ=;
	b=ikgdq04eNa4HSQOVMGByLkHUdtTUzTvVVnRJ3XOO4CVEzXF4H/Pet4IRaYYZVaRIZbbnA5
	LQ6z7yeKkcKIsDOHZtlsthlJbC27E/FJi7FsnbcJXVRIhppmDxeqJnoQx/XilR7u/A9Qmy
	KBxYRy6ddQZNMULViCHQg9RDHRZ8/HY=
Message-ID: <3699fe77-68cc-d6f0-8614-182f90741531@suse.com>
Date: Thu, 7 Apr 2022 17:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20220331070755.10894-1-jgross@suse.com>
 <Yk74172+jHIn4PJW@perard.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/libs/light: update xenstore entry when setting max
 domain memory
In-Reply-To: <Yk74172+jHIn4PJW@perard.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bn0oLX7TcYRT1h0Sb2oC8mtb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bn0oLX7TcYRT1h0Sb2oC8mtb
Content-Type: multipart/mixed; boundary="------------D8Vm4tA0Dt01EkUZzsRtc2Am";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <3699fe77-68cc-d6f0-8614-182f90741531@suse.com>
Subject: Re: [PATCH] tools/libs/light: update xenstore entry when setting max
 domain memory
References: <20220331070755.10894-1-jgross@suse.com>
 <Yk74172+jHIn4PJW@perard.uk.xensource.com>
In-Reply-To: <Yk74172+jHIn4PJW@perard.uk.xensource.com>

--------------D8Vm4tA0Dt01EkUZzsRtc2Am
Content-Type: multipart/mixed; boundary="------------0vLbkL00ggIurmhGBdhL06RV"

--------------0vLbkL00ggIurmhGBdhL06RV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDQuMjIgMTY6NDQsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAzMSwgMjAyMiBhdCAwOTowNzo1NUFNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gbGlieGxfZG9tYWluX3NldG1heG1lbSgpIHNob3VsZCB1cGRhdGUgdGhlIGRvbWFpbidz
IG1lbW9yeS9zdGF0aWMtbWF4DQo+PiBYZW5zdG9yZSBub2RlLCBhcyBvdGhlcndpc2UgInhs
IG1lbS1zZXQiIHdvbid0IGJlIGFibGUgdG8gc2V0IHRoZQ0KPj4gbWVtb3J5IHNpemUgdG8g
dGhlIG5ldyBtYXhpbXVtLg0KPiANCj4gYHhsIG1lbS1zZXRgIGRvZXNuJ3QgY2FsbCBsaWJ4
bF9kb21haW5fc2V0bWF4bWVtKCksIGJ1dCBjYWxscw0KPiBsaWJ4bF9zZXRfbWVtb3J5X3Rh
cmdldCgpLg0KDQpDb3JyZWN0LiBBbmQgaXQgcmVmdXNlcyB0byBkbyBzbyB3aGVuIG1lbW9y
eS9zdGF0aWMtbWF4IGlzIGJlbG93IHRoZQ0KbmV3IG1lbW9yeSBzaXplIHRvIGJlIHNldC4N
Cg0KPiANCj4gT3IgbWF5YmUgeW91IGFyZSBzcGVha2luZyBhYm91dCBgeGwgbWVtLW1heGAg
Zm9sbG93ZWQgYnkgYHhsIG1lbS1zZXRgPw0KPiBJbiB0aGlzIGNhc2UsIGl0IGlzIGRvY3Vt
ZW50ZWQgaW4gYG1hbiAxIHhsYCB0aGF0IGBtZW0tbWF4YCBoYXMgbm8NCj4gZWZmZWN0IHRv
IGBtZW0tc2V0YC4NCg0KV2hlbiBoYXZpbmcgZS5nLiBhIGRvbWFpbiB3aXRoIDFHIG9mIG1h
eG1lbSwgdGhlbiBjYWxsaW5nDQoNCnhsIG1lbS1tYXggPGRvbWFpbj4gMjA0OA0KDQppdCBz
aG91bGQgYmUgcG9zc2libGUgdG8gdGhlbiBkbw0KDQp4bCBtZW0tc2V0IDxkb21haW4+IDIw
NDgNCg0KYnV0IHRoaXMgaXNuJ3QgcG9zc2libGUsIGFzIHhsIG1lbS1zZXQgd2lsbCBsb29r
IGF0IHRoZSBtZW1vcnkvc3RhdGljLW1heA0Kbm9kZSBvZiB0aGUgZG9tYWluIGFuZCByZWZ1
c2UgdG8gZG8gdGhlIHNldHRpbmcgaWYgaXQgaGFzIGEgdG9vIGxvdw0KdmFsdWUsIHdoaWNo
IGlzIHRoZSBjYXNlIHRvZGF5Lg0KDQo+IA0KPiBxdW90ZSBmcm9tIG1hbiwgYWJvdXQgYHhs
IG1lbS1tYXhgOg0KPiAgICAgIEl0IGlzIGFsbG93ZWQgdG8gYmUgaGlnaGVyIHRoYW4gdGhl
IGNvbmZpZ3VyZWQgbWF4aW11bQ0KPiAgICAgIG1lbW9yeSBzaXplIG9mIHRoZSBkb21haW4g
KEI8bWF4bWVtPiBwYXJhbWV0ZXIgaW4gdGhlIGRvbWFpbidzDQo+ICAgICAgY29uZmlndXJh
dGlvbikuIE5vdGUgaG93ZXZlciB0aGF0IHRoZSBpbml0aWFsIEI8bWF4bWVtPiB2YWx1ZSBp
cyBzdGlsbA0KPiAgICAgIHVzZWQgYXMgYW4gdXBwZXIgbGltaXQgZm9yIEI8eGwgbWVtLXNl
dD4uICBBbHNvIG5vdGUgdGhhdCBjYWxsaW5nIEI8eGwNCj4gICAgICBtZW0tc2V0PiB3aWxs
IHJlc2V0IHRoaXMgdmFsdWUuDQoNCk9oLCB0aGlzIHNob3VsZCB0aGVuIGJlIGFkYXB0ZWQu
IFRvZGF5IGhvdHBsdWdnaW5nIG1lbW9yeSBpcyBqdXN0DQphIG1lc3MgYXMgeW91IG5lZWQg
dG86DQoNCnhsIG1lbS1tYXggPGRvbWlkPiA8dmFsdWU+DQp4ZW5zdG9yZS13cml0ZSAvbG9j
YWwvZG9tYWluLzxkb21pZD4vbWVtb3J5L3N0YXRpYy1tYXggJCgoPHZhbHVlPiAqIDEwMjQp
KQ0KeGwgbWVtLXNldCA8ZG9taWQ+IDx2YWx1ZT4NCg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gICB0b29scy9s
aWJzL2xpZ2h0L2xpYnhsX21lbS5jIHwgOSArKysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xp
Z2h0L2xpYnhsX21lbS5jIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9tZW0uYw0KPj4gaW5k
ZXggYzczOWQwMGYzOS4uMmY0ZjlkNGE0YSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xpYnMv
bGlnaHQvbGlieGxfbWVtLmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfbWVt
LmMNCj4+IEBAIC04Miw2ICs4MiwxNSBAQCBpbnQgbGlieGxfZG9tYWluX3NldG1heG1lbShs
aWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsIHVpbnQ2NF90IG1heF9tZW1rYikNCj4g
DQo+IFRoZXJlJ3MgYSBjb21tZW50IG9uIHRoaXMgZnVuY3Rpb25zOg0KPiAgICAgIC8qDQo+
ICAgICAgICogU2V0IHRoZSBtYXhpbXVtIG1lbW9yeSBzaXplIG9mIHRoZSBkb21haW4gaW4g
dGhlIGh5cGVydmlzb3IuIFRoZXJlIGlzIG5vDQo+ICAgICAgICogY2hhbmdlIG9mIHRoZSBj
dXJyZW50IG1lbW9yeSBzaXplIGludm9sdmVkLiBUaGUgc3BlY2lmaWVkIG1lbW9yeSBzaXpl
IGNhbg0KPiAgICAgICAqIGV2ZW4gYmUgYWJvdmUgdGhlIGNvbmZpZ3VyZWQgbWF4bWVtIHNp
emUgb2YgdGhlIGRvbWFpbiwgYnV0IHRoZSByZWxhdGVkDQo+ICAgICAgICogWGVuc3RvcmUg
ZW50cnkgbWVtb3J5L3N0YXRpYy1tYXggaXNuJ3QgbW9kaWZpZWQhDQo+ICAgICAgICovDQo+
ICAgICAgaW50IGxpYnhsX2RvbWFpbl9zZXRtYXhtZW0obGlieGxfY3R4ICpjdHgsIHVpbnQz
Ml90IGRvbWlkLCB1aW50NjRfdCBtYXhfbWVta2IpDQo+IA0KPiBTbyBpdCB3YXMgYWxyZWFk
eSBrbm93biB0aGF0ICJzdGF0aWMtbWF4IiB3YXNuJ3Qgc2V0Lg0KPiBBdCB0aGUgdmVyeSBs
ZWFzdCwgdGhpcyBjb21tZW50IG5lZWRzIHVwZGF0aW5nLg0KDQpZZXMuDQoNCj4gDQo+PiAg
ICAgICAgICAgZ290byBvdXQ7DQo+PiAgICAgICB9DQo+PiAgIA0KPj4gKyAgICByYyA9IGxp
YnhsX194c19wcmludGYoZ2MsIFhCVF9OVUxMLA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgR0NTUFJJTlRGKCIlcy9tZW1vcnkvc3RhdGljLW1heCIsIGRvbXBhdGgpLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIiUiUFJJdTY0LCBtYXhfbWVta2IpOw0KPj4g
KyAgICBpZiAocmMgIT0gMCkgew0KPj4gKyAgICAgICAgTE9HRUQoRVJST1IsIGRvbWlkLCAi
Q291bGRuJ3Qgc2V0ICVzL21lbW9yeS9zdGF0aWMtbWF4LCByYz0lZFxuIiwNCj4+ICsgICAg
ICAgICAgICAgIGRvbXBhdGgsIHJjKTsNCj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPiANCj4g
DQo+IA0KPiBTbywgSSBkb24ndCBrbm93IHdoZXRoZXIgaW5jcmVhc2luZyAic3RhdGljLW1h
eCIgaXMgZmluZSBvciBub3QsIGJ1dA0KPiBhY2NvcmRpbmcgdG8gdGhlIGRvY3VtZW50YXRp
b24sIGl0IGlzbid0IGV4cGVjdGVkLg0KPiANCj4gSXMgYSBndWVzdCBmaW5lIHdpdGggInN0
YXRpYy1tYXgiIGJlZW4gY2hhbmdlZD8NCg0KTm9ybWFsbHkgaXQgZG9lc24ndCBjYXJlIGF0
IGFsbC4NCg0KPiANCj4gSWYgeWVzLCB0aGVyZSdzIGRvY3VtZW50YXRpb24gYW5kIGNvbW1l
bnRzIHRoYXQgbmVlZHMgdG8gY2hhbmdlIHdpdGggdGhlDQo+IGNvZGUgY2hhbmdlLg0KDQpJ
IGFncmVlLiBXaWxsIGRvIHNvLg0KDQoNCkp1ZXJnZW4NCg==
--------------0vLbkL00ggIurmhGBdhL06RV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0vLbkL00ggIurmhGBdhL06RV--

--------------D8Vm4tA0Dt01EkUZzsRtc2Am--

--------------bn0oLX7TcYRT1h0Sb2oC8mtb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJPBgEFAwAAAAAACgkQsN6d1ii/Ey+Z
qwf7B848NKg7K1WnD1HRRZD62Qn3BJ6dz8UU3K0LA+D3ofrZeiaGp2haCZJjuvH/XjVSewI6pDkM
ejOJAULb+Oldtm4lkJEj3jZ693etBKEN75MtxIoyrQmfpC4t1K2VhXhm2zVoKkEQHYrWy27NXIuD
w7AIZjHpSM4yNI3jKXCixIxbBdzDtvt2ZhXj14+OwowifiLaUlAvjR6yM//MbpH1RJ4D8F7LuqMA
cbR3CBHNWL7qzV+bFAz8zsSxU+gQOWD5/D1xxYobyFBWYCsTFuMMpnsq17LtVv2IdxyP+2fho0WS
t+ekevYN2Tt0bDLSx2JRHa7/7C2RZbUfjRE+3ZF2aA==
=+V5w
-----END PGP SIGNATURE-----

--------------bn0oLX7TcYRT1h0Sb2oC8mtb--

