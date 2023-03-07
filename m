Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D056ADB90
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 11:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507276.780581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUM7-0008RP-2d; Tue, 07 Mar 2023 10:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507276.780581; Tue, 07 Mar 2023 10:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUM6-0008P2-W7; Tue, 07 Mar 2023 10:15:38 +0000
Received: by outflank-mailman (input) for mailman id 507276;
 Tue, 07 Mar 2023 10:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JVyd=67=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZUM5-0008Or-M9
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 10:15:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00bb3e10-bcd1-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 11:15:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3280D1FE17;
 Tue,  7 Mar 2023 10:15:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 019581341F;
 Tue,  7 Mar 2023 10:15:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8vGCOscOB2TGWgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Mar 2023 10:15:35 +0000
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
X-Inumbo-ID: 00bb3e10-bcd1-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678184136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s4Qt3vZRexltBFiP0VZtlCJzwjAadgqYyj2/rqyXu0o=;
	b=gJBNkNmw2QtMXirjMceYRptRgEkD6Q/4fkHg1zcre4mY7p1zI1/7e2r/rE9j37acH0Sbat
	sV3lvccQXKkiuJwb8gTW5DhH6HVoO/JdwktU8mVOfgkfrkHpJ9aPIaMA5vjJ8eOxbhexGY
	gRelTG+mDgkcB8v6HQVdL8ETykoeLuc=
Message-ID: <a688c968-bebe-694e-b8af-3acdedd4334c@suse.com>
Date: Tue, 7 Mar 2023 11:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] tools/tests: remove vhpet tests
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230306162904.7831-1-jgross@suse.com>
 <b131fc3d-901b-a4e9-3827-0daab0505452@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b131fc3d-901b-a4e9-3827-0daab0505452@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jo0DPslVwukZ8Nf47CptpVH0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jo0DPslVwukZ8Nf47CptpVH0
Content-Type: multipart/mixed; boundary="------------WJxB0zXTd0z5p7kcO28EbN8r";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a688c968-bebe-694e-b8af-3acdedd4334c@suse.com>
Subject: Re: [PATCH] tools/tests: remove vhpet tests
References: <20230306162904.7831-1-jgross@suse.com>
 <b131fc3d-901b-a4e9-3827-0daab0505452@suse.com>
In-Reply-To: <b131fc3d-901b-a4e9-3827-0daab0505452@suse.com>

--------------WJxB0zXTd0z5p7kcO28EbN8r
Content-Type: multipart/mixed; boundary="------------oja9rJ0O2VmMaU7Kt0dzeFdV"

--------------oja9rJ0O2VmMaU7Kt0dzeFdV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDMuMjMgMTE6MDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wMy4yMDIz
IDE3OjI5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gdG9vbHMvdGVzdHMvdmhwZXQgdGVz
dHMgZG9uJ3QgYnVpbGQgc2luY2UgYWdlcyAoYXQgbGVhc3Qgc2luY2UgNC4xMCkNCj4+IGFu
ZCB0aGV5IGNhbid0IGJlIGFjdGl2YXRlZCBmcm9tIG91dHNpZGUgb2YgdG9vbHMvdGVzdHMv
dmhwZXQuDQo+IA0KPiBUaGlzIGlzbid0IGV4YWN0bHkgdHJ1ZSAtIHNlZSB0aGUgcnVuLXRl
c3RzLSUgZ29hbCBpbiB0aGUgdG9wIGxldmVsDQo+IE1ha2VmaWxlLg0KDQpBaCwgSSBtaXNz
ZWQgdGhhdCBvbmUuDQoNCj4gDQo+PiBSZW1vdmUgdGhlbSBhcyB0aGV5IHNlZW0gdG8gYmUg
aXJyZWxldmFudC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IEFuZHJldyBzZWVtcyB0byByZW1lbWJlciB0aGF0
IFJvZ2VyIHdhbnRlZCB0byBrZWVwIHRob3NlIHRlc3RzLCBidXQNCj4+IHRoaXMgaW5mb3Jt
YXRpb24gbWlnaHQgYmUgc3RhbGUgb3IgYmFzZWQgb24gZmFsc2UgYXNzdW1wdGlvbnMuDQo+
PiBTbyB0aGlzIHBhdGNoIHNob3VsZCBvbmx5IGdvIGluIHdpdGggUm9nZXIncyBBY2suDQo+
IA0KPiBIYXZpbmcgdHJpZWQgYSBsaXR0bGUgSSBjYW4gc2VlIHRoYXQgaXQncyBnb2luZyB0
byBiZSBxdWl0ZSBhIGJpdCBvZg0KPiB3b3JrIHRvIGdldCB0aGUgdGhpbmcgdG8gYXQgbGVh
c3QgYnVpbGQgYWdhaW4uIEluIGZhY3QgaXQgbG9va3MgYXMNCj4gaWYgaXQsIGhhdmluZyBi
ZWVuIGludHJvZHVjZWQgaW4gNC41LCBtYXkgYWxyZWFkeSBub3QgaGF2ZSBidWlsdA0KPiBz
dWNjZXNzZnVsbHkgYW55bW9yZSBieSB0aGUgdGltZSA0LjUgd2FzIHJlbGVhc2VkOiBocGV0
X2luaXQoKQ0KPiB0YWtlcyBhIHN0cnVjdCBkb21haW4gKiwgYnV0IGlzIHBhc3NlZCAmdmNw
dTAgKG1hdGNoaW5nIHdoYXQgSSBjYW4NCj4gc2VlIGluIDQuNCk7IEkndmUgbm90aWNlZCB0
aGlzIHdoaWxlIHRyeWluZyB0byBmaWd1cmUgb3V0IGZyb20gd2hlcmUNCj4gaXQgZ290IGEg
ZGVjbGFyYXRpb24gb2YgdGhlIGZ1bmN0aW9uIGluIHRoZSBmaXJzdCBwbGFjZS4NCj4gDQo+
IE5ldmVydGhlbGVzcyB0aGUgdGVzdCBvbmNlIHNlcnZlZCBhIHB1cnBvc2UsIHNvIGl0IG1h
eSBiZSB3b3J0aA0KPiBtYWtpbmcgaXQgd29yayBhZ2Fpbi4gU28geWVzLCB0byBkZWNpZGUg
d2hpY2ggZGlyZWN0aW9uIHRvIG1vdmUgd2UNCj4gd2lsbCB3YW50IFJvZ2VyJ3Mgb3Bpbmlv
bi4NCg0KWWVzLCBJIGFncmVlLiBUaGUgbWFpbiByZWFzb24gdG8gd3JpdGUgdGhpcyBwYXRj
aCB3YXMgdG8gY29tZSB0byBhDQpkZWNpc2lvbiB3aGF0IHRvIGRvIHdpdGggdGhlIHRlc3Q6
IGRpc2NhcmQgaXQgb3IgcmVwYWlyIGl0Lg0KDQo+IFdoZXRoZXIganVzdCBidWlsZGluZyBp
dCBieSBkZWZhdWx0IGlzIHVzZWZ1bCBJJ20gbm90IGVudGlyZWx5DQo+IGNlcnRhaW4uIFdo
YXQgSSdkIGNvbnNpZGVyIG1vcmUgdXNlZnVsIGlzIGlmIHRlc3RzIGxpa2UgdGhpcyB3ZXJl
DQo+IF9ydW5fIGluIHRoZSBjb3Vyc2Ugb2Ygcm91dGluZSBhdXRvbWF0ZWQgdGVzdGluZy4N
Cg0KSW4gd2hpY2ggY2FzZSBpdCB3b3VsZCBuZWVkIHRvIGJ1aWx0IGF0IGxlYXN0IGJ5IHRo
aXMgdGVzdCBzdGVwLg0KDQpJIGFncmVlIHRoaXMgd291bGQgYmUgYSBzZW5zaWJsZSB0aGlu
ZyB0byBkby4NCg0KDQpKdWVyZ2VuDQo=
--------------oja9rJ0O2VmMaU7Kt0dzeFdV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------oja9rJ0O2VmMaU7Kt0dzeFdV--

--------------WJxB0zXTd0z5p7kcO28EbN8r--

--------------jo0DPslVwukZ8Nf47CptpVH0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQHDscFAwAAAAAACgkQsN6d1ii/Ey8u
hwf+O5nAjO5Tvs1s9C+TYxH1sId2aWCbOfBsHEHZoxwrt80ndG0QEG8/+Vdn1e2dmYW/sjBQMFSw
TbZk8C/EYQVj6oYLFMt8yfyiWFicM4uX5FXPrY7YDk9NFtlUQDUbIi4VCJGKd71qnRP27RpPZ0fM
wJ+AtXvnC7kxDmfk37gbVAYQ0iw9M8/sJrO6KuMgh6Sn4AUc3wc5OrbVKVMrJFRxWDnlJ26QO+mj
LDxW+bgNcz2A4xRfZ5UfaQ/TXOrUMQyQYrMiZwjiw5XCiCLgUzcnert/9Ga0DSW50NLtRVN1hIoE
Z3y/TgstWPDfA9YsU4dhFQFmrX/D3zuc9Q5RWYE+Vw==
=ayC4
-----END PGP SIGNATURE-----

--------------jo0DPslVwukZ8Nf47CptpVH0--

