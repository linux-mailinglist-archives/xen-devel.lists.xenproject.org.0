Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F8F554CC1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353943.580951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Ex-0001CY-Uc; Wed, 22 Jun 2022 14:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353943.580951; Wed, 22 Jun 2022 14:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Ex-0001AP-RY; Wed, 22 Jun 2022 14:21:55 +0000
Received: by outflank-mailman (input) for mailman id 353943;
 Wed, 22 Jun 2022 14:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o41Ew-0001AJ-SF
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:21:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a946afe0-f236-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 16:21:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C05621BF7;
 Wed, 22 Jun 2022 14:21:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C2AE13A5D;
 Wed, 22 Jun 2022 14:21:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hecZAYAls2I+UgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Jun 2022 14:21:52 +0000
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
X-Inumbo-ID: a946afe0-f236-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655907712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JWlsSBMic3KME3oUinrGm+qKceRjrlz1lkQJva2Hp14=;
	b=N5GTwz/lgLt4+jCRt+Lpx/a0PZbZPCQDUvOcnWBC84a3B54hN1NFyMnvzHiekEh96etubR
	FnHeyajPLlKkUkdXBslfAdZoku7nJZk04wdiNLzZ73c2MH2+1hc8M0kbyV0uzHVh3OjKGC
	OgZB1MbwW432YHBemYTv/CJ/h+SW4dk=
Message-ID: <fae2ea1b-a74c-a285-fa8b-def6b27f0809@suse.com>
Date: Wed, 22 Jun 2022 16:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <d465abfb-6d44-0739-9959-3e3311dd671c@suse.com>
 <e32a84bf-ad49-da95-4a19-61872c2ff7e0@xen.org>
 <bc8899d7-0300-8640-57d9-52c2a1bf599c@suse.com>
 <a9566b42-2360-4d3f-5272-8f69368d50f2@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Tentative fix for dom0 boot problem
In-Reply-To: <a9566b42-2360-4d3f-5272-8f69368d50f2@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mqZ7jjNFnoN7juOnYB9eBcKo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mqZ7jjNFnoN7juOnYB9eBcKo
Content-Type: multipart/mixed; boundary="------------Jiabdt1bIloXCiW6RjD85VAZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fae2ea1b-a74c-a285-fa8b-def6b27f0809@suse.com>
Subject: Re: Tentative fix for dom0 boot problem
References: <d465abfb-6d44-0739-9959-3e3311dd671c@suse.com>
 <e32a84bf-ad49-da95-4a19-61872c2ff7e0@xen.org>
 <bc8899d7-0300-8640-57d9-52c2a1bf599c@suse.com>
 <a9566b42-2360-4d3f-5272-8f69368d50f2@xen.org>
In-Reply-To: <a9566b42-2360-4d3f-5272-8f69368d50f2@xen.org>

--------------Jiabdt1bIloXCiW6RjD85VAZ
Content-Type: multipart/mixed; boundary="------------8Yk0kMtIoLifE0XL9448wgDY"

--------------8Yk0kMtIoLifE0XL9448wgDY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDYuMjIgMTU6MjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDIyLzA2LzIwMjIgMTM6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyMi4wNi4yMiAxMjo1MCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+DQo+Pj4NCj4+PiBP
biAyMi8wNi8yMDIyIDExOjQ1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+PiBKdWxpZW4s
DQo+Pj4NCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+Pj4+IGNvdWxkIHlvdSBwbGVhc2UgdGVz
dCB0aGUgYXR0YWNoZWQgcGF0Y2hlcz8NCj4+Pg0KPj4+IEkgYW0gZ2V0dGluZyB0aGUgZm9s
bG93aW5nIGVycm9yOg0KPj4+DQo+Pj4gKFhFTikgZDB2MCBVbmhhbmRsZWQ6IHZlYyAxNCwg
I1BGWzAwMDNdDQo+Pj4gKFhFTikgUGFnZXRhYmxlIHdhbGsgZnJvbSBmZmZmZmZmZjg0MDAx
MDAwOg0KPj4+IChYRU4pwqAgTDRbMHgxZmZdID0gMDAwMDAwMDQ2YzAwNDA2NyAwMDAwMDAw
MDAwMDA0MDA0DQo+Pj4gKFhFTinCoCBMM1sweDFmZV0gPSAwMDAwMDAwNDZjMDAzMDY3IDAw
MDAwMDAwMDAwMDQwMDMNCj4+PiAoWEVOKcKgIEwyWzB4MDIwXSA9IDAwMDAwMDA0NmMwMjQw
NjcgMDAwMDAwMDAwMDAwNDAyNA0KPj4+IChYRU4pwqAgTDFbMHgwMDFdID0gMDAxMDAwMDQ2
YzAwMTAyNSAwMDAwMDAwMDAwMDA0MDAxDQo+Pg0KPj4gSG1tLCBmcm9tIHRoaXMgZGF0YSBJ
IGd1ZXNzIHRoaXMgd2FzIGEgd3JpdGUgdG8gYSBwYWdlIHRhYmxlLg0KPj4NCj4+PiAoWEVO
KSBkb21haW5fY3Jhc2hfc3luYyBjYWxsZWQgZnJvbSBlbnRyeS5TOiBmYXVsdCBhdCBmZmZm
ODJkMDQwMzI1OTA2IA0KPj4+IHg4Nl82NC9lbnRyeS5TI2NyZWF0ZV9ib3VuY2VfZnJhbWUr
MHgxNWQvMHgxNzcNCj4+PiAoWEVOKSBEb21haW4gMCAodmNwdSMwKSBjcmFzaGVkIG9uIGNw
dSMxOg0KPj4+IChYRU4pIC0tLS1bIFhlbi00LjE3LXVuc3RhYmxlwqAgeDg2XzY0wqAgZGVi
dWc9ecKgIFRhaW50ZWQ6wqDCoCBDwqDCoMKgIF0tLS0tDQo+Pj4gKFhFTikgQ1BVOsKgwqDC
oCAxDQo+Pj4gKFhFTikgUklQOsKgwqDCoCBlMDMzOls8ZmZmZmZmZmY4MzJhMzQ4MT5dDQo+
Pg0KPj4gQ2FuIHlvdSBwbGVhc2UgZmluZCBvdXQgdGhlIGFzc29jaWF0ZWQgc3RhdGVtZW50
Pw0KPiANCj4gYXJjaC94ODYva2VybmVsL2hlYWQ2NC5jOjQzMw0KPiANCj4gVGhpcyBpcyB0
aGUgbWVtc2V0KCkgZm9yIF9fYnJrX2Jhc2UuDQoNClZlcnkgd2VpcmQuDQoNCkluIHRoZSBr
ZXJuZWwncyBsaW5rZXIgc2NyaXB0IHdlIGhhdmU6DQoNCiAgICAgICAgIF9fZW5kX29mX2tl
cm5lbF9yZXNlcnZlID0gLjsNCg0KICAgICAgICAgLiA9IEFMSUdOKFBBR0VfU0laRSk7DQog
ICAgICAgICAuYnJrIChOT0xPQUQpIDogQVQoQUREUiguYnJrKSAtIExPQURfT0ZGU0VUKSB7
DQogICAgICAgICAgICAgICAgIF9fYnJrX2Jhc2UgPSAuOw0KICAgICAgICAgICAgICAgICAu
ICs9IDY0ICogMTAyNDsgICAgICAgICAvKiA2NGsgYWxpZ25tZW50IHNsb3Agc3BhY2UgKi8N
CiAgICAgICAgICAgICAgICAgKiguYnNzLi5icmspICAgICAgICAgICAgLyogYXJlYXMgYnJr
IHVzZXJzIGhhdmUgcmVzZXJ2ZWQgKi8NCiAgICAgICAgICAgICAgICAgX19icmtfbGltaXQg
PSAuOw0KICAgICAgICAgfQ0KDQogICAgICAgICAuID0gQUxJR04oUEFHRV9TSVpFKTsgICAg
ICAgICAgIC8qIGtlZXAgVk9fSU5JVF9TSVpFIHBhZ2UgYWxpZ25lZCAqLw0KICAgICAgICAg
X2VuZCA9IC47DQoNClNvIHRoZSBhcmVhIHRvIGJlIHplcm9lZCBzaG91bGQgYmUgbGFyZ2Vy
IHRoYW4gNjRrLg0KDQo+IA0KPj4NCj4+PiAoWEVOKSBSRkxBR1M6IDAwMDAwMDAwMDAwMDAy
MDbCoMKgIEVNOiAxwqDCoCBDT05URVhUOiBwdiBndWVzdCAoZDB2MCkNCj4+PiAoWEVOKSBy
YXg6IDAwMDAwMDAwMDAwMDAwMDDCoMKgIHJieDogZmZmZmZmZmY4NDAwMDAwMMKgwqAgcmN4
OiAwMDAwMDAwMDAwMDJiMDAwDQo+Pj4gKFhFTikgcmR4OiBmZmZmZmZmZjg0MDAwMDAwwqDC
oCByc2k6IGZmZmZmZmZmODQwMDAwMDDCoMKgIHJkaTogZmZmZmZmZmY4NDAwMTAwMA0KDQpK
dXN0IGd1ZXNzaW5nIEknZCBzYXkgdGhhdCBtZW1zZXQgc3RhcnRlZCBhdCBmZmZmZmZmZjg0
MDAwMDAwIGFuZCB0aGVyZSBhcmUNCjJiMDAwIGJ5dGVzIGxlZnQgdG8gYmUgY2xlYXJlZC4g
QSBkaXNhc3NlbWJseSBvZiBjbGVhcl9ic3MoKSB3b3VsZCBoZWxwIGhlcmUuDQoNCkFueXdh
eSBpdCBzZWVtcyBhcyBpZiB0aGUgbWVtc2V0IHdvdWxkIHJ1biByaWdodCBpbnRvIHRoZSBp
bml0aWFsIHBhZ2UgdGFibGVzDQpzdXBwbGllZCBieSB0aGUgaHlwZXJ2aXNvci4NCg0KQ2Fu
IHlvdSBwbGVhc2UgcG9zdCB0aGUgaHlwZXJ2aXNvcidzIGNvbnNvbGUgbWVzc2FnZXMgcmVn
YXJkaW5nIGRvbTAgc2l6ZXMNCmFuZCBsb2NhdGlvbnM/DQoNCkNvdWxkIGl0IGJlIHRoYXQg
dGhlIGJyayBhcmVhIGlzIHRoZSBsYXN0IHNlY3Rpb24gcmVsZXZhbnQgZm9yIGxvYWRpbmcg
dGhlDQprZXJuZWw/IEluIGNvbnRyYXN0IHRvIHlvdXIgLmNvbmZpZywgSSBoYXZlIENPTkZJ
R19BTURfTUVNX0VOQ1JZUFQgZGVmaW5lZA0KYW5kIHRoaXMgYWRkcyB0aGUgLmluaXQuc2Ny
YXRjaCBzZWN0aW9uIGFmdGVyIHRoZSBicmsgYXJlYS4gTWF5YmUgdGhlDQpoeXBlcnZpc29y
IGlzIG5vdCBhZGp1c3RpbmcgdGhlIHBhZ2UgdGFibGUgbG9jYXRpb24gY29ycmVjdGx5IGR1
ZSB0byB0aGUNCk5PTE9BRCBhdHRyaWJ1dGUgb2YgYnJrPw0KDQoNCkp1ZXJnZW4NCg==
--------------8Yk0kMtIoLifE0XL9448wgDY
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------8Yk0kMtIoLifE0XL9448wgDY--

--------------Jiabdt1bIloXCiW6RjD85VAZ--

--------------mqZ7jjNFnoN7juOnYB9eBcKo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKzJX8FAwAAAAAACgkQsN6d1ii/Ey8W
owf/XiXh2hyQNzbuxnvWTWSy0EzPaRA5Plhmftxlg3dCS13l1lW5A39UsN8ZOwsXIPw5dyfH3ZGU
DwWDzH5ezglkPlAG+cgQLfmqiNpiOB1krc2HtY26iQRgVaVwB4nmJHcMuTKjrAHPzWyLAZcXzK1E
aM8HiasH+MsoRo2AGgu4j6XHd66mApU5rh8VBtyhO8QeNqCMQBWAS35U1u4XXZ2ILZBDWAK8BOQJ
nxMgCyXmpoQ4VvaRsYo63QV8bp5PKAQfa4lMZebrA59pqpzuDiBa4v9zZD7LMx7aBcs5sCy4+tbC
F647jxRhBbe6pMaWwFOseZsFNtTqPk9BJjErdMJCWQ==
=RDI2
-----END PGP SIGNATURE-----

--------------mqZ7jjNFnoN7juOnYB9eBcKo--

