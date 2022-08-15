Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07E5592F30
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 14:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387429.623649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNZVN-0006Dz-3G; Mon, 15 Aug 2022 12:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387429.623649; Mon, 15 Aug 2022 12:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNZVM-0006BH-V0; Mon, 15 Aug 2022 12:47:40 +0000
Received: by outflank-mailman (input) for mailman id 387429;
 Mon, 15 Aug 2022 12:47:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dGwN=YT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNZVM-0006BB-C2
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 12:47:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71ad696a-1c98-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 14:47:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5DA9D372E1;
 Mon, 15 Aug 2022 12:47:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 363CF13A99;
 Mon, 15 Aug 2022 12:47:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QMOzC2pA+mLjMwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 15 Aug 2022 12:47:38 +0000
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
X-Inumbo-ID: 71ad696a-1c98-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660567658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UwxqDYA4SctXdhPnFD3Ygn4LP6jKcoAWye8zSWC3EVs=;
	b=VHPEV3CG62x3TLLsW3MEwNcYsF9D3DtWW2WqGcBLLVw4Pku4FHKF24h3Agn6EqYUjMAqwl
	JOnWcj3DDc6zdLZDFaWBiC0QC5C29NCgW3TajA2UTmTAcdx3k3JIFD7aPO6FMrBDN3CLc7
	dLf3dVBYArV/WolszE6j/+uP7sreIuY=
Message-ID: <813693ca-f9ff-a2da-ba92-d695d48ce012@suse.com>
Date: Mon, 15 Aug 2022 14:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-3-jgross@suse.com>
 <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
 <3366d1e0-84dd-15af-417d-dd3633a09f4b@suse.com>
 <d55c6d62-8ee1-b1a9-94be-5798ed1878b5@suse.com>
 <a77660b5-7fde-0be1-98be-d7213a4e76cb@suse.com>
 <55ef3754-f893-29fb-8504-27a309a9edec@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
In-Reply-To: <55ef3754-f893-29fb-8504-27a309a9edec@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1CSxAiVmvDVKKKbXRYWRNCJ2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1CSxAiVmvDVKKKbXRYWRNCJ2
Content-Type: multipart/mixed; boundary="------------lTqfzaP4w0oc0MkRfrfJ0biu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Message-ID: <813693ca-f9ff-a2da-ba92-d695d48ce012@suse.com>
Subject: Re: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-3-jgross@suse.com>
 <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
 <3366d1e0-84dd-15af-417d-dd3633a09f4b@suse.com>
 <d55c6d62-8ee1-b1a9-94be-5798ed1878b5@suse.com>
 <a77660b5-7fde-0be1-98be-d7213a4e76cb@suse.com>
 <55ef3754-f893-29fb-8504-27a309a9edec@suse.com>
In-Reply-To: <55ef3754-f893-29fb-8504-27a309a9edec@suse.com>

--------------lTqfzaP4w0oc0MkRfrfJ0biu
Content-Type: multipart/mixed; boundary="------------u3i3A2t010GlDvRBbF0l2Xf1"

--------------u3i3A2t010GlDvRBbF0l2Xf1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDguMjIgMTQ6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wOC4yMDIy
IDE0OjE2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTUuMDguMjIgMTQ6MDAsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE1LjA4LjIwMjIgMTM6NTUsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDE1LjA4LjIyIDEzOjUyLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDE1LjA4LjIwMjIgMTM6MDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4+Pj4+PiArKysgYi94ZW4vY29t
bW9uL3NjaGVkL2NvcmUuYw0KPj4+Pj4+IEBAIC0zMjM3LDYgKzMyMzcsNjUgQEAgb3V0Og0K
Pj4+Pj4+ICAgICAgICAgcmV0dXJuIHJldDsNCj4+Pj4+PiAgICAgfQ0KPj4+Pj4+ICAgICAN
Cj4+Pj4+PiArc3RhdGljIHN0cnVjdCBjcHVfcm1fZGF0YSAqc2NoZWR1bGVfY3B1X3JtX2Fs
bG9jKHVuc2lnbmVkIGludCBjcHUpDQo+Pj4+Pj4gK3sNCj4+Pj4+PiArICAgIHN0cnVjdCBj
cHVfcm1fZGF0YSAqZGF0YTsNCj4+Pj4+PiArICAgIGNvbnN0IHN0cnVjdCBzY2hlZF9yZXNv
dXJjZSAqc3I7DQo+Pj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgaWR4Ow0KPj4+Pj4+ICsNCj4+
Pj4+PiArICAgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsNCj4+Pj4+PiAr
DQo+Pj4+Pj4gKyAgICBzciA9IGdldF9zY2hlZF9yZXMoY3B1KTsNCj4+Pj4+PiArICAgIGRh
dGEgPSB4bWFsbG9jX2ZsZXhfc3RydWN0KHN0cnVjdCBjcHVfcm1fZGF0YSwgc3IsIHNyLT5n
cmFudWxhcml0eSAtIDEpOw0KPj4+Pj4+ICsgICAgaWYgKCAhZGF0YSApDQo+Pj4+Pj4gKyAg
ICAgICAgZ290byBvdXQ7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgZGF0YS0+b2xkX29wcyA9
IHNyLT5zY2hlZHVsZXI7DQo+Pj4+Pj4gKyAgICBkYXRhLT52cHJpdl9vbGQgPSBpZGxlX3Zj
cHVbY3B1XS0+c2NoZWRfdW5pdC0+cHJpdjsNCj4+Pj4+PiArICAgIGRhdGEtPnBwcml2X29s
ZCA9IHNyLT5zY2hlZF9wcml2Ow0KPj4+Pj4NCj4+Pj4+IFJlcGVhdGluZyBhIHYxIGNvbW1l
bnQ6DQo+Pj4+Pg0KPj4+Pj4gIkF0IGxlYXN0IGZyb20gYW4gYWJzdHJhY3QgcGVyc3BlY3Rp
dmUsIGRvZXNuJ3QgcmVhZGluZyBmaWVsZHMgZnJvbQ0KPj4+Pj4gICAgIHNyIHJlcXVpcmUg
dGhlIFJDVSBsb2NrIHRvIGJlIGhlbGQgY29udGludW91c2x5IChpLmUuIG5vdCBkcm9wcGlu
Zw0KPj4+Pj4gICAgIGl0IGF0IHRoZSBlbmQgb2YgdGhpcyBmdW5jdGlvbiBhbmQgcmUtYWNx
dWlyaW5nIGl0IGluIHRoZSBjYWxsZXIpPyINCj4+Pj4+DQo+Pj4+PiBJbml0aWFsbHkgSSB0
aG91Z2h0IHlvdSBkaWQgcmVzcG9uZCB0byB0aGlzIGluIHNvbWUgd2F5LCBidXQgd2hlbg0K
Pj4+Pj4gbG9va2luZyBmb3IgYSBtYXRjaGluZyByZXBseSBJIGNvdWxkbid0IGZpbmQgb25l
Lg0KPj4+Pg0KPj4+PiBPaCwgc29ycnkuDQo+Pj4+DQo+Pj4+IFRoZSBSQ1UgbG9jayBpcyBw
cm90ZWN0aW5nIG9ubHkgdGhlIHNyLCBub3QgYW55IGRhdGEgcG9pbnRlcnMgaW4gdGhlIHNy
DQo+Pj4+IGFyZSByZWZlcmVuY2luZy4gU28gaXQgaXMgZmluZSB0byBkcm9wIHRoZSBSQ1Ug
bG9jayBhZnRlciByZWFkaW5nIHNvbWUNCj4+Pj4gb2YgdGhlIGZpZWxkcyBmcm9tIHRoZSBz
ciBhbmQgc3RvcmluZyBpdCBpbiB0aGUgY3B1X3JtX2RhdGEgbWVtb3J5Lg0KPj4+DQo+Pj4g
SG1tLCBpbnRlcmVzdGluZy4gIlByb3RlY3Rpbmcgb25seSB0aGUgc3IiIHRoZW4gbWVhbnMg
d2hhdCBleGFjdGx5Pw0KPj4+IEp1c3QgaXRzIGFsbG9jYXRpb24sIGJ1dCBub3QgaXRzIGNv
bnRlbnRzPw0KPj4NCj4+IENvcnJlY3QuDQo+Pg0KPj4+IFBsdXMgaXQncyBub3QganVzdCB0
aGUgcG9pbnRlcnMgLSBzci0+Z3JhbnVsYXJpdHkgYWxzbyB3b3VsZCBiZXR0ZXIgbm90DQo+
Pj4gaW5jcmVhc2UgaW4gdGhlIG1lYW50aW1lIC4uLiBRdWl0ZSBsaWtlbHkgdGhlcmUncyBh
IHJlYXNvbiB3aHkgdGhhdCBhbHNvDQo+Pj4gY2Fubm90IGhhcHBlbiwgeWV0IGV2ZW4gdGhl
biBJIHRoaW5rIGEgYnJpZWYgY29kZSBjb21tZW50IG1pZ2h0IGJlDQo+Pj4gaGVscGZ1bCBo
ZXJlLg0KPj4NCj4+IE9rYXksIHdpbGwgYWRkIHNvbWV0aGluZyBsaWtlOg0KPj4NCj4+ICJC
ZXR3ZWVuIHNjaGVkdWxlX2NwdV9ybV9hbGxvYygpIGFuZCB0aGUgcmVhbCBjcHUgcmVtb3Zh
bCBhY3Rpb24gdGhlIHJlbGV2YW50DQo+PiAgICBjb250ZW50cyBvZiBzdHJ1Y3Qgc2NoZWRf
cmVzb3VyY2UgY2FuJ3QgY2hhbmdlLCBhcyB0aGUgY3B1IGluIHF1ZXN0aW9uIGlzDQo+PiAg
ICBsb2NrZWQgYWdhaW5zdCBhbnkgb3RoZXIgbW92ZW1lbnQgdG8gb3IgZnJvbSBjcHVwb29s
cywgYW5kIHRoZSBkYXRhIGNvcGllZA0KPj4gICAgYnkgc2NoZWR1bGVfY3B1X3JtX2FsbG9j
KCkgaXMgY3B1cG9vbCBzcGVjaWZpYy4iDQo+Pg0KPj4gSXMgdGhhdCBva2F5Pw0KPiANCj4g
V2VsbCwgSSBndWVzcyBJIG5lZWQgdG8gbGVhdmUgdGhpcyB0byB0aGUgc2NoZWR1bGVyIG1h
aW50YWluZXJzIHRoZW4uIEkNCj4gaGF2ZSB0byBhZG1pdCB0aGF0IGl0J3Mgbm90IGNsZWFy
IHRvIG1lIHdoeSBhbGwgb2Ygc3ItPmdyYW51bGFyaXR5LA0KPiBzci0+c2NoZWR1bGVyLCBv
ciBzci0+c2NoZWRfcHJpdiB3b3VsZCBiZSAiY3B1cG9vbCBzcGVjaWZpYyIuIEkgbWF5IGJl
DQoNCnNyLT5zY2hlZHVsZXIgaXMgdGhlIHBvaW50ZXIgdG8gdGhlIHNjaGVkdWxlciBvcHMg
YXJyYXkgd2hpY2ggaXMgc2V0IHdoZW4NCmEgY3B1IGlzIGFkZGVkIHRvIGEgY3B1cG9vbCAo
dGhlIHNjaGVkdWxlciBpcyBhIGNwdXBvb2wgcHJvcGVydHkpLiBUaGUgc2FtZQ0KYXBwbGll
cyB0byBzci0+Z3JhbnVsYXJpdHk6IHRoaXMgdmFsdWUgaXMgcGVyLWNwdXBvb2wsIHRvby4g
c3ItPnNjaGVkX3ByaXYNCmlzIG9ubHkgY2hhbmdlZCB3aGVuIGEgY3B1IGlzIGFkZGVkIHRv
IG9yIHJlbW92ZWQgZnJvbSBhIGNwdXBvb2wsIGFzIHRoaXMNCmlzIHRoZSBwZXItY3B1IGRh
dGEgb2YgYSBzY2hlZHVsZXIsIHdoaWNoIG5lZWRzIHRvIHN0YXkgd2hlbiBzY2hlZHVsaW5n
IGlzDQpoYXBwZW5pbmcgb24gdGhlIGNwdSwgdGh1cyBpdCBpcyBhbGxvd2VkIHRvIGJlIHJl
bW92ZWQgb25seSBpbiBjYXNlIHRoZQ0KY3B1IGlzIHJlbW92ZWQgZnJvbSBvciBhZGRlZCB0
byB0aGUgY3B1cG9vbC4NCg0KPiBhYmxlIHRvIGFncmVlIGZvciBzci0+Z3JhbnVsYXJpdHks
IGJ1dCB0aGUgb3RoZXIgdHdvIEkgdGhvdWdodCB3YXMNCj4gc2NoZWR1bGVyIGRhdGEsIG5v
dCBjcHVwb29sIGRhdGEuIEZvciBzci0+Z3JhbnVsYXJpdHkgaW4gdHVybiAoYnV0DQo+IHBl
cmhhcHMgYWxzbyB0aGUgb3RoZXIgdHdvIGZpZWxkcykgaXQncyBub3Qgb2J2aW91cyB0byBt
ZSB0aGF0IHBvb2wNCj4gcHJvcGVydGllcyBjYW4ndCBjaGFuZ2UgaW4gYSByYWNpbmcgbWFu
bmVyLg0KDQpUaGV5IGNhbid0LiBPdGhlcndpc2UgdGhlIHNjaGVkdWxlciB3b3VsZCBleHBs
b2RlLg0KDQoNCkp1ZXJnZW4NCg==
--------------u3i3A2t010GlDvRBbF0l2Xf1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------u3i3A2t010GlDvRBbF0l2Xf1--

--------------lTqfzaP4w0oc0MkRfrfJ0biu--

--------------1CSxAiVmvDVKKKbXRYWRNCJ2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL6QGkFAwAAAAAACgkQsN6d1ii/Ey/5
YQf/dMNdo+rF5s+AQM/aPdLkGwf46sfD2+51/s/EhOG1DEBPPfQlN2So90UF2zuo35tbpVGnsHUc
sayBBnwSSP23IU1Op91NN6Hx6nxu2zvSoc/dj1b69r5elkv/IdZQOQtrG8Z0dUkFSW2pzzDqkikx
oprDXnza5OYXWhy4FTmHE4LiHtrwf0TJAJ5IvnWlEwRro579jD52MTOb7mdr1tKCekXuG7Cn1/Az
L0OqJ3Ija0EehGgKX82iUVuFdoevPd53N4ZFT85d6RMq6RiF4O2J0JHdVdJ9eiKtjPzEzF0E6dDd
c0f97YRbBQ9sZg32OAR8I82NBqGtEiQaKeO27ynQ5g==
=TS9y
-----END PGP SIGNATURE-----

--------------1CSxAiVmvDVKKKbXRYWRNCJ2--

