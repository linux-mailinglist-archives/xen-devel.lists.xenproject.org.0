Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072FE63ED47
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 11:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450442.707699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0gVe-0000oZ-6F; Thu, 01 Dec 2022 10:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450442.707699; Thu, 01 Dec 2022 10:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0gVe-0000mI-3Y; Thu, 01 Dec 2022 10:09:38 +0000
Received: by outflank-mailman (input) for mailman id 450442;
 Thu, 01 Dec 2022 10:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p0gVc-0000lb-MH
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 10:09:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76085a72-715f-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 11:04:31 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD74421B14;
 Thu,  1 Dec 2022 10:08:23 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6AF4E1320E;
 Thu,  1 Dec 2022 10:08:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id YZ6UGBd9iGOVIgAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 01 Dec 2022 10:08:23 +0000
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
X-Inumbo-ID: 76085a72-715f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669889303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/Zy+CCybaDxKp3aYPioeisvRI5M/wfIgvCuWi1qCd0=;
	b=bZuJ6/QCgvZmP9sepNM1tUVJP3IcM2Y0cFgvKLLzKUK+6OwO4v5xGw3dBPYZMWeODD0aTN
	18fE8ig4txCGwfbfKtRA255+T1Nfj9u8z4cm41LunL5uN8On5kMD2p8QEMCm50s9fXHMP2
	VfW2BKkzi469ATn/13gIeN16/3GrI34=
Message-ID: <99df302d-8bc5-55a7-a97e-dcc8eee41d2c@suse.com>
Date: Thu, 1 Dec 2022 11:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 5/5] CODING_STYLE: add .clang-format
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Edwin Torok <edvin.torok@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
 <7e6b8e69-70d2-8178-205d-8c20b993162d@xen.org>
 <7DF6F06F-A65A-4F1F-8FDA-BF0E8977F99B@citrix.com>
 <c3af2730-d503-e139-644a-480a506c94d1@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <c3af2730-d503-e139-644a-480a506c94d1@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VcZ4mFgyNRyaOYbtg3Dj0Bzp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VcZ4mFgyNRyaOYbtg3Dj0Bzp
Content-Type: multipart/mixed; boundary="------------uEZlWcCemTvvAzs5yw01WbMq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Edwin Torok <edvin.torok@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <99df302d-8bc5-55a7-a97e-dcc8eee41d2c@suse.com>
Subject: Re: [PATCH v1 5/5] CODING_STYLE: add .clang-format
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
 <7e6b8e69-70d2-8178-205d-8c20b993162d@xen.org>
 <7DF6F06F-A65A-4F1F-8FDA-BF0E8977F99B@citrix.com>
 <c3af2730-d503-e139-644a-480a506c94d1@xen.org>
In-Reply-To: <c3af2730-d503-e139-644a-480a506c94d1@xen.org>

--------------uEZlWcCemTvvAzs5yw01WbMq
Content-Type: multipart/mixed; boundary="------------6joclWgJRjVdt5DtrZ2tPeSR"

--------------6joclWgJRjVdt5DtrZ2tPeSR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTIuMjIgMTA6MzEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gKCsgQSBmZXcgcGVv
cGxlKQ0KPiANCj4gT24gMDEvMTIvMjAyMiAwOToyMSwgRWR3aW4gVG9yb2sgd3JvdGU6DQo+
Pg0KPj4NCj4+PiBPbiAxIERlYyAyMDIyLCBhdCAwOToxMSwgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4NCj4+PiBIaSBFZHdpbiwNCj4+Pg0KPj4+IFRoZSB0
aXRsZSBzaG91bGQgaGF2ZSAiT0NhbWwiIHRvIGNsYXJpZnkgdGhhdCAuY2xhbmctZm9ybWF0
IGlzIG5vdCBhZGRlZCBhdCANCj4+PiB0aGUgcm9vdCBsZXZlbC4NCj4+Pg0KPj4NCj4+IFN1
cmUsIEknbGwgdXBkYXRlIHRoYXQgd2hlbiBJIHJlc2VuZC4NCj4+DQo+Pj4gT24gMzAvMTEv
MjAyMiAxNzozMiwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4+Pj4gQWRkIGEgLmNsYW5nLWZv
cm1hdCBjb25maWd1cmF0aW9uIHRoYXQgdHJpZXMgdG8gbWF0Y2ggQ09ESU5HX1NUWUxFIHdo
ZXJlDQo+Pj4+IHBvc3NpYmxlLg0KPj4+PiBJIHdhcyBub3QgYWJsZSB0byBleHByZXNzIHRo
ZSBzcGVjaWFsIGNhc2luZyBvZiBicmFjZXMgYWZ0ZXIgJ2RvJw0KPj4+PiB0aG91Z2gsIHRo
aXMgY2FuIG9ubHkgYmUgY29udHJvbGxlZCBnZW5lcmFsbHkgZm9yIGFsbCBjb250cm9sDQo+
Pj4+IHN0YXRlbWVudHMuDQo+Pj4+IEl0IGlzIGltcGVyZmVjdCwgYnV0IHNob3VsZCBiZSBi
ZXR0ZXIgdGhhbiB0aGUgZXhpc3RpbmcgYmluZGluZ3MsIHdoaWNoDQo+Pj4+IGRvIG5vdCBm
b2xsb3cgWGVuIGNvZGluZyBzdHlsZS4NCj4+Pg0KPj4+IFJpZ2h0LCBmcm9tIHByZXZpb3Vz
IGRpc2N1c3Npb24sIEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgaXQgcmVxdWly
ZXMgDQo+Pj4gc29tZSB3b3JrIHRvIHdyaXRlIGEgY2xhbmctZm9ybWF0IGZpbGUgZm9yIFhl
bi4NCj4+Pg0KPj4+IEkgYW0gaG9wZWZ1bCB0aGF0IHNvbWUgZGF5IHdlIHdpbGwgaGF2ZSBh
IHByb3BlciBvbmUuIEluIGZhY3QsIHdlIGhhdmUgYmVlbiANCj4+PiBkaXNjdXNzaW5nIGFi
b3V0IHRoaXMgYXMgcGFydCBvZiBNSVNSQSAoKyBTdGVmYW5vKS4NCj4+Pg0KPj4+PiBBZGQg
dGhpcyB0byB0b29scy9vY2FtbCBmaXJzdCBiZWNhdXNlOg0KPj4+PiAqIHRoZXJlIGFyZSBy
ZWxhdGl2ZWx5IGZldyBDIGZpbGVzIGhlcmUsIGFuZCBpdCBpcyBhIGdvb2QgcGxhY2UgdG8g
c3RhcnQgd2l0aA0KPj4+PiAqIGl0J2QgYmUgdXNlZnVsIHRvIG1ha2UgdGhlc2UgZm9sbG93
IFhlbidzIENPRElOR19TVFlMRQ0KPj4+PiAod2hpY2ggdGhleSBjdXJyZW50bHkgZG8gbm90
IGJlY2F1c2UgdGhleSB1c2UgdGFicyBmb3IgZXhhbXBsZSkNCj4+Pj4gKiB0aGV5IGNoYW5n
ZSByZWxhdGl2ZWx5IGluZnJlcXVlbnRseSwgc28gc2hvdWxkbid0IGNhdXNlIGlzc3VlcyB3
aXRoDQo+Pj4+IMKgwqAgYmFja3BvcnRpbmcgc2VjdXJpdHkgZml4ZXMgKGNvdWxkIGVpdGhl
ciBiYWNrcG9ydCB0aGUgcmVpbmRlbnRhdGlvbg0KPj4+PiDCoMKgIHBhdGNoIHRvbywgb3Ig
dXNlIGdpdCBjaGVycnktcGljayB3aXRoIGAtWGlnbm9yZS1zcGFjZS1jaGFuZ2VgKQ0KPj4+
PiBPbmNlIHRoaXMgaXMgdXNlZCBpdCdsbCBuZWVkIGluc2VydGluZyBzb21lICcjaW5jbHVk
ZSA8c3RkaW50Lmg+Jywgb3RoZXJ3aXNlIA0KPj4+PiB4c193aXJlLmgNCj4+Pj4gZmFpbHMg
dG8gY29tcGlsZSBkdWUgdG8gdGhlIG1pc3NpbmcgdWludDMyX3QgZGVmaW5lLg0KPj4+DQo+
Pj4gQXQgZmlyc3QgSSB3YXMgYSBiaXQgY29uY2VybmVkIHdpdGggdGhpcyBwYXJhZ3JhcGgg
YmVjYXVzZSBhIGNvZGluZyBzdHlsZSANCj4+PiBzaG91bGQgbm90IGltcGFjdCBjb21waWxh
dGlvbi4gQnV0IEkgZ3Vlc3MgdGhhdCdzIGJlY2F1c2UgdGhlIGZvcm1hdCB3aWxsIA0KPj4+
IGNvbnZlcnQgdTMyIHRvIHVpbnQzMl90LiBJcyB0aGF0IGNvcnJlY3Q/DQo+Pj4NCj4+PiBJ
ZiBzbywgSSB3b3VsZCBleHBhbmQgdGhlIHBhcmFncmFwaCB0byBleHBsaWNpdCBzYXkgdGhh
dCwgcGVyIHRoZSBjb2RpbmcgDQo+Pj4gc3R5ZWwsIHUzMiB3aWxsIGJlIGNvbnZlcnRlZCB0
byB1aW50MzJfdC4NCj4+DQo+Pg0KPj4gY2xhbmctZm9ybWF0IHJlYXJyYW5nZXMgdGhlIG9y
ZGVyIG9mICcjaW5jbHVkZScgaW4gQyBmaWxlcywgaXQgc2hvdWxkbid0IA0KPj4gY29udmVy
dCB0eXBlcy4NCj4+IEJ1dCByZWFycmFuZ2luZyAoc29ydGluZykgaW5jbHVkZXMgY2FuIHNv
bWV0aW1lcyByZXZlYWwgYnVncyB3aGVyZSB0aGUgY29kZSANCj4+IG9ubHkgaGFwcGVuZWQg
dG8gY29tcGlsZSBiZWNhdXNlIHRoZSBpbmNsdWRlcyB3ZXJlIGRvbmUgaW4gYSBjZXJ0YWlu
IG9yZGVyDQo+PiAoZS5nLiB3ZSBpbmNsdWRlZCBzb21ldGhpbmcgdGhhdCBpbmNsdWRlZCBz
dGRpbnQuaCwgdGhlcmVmb3JlIHRoZSBuZXh0IGluY2x1ZGUgDQo+PiBsaW5lIHdvcmtlZCwg
YnV0IGlmIHlvdSBzd2FwIHRoZSBpbmNsdWRlIG9yZGVyIHRoYXQgbm8gbG9uZ2VyIHdvcmtz
KSwgaS5lLjoNCj4+DQo+PiAjaW5jbHVkZSAiYy5oIg0KPj4gI2luY2x1ZGUgImIuaCINCj4+
DQo+PiB2cw0KPj4NCj4+IC8qIHBvc3QgZm9ybWF0dGluZyAqLw0KPj4gI2luY2x1ZGUgImIu
aCINCj4+ICNpbmNsdWRlICJjLmgiDQo+Pg0KPj4gV2hlcmUgYy5oIGluY2x1ZGVzIGEuaCwg
YW5kIGIuaCBkZXBlbmRzIG9uIGRlY2xhcmF0aW9ucyBmcm9tIGEuaCwgdGhlbiBwcmlvciAN
Cj4+IHRvIHJlZm9ybWF0IHRoZSBjb2RlIGNvbXBpbGVzLCBhbmQgYWZ0ZXJ3YXJkcyBpdCBk
b2Vzbid0Lg0KPiBUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBpbmZvcm1hdGlvbiwgSSB0aGlu
ayBzb21lIG9mIGl0IG5lZWRzIHRvIGJlIHN1bW1hcml6ZWQgDQo+IGluIHRoZSBjb21tbWl0
IG1lc3NhZ2UuDQo+IA0KPj4NCj4+IFdoaWNoIGNhbiBiZSBmaXhlZCBieSBhZGRpbmcgdGhp
cyB0byB0aGUgQyBmaWxlIChhbmQgdGhlbiByZWdhcmRsZXNzIG9mIA0KPj4gaW5jbHVkZSBv
cmRlciBvZiB0aGUgb3RoZXIgMiBpdCBjb21waWxlcyk6DQo+PiAjaW5jbHVkZSA8YS5oPg0K
PiBUaGlzIHdvdWxkIG5vdCB3b3JrIGlmIHRoZSBmaWxlIHdlcmUgY2FsbGVkICJkLmgiIHJh
dGhlciB0aGFuICJhLmgiIGJlY2F1c2UgdGhlIA0KPiBjbGFuZyBmb3JtYXQgd291bGQgcmUt
b3JkZXIgaXQuIFNvLi4uDQo+IA0KPj4NCj4+IE9yIGJ5IGZpeGluZyBiLmggdG8gaW5jbHVk
ZSBhLmggaXRzZWxmIGl0IGl0IGRlcGVuZHMgb24gaXQuDQo+IA0KPiAuLi4gdGhpcyBpcyB0
aGUgcHJvcGVyIHdheSB0byBmaXggaXQuDQo+IA0KPj4NCj4+IFBlcmhhcHMgdGhpcydkIGJl
dHRlciBiZSBmaXhlZCBpbiB4c193aXJlLmggaXRzZWxmIHRvIGluY2x1ZGUgYWxsIGl0cyAN
Cj4+IGRlcGVuZGVuY2llcywgYnV0IHRoYXQgaXMgYSBwdWJsaWNseSBpbnN0YWxsZWQgaGVh
ZGVyLCBhbmQgdGhlcmUgbWlnaHQgYmUgYSANCj4+IHJlYXNvbiB3aHkgaXQgZG9lc24ndCBp
bmNsdWRlIHN0ZGludC5oLg0KPiANCj4gSSBhbSBub3QgYXdhcmUgb2YgYW55IHJlc3RyaWN0
aW9ucyBhbmQgYXQgbGVhc3Qgb25lIHB1YmxpYyBoZWFkZXJzIGFscmVhZHkgDQo+IGluY2x1
ZGUgPHN0ZGludC5oPi4gSSBhbSBDQ2VkIGEgZmV3IG1vcmUgcGVvcGxlIHRvIGdldCBhbiBv
cGluaW9uLg0KDQpJIGRvbid0IHRoaW5rIHhzX3dpcmUuaCBzaG91bGQgaW5jbHVkZSBzdGRp
bnQuaC4gVGhpcyB3aWxsIHJlc3VsdCBpbiBhIGNvbmZsaWN0DQplLmcuIGluIHRoZSBMaW51
eCBrZXJuZWwuDQoNCldlIG1pZ2h0IHdhbnQgdG8gYWRkIGEgY29tbWVudCB0byB4c193aXJl
LmggbGlrZSB0aGUgb25lIGluIHJpbmcuaCBpbiBvcmRlciB0bw0KZG9jdW1lbnQgdGhlIHJl
cXVpcmVtZW50IG9mIHRoZSB0eXBlIGRlZmluaXRpb24gb2YgdWludDMyX3QuDQoNCg0KSnVl
cmdlbg0KDQo=
--------------6joclWgJRjVdt5DtrZ2tPeSR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------6joclWgJRjVdt5DtrZ2tPeSR--

--------------uEZlWcCemTvvAzs5yw01WbMq--

--------------VcZ4mFgyNRyaOYbtg3Dj0Bzp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOIfRcFAwAAAAAACgkQsN6d1ii/Ey9V
5wf/ZnxIJN6898f+iZ4NH49cJUQT2IhUTH3Oqn2F9ooBSX4kQGZeC92YZKrkkiJV9MC/nP2DwkId
hRXU5OZVbTH5jHOjfa/ocOGNYBPJz/7dHB37//gUMq18AYrTEWoZL/1dsn08ax2h9dlvTCGm1Y9/
q4dZ404z6waNMIvx0ymmllxj8gNUhEK5TTRvpWGtumaVEMnIeBm/jA5QY3xd1Srn4lrND/HwoHA6
Bqbpwgz5zP7C17L8yO5+XivkzqEfJ7U6WIrTWZC5LHN6yXLcPViBHgJ7chTxLhY606ee1mieT8rf
XuQYptlD1wqZJ6DZSGZLLMzwH//e6myZeu7zEkgJ2Q==
=L1JK
-----END PGP SIGNATURE-----

--------------VcZ4mFgyNRyaOYbtg3Dj0Bzp--

