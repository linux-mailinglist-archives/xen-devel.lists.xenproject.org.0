Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C8964C7BF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 12:11:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462093.720261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Pel-0001Eo-Ns; Wed, 14 Dec 2022 11:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462093.720261; Wed, 14 Dec 2022 11:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Pel-0001CS-L8; Wed, 14 Dec 2022 11:10:35 +0000
Received: by outflank-mailman (input) for mailman id 462093;
 Wed, 14 Dec 2022 11:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8nZ=4M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p5Pek-0001CI-G8
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 11:10:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed42760d-7b9f-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 12:10:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE39522217;
 Wed, 14 Dec 2022 11:10:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EB77138F6;
 Wed, 14 Dec 2022 11:10:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LFtlISivmWP4OAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Dec 2022 11:10:32 +0000
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
X-Inumbo-ID: ed42760d-7b9f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671016232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eQXZSV9cUYq4VSFcTa7m4KzsknaGVcSHrjzxxm4S644=;
	b=PfTorPjih5oSplosoxA0a5+70/CcDDnsx4n5/eQcXFshSwQQGrcvHrAcHQkYKkAt4Gl1rC
	IFTh3/j1QWDIMl9cb5O4O9VNfWMsJypYtvGB3HRgXWxY9xGdtNCHTMozGnOEBcv2mFcaYw
	w33PTmPdl9W/NAoIo2wbBJOMFdwB8S8=
Message-ID: <a6aadbc6-e34e-43db-26e5-5379ce2d88d3@suse.com>
Date: Wed, 14 Dec 2022 12:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220910154959.15971-1-jgross@suse.com>
 <20220910154959.15971-3-jgross@suse.com>
 <71281857-7387-afc1-f9b0-e076e4f076a8@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 2/3] xen/spinlock: split recursive spinlocks from
 normal ones
In-Reply-To: <71281857-7387-afc1-f9b0-e076e4f076a8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lK8lR0EOo9wU7sKTjeHfZ4FJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lK8lR0EOo9wU7sKTjeHfZ4FJ
Content-Type: multipart/mixed; boundary="------------7wh2gLwl0JQh02FtlPC80shO";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Message-ID: <a6aadbc6-e34e-43db-26e5-5379ce2d88d3@suse.com>
Subject: Re: [RFC PATCH 2/3] xen/spinlock: split recursive spinlocks from
 normal ones
References: <20220910154959.15971-1-jgross@suse.com>
 <20220910154959.15971-3-jgross@suse.com>
 <71281857-7387-afc1-f9b0-e076e4f076a8@suse.com>
In-Reply-To: <71281857-7387-afc1-f9b0-e076e4f076a8@suse.com>

--------------7wh2gLwl0JQh02FtlPC80shO
Content-Type: multipart/mixed; boundary="------------F0EcMBudQdUqPPoUzPPjOWJl"

--------------F0EcMBudQdUqPPoUzPPjOWJl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTIuMjIgMTE6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMC4wOS4yMDIy
IDE3OjQ5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L21t
L3AybS1wb2QuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1wb2QuYw0KPj4gQEAg
LTM5Nyw3ICszOTcsNyBAQCBpbnQgcDJtX3BvZF9lbXB0eV9jYWNoZShzdHJ1Y3QgZG9tYWlu
ICpkKQ0KPj4gICANCj4+ICAgICAgIC8qIEFmdGVyIHRoaXMgYmFycmllciBubyBuZXcgUG9E
IGFjdGl2aXRpZXMgY2FuIGhhcHBlbi4gKi8NCj4+ICAgICAgIEJVR19PTighZC0+aXNfZHlp
bmcpOw0KPj4gLSAgICBzcGluX2JhcnJpZXIoJnAybS0+cG9kLmxvY2subG9jayk7DQo+PiAr
ICAgIHNwaW5fYmFycmllcigmcDJtLT5wb2QubG9jay5sb2NrLmxvY2spOw0KPiANCj4gVGhp
cyBpcyBnZXR0aW5nIHVud2llbGR5IGFzIHdlbGwsIGFuZCAuLi4NCj4gDQo+PiBAQCAtMTYw
LDIxICsxNjUsMzAgQEAgdHlwZWRlZiB1bmlvbiB7DQo+PiAgIA0KPj4gICB0eXBlZGVmIHN0
cnVjdCBzcGlubG9jayB7DQo+PiAgICAgICBzcGlubG9ja190aWNrZXRzX3QgdGlja2V0czsN
Cj4+IC0gICAgdTE2IHJlY3Vyc2VfY3B1OlNQSU5MT0NLX0NQVV9CSVRTOw0KPj4gLSNkZWZp
bmUgU1BJTkxPQ0tfTk9fQ1BVICAgICAgICAoKDF1IDw8IFNQSU5MT0NLX0NQVV9CSVRTKSAt
IDEpDQo+PiAtI2RlZmluZSBTUElOTE9DS19SRUNVUlNFX0JJVFMgICgxNiAtIFNQSU5MT0NL
X0NQVV9CSVRTKQ0KPj4gLSAgICB1MTYgcmVjdXJzZV9jbnQ6U1BJTkxPQ0tfUkVDVVJTRV9C
SVRTOw0KPj4gLSNkZWZpbmUgU1BJTkxPQ0tfTUFYX1JFQ1VSU0UgICAoKDF1IDw8IFNQSU5M
T0NLX1JFQ1VSU0VfQklUUykgLSAxKQ0KPj4gICAgICAgdW5pb24gbG9ja19kZWJ1ZyBkZWJ1
ZzsNCj4+ICAgI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUNCj4+ICAgICAgIHN0
cnVjdCBsb2NrX3Byb2ZpbGUgKnByb2ZpbGU7DQo+PiAgICNlbmRpZg0KPj4gICB9IHNwaW5s
b2NrX3Q7DQo+PiAgIA0KPj4gK3N0cnVjdCBzcGlubG9ja19yZWN1cnNpdmUgew0KPj4gKyAg
ICBzdHJ1Y3Qgc3BpbmxvY2sgbG9jazsNCj4+ICsgICAgdTE2IHJlY3Vyc2VfY3B1OlNQSU5M
T0NLX0NQVV9CSVRTOw0KPj4gKyNkZWZpbmUgU1BJTkxPQ0tfTk9fQ1BVICAgICAgICAoKDF1
IDw8IFNQSU5MT0NLX0NQVV9CSVRTKSAtIDEpDQo+PiArI2RlZmluZSBTUElOTE9DS19SRUNV
UlNFX0JJVFMgICgxNiAtIFNQSU5MT0NLX0NQVV9CSVRTKQ0KPj4gKyAgICB1MTYgcmVjdXJz
ZV9jbnQ6U1BJTkxPQ0tfUkVDVVJTRV9CSVRTOw0KPj4gKyNkZWZpbmUgU1BJTkxPQ0tfTUFY
X1JFQ1VSU0UgICAoKDF1IDw8IFNQSU5MT0NLX1JFQ1VSU0VfQklUUykgLSAxKQ0KPj4gK307
DQo+IA0KPiAuLi4gSSdtIG5vdCBzdXJlIGFueXdheSBpdCdzIGEgZ29vZCBpZGVhIHRvIGVt
YmVkIHNwaW5sb2NrX3QgaW5zaWRlIHRoZQ0KPiBuZXcgc3RydWN0LiBJJ2QgcHJlZmVyIGlm
IG5vbi1vcHRpb25hbCBmaWVsZHMgd2VyZSBhbHdheXMgYXQgdGhlIHNhbWUNCj4gcG9zaXRp
b24sIGFuZCB0aGVyZSdzIG5vdCBnb2luZyB0byBiZSB0aGF0IG11Y2ggZHVwbGljYXRpb24g
aWYgd2Ugd2VudA0KPiB3aXRoDQo+IA0KPiB0eXBlZGVmIHN0cnVjdCBzcGlubG9jayB7DQo+
ICAgICAgc3BpbmxvY2tfdGlja2V0c190IHRpY2tldHM7DQo+ICAgICAgdW5pb24gbG9ja19k
ZWJ1ZyBkZWJ1ZzsNCj4gI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUNCj4gICAg
ICBzdHJ1Y3QgbG9ja19wcm9maWxlICpwcm9maWxlOw0KPiAjZW5kaWYNCj4gfSBzcGlubG9j
a190Ow0KPiANCj4gdHlwZWRlZiBzdHJ1Y3QgcnNwaW5sb2NrIHsNCj4gICAgICBzcGlubG9j
a190aWNrZXRzX3QgdGlja2V0czsNCj4gICAgICB1MTYgcmVjdXJzZV9jcHU6U1BJTkxPQ0tf
Q1BVX0JJVFM7DQo+ICNkZWZpbmUgU1BJTkxPQ0tfTk9fQ1BVICAgICAgICAoKDF1IDw8IFNQ
SU5MT0NLX0NQVV9CSVRTKSAtIDEpDQo+ICNkZWZpbmUgU1BJTkxPQ0tfUkVDVVJTRV9CSVRT
ICAoMTYgLSBTUElOTE9DS19DUFVfQklUUykNCj4gICAgICB1MTYgcmVjdXJzZV9jbnQ6U1BJ
TkxPQ0tfUkVDVVJTRV9CSVRTOw0KPiAjZGVmaW5lIFNQSU5MT0NLX01BWF9SRUNVUlNFICAg
KCgxdSA8PCBTUElOTE9DS19SRUNVUlNFX0JJVFMpIC0gMSkNCj4gICAgICB1bmlvbiBsb2Nr
X2RlYnVnIGRlYnVnOw0KPiAjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tfUFJPRklMRQ0KPiAg
ICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGUgKnByb2ZpbGU7DQo+ICNlbmRpZg0KPiB9IHJzcGlu
bG9ja190Ow0KPiANCj4gVGhpcyB3b3VsZCBhbHNvIGVsaW1pbmF0ZSB0aGUgc2l6ZSBpbmNy
ZWFzZSBvZiByZWN1cnNpdmUgbG9ja3MgaW4NCj4gZGVidWcgYnVpbGRzLiBBbmQgZnVuY3Rp
b25zIGxpa2Ugc3Bpbl9iYXJyaWVyKCkgdGhlbiBhbHNvIHdvdWxkDQo+IChoYXZlIHRvKSBw
cm9wZXJseSBpbmRpY2F0ZSB3aGF0IGtpbmQgb2YgbG9jayB0aGV5IGFjdCBvbi4NCg0KWW91
IGFyZSBhd2FyZSB0aGF0IHRoaXMgd291bGQgcmVxdWlyZSB0byBkdXBsaWNhdGUgYWxsIHRo
ZSBzcGlubG9jaw0KZnVuY3Rpb25zIGZvciB0aGUgcmVjdXJzaXZlIHNwaW5sb2Nrcz8NCg0K
SSdtIG5vdCBzdHJpY3RseSBhZ2FpbnN0IHRoaXMsIGJ1dCBiZWZvcmUgZ29pbmcgdGhpcyBy
b3V0ZSBJIHRoaW5rIEkNCnNob3VsZCBtZW50aW9uIHRoZSBpbXBsaWNhdGlvbnMuDQoNCg0K
SnVlcmdlbg0K
--------------F0EcMBudQdUqPPoUzPPjOWJl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------F0EcMBudQdUqPPoUzPPjOWJl--

--------------7wh2gLwl0JQh02FtlPC80shO--

--------------lK8lR0EOo9wU7sKTjeHfZ4FJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOZrygFAwAAAAAACgkQsN6d1ii/Ey/f
IAf/ZXlFtnbG994Brl8m2D4tMMK+VPsO3E8gB5NBhL2aCzQSMcm/TUzZgXYGUzaYV/L0npZeF9RA
PDv1x59m7kvjNjwPSGeuliyucECghYe2FukR3U401ryMBWNGuzRAwcseqhap6s3l2BNdRs94V+9X
v9z4PvwUVpSX52BelH30VIWPornap93U+BlM/WmqcROgcahcdtIL8GAy5T4VYUWEYExTkgRxWjqf
wKjpPNv7ncosjXGy6CjCwZcKGR4jqkz0WwwU0keI8tEM8LBQAAlVpO+eAhUq03WXLNMYuanx+zfk
2UiHScCrH6XtC4+pT9qCk7q/U5Sf3/4coDQeN8aGRQ==
=2Lx6
-----END PGP SIGNATURE-----

--------------lK8lR0EOo9wU7sKTjeHfZ4FJ--

