Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ACB6FDE23
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 14:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532793.829090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwjKs-0000CC-Qd; Wed, 10 May 2023 12:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532793.829090; Wed, 10 May 2023 12:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwjKs-00009L-Ns; Wed, 10 May 2023 12:54:26 +0000
Received: by outflank-mailman (input) for mailman id 532793;
 Wed, 10 May 2023 12:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ibwy=A7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pwjKq-00009F-Pe
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 12:54:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9135dd4-ef31-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 14:54:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1541D1F6E6;
 Wed, 10 May 2023 12:54:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E345113519;
 Wed, 10 May 2023 12:54:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gA72Nf2TW2RTfgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 10 May 2023 12:54:21 +0000
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
X-Inumbo-ID: c9135dd4-ef31-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683723262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15ULA9v4ixy4aWl5RkeidEJQKePXQf3PS38Ydm98OBs=;
	b=F8kDotC7BG0gEXaqzehQ5u7I9GL2eP42Rz4T77VpAm/pVb24Puaoa6iilKJyKaawJQfT0/
	FSSD8aV4e7W+V2ujS+pd+fAaVyqDoOesUgLGxU7WZwGp47RLzoltQjzRIcDJs+/RSTgzV/
	M/6amc+v2TibHlQ6RniuUNvbImG8+6A=
Message-ID: <9745474f-db84-c8f3-3662-95728d4d5bd3@suse.com>
Date: Wed, 10 May 2023 14:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-6-jgross@suse.com>
 <21847835-4f7e-a09a-458e-e68dc59d4268@xen.org>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 05/14] tools/xenstore: use accounting buffering for
 node accounting
In-Reply-To: <21847835-4f7e-a09a-458e-e68dc59d4268@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1E0AaHszEBAx6SZLBetrjz0o"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1E0AaHszEBAx6SZLBetrjz0o
Content-Type: multipart/mixed; boundary="------------rss0Gaot1iYqJzjU3aM9SBQz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <9745474f-db84-c8f3-3662-95728d4d5bd3@suse.com>
Subject: Re: [PATCH v5 05/14] tools/xenstore: use accounting buffering for
 node accounting
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-6-jgross@suse.com>
 <21847835-4f7e-a09a-458e-e68dc59d4268@xen.org>
In-Reply-To: <21847835-4f7e-a09a-458e-e68dc59d4268@xen.org>

--------------rss0Gaot1iYqJzjU3aM9SBQz
Content-Type: multipart/mixed; boundary="------------GdoHBGFGqum09XITwnpwb00G"

--------------GdoHBGFGqum09XITwnpwb00G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDUuMjMgMjA6NDYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA4LzA1LzIwMjMgMTI6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
ZGQgdGhlIG5vZGUgYWNjb3VudGluZyB0byB0aGUgYWNjb3VudGluZyBpbmZvcm1hdGlvbiBi
dWZmZXJpbmcgaW4NCj4+IG9yZGVyIHRvIGF2b2lkIGhhdmluZyB0byB1bmRvIGl0IGluIGNh
c2Ugb2YgZmFpbHVyZS4NCj4+DQo+PiBUaGlzIHJlcXVpcmVzIHRvIGNhbGwgZG9tYWluX25i
ZW50cnlfZGVjKCkgYmVmb3JlIGFueSBjaGFuZ2VzIHRvIHRoZQ0KPj4gZGF0YSBiYXNlLCBh
cyBpdCBjYW4gcmV0dXJuIGFuIGVycm9yIG5vdy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IFY1Og0KPj4gLSBh
ZGQgZXJyb3IgaGFuZGxpbmcgYWZ0ZXIgZG9tYWluX25iZW50cnlfZGVjKCkgY2FsbHMgKEp1
bGllbiBHcmFsbCkNCj4+IC0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2Nv
cmUuY8KgwqAgfCAyOSArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gwqAgdG9v
bHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5oIHzCoCA0ICsrLS0NCj4+IMKgIDIgZmls
ZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYyBiL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+IGluZGV4IDgzOTJiZGVjOWIuLjIyZGE0MzRl
MmEgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+
PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBAQCAtMTQ1NCw3
ICsxNDU0LDYgQEAgc3RhdGljIHZvaWQgZGVzdHJveV9ub2RlX3JtKHN0cnVjdCBjb25uZWN0
aW9uICpjb25uLCANCj4+IHN0cnVjdCBub2RlICpub2RlKQ0KPj4gwqAgc3RhdGljIGludCBk
ZXN0cm95X25vZGUoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIHN0cnVjdCBub2RlICpub2Rl
KQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCBkZXN0cm95X25vZGVfcm0oY29ubiwgbm9kZSk7
DQo+PiAtwqDCoMKgIGRvbWFpbl9uYmVudHJ5X2RlYyhjb25uLCBnZXRfbm9kZV9vd25lcihu
b2RlKSk7DQo+PiDCoMKgwqDCoMKgIC8qDQo+PiDCoMKgwqDCoMKgwqAgKiBJdCBpcyBub3Qg
cG9zc2libGUgdG8gZWFzaWx5IHJldmVydCB0aGUgY2hhbmdlcyBpbiBhIHRyYW5zYWN0aW9u
Lg0KPj4gQEAgLTE2NDUsNiArMTY0NCw5IEBAIHN0YXRpYyBpbnQgZGVsbm9kZV9zdWIoY29u
c3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgDQo+PiBjb25uZWN0aW9uICpjb25uLA0KPj4gwqDCoMKg
wqDCoCBpZiAocmV0ID4gMCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gV0FMS19U
UkVFX1NVQ0NFU1NfU1RPUDsNCj4+ICvCoMKgwqAgaWYgKGRvbWFpbl9uYmVudHJ5X2RlYyhj
b25uLCBnZXRfbm9kZV9vd25lcihub2RlKSkpDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IFdBTEtfVFJFRV9FUlJPUl9TVE9QOw0KPiANCj4gSSB0aGluayB0aGVyZSBpcyBhIHBvdGVu
dGlhbCBpc3N1ZSB3aXRoIHRoZSBidWZmZXJpbmcgaGVyZS4gSW4gY2FzZSBvZiBmYWlsdXJl
LCANCj4gdGhlIG5vZGUgY291bGQgaGF2ZSBiZWVuIHJlbW92ZWQsIGJ1dCB0aGUgcXVvdGEg
d291bGQgbm90IGJlIHByb3Blcmx5IGFjY291bnRlZC4NCg0KWW91IG1lYW4gdGhlIGNhc2Ug
d2hlcmUgYW5vdGhlciBub2RlIGhhcyBiZWVuIGRlbGV0ZWQgYW5kIGR1ZSB0byBhY2NvdW50
aW5nDQpidWZmZXJpbmcgdGhlIGNvcnJlY3RlZCBhY2NvdW50aW5nIGRhdGEgd291bGRuJ3Qg
YmUgY29tbWl0dGVkPw0KDQpUaGlzIGlzIG5vIHByb2JsZW0sIGFzIGFuIGVycm9yIHJldHVy
bmVkIGJ5IGRlbG5vZGVfc3ViKCkgd2lsbCByZXN1bHQgaW4NCmNvcnJ1cHQoKSBiZWluZyBj
YWxsZWQsIHdoaWNoIGluIHR1cm4gd2lsbCBjb3JyZWN0IHRoZSBhY2NvdW50aW5nIGRhdGEu
DQoNCj4gQWxzbywgSSB0aGluayBhIGNvbW1lbnQgd291bGQgYmUgd2FycmFudCB0byBleHBs
YWluIHdoeSB3ZSBhcmUgcmV0dXJuaW5nIA0KPiBXQUxLX1RSRUVfRVJST1JfU1RPUCBoZXJl
IHdoZW4uLi4NCj4gDQo+PiArDQo+PiDCoMKgwqDCoMKgIC8qIEluIGNhc2Ugb2YgZXJyb3Ig
c3RvcCB0aGUgd2Fsay4gKi8NCj4+IMKgwqDCoMKgwqAgaWYgKCFyZXQgJiYgZG9fdGRiX2Rl
bGV0ZShjb25uLCAma2V5LCAmbm9kZS0+YWNjKSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gV0FMS19UUkVFX1NVQ0NFU1NfU1RPUDsNCj4gDQo+IC4uLiB0aGlzIGlzIG5vdCB0
aGUgY2FzZSB3aGVuIGRvX3RkYl9kZWxldGUoKSBmYWlscyBmb3Igc29tZSByZWFzb25zLg0K
DQpUaGUgbWFpbiBpZGVhIHdhcyB0aGF0IHRoZSByZW1vdmUgaXMgd29ya2luZyBmcm9tIHRo
ZSBsZWFmcyB0b3dhcmRzIHRoZSByb290Lg0KSW4gY2FzZSBvbmUgZW50cnkgY2FuJ3QgYmUg
cmVtb3ZlZCwgd2Ugc2hvdWxkIGp1c3Qgc3RvcC4NCg0KT1RPSCByZXR1cm5pbmcgV0FMS19U
UkVFX0VSUk9SX1NUT1AgbWlnaHQgYmUgY2xlYW5lciwgYXMgdGhpcyB3b3VsZCBtYWtlIHN1
cmUNCnRoYXQgYWNjb3VudGluZyBkYXRhIGlzIHJlcGFpcmVkIGFmdGVyd2FyZHMuIEV2ZW4g
aWYgZG9fdGRiX2RlbGV0ZSgpIGNhbid0DQpyZWFsbHkgZmFpbCBpbiBub3JtYWwgY29uZmln
dXJhdGlvbnMsIGFzIHRoZSBvbmx5IGZhaWx1cmUgcmVhc29ucyBhcmU6DQoNCi0gdGhlIG5v
ZGUgaXNuJ3QgZm91bmQgKHF1aXRlIHVubGlrZWx5LCBhcyB3ZSBqdXN0IHJlYWQgaXQgYmVm
b3JlIGVudGVyaW5nDQogICBkZWxub2RlX3N1YigpKSwgb3INCi0gd3JpdGluZyB0aGUgdXBk
YXRlZCBkYXRhIGJhc2UgZmFpbGVkIChpbiBub3JtYWwgY29uZmlndXJhdGlvbnMgaXQgaXMg
aW4NCiAgIGFscmVhZHkgYWxsb2NhdGVkIG1lbW9yeSwgc28gbm8gd2F5IHRvIGZhaWwgdGhh
dCkNCg0KSSB0aGluayBJJ2xsIHN3aXRjaCB0byByZXR1cm4gV0FMS19UUkVFX0VSUk9SX1NU
T1AgaGVyZS4NCg0KDQpKdWVyZ2VuDQo=
--------------GdoHBGFGqum09XITwnpwb00G
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------GdoHBGFGqum09XITwnpwb00G--

--------------rss0Gaot1iYqJzjU3aM9SBQz--

--------------1E0AaHszEBAx6SZLBetrjz0o
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRbk/0FAwAAAAAACgkQsN6d1ii/Ey/w
Nwf/YmwmXNuZf22ns5/wQ1xW5RmjVVGKbnWrAYy33FPVbJ8+02bcmwm+gOBBESgUkgOeE36z9O+A
uUcc5c49GcqDyzruaFuWT5lQdX690fHnze/H8QJVhqkuXp7UO11jVjR6h01SNjtZ24kAkLbNF6Nn
g1c9T/dHiaOcAR5yJim1dsmKg5UYj3IdPtfqkYCCEqRjdDKx49OgYOVlPGlSoUnyH8kRMyJYZAW6
WloSM1kFrdOb0ilC2EByui0PxNkzyDonf0Uvj7jR8QQfMJsaRKt3qK64Nyvd6g7kTslSILs+g1oM
DiLptTvR38IHugEQgY6PEe7RdoSGq1Iw6uWPnAug/Q==
=dYdg
-----END PGP SIGNATURE-----

--------------1E0AaHszEBAx6SZLBetrjz0o--

