Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A593776688D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 11:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571404.895148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPJY1-0007rh-W3; Fri, 28 Jul 2023 09:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571404.895148; Fri, 28 Jul 2023 09:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPJY1-0007pj-SH; Fri, 28 Jul 2023 09:14:09 +0000
Received: by outflank-mailman (input) for mailman id 571404;
 Fri, 28 Jul 2023 09:14:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qPJXz-0007pa-S5
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 09:14:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a34101e-2d27-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 11:14:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E885A1F8AB;
 Fri, 28 Jul 2023 09:14:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C3AC3133F7;
 Fri, 28 Jul 2023 09:14:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /4PsLd2Gw2SbAgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Jul 2023 09:14:05 +0000
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
X-Inumbo-ID: 1a34101e-2d27-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690535645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dynrXdPOybJ8vPvETPaBxnwQPadMvLY3UhbY+3rbcZY=;
	b=OAQ8bicK1bi6+6FSuFVzSzzuHVeTZ2fNcTp4X2IOtvz/IGWE3Sdy0rDWzJcuEmvaLv3SHe
	FsCpV9ici5RpKQWaSbdq0sqgFYYlyk8i484gEVfjZ2UXZLSioj3iOfTiFZq3Erw6ZHIk2x
	d+Wt2tDdapWASMo/u2/svHKq7pt8wBk=
Message-ID: <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
Date: Fri, 28 Jul 2023 11:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
In-Reply-To: <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RDf00EGpAcPjS0WvMTA3CrDp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RDf00EGpAcPjS0WvMTA3CrDp
Content-Type: multipart/mixed; boundary="------------GuqO5dN1Ye0P1OfZ4LkLc3Pv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
In-Reply-To: <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>

--------------GuqO5dN1Ye0P1OfZ4LkLc3Pv
Content-Type: multipart/mixed; boundary="------------vU27p10zeRQAOUYSZ9MAvHJo"

--------------vU27p10zeRQAOUYSZ9MAvHJo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDcuMjMgMTA6NTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI4LzA3LzIwMjMgMDc6MjMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyNy4wNy4yMyAyMzo1MywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAyNC8wNy8yMDIzIDEyOjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBTdHJ1Y3QgeHNfdGRiX3JlY29yZF9oZHIgaXMgdXNlZCBmb3Igbm9kZXMgc3RvcmVk
IGluIHRoZSBkYXRhIGJhc2UuDQo+Pj4+IFdoZW4gd29ya2luZyBvbiBhIG5vZGUsIHN0cnVj
dCBub2RlIGlzIGJlaW5nIHVzZWQsIHdoaWNoIGlzIGluY2x1ZGluZw0KPj4+PiB0aGUgc2Ft
ZSBpbmZvcm1hdGlvbiBhcyBzdHJ1Y3QgeHNfdGRiX3JlY29yZF9oZHIsIGJ1dCBpbiBhIGRp
ZmZlcmVudA0KPj4+PiBmb3JtYXQuIFJld29yayBzdHJ1Y3QgeHNfdGRiX3JlY29yZF9oZHIg
aW4gb3JkZXIgdG8gcHJlcGFyZSBpbmNsdWRpbmcNCj4+Pj4gaXQgaW4gc3RydWN0IG5vZGUu
DQo+Pj4+DQo+Pj4+IERvIHRoZSBmb2xsb3dpbmcgbW9kaWZpY2F0aW9uczoNCj4+Pj4NCj4+
Pj4gLSBtb3ZlIGl0cyBkZWZpbml0aW9uIHRvIHhlbnN0b3JlZF9jb3JlLmgsIGFzIHRoZSBy
ZWFzb24gdG8gcHV0IGl0IGludG8NCj4+Pj4gwqDCoCB1dGlscy5oIGFyZSBubyBsb25nZXIg
ZXhpc3RpbmcNCj4+Pj4NCj4+Pj4gLSByZW5hbWUgaXQgdG8gc3RydWN0IG5vZGVfaGRyLCBh
cyB0aGUgInRkYiIgaW4gaXRzIG5hbWUgaGFzIG9ubHkNCj4+Pj4gwqDCoCBoaXN0b3JpY2Fs
IHJlYXNvbnMNCj4+Pj4NCj4+Pj4gLSByZXBsYWNlIHRoZSBlbXB0eSBwZXJtaXNzaW9uIGFy
cmF5IGF0IHRoZSBlbmQgd2l0aCBhIGNvbW1lbnQgYWJvdXQNCj4+Pj4gwqDCoCB0aGUgbGF5
b3V0IG9mIGRhdGEgaW4gdGhlIGRhdGEgYmFzZSAoY29uY2F0ZW5hdGlvbiBvZiBoZWFkZXIs
DQo+Pj4+IMKgwqAgcGVybWlzc2lvbnMsIG5vZGUgY29udGVudHMsIGFuZCBjaGlsZHJlbiBs
aXN0KQ0KPj4+Pg0KPj4+PiAtIHVzZSBuYXJyb3dlciB0eXBlcyBmb3IgbnVtX3Blcm1zIGFu
ZCBkYXRhbGVuLCBhcyB0aG9zZSBhcmUgbmF0dXJhbGx5DQo+Pj4+IMKgwqAgbGltaXRlZCB0
byBYRU5TVE9SRV9QQVlMT0FEX01BWCAoY2hpbGRsZW4gaXMgZGlmZmVyZW50IGhlcmUsIGFz
IGl0IGlzDQo+Pj4+IMKgwqAgaW4gdGhlb3J5IGJhc2ljYWxseSB1bmxpbWl0ZWQpDQo+Pj4N
Cj4+PiBUaGUgYXNzdW1wdGlvbiBpcyBYRU5TVE9SRV9QQVlMT0FEX01BWCB3aWxsIG5ldmVy
IGNoYW5nZSBhbmQvb3IgYWx3YXlzIGFwcGx5IA0KPj4+IGZvciBhbGwgdGhlIGNvbm5lY3Rp
b24uIEkgYW0gYXdhcmUgb2YgYXQgbGVhc3Qgb25lIGRvd25zdHJlYW0gdXNlIHdoZXJlIHRo
aXMgDQo+Pj4gaXMgbm90IHRoZSBjYXNlLg0KPj4+DQo+Pj4gSSBhbSBoYXBweSB0byB1c2Ug
bmFycm93ZXIgdHlwZXMsIGJ1dCBJIHdvdWxkIGF0IGxlYXN0IGxpa2Ugc29tZSBjaGVja3Mg
aW4gDQo+Pj4gWGVuc3RvcmUgdG8gZW5zdXJlIHRoZSBsaW1pdHMgYXJlIG5vdCByZWFjaGVk
Lg0KPj4NCj4+IEkgd2lsbCBhZGQgYSBCVUlMRF9CVUdfT04oKS4NCj4gDQo+IEluaXRpYWxs
eSBJIHdhcyB0aGlua2luZyBhYm91dCBhIHJ1bnRpbWUgY2hlY2ssIGJ1dCBJIGFtIGFsc28g
ZmluZSB3aXRoIGEgDQo+IEJVSUxEX0JVR19PTigpIGlmIGl0IGlzIHJpZ2h0IG5leHQgdG8g
bGVuZ3RoIGNoZWNrIGluIGhhbmRsZV9pbnB1dCgpLiBTbyBpZiANCj4gc29tZW9uZSBkZWNp
ZGVkIHRvIGFkZCBkaWZmZXJlbnQgcGF5bG9hZCBzaXplIGRlcGVuZGluZyBvbiB0aGUgZG9t
YWluIChzdWNoIGFzIA0KPiBwcml2aWxlZ2VkIGRvbWFpbiBjb3VsZCBkbyBtb3JlKSwgaXQg
d291bGQgYmUgZWFzaWVyIHRvIHNwb3Qgd2hhdCBlbHNlIG5lZWRzIHRvIA0KPiBiZSBjaGFu
Z2VkLg0KDQpJcyB0aGlzIHJlYWxseSB0aGUgY29ycmVjdCBwbGFjZW1lbnQ/DQoNCkkndmUg
cHV0IGl0IGludG8gd3JpdGVfbm9kZV9yYXcoKSwgYXMgdGhpcyBpcyB3aGVyZSB0aGUgcmVs
YXRlZCBkYXRhbGVuIG1lbWJlcg0KaXMgYmVpbmcgZmlsbGVkLiBUaGlzIHBsYWNlbWVudCBo
YXMgdGhlIGZ1cnRoZXIgYWR2YW50YWdlIHRoYXQgSSBhbHJlYWR5IGhhdmUNCmEgcmVsYXRl
ZCBwb2ludGVyIGF0IGhhbmQsIHNvIEkgY2FuIHVzZToNCg0KCUJVSUxEX0JVR19PTihYRU5T
VE9SRV9QQVlMT0FEX01BWCA+PSAodHlwZW9mKGhkci0+ZGF0YWxlbikpKC0xKSk7DQoNCndo
aWNoIGlzIGV4YWN0bHkgd2hhdCBzaG91bGQgYmUgdGVzdGVkLg0KDQo+IA0KPj4+IE9PSSwg
ZG8geW91IGhhdmUgYSB1c2UgY2FzZSB3aGVyZSBhIG5vZGUgd291bGQgYmUgc2hhcmVkIHdp
dGggbW9yZSB0aGFuIDI1NSANCj4+PiBkb21haW5zPw0KPj4NCj4+IE5vLCBidXQgbGltaXRp
bmcgaXQgd291bGRuJ3QgZ2l2ZSBhbnkgcmVhbCBhZHZhbnRhZ2UuDQo+IA0KPiBJIGd1ZXNz
IGJ5IGFkdmFudGFnZSB5b3UgbWVhbiB0aGF0IHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3R1cmUg
d291bGQgc3RpbGwgYmUgdGhlIA0KPiBzYW1lLiBJIHRob3VnaHQgdGhpcyB3YXMgdGhlIHJh
dGlvbmFsZSBidXQgSSBhc2tlZCBqdXN0IGluIGNhc2UgeW91IGhhZCANCj4gc29tZXRoaW5n
IGVsc2UgaW4gbWluZC4gRm9yIGluc3RhbmNlLCBYZW4gdGVjaG5pY2FsbHkgc3VwcG9ydHMg
dXAgdG8gfjMyIDAwMCANCj4gZG9tYWlucy4gQnV0IEkgdGhpbmsgaXQgd291bGQgYmUgY3Jh
enkgdG8gZGVjaWRlIHRvIGhhdmUgbW9yZSB0aGFuIGEgZmV3IHRlbnMgDQo+IHBlcm1pc3Np
b25zIG9uIGEgbm9kZSA6KS4NCg0KWWVzIHRvIGJvdGguIE9UT0ggd2h5IHNob3VsZCB3ZSBk
ZW55IHRvIGFsbG93IHRoYXQgd2l0aG91dCBhbnkgdXJnZW50IG5lZWQgdG8gZG8NCnNvPw0K
DQoNCkp1ZXJnZW4NCg==
--------------vU27p10zeRQAOUYSZ9MAvHJo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------vU27p10zeRQAOUYSZ9MAvHJo--

--------------GuqO5dN1Ye0P1OfZ4LkLc3Pv--

--------------RDf00EGpAcPjS0WvMTA3CrDp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTDht0FAwAAAAAACgkQsN6d1ii/Ey8P
2Af9GTDQrvaS+2fZfHnn5zb4IfGYpW7/PlJwb5ftS4md5E8lMmu4XUH6Mq9BdkdPue3wd6hDMc4k
Bby3jHMimtQtnsi/aQYZuiJaDwoNtUfaMPHA8xmpdhz2sahjMgRJ01F4EYvZeq3d4dKe0Hk1euIo
hCXYec0pMrxssxNkTcLEgCojtXZk5ndbQsky41RuIfjvMlEqOYmI2h/Qmyts1VPQpw/Q0aS9C6bS
/aSvSfNmx2jz5+41Qi6VAJaBhTnwTct1Q60j7AZTUzhvAK7hdsd+x6658lw01Ohsg9wNH0+gsHPT
Kcizpn9axy7vKtLxWq5Wxy08LBqzdMeYswC8mIJIfw==
=Ntfe
-----END PGP SIGNATURE-----

--------------RDf00EGpAcPjS0WvMTA3CrDp--

