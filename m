Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843F25F558C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 15:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416230.660882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4Y9-0005gY-9U; Wed, 05 Oct 2022 13:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416230.660882; Wed, 05 Oct 2022 13:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4Y9-0005dk-6Y; Wed, 05 Oct 2022 13:35:01 +0000
Received: by outflank-mailman (input) for mailman id 416230;
 Wed, 05 Oct 2022 13:34:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1og4Y7-0005dX-Bc
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 13:34:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 813ae665-44b2-11ed-9377-c1cf23e5d27e;
 Wed, 05 Oct 2022 15:34:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CA89621908;
 Wed,  5 Oct 2022 13:34:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACD7C13345;
 Wed,  5 Oct 2022 13:34:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pu5eJAGIPWPRDQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Oct 2022 13:34:57 +0000
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
X-Inumbo-ID: 813ae665-44b2-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664976897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=El4JLMS24llyAZuKoBuUB2pklIvHUj7HOuT1FjTbuIw=;
	b=Ew2jY0UaBNTiHT8NJA6+zAzHvt41ltzubVv74zfFg1VRhGkLoRFGBCuF7cIvQ/6CGlWpNR
	qmiSucvvB0kmu916dVtOY8OqDgSa3+ZW+jlU9sB0/IPMbdkBKtIF4asjN4yKy8SRqeMWTY
	99npnS5NSffKlygOBqvszo7hhTDPwPo=
Message-ID: <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com>
Date: Wed, 5 Oct 2022 15:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com> <Yz2Fvp9Q9aeYKnDY@mail-itl>
From: Juergen Gross <jgross@suse.com>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
In-Reply-To: <Yz2Fvp9Q9aeYKnDY@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------idwQYzvS76ONej6N4uG0rw0v"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------idwQYzvS76ONej6N4uG0rw0v
Content-Type: multipart/mixed; boundary="------------L0Jox5dlCfIBqkZqf1rgmdvL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com> <Yz2Fvp9Q9aeYKnDY@mail-itl>
In-Reply-To: <Yz2Fvp9Q9aeYKnDY@mail-itl>

--------------L0Jox5dlCfIBqkZqf1rgmdvL
Content-Type: multipart/mixed; boundary="------------S0Ui21f7UEv7odRer5m6tL16"

--------------S0Ui21f7UEv7odRer5m6tL16
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTAuMjIgMTU6MjUsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gV2VkLCBPY3QgMDUsIDIwMjIgYXQgMDI6NTc6MDFQTSArMDIwMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+IE9uIDA1LjEwLjIyIDE0OjQxLCBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgd3JvdGU6DQo+Pj4gSGksDQo+Pj4NCj4+PiBXaGVuIGJvb3RpbmcgWGVuIHdp
dGggTGludXggZG9tMCBuZXN0ZWQgdW5kZXIgS1ZNLA0KPj4+IENPTkZJR19YRU5fVklSVElP
X0ZPUkNFX0dSQU5UPXkgbWFrZXMgaXQgdW5hYmxlIHRvIHVzZSB2aXJ0aW8gZGV2aWNlcw0K
Pj4+IHByb3ZpZGVkIGJ5IEwwIGh5cGVydmlzb3IgKEtWTSB3aXRoIHFlbXUpLiBXaXRoIFBW
IGRvbTAsIGdyYW50cyBhcmUNCj4+PiByZXF1aXJlZCBmb3IgdmlydGlvIGV2ZW4gaWYganVz
dCBDT05GSUdfWEVOX1ZJUlRJTyBpcyBlbmFibGVkLg0KPj4+DQo+Pj4gVGhpcyBpcyBwcm9i
YWJseSB1bmNvbW1vbiBjb3JuZXIgY2FzZSwgYnV0IG9uZSB0aGF0IGhhcyBiaXR0ZW4gbWUg
aW4gbXkNCj4+PiBDSSBzZXR1cC4uLiBJIHRoaW5rIFhlbiBzaG91bGQgc2V0IHNtYXJ0ZXIN
Cj4+PiB2aXJ0aW9fcmVxdWlyZV9yZXN0cmljdGVkX21lbV9hY2MoKSwgdGhhdCBlbmZvcmNl
cyBpdCBvbmx5IGZvciBkZXZpY2VzDQo+Pj4gcmVhbGx5IHByb3ZpZGVkIGJ5IGFub3RoZXIg
WGVuIFZNIChub3QgYnkgdGhlICJvdXRlciBob3N0IiksIGJ1dCBJJ20gbm90DQo+Pj4gc3Vy
ZSBob3cgdGhhdCBjb3VsZCBiZSBkb25lLiBBbnkgaWRlYXM/DQo+Pj4NCj4+DQo+PiBJdCBz
aG91bGQgYmUgcG9zc2libGUgdG8gYWRkIGEgYm9vdCBwYXJhbWV0ZXIgZm9yIHRoYXQgcHVy
cG9zZS4gVXNpbmcgaXQNCj4+IHdvdWxkIG9wZW4gYSBzZWN1cml0eSBob2xlLCB0aG91Z2gg
KGJhc2ljYWxseSBsaWtlIGFsbCBQQ0kgcGFzc3Rocm91Z2ggdG8NCj4+IFBWIGd1ZXN0cyku
DQo+IA0KPiBXaGF0IGFib3V0IGV4Y2x1ZGluZyBqdXN0IGRvbTA/IEF0IGxlYXN0IGN1cnJl
bnRseSwgdGhlcmUgaXMgbm8gd2F5IGZvcg0KPiBkb20wIHRvIHNlZSB2aXJ0aW8gZGV2aWNl
cyBwcm92aWRlZCBieSBhbm90aGVyIFhlbiBkb21VLg0KDQpFdmVuIG5vdCB2aWEgaG90cGx1
Zz8NCg0KPiANCj4gU29tZXRoaW5nIGxpa2UgdGhpczoNCj4gLS0tODwtLS0NCj4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxp
Z2h0ZW5fcHYuYw0KPiBpbmRleCA5YjFhNThkZGE5MzUuLjZhYzMyYjBiMzcyMCAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jDQo+ICsrKyBiL2FyY2gveDg2
L3hlbi9lbmxpZ2h0ZW5fcHYuYw0KPiBAQCAtMTExLDcgKzExMSw3IEBAIHN0YXRpYyBERUZJ
TkVfUEVSX0NQVShzdHJ1Y3QgdGxzX2Rlc2NzLCBzaGFkb3dfdGxzX2Rlc2MpOw0KPiAgIHN0
YXRpYyB2b2lkIF9faW5pdCB4ZW5fcHZfaW5pdF9wbGF0Zm9ybSh2b2lkKQ0KPiAgIHsNCj4g
ICAgICAgICAgLyogUFYgZ3Vlc3RzIGNhbid0IG9wZXJhdGUgdmlydGlvIGRldmljZXMgd2l0
aG91dCBncmFudHMuICovDQo+IC0gICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1hFTl9W
SVJUSU8pKQ0KPiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19YRU5fVklSVElPKSAm
JiAheGVuX2luaXRpYWxfZG9tYWluKCkpDQo+ICAgICAgICAgICAgICAgICAgdmlydGlvX3Nl
dF9tZW1fYWNjX2NiKHZpcnRpb19yZXF1aXJlX3Jlc3RyaWN0ZWRfbWVtX2FjYyk7DQo+ICAg
DQo+ICAgICAgICAgIHBvcHVsYXRlX2V4dHJhX3B0ZShmaXhfdG9fdmlydChGSVhfUEFSQVZJ
UlRfQk9PVE1BUCkpOw0KPiAtLS04PC0tLQ0KPiANCj4gVGhpcyBCVFcgcmFpc2VzIGFsc28g
YSBxdWVzdGlvbiB3aGF0IHdpbGwgaGFwcGVuIG9uIFhlbiBuZXN0ZWQgaW5zaWRlDQo+IFhl
biwgd2hlbiBMMCB3aWxsIHByb3ZpZGUgdmlydGlvIGRldmljZXMgdG8gTDEuIEdyYW50cyBz
ZXQgYnkgTDEgZG9tMA0KPiB3b3VsZG4ndCB3b3JrIG9uIEwwLCBubz8gT3IgbWF5YmUgdGhp
cyBpcyBzb2x2ZWQgYWxyZWFkeSBmb3IgcHYtc2hpbQ0KPiBjYXNlPw0KDQpUaGlzIGlzIGEg
c2ltaWxhciBwcm9ibGVtIGFzIHdpdGggbm9ybWFsIFhlbiBQViBkZXZpY2VzLg0KDQpZb3Ug
d2lsbCBuZWVkIGVpdGhlciBhIHNpbXBsZSBncmFudCBwYXNzdGhyb3VnaCBsaWtlIHdpdGgg
cHYtc2hpbSAoZW5hYmxpbmcNCnN1Y2ggZGV2aWNlcyBmb3Igb25lIGd1ZXN0IGluIEwxIG9u
bHkpLCBvciB5b3UgbmVlZCBhIGdyYW50IG11bHRpcGxleGVyIGluIEwxIA0KWGVuIGluIGNh
c2UgeW91IHdhbnQgdG8gYmUgYWJsZSB0byBoYXZlIG11bHRpcGxlIGd1ZXN0cyBpbiBMMSBi
ZWluZyBhYmxlIHRvDQp1c2UgTDAgUFYgZGV2aWNlcy4NCg0KDQpKdWVyZ2VuDQo=
--------------S0Ui21f7UEv7odRer5m6tL16
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------S0Ui21f7UEv7odRer5m6tL16--

--------------L0Jox5dlCfIBqkZqf1rgmdvL--

--------------idwQYzvS76ONej6N4uG0rw0v
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM9iAEFAwAAAAAACgkQsN6d1ii/Ey9C
gggAiWLErCG6HxC+qiLR8RFGLDDHFM2MVFQiHNkrlNV7xzfVOevDMUT31dy1R0IlZUEqObfFQ8dh
gOnSsA7w9JFo4YrKMkVddkfleSmtkn6GrNh3y3tM5EYDsNGkOguLd9Dp6l6avCuHST8es0DplINI
k2P4jxkAbpvArJ9u5mTP+pbbZ38M9ghCR31IJ3oYKlM8nwnvDlVSZiIL/abwbAcW6KREGNAkvtV/
Jl0i+PR/3g4+x2phy74MVOJvKFy/a0C/OjJUcE/3dgLXAmNZjwHrZJ1lULGe0cvhfNZtD3dUKfK7
WS40/0ljaIwRKSK5j+M2kJM+Fflv7AkD7EyorerlTA==
=UFwT
-----END PGP SIGNATURE-----

--------------idwQYzvS76ONej6N4uG0rw0v--

