Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13B9649E6E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 13:09:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459544.717297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4hbw-0002Xi-9r; Mon, 12 Dec 2022 12:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459544.717297; Mon, 12 Dec 2022 12:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4hbw-0002VU-66; Mon, 12 Dec 2022 12:08:44 +0000
Received: by outflank-mailman (input) for mailman id 459544;
 Mon, 12 Dec 2022 12:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/A98=4K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p4hbu-0002VO-OV
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 12:08:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a3f340-7a15-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 13:08:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0620B3421D;
 Mon, 12 Dec 2022 12:08:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4CC3138F3;
 Mon, 12 Dec 2022 12:08:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a1OeMsgZl2NZdAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Dec 2022 12:08:40 +0000
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
X-Inumbo-ID: b7a3f340-7a15-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670846921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9RWPIza+YngD0S0M5lNjTKOVFjadcUW0pWKnqJ+0FRA=;
	b=YBYVJLz/hP6OuQl7RB5CZzJxEGG69mtQRRU81IQRKM0dd/IlnqWpEkGW4INxnJKvH/yCNg
	SjRF333AISjPUTJTo37WJhajaGyvJGCBqM6/76igW0IZJ8vPRTmbN8NRUYtRWpV95OTUAR
	bNpNE6kXgXgcXLXGvg5CreDjRgocv7g=
Message-ID: <f3657164-2f8e-0cab-7273-d31f10556a38@suse.com>
Date: Mon, 12 Dec 2022 13:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-9-jgross@suse.com>
 <b0380217-09ff-1fa8-b6b3-1bc98766114b@xen.org>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 08/20] tools/xenstore: add hashlist for finding struct
 domain by domid
In-Reply-To: <b0380217-09ff-1fa8-b6b3-1bc98766114b@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mrx2Educ0culufv9YERt62MQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mrx2Educ0culufv9YERt62MQ
Content-Type: multipart/mixed; boundary="------------0weQgXv90BtyDW3RbQmyuAmU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <f3657164-2f8e-0cab-7273-d31f10556a38@suse.com>
Subject: Re: [PATCH 08/20] tools/xenstore: add hashlist for finding struct
 domain by domid
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-9-jgross@suse.com>
 <b0380217-09ff-1fa8-b6b3-1bc98766114b@xen.org>
In-Reply-To: <b0380217-09ff-1fa8-b6b3-1bc98766114b@xen.org>

--------------0weQgXv90BtyDW3RbQmyuAmU
Content-Type: multipart/mixed; boundary="------------tYy98GYJ2PBhySwn0mykbdGY"

--------------tYy98GYJ2PBhySwn0mykbdGY
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
ZSBoYXNodGFibGU/DQoNCkkgaGF2ZSBtb2RpZmllZCB0aGUgcHJldmlvdXMgcGF0Y2ggdG8g
bWFrZSBrIGNvbnN0LiBJIGhvcGUgeW91IGFyZQ0KZmluZSB3aXRoIG1lIGhhdmluZyBrZXB0
IHlvdXIgIlJldmlld2VkLWJ5OiIuDQoNCj4gDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIHhj
X2RvbWluZm9fdCBkb21pbmZvOw0KPj4gLcKgwqDCoCBzdHJ1Y3QgZG9tYWluICpkb21haW47
DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBjb25uZWN0aW9uICpjb25uOw0KPj4gLcKgwqDCoCBp
bnQgbm90aWZ5ID0gMDsNCj4+IMKgwqDCoMKgwqAgYm9vbCBkb21fdmFsaWQ7DQo+PiArwqDC
oMKgIHN0cnVjdCBkb21haW4gKmRvbWFpbiA9IHY7DQo+PiArwqDCoMKgIGJvb2wgKm5vdGlm
eSA9IGFyZzsNCj4+IC0gYWdhaW46DQo+PiAtwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnko
ZG9tYWluLCAmZG9tYWlucywgbGlzdCkgew0KPj4gLcKgwqDCoMKgwqDCoMKgIGRvbV92YWxp
ZCA9IGdldF9kb21haW5faW5mbyhkb21haW4tPmRvbWlkLCAmZG9taW5mbyk7DQo+PiAtwqDC
oMKgwqDCoMKgwqAgaWYgKCFkb21haW4tPmludHJvZHVjZWQpIHsNCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmICghZG9tX3ZhbGlkKSB7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHRhbGxvY19mcmVlKGRvbWFpbik7DQo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gYWdhaW47DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB9DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4+IC3CoMKgwqDC
oMKgwqDCoCB9DQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGRvbV92YWxpZCkgew0KPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKChkb21pbmZvLmNyYXNoZWQgfHwgZG9taW5mby5z
aHV0ZG93bikNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJiYgIWRvbWFp
bi0+c2h1dGRvd24pIHsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9t
YWluLT5zaHV0ZG93biA9IHRydWU7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG5vdGlmeSA9IDE7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8q
DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBBdm9pZCB0cmlnZ2Vy
aW5nIHdhdGNoIGV2ZW50cyB3aGVuIHRoZQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogZG9tYWluJ3Mgbm9kZXMgYXJlIGJlaW5nIGRlbGV0ZWQuDQo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGRvbWFpbi0+Y29ubikNCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25uX2RlbGV0ZV9hbGxfd2F0Y2hlcyhkb21haW4t
PmNvbm4pOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKCFkb21pbmZvLmR5aW5nKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4+ICvCoMKgwqAgZG9tX3ZhbGlkID0gZ2V0X2Rv
bWFpbl9pbmZvKGRvbWFpbi0+ZG9taWQsICZkb21pbmZvKTsNCj4+ICvCoMKgwqAgaWYgKCFk
b21haW4tPmludHJvZHVjZWQpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWRvbV92YWxp
ZCkgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGFsbG9jX2ZyZWUoZG9tYWluKTsN
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAxOw0KPiANCj4gWW91IGFyZSBv
bmx5IGZyZWVpbmcgb25lIGRvbWFpbiBoZXJlLiBTbyBzaG91bGRuJ3Qgd2UgcmV0dXJuIDA/
IElmIG5vdCBwbGVhc2UgDQo+IGV4cGxhaW4gaW4gYSBjb21tZW50Lg0KDQpPaCwgZ29vZCBj
YXRjaC4gVGhhdCB3YXMgYSBsZWZ0b3ZlciBmcm9tIGEgcHJldmlvdXMgc3RhdGUgd2hlcmUg
ZXZlbg0KcmVtb3ZpbmcgdGhlIGVudHJ5IGl0c2VsZiB3YXNuJ3QgYWxsb3dlZC4NCg0KPiAN
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGRvbWFp
bi0+Y29ubikgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogZG9tYWluIGlzIGEg
dGFsbG9jIGNoaWxkIG9mIGRvbWFpbi0+Y29ubi4gKi8NCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbm4gPSBkb21haW4tPmNvbm47DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkb21haW4tPmNvbm4gPSBOVUxMOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGFs
bG9jX3VubGluayh0YWxsb2NfYXV0b2ZyZWVfY29udGV4dCgpLCBjb25uKTsNCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG5vdGlmeSA9IDA7IC8qIGRlc3Ryb3lfZG9tYWluKCkgZmly
ZXMgdGhlIHdhdGNoICovDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGFnYWlu
Ow0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4gK8KgwqDCoCB9DQo+PiArwqDC
oMKgIGlmIChkb21fdmFsaWQpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoKGRvbWluZm8u
Y3Jhc2hlZCB8fCBkb21pbmZvLnNodXRkb3duKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJiYgIWRvbWFpbi0+c2h1dGRvd24pIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGRvbWFpbi0+c2h1dGRvd24gPSB0cnVlOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Km5vdGlmeSA9IHRydWU7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEF2b2lkIHRyaWdnZXJpbmcgd2F0Y2ggZXZlbnRz
IHdoZW4gdGhlIGRvbWFpbidzDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogbm9k
ZXMgYXJlIGJlaW5nIGRlbGV0ZWQuDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICov
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZG9tYWluLT5jb25uKQ0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25uX2RlbGV0ZV9hbGxfd2F0Y2hlcyhk
b21haW4tPmNvbm4pOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAoIWRvbWluZm8uZHlpbmcpDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gMDsNCj4+ICvCoMKgwqAgfQ0KPj4gK8KgwqDCoCBpZiAoZG9tYWluLT5jb25uKSB7
DQo+PiArwqDCoMKgwqDCoMKgwqAgLyogZG9tYWluIGlzIGEgdGFsbG9jIGNoaWxkIG9mIGRv
bWFpbi0+Y29ubi4gKi8NCj4+ICvCoMKgwqDCoMKgwqDCoCBjb25uID0gZG9tYWluLT5jb25u
Ow0KPj4gK8KgwqDCoMKgwqDCoMKgIGRvbWFpbi0+Y29ubiA9IE5VTEw7DQo+PiArwqDCoMKg
wqDCoMKgwqAgdGFsbG9jX3VubGluayh0YWxsb2NfYXV0b2ZyZWVfY29udGV4dCgpLCBjb25u
KTsNCj4+ICvCoMKgwqDCoMKgwqDCoCAqbm90aWZ5ID0gZmFsc2U7IC8qIGRlc3Ryb3lfZG9t
YWluKCkgZmlyZXMgdGhlIHdhdGNoICovDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDE7
DQo+IA0KPiBDYW4geW91IGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aHkgMSBpcyByZXR1
cm5lZCBoZXJlPyBJcyB0aGlzIGJlY2F1c2Ugd2UgbWF5IA0KPiBmcmVlIHR3byBkb21haW5z
Pw0KDQpTaG91bGQgYmUgdGhlIHNhbWUgY2FzZSBhcyBhYm92ZS4NCg0KSW4gdGhlIGluaXRp
YWwgdmVyc2lvbiBJIGp1c3QgbWFwcGVkIHRoZSByZW1vdmVkICJnb3RvIGFnYWluIiB0byBh
IHJlc3RhcnQgb2YNCmhhc2h0YWJsZV9pdGVyYXRlKCkuDQoNCg0KSnVlcmdlbg0K
--------------tYy98GYJ2PBhySwn0mykbdGY
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------tYy98GYJ2PBhySwn0mykbdGY--

--------------0weQgXv90BtyDW3RbQmyuAmU--

--------------mrx2Educ0culufv9YERt62MQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOXGcgFAwAAAAAACgkQsN6d1ii/Ey91
sAgAlp1cwASARHL623uhwdj5CUWLoWT7jRvRxYyll9kXYVf4Q8CIgRskm0IvabkBsp50Q3AtR0Nd
HjbsQLUl6a2/V1se5XyJcG9XSRiJAbyPCVOd2zX1GPjS6Ql1MV3ENMxeALm7soKyFnjcXC1DoXRQ
Xy5js/EdoLld01vKJ4utgS0uFxeAn4TMtMcCK9WK+mf7282pSXtXywpmmTk2DtXe9FpYCdX8QkRL
C6H9LBkikfEL87RHlCCM4Wn0r8dOM7y5aA7BegSHcYIf+n0hEjCYteDDwNH7YaqDRttM1PX4Gi2r
kgIR6Md7CxOffBL3YXMvQheQ6TJLpJFNu+T3EXv6uQ==
=VwH2
-----END PGP SIGNATURE-----

--------------mrx2Educ0culufv9YERt62MQ--

