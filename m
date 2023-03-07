Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005C6AE224
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:23:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507443.780942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYDe-0004fT-Ck; Tue, 07 Mar 2023 14:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507443.780942; Tue, 07 Mar 2023 14:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYDe-0004cV-8g; Tue, 07 Mar 2023 14:23:10 +0000
Received: by outflank-mailman (input) for mailman id 507443;
 Tue, 07 Mar 2023 14:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JVyd=67=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZYDc-0004Xu-Me
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:23:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94e999e4-bcf3-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 15:23:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B183621A02;
 Tue,  7 Mar 2023 14:23:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77CBA1341F;
 Tue,  7 Mar 2023 14:23:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Tgy2G8tIB2TzeAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Mar 2023 14:23:07 +0000
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
X-Inumbo-ID: 94e999e4-bcf3-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678198987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p7dwYvdhDL9Y2cul0RryA7tRWfAjrTaa1rEtFJj/yTU=;
	b=EoF3Lt4zEbPbm+S8oXSG0lFZZQM1kH9FRDu5e481Gnh6R8b/vJzFBaq6kVhOWW+sYSF9nA
	Y5m2T0BzChUu/YB5hdeqRrFxf2qfTh1rOj+ea8KlsBl0kjMQEoi1WaRqQpvcNxBlTFQvOb
	nJZVX2EpnS0/fYZBNHjq0vjMkzaKQBs=
Message-ID: <9537fcd2-99ae-0570-aba3-41fd1fefe4ba@suse.com>
Date: Tue, 7 Mar 2023 15:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-3-jgross@suse.com>
 <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
 <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
 <825c0085-ba84-9ede-ea91-f07dce66f214@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <825c0085-ba84-9ede-ea91-f07dce66f214@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s4paX0px1wy5RVY2G6ZzHfyz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------s4paX0px1wy5RVY2G6ZzHfyz
Content-Type: multipart/mixed; boundary="------------4UE9M1trPRij4vFzGGL87QnT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <9537fcd2-99ae-0570-aba3-41fd1fefe4ba@suse.com>
Subject: Re: [PATCH 2/2] xen: update CONFIG_DEBUG_INFO help text
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-3-jgross@suse.com>
 <e673b686-abcb-1e38-1e2d-dcbc77c65576@suse.com>
 <d0aefe0b-4e71-458c-0072-345e1c505083@suse.com>
 <825c0085-ba84-9ede-ea91-f07dce66f214@suse.com>
In-Reply-To: <825c0085-ba84-9ede-ea91-f07dce66f214@suse.com>

--------------4UE9M1trPRij4vFzGGL87QnT
Content-Type: multipart/mixed; boundary="------------QNpfez70Op6Wy66dVmyY0Y4b"

--------------QNpfez70Op6Wy66dVmyY0Y4b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDMuMjMgMTU6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMy4yMDIz
IDE1OjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDcuMDMuMjMgMTE6NDEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAzLjIwMjMgMDc6MzIsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9LY29uZmlnLmRlYnVnDQo+Pj4+ICsrKyBiL3hl
bi9LY29uZmlnLmRlYnVnDQo+Pj4+IEBAIC0xNSw4ICsxNSwxMSBAQCBjb25maWcgREVCVUdf
SU5GTw0KPj4+PiAgICAJYm9vbCAiQ29tcGlsZSBYZW4gd2l0aCBkZWJ1ZyBpbmZvIg0KPj4+
PiAgICAJZGVmYXVsdCBERUJVRw0KPj4+PiAgICAJLS0taGVscC0tLQ0KPj4+PiAtCSAgSWYg
eW91IHNheSBZIGhlcmUgdGhlIHJlc3VsdGluZyBYZW4gd2lsbCBpbmNsdWRlIGRlYnVnZ2lu
ZyBpbmZvDQo+Pj4+IC0JICByZXN1bHRpbmcgaW4gYSBsYXJnZXIgYmluYXJ5IGltYWdlLg0K
Pj4+PiArCSAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byBidWlsZCBYZW4gd2l0aCBkZWJ1
ZyBpbmZvcm1hdGlvbi4gVGhpcw0KPj4+PiArCSAgaW5mb3JtYXRpb24gaXMgbmVlZGVkIGUu
Zy4gZm9yIGRvaW5nIGNyYXNoIGR1bXAgYW5hbHlzaXMgb2YgdGhlDQo+Pj4+ICsJICBoeXBl
cnZpc29yIHZpYSB0aGUgImNyYXNoIiB0b29sLg0KPj4+PiArCSAgU2F5aW5nIFkgd2lsbCBp
bmNyZWFzZSB0aGUgc2l6ZSBvZiB4ZW4tc3ltcyBhbmQgdGhlIGJ1aWx0IEVGSQ0KPj4+PiAr
CSAgYmluYXJ5Lg0KPj4+DQo+Pj4gTGFyZ2VseSBmaW5lIHdpdGggbWUsIGp1c3Qgb25lIHF1
ZXN0aW9uOiBXaHkgZG8geW91IG1lbnRpb24geGVuLXN5bXMgYnkNCj4+PiBuYW1lLCBidXQg
dGhlbiB2ZXJiYWxseSBkZXNjcmliZSB4ZW4uZWZpPyBBbmQgc2luY2UsIHVubGlrZSBmb3Ig
eGVuLXN5bXMsDQo+Pg0KPj4gRm9yIHhlbi1zeW1zIEkgY291bGRuJ3QgZmluZCBhbiBlYXNp
bHkgdW5kZXJzdGFuZGFibGUgd29yZGluZy4gSSdkIGJlIGZpbmUNCj4+IHdpdGgganVzdCBz
YXlpbmcgInhlbi5lZmkiLg0KPj4NCj4+PiB0aGlzIGFmZmVjdHMgdGhlIGluc3RhbGxlZCBi
aW5hcnkgYWN0dWFsbHkgdXNlZCBmb3IgYm9vdGluZyAod2hpY2ggbWF5DQo+Pj4gYmUgcGxh
Y2VkIG9uIGEgc3BhY2UgY29uc3RyYWluZWQgcGFydGl0aW9uKSwgaXQgbWF5IGJlIHBydWRl
bnQgdG8NCj4+PiBtZW50aW9uIElOU1RBTExfRUZJX1NUUklQIGhlcmUgKGFzIGEgd2F5IHRv
IHJlZHVjZSB0aGUgYmluYXJ5IHNpemUgb2YNCj4+PiB3aGF0IGVuZHMgdXAgb24gdGhlIEVG
SSBwYXJ0aXRpb24sIGV2ZW4gaWYgdGhhdCB3b3VsZG4ndCBhZmZlY3QgdGhlDQo+Pj4gIm5v
cm1hbCIgd2F5IG9mIHB1dHRpbmcgdGhlIGJpbmFyeSBvbiB0aGUgRUZJIHBhcnRpdGlvbiAt
IHBlb3BsZSB3b3VsZA0KPj4+IHN0aWxsIG5lZWQgdG8gdGFrZSBjYXJlIG9mIHRoYXQgaW4g
dGhlaXIgZGlzdHJvcykuDQo+Pg0KPj4gV2hhdCBhYm91dCBhZGRpbmcgYSByZWxhdGVkIEtj
b25maWcgb3B0aW9uIGluc3RlYWQ/DQo+IA0KPiBIb3cgd291bGQgYSBLY29uZmlnIG9wdGlv
biBwb3NzaWJseSBhZmZlY3QgdGhpcz8gWW91IHdhbnQgZGVidWcgaW5mbw0KPiBpbiB0aGUg
eGVuLmVmaSBpbiBpdHMgc3RhbmRhcmQgaW5zdGFsbCBsb2NhdGlvbiAob3V0c2lkZSBvZiB0
aGUgRUZJDQo+IHBhcnRpdGlvbik7IG9yIGVsc2UgaWYgeW91IGRvbid0IHdhbnQgaXQgdGhl
cmUgd2h5IHdvdWxkIHlvdSB3YW50IGl0DQo+IGluIHhlbi1zeW1zPyBJdCBpcyB0aGUgc3Rl
cCBvZiBwb3B1bGF0aW5nIHRoZSBFRkkgcGFydGl0aW9uIGZyb20gdGhlDQo+IHN0YW5kYXJk
IGluc3RhbGwgbG9jYXRpb24gd2hlcmUgc29tZSBlcXVpdmFsZW50IG9mIElOU1RBTExfRUZJ
X1NUUklQDQo+IHdvdWxkIGNvbWUgaW50byBwbGF5LiBUaGF0IHN0ZXAgaXMgZG9uZSBvdXRz
aWRlIG9mIFhlbidzIGJ1aWxkDQo+IHN5c3RlbSBhbmQgaGVuY2Ugb3V0c2lkZSBvZiBhbnkg
S2NvbmZpZyBjb250cm9sLg0KDQpXZSBoYXZlIDIgYmluYXJpZXMgZm9yIHRoZSBub24tRUZJ
IGh5cGVydmlzb3IgKHhlbi1zeW1zIGFuZCB4ZW5bLmd6XSkuDQpXaHkgY2FuJ3Qgd2UgaGF2
ZSB0aGUgc2FtZSBmb3IgRUZJPyBFLmcuIHhlbi1zeW1zLmVmaSBhbmQgeGVuLmVmaS4NClRo
ZSBmb3JtZXIgd291bGQgaGF2ZSB0aGUgZGVidWctaW5mbywgdGhlIGxhdHRlciBjb3VsZCBi
ZSBpbnN0YWxsZWQNCmludG8gdGhlIEVGSSBwYXJ0aXRpb24uDQoNCg0KSnVlcmdlbg0K
--------------QNpfez70Op6Wy66dVmyY0Y4b
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------QNpfez70Op6Wy66dVmyY0Y4b--

--------------4UE9M1trPRij4vFzGGL87QnT--

--------------s4paX0px1wy5RVY2G6ZzHfyz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQHSMsFAwAAAAAACgkQsN6d1ii/Ey8P
FQgAix3d3K04JlBkZWaomKJ+mWb+mlL8/z8g34JXl+7b4S4DrHVbwjZW7oI+muaWzHGZCsI0zGW6
nzn8BWwGADeC+pbM0Yf9ZEBbr8S505MgT6t82JIOKRMNzUwys24winegkHHBGn0AxgtDNwqPvd8z
yImH/x9Blo9f8c7etEFvy8hnbXDQ8jC7wGfh1cje+QmRo4+OtmGGa2QpRWLqeY650Vkpp96OzGEr
n4vIiUgbsdcV0qHKT5YTxW1UjjmchWvhAZF43TXNVHufBn1pAG10dj2KgW3jbhFJM+xyBNHLUcmm
07XyqilBby4O2FWyJSvrnfL/p5Em9VJPpmtZiuPeiw==
=I+vC
-----END PGP SIGNATURE-----

--------------s4paX0px1wy5RVY2G6ZzHfyz--

