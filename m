Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BD4649E8A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 13:19:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459576.717341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4hlq-0005uc-T7; Mon, 12 Dec 2022 12:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459576.717341; Mon, 12 Dec 2022 12:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4hlq-0005rx-Py; Mon, 12 Dec 2022 12:18:58 +0000
Received: by outflank-mailman (input) for mailman id 459576;
 Mon, 12 Dec 2022 12:18:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/A98=4K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p4hlp-0005rm-NO
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 12:18:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25adab55-7a17-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 13:18:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2802320DA0;
 Mon, 12 Dec 2022 12:18:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 064AF138F3;
 Mon, 12 Dec 2022 12:18:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mVU5AC8cl2NaeQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Dec 2022 12:18:55 +0000
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
X-Inumbo-ID: 25adab55-7a17-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670847535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qdW3jzQrLYj2pvb2WL6Qk3RA3QhJUSjKWI9QVGJclbA=;
	b=d+KkegkpKvJKujUjx0wwCUFmXFu/TGo/RgPISajrFlLQpozQGIMrPQha59MGsg0sYPN0QG
	6q8ryJhrAgA2fiLJW9kxUJv5326yYpmRfEYOjbfplC0BL2H4VWXq9vX7DoQ1vVsFnuPZzV
	R3y4oCL03HmCNQCyYY6P24H4I+UCRl4=
Message-ID: <2eefb93e-e48e-17c5-fcab-bdfcff8d7718@suse.com>
Date: Mon, 12 Dec 2022 13:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 08/20] tools/xenstore: add hashlist for finding struct
 domain by domid
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-9-jgross@suse.com>
 <b0380217-09ff-1fa8-b6b3-1bc98766114b@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b0380217-09ff-1fa8-b6b3-1bc98766114b@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tjUuQAZUdDsnxzJtAdeDyulb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tjUuQAZUdDsnxzJtAdeDyulb
Content-Type: multipart/mixed; boundary="------------IIYqVxjQQHDgD9y0oNnSMmlZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <2eefb93e-e48e-17c5-fcab-bdfcff8d7718@suse.com>
Subject: Re: [PATCH 08/20] tools/xenstore: add hashlist for finding struct
 domain by domid
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-9-jgross@suse.com>
 <b0380217-09ff-1fa8-b6b3-1bc98766114b@xen.org>
In-Reply-To: <b0380217-09ff-1fa8-b6b3-1bc98766114b@xen.org>

--------------IIYqVxjQQHDgD9y0oNnSMmlZ
Content-Type: multipart/mixed; boundary="------------YeX0OLJEDPJQqpM2pZQWoZRL"

--------------YeX0OLJEDPJQqpM2pZQWoZRL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTIuMjIgMjI6MzQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzExLzIwMjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBA
QCAtMzQxLDQ5ICszMzksNTYgQEAgc3RhdGljIGJvb2wgZ2V0X2RvbWFpbl9pbmZvKHVuc2ln
bmVkIGludCBkb21pZCwgDQo+PiB4Y19kb21pbmZvX3QgKmRvbWluZm8pDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZG9taW5mby0+ZG9taWQgPT0gZG9taWQ7DQo+PiDCoCB9DQo+
PiAtdm9pZCBjaGVja19kb21haW5zKHZvaWQpDQo+PiArc3RhdGljIGludCBjaGVja19kb21h
aW4odm9pZCAqaywgdm9pZCAqdiwgdm9pZCAqYXJnKQ0KPiANCj4gTG9va2luZyBhdCB0aGlz
IGNhbGxiYWNrLCBzaG91bGRuJ3QgJ2snIGJlIGNvbnN0PyBJZiBub3QsIHdvdWxkbid0IHRo
aXMgbWVhbiBhIA0KPiBjYWxsZXIgY291bGQgcG90ZW50aWFsbHkgbWVzcyB1cCB3aXRoIHRo
ZSBoYXNodGFibGU/DQo+IA0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCB4Y19kb21pbmZvX3Qg
ZG9taW5mbzsNCj4+IC3CoMKgwqAgc3RydWN0IGRvbWFpbiAqZG9tYWluOw0KPj4gwqDCoMKg
wqDCoCBzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubjsNCj4+IC3CoMKgwqAgaW50IG5vdGlmeSA9
IDA7DQo+PiDCoMKgwqDCoMKgIGJvb2wgZG9tX3ZhbGlkOw0KPj4gK8KgwqDCoCBzdHJ1Y3Qg
ZG9tYWluICpkb21haW4gPSB2Ow0KPj4gK8KgwqDCoCBib29sICpub3RpZnkgPSBhcmc7DQo+
PiAtIGFnYWluOg0KPj4gLcKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KGRvbWFpbiwgJmRv
bWFpbnMsIGxpc3QpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCBkb21fdmFsaWQgPSBnZXRfZG9t
YWluX2luZm8oZG9tYWluLT5kb21pZCwgJmRvbWluZm8pOw0KPj4gLcKgwqDCoMKgwqDCoMKg
IGlmICghZG9tYWluLT5pbnRyb2R1Y2VkKSB7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoIWRvbV92YWxpZCkgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB0YWxsb2NfZnJlZShkb21haW4pOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIGFnYWluOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+PiAtwqDCoMKgwqDCoMKgwqAgfQ0K
Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChkb21fdmFsaWQpIHsNCj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICgoZG9taW5mby5jcmFzaGVkIHx8IGRvbWluZm8uc2h1dGRvd24pDQo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICYmICFkb21haW4tPnNodXRkb3du
KSB7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRvbWFpbi0+c2h1dGRv
d24gPSB0cnVlOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3RpZnkg
PSAxOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogQXZvaWQgdHJpZ2dlcmluZyB3YXRjaCBl
dmVudHMgd2hlbiB0aGUNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IGRvbWFpbidzIG5vZGVzIGFyZSBiZWluZyBkZWxldGVkLg0KPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICovDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChkb21haW4tPmNvbm4pDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29ubl9kZWxldGVfYWxsX3dhdGNoZXMoZG9tYWluLT5jb25uKTsNCj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmICghZG9taW5mby5keWluZykNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29udGludWU7DQo+PiArwqDCoMKgIGRvbV92YWxpZCA9IGdldF9kb21haW5faW5mbyhk
b21haW4tPmRvbWlkLCAmZG9taW5mbyk7DQo+PiArwqDCoMKgIGlmICghZG9tYWluLT5pbnRy
b2R1Y2VkKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFkb21fdmFsaWQpIHsNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRhbGxvY19mcmVlKGRvbWFpbik7DQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMTsNCj4gDQo+IFlvdSBhcmUgb25seSBmcmVlaW5n
IG9uZSBkb21haW4gaGVyZS4gU28gc2hvdWxkbid0IHdlIHJldHVybiAwPyBJZiBub3QgcGxl
YXNlIA0KPiBleHBsYWluIGluIGEgY29tbWVudC4NCj4gDQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgfQ0KPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChkb21haW4tPmNvbm4pIHsNCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIGRvbWFpbiBpcyBhIHRhbGxvYyBjaGlsZCBvZiBkb21h
aW4tPmNvbm4uICovDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25uID0gZG9tYWlu
LT5jb25uOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tYWluLT5jb25uID0gTlVM
TDsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRhbGxvY191bmxpbmsodGFsbG9jX2F1
dG9mcmVlX2NvbnRleHQoKSwgY29ubik7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBu
b3RpZnkgPSAwOyAvKiBkZXN0cm95X2RvbWFpbigpIGZpcmVzIHRoZSB3YXRjaCAqLw0KPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBhZ2FpbjsNCj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gMDsNCj4+ICvCoMKgwqAgfQ0KPj4gK8KgwqDCoCBpZiAoZG9tX3ZhbGlkKSB7
DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKChkb21pbmZvLmNyYXNoZWQgfHwgZG9taW5mby5z
aHV0ZG93bikNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICYmICFkb21haW4tPnNodXRk
b3duKSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb21haW4tPnNodXRkb3duID0g
dHJ1ZTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICpub3RpZnkgPSB0cnVlOw0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBBdm9pZCB0cmlnZ2VyaW5nIHdhdGNoIGV2ZW50cyB3aGVuIHRoZSBkb21haW4ncw0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIG5vZGVzIGFyZSBiZWluZyBkZWxldGVk
Lg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGRvbWFpbi0+Y29ubikNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29ubl9kZWxldGVfYWxsX3dhdGNoZXMoZG9tYWluLT5jb25uKTsNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCB9DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFkb21pbmZvLmR5
aW5nKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiArwqDCoMKg
IH0NCj4+ICvCoMKgwqAgaWYgKGRvbWFpbi0+Y29ubikgew0KPj4gK8KgwqDCoMKgwqDCoMKg
IC8qIGRvbWFpbiBpcyBhIHRhbGxvYyBjaGlsZCBvZiBkb21haW4tPmNvbm4uICovDQo+PiAr
wqDCoMKgwqDCoMKgwqAgY29ubiA9IGRvbWFpbi0+Y29ubjsNCj4+ICvCoMKgwqDCoMKgwqDC
oCBkb21haW4tPmNvbm4gPSBOVUxMOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHRhbGxvY191bmxp
bmsodGFsbG9jX2F1dG9mcmVlX2NvbnRleHQoKSwgY29ubik7DQo+PiArwqDCoMKgwqDCoMKg
wqAgKm5vdGlmeSA9IGZhbHNlOyAvKiBkZXN0cm95X2RvbWFpbigpIGZpcmVzIHRoZSB3YXRj
aCAqLw0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAxOw0KPiANCj4gQ2FuIHlvdSBhZGQg
YSBjb21tZW50IGV4cGxhaW5pbmcgd2h5IDEgaXMgcmV0dXJuZWQgaGVyZT8gSXMgdGhpcyBi
ZWNhdXNlIHdlIG1heSANCj4gZnJlZSB0d28gZG9tYWlucz8NCg0KT2gsIGp1c3QgZGV0ZWN0
ZWQgeW91IGFyZSByaWdodDogdGhpcyBtaWdodCBmcmVlIDIgZG9tYWlucywgc28gYSByZXR1
cm4NCnZhbHVlIG90aGVyIHRoYW4gMCBpcyByZXF1aXJlZC4gV2lsbCBhZGQgYSBjb21tZW50
Lg0KDQoNCkp1ZXJnZW4NCg0K
--------------YeX0OLJEDPJQqpM2pZQWoZRL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------YeX0OLJEDPJQqpM2pZQWoZRL--

--------------IIYqVxjQQHDgD9y0oNnSMmlZ--

--------------tjUuQAZUdDsnxzJtAdeDyulb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOXHC4FAwAAAAAACgkQsN6d1ii/Ey+b
EwgAkkEGDLcX1i0R4MvvF9xoD6VM4YNUOBb3shzYdLeocCgdaaX6+duqtyA4kDN8iixFxdim4IPL
FZ3iGx5oL9BBTumoI7fIcAjV5JWFD8UzhGr5eSJk89D9pVIU4mKN2AOIomnjcrs8itJ+jy0vcBev
TxTS8SgKy2I0pOrau7AYhbqYcXi2xaxAQN0M1TfSO3Jr2wuGnUw7fPgwolpLQSsxNgK7sSfkmrNo
RlBwHUWET0S744On7D/Z9ppVuqMHDewHk4E2R518+4yiyq8QMlkNOVyDnwsb1cRdXWf7DnrrOFf1
2uINMDOG+LzH87JT/hhCoI11SDRCFhsQik+6vYnk1w==
=mu23
-----END PGP SIGNATURE-----

--------------tjUuQAZUdDsnxzJtAdeDyulb--

