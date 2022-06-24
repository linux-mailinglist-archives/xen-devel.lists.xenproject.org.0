Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97375558F89
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 06:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355243.582792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4ahX-0006rW-Ld; Fri, 24 Jun 2022 04:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355243.582792; Fri, 24 Jun 2022 04:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4ahX-0006pg-E3; Fri, 24 Jun 2022 04:13:47 +0000
Received: by outflank-mailman (input) for mailman id 355243;
 Fri, 24 Jun 2022 04:13:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4ahU-0006pX-Tp
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 04:13:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 083e04fd-f374-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 06:13:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D7ED1218EC;
 Fri, 24 Jun 2022 04:13:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CB1F13480;
 Fri, 24 Jun 2022 04:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kZpzJPU5tWKOAQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Jun 2022 04:13:41 +0000
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
X-Inumbo-ID: 083e04fd-f374-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656044021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=muCjj7lD4k3cRcTy4dnsz/q9/GO7CSHVPg1bC2m+yuA=;
	b=en9nTNeu4pWMeOlJyax05SkL8lv2p3CQTK5IsSd5+gHWJ0eC+f1BdzDLf01TVP68HwYZik
	8dnvJBzlZH0Gs6r4t5dGdXgo2QoivdAVCJlghIYeOderye/NP3UD5O3euqZsJ6m9Cnumi0
	a9+qwO3QZJKBy7BdU3atiEVBclcZ9og=
Message-ID: <258f4579-7c24-dd98-d4ce-1155b1da8759@suse.com>
Date: Fri, 24 Jun 2022 06:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/4] tools/xenstore: add documentation for new
 set/get-feature commands
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220527072427.20327-1-jgross@suse.com>
 <20220527072427.20327-3-jgross@suse.com>
 <4f8f6cf3-3aee-9128-df09-d3957c233c42@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <4f8f6cf3-3aee-9128-df09-d3957c233c42@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------03OzHPg0v0BcI5HTtZssUGRd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------03OzHPg0v0BcI5HTtZssUGRd
Content-Type: multipart/mixed; boundary="------------NKk6srx51QLwbjIiLyy7vb0W";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <258f4579-7c24-dd98-d4ce-1155b1da8759@suse.com>
Subject: Re: [PATCH v2 2/4] tools/xenstore: add documentation for new
 set/get-feature commands
References: <20220527072427.20327-1-jgross@suse.com>
 <20220527072427.20327-3-jgross@suse.com>
 <4f8f6cf3-3aee-9128-df09-d3957c233c42@xen.org>
In-Reply-To: <4f8f6cf3-3aee-9128-df09-d3957c233c42@xen.org>

--------------NKk6srx51QLwbjIiLyy7vb0W
Content-Type: multipart/mixed; boundary="------------HmO4llLX2aHQhOoJ3jzTMQ4k"

--------------HmO4llLX2aHQhOoJ3jzTMQ4k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDYuMjIgMjA6MjcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI3LzA1LzIwMjIgMDg6MjQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
ZGQgZG9jdW1lbnRhdGlvbiBmb3IgdHdvIG5ldyBYZW5zdG9yZSB3aXJlIGNvbW1hbmRzIFNF
VF9GRUFUVVJFIGFuZA0KPj4gR0VUX0ZFQVRVUkUgdXNlZCB0byBzZXQgb3IgcXVlcnkgdGhl
IFhlbnN0b3JlIGZlYXR1cmVzIHZpc2libGUgaW4gdGhlDQo+PiByaW5nIHBhZ2Ugb2YgYSBn
aXZlbiBkb21haW4uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBEbyB3ZSBuZWVkIHN1cHBvcnQgaW4gdGhlIG1p
Z3JhdGlvbiBwcm90b2NvbCBmb3IgdGhlIGZlYXR1cmVzPw0KPiANCj4gSSB3b3VsZCBzYXkg
eWVzLiBZb3Ugd2FudCB0byBtYWtlIHN1cmUgdGhhdCB0aGUgY2xpZW50IGNhbiBiZSBtaWdy
YXRlZCB3aXRob3V0IA0KPiBsb29zaW5nIGZlYXR1cmVzIGJldHdlZW4gdHdvIHhlbnN0b3Jl
ZC4NCg0KT2theSwgd2lsbCBhZGQgdGhhdCBpbiBWMy4NCg0KPiANCj4+IFYyOg0KPj4gLSBy
ZW1vdmUgZmVhdHVyZSBiaXQgKEp1bGllbiBHcmFsbCkNCj4+IC0gR0VUX0ZFQVRVUkUgd2l0
aG91dCBkb21pZCB3aWxsIHJldHVybiBYZW5zdG9yZSBzdXBwb3J0ZWQgZmVhdHVyZXMNCj4+
IMKgwqAgKHRyaWdnZXJlZCBieSBKdWxpZW4gR3JhbGwpDQo+PiAtLS0NCj4+IMKgIGRvY3Mv
bWlzYy94ZW5zdG9yZS50eHQgfCAxNCArKysrKysrKysrKysrKw0KPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNj
L3hlbnN0b3JlLnR4dCBiL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQNCj4+IGluZGV4IGEzZDNk
YTBhNWIuLjAwZjY5NjkyMDIgMTAwNjQ0DQo+PiAtLS0gYS9kb2NzL21pc2MveGVuc3RvcmUu
dHh0DQo+PiArKysgYi9kb2NzL21pc2MveGVuc3RvcmUudHh0DQo+PiBAQCAtMzMxLDYgKzMz
MSwyMCBAQCBTRVRfVEFSR0VUwqDCoMKgwqDCoMKgwqAgPGRvbWlkPnw8dGRvbWlkPnwNCj4+
IMKgwqDCoMKgwqAgeGVuc3RvcmVkIHByZXZlbnRzIHRoZSB1c2Ugb2YgU0VUX1RBUkdFVCBv
dGhlciB0aGFuIGJ5IGRvbTAuDQo+PiArR0VUX0ZFQVRVUkXCoMKgwqDCoMKgwqDCoCBbPGRv
bWlkPnxdwqDCoMKgwqDCoMKgwqAgPHZhbHVlPnwNCj4+ICtTRVRfRkVBVFVSRcKgwqDCoMKg
wqDCoMKgIDxkb21pZD58PHZhbHVlPnwNCj4+ICvCoMKgwqAgUmV0dXJucyBvciBzZXRzIHRo
ZSBjb250ZW50cyBvZiB0aGUgImZlYXR1cmUiIGZpZWxkIGxvY2F0ZWQgYXQNCj4+ICvCoMKg
wqAgb2Zmc2V0IDIwNjQgb2YgdGhlIFhlbnN0b3JlIHJpbmcgcGFnZSBvZiB0aGUgZG9tYWlu
IHNwZWNpZmllZCBieQ0KPj4gK8KgwqDCoCA8ZG9taWQ+LiA8dmFsdWU+IGlzIGEgZGVjaW1h
bCBudW1iZXIgYmVpbmcgYSBsb2dpY2FsIG9yIG9mIHRoZQ0KPiANCj4gSW4gdGhlIGNvbnRl
eHQgb2YgbWlncmF0aW9uLCBJIGFtIHN0aWxsbCBhIGJpdCBjb25jZXJuZWQgdGhhdCB0aGUg
ZmVhdHVyZXMgYXJlIA0KPiBzdG9yZWQgaW4gdGhlIHJpbmcgYmVjYXVzZSB0aGUgZ3Vlc3Qg
Y291bGQgb3ZlcndyaXRlIGl0Lg0KPiANCj4gSSB3b3VsZCBleHBlY3QgdGhlIG1pZ3JhdGlv
biBjb2RlIHRvIGNoZWNrIHRoYXQgdGhlIEdFVF9GRUFUVVJFIDxkb21pZD4gaXMgYSANCj4g
c3Vic2V0IG9mIEdFVF9GRUFUVVJFIG9uIHRoZSB0YXJnZXRlZCBYZW5zdG9yZWQuIFNvIGl0
IGNhbiBlYXNpbHkgcHJldmVudCBhIA0KPiBndWVzdCB0byBtaWdyYXRlLg0KPiANCj4gU28g
SSB0aGluayB0aGlzIHNob3VsZCBiZSBhIHNoYWRvdyBjb3B5IHRoYXQgd2lsbCBiZSByZXR1
cm5lZCBpbnN0ZWFkIG9mIHRoZSANCj4gY29udGVudHMgb2YgdGhlICJmZWF0dXJlIiBmaWVs
ZC4NCg0KT2YgY291cnNlLiBUaGUgdmFsdWUgaW4gdGhlIHJpbmcgaXMgbWVhbnQgb25seSBm
b3IgdGhlIGd1ZXN0LiBYZW5zdG9yZQ0Kd2lsbCBoYXZlIHRoZSBhdXRob3JpdGF0aXZlIHZh
bHVlIGluIGl0cyBwcml2YXRlIG1lbW9yeS4NCg0KPiANCj4+ICvCoMKgwqAgZmVhdHVyZSBi
aXRzIGFzIGRlZmluZWQgaW4gZG9jcy9taXNjL3hlbnN0b3JlLXJpbmcudHh0LiBUcnlpbmcN
Cj4+ICvCoMKgwqAgdG8gc2V0IGEgYml0IGZvciBhIGZlYXR1cmUgbm90IGJlaW5nIHN1cHBv
cnRlZCBieSB0aGUgcnVubmluZw0KPj4gK8KgwqDCoCBYZW5zdG9yZSB3aWxsIGJlIGRlbmll
ZC4gUHJvdmlkaW5nIG5vIDxkb21pZD4gd2l0aCB0aGUNCj4+ICvCoMKgwqAgR0VUX0ZFQVRV
UkUgY29tbWFuZCB3aWxsIHJldHVybiB0aGUgZmVhdHVyZXMgd2hpY2ggYXJlIHN1cHBvcnRl
ZA0KPj4gK8KgwqDCoCBieSBYZW5zdG9yZS4NCj4gDQo+IERvIHdlIHdhbnQgdG8gYWxsb3cg
bW9kaWZ5aW5nIHRoZSBmZWF0dXJlcyB3aGVuIHRoZSBndWVzdCBpcyBydW5uaW5nPw0KDQpJ
IHRoaW5rIHdlIGNhbid0IHJlbW92ZSBmZWF0dXJlcywgYnV0IGFkZGluZyB3b3VsZCBiZSBm
aW5lLiBGb3INCnNpbXBsaWNpdHkgaXQgbWlnaHQgYmUgYmV0dGVyIHRvIGp1c3QgZGVueSBh
IG1vZGlmaWNhdGlvbiB3aGlsZSB0aGUNCmd1ZXN0IGlzIHJ1bm5pbmcuDQoNCg0KSnVlcmdl
bg0K
--------------HmO4llLX2aHQhOoJ3jzTMQ4k
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------HmO4llLX2aHQhOoJ3jzTMQ4k--

--------------NKk6srx51QLwbjIiLyy7vb0W--

--------------03OzHPg0v0BcI5HTtZssUGRd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK1OfUFAwAAAAAACgkQsN6d1ii/Ey8X
+gf/fu2SjZR+JN5YFm/NiKJZbzHDwff8yseYWCMe8EygN6rZJw4CFET5ZTZxB1f3QmdVx6ru4lm5
8uv0lXx0XoNC2HHlLwambcH/+p2h1rhOOwAeL90xpoe5NZpFneblGGE8Vq8DwzwVJIvc3/k/SGZh
NdjMVCMmWMUFUp/8sPBBKcK/w3TpQxqHGScshHR3ihMvByIOCWVWr710BxMZCZJMDKZCnXbw5wHu
pEpGm1LBdVeDNOnZwzUSzdnz9ne4VaG03vmnzioGKkOtwckNfEvamfZMn7pbTLXXJh2GMs27sScM
bfJRoV/zMLS09NXhZcrmfoLZt414TpnE5bL+fstxTw==
=hrKm
-----END PGP SIGNATURE-----

--------------03OzHPg0v0BcI5HTtZssUGRd--

