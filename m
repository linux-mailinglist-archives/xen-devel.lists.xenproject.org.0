Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25D64D77E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 09:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463112.721245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jD7-0004gq-16; Thu, 15 Dec 2022 08:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463112.721245; Thu, 15 Dec 2022 08:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jD6-0004eu-Tp; Thu, 15 Dec 2022 08:03:20 +0000
Received: by outflank-mailman (input) for mailman id 463112;
 Thu, 15 Dec 2022 08:03:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ka2Q=4N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p5jD6-0004eo-5z
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 08:03:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9b23635-7c4e-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 09:03:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4A34121F13;
 Thu, 15 Dec 2022 08:03:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D55D0138E5;
 Thu, 15 Dec 2022 08:03:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 91ecMsXUmmNbAgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 15 Dec 2022 08:03:17 +0000
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
X-Inumbo-ID: e9b23635-7c4e-11ed-8fd3-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671091398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cxDWF5TAQ0XznhghIGv+VKbx7KJfcY5xYS7v/ynjBuc=;
	b=fMv66WXJ2Aq+UV7oVkgJY6EU+47IYYxzzI2e2yXyt3qlBLfXkyPxwMCzQgWn2FktDnsY/A
	SPo450Ev12Zrz9CmVmtK5rzEe8rjLQDmFt6IXWW9tUdUYdMObIvNyu/u5tfF6iQRSyNtk+
	rbY5O1qDvMkpcRbLd2ah557rEQqusaY=
Message-ID: <9cf592ef-fa3c-251a-97a3-2f0e8f4f2a0b@suse.com>
Date: Thu, 15 Dec 2022 09:03:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 Paul Durrant <paul@xen.org>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org
References: <20220910154959.15971-1-jgross@suse.com>
 <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>
 <d28412f2-2b94-5c69-c43f-481634562356@suse.com>
 <d57129f5-cfaf-0ed7-0dac-985b3a646b79@apertussolutions.com>
 <0fef4389-0373-b214-800c-f2457676e929@suse.com>
 <5b948f88-7757-7506-aa53-26308893fddf@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 0/3] xen/spinlock: make recursive spinlocks a
 dedicated type
In-Reply-To: <5b948f88-7757-7506-aa53-26308893fddf@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mrw3n1i81lmQMkQlx41MiBhH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mrw3n1i81lmQMkQlx41MiBhH
Content-Type: multipart/mixed; boundary="------------MuaQ07EDBklgIoYJB1Wh38vk";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 Paul Durrant <paul@xen.org>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org
Message-ID: <9cf592ef-fa3c-251a-97a3-2f0e8f4f2a0b@suse.com>
Subject: Re: [RFC PATCH 0/3] xen/spinlock: make recursive spinlocks a
 dedicated type
References: <20220910154959.15971-1-jgross@suse.com>
 <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>
 <d28412f2-2b94-5c69-c43f-481634562356@suse.com>
 <d57129f5-cfaf-0ed7-0dac-985b3a646b79@apertussolutions.com>
 <0fef4389-0373-b214-800c-f2457676e929@suse.com>
 <5b948f88-7757-7506-aa53-26308893fddf@suse.com>
In-Reply-To: <5b948f88-7757-7506-aa53-26308893fddf@suse.com>

--------------MuaQ07EDBklgIoYJB1Wh38vk
Content-Type: multipart/mixed; boundary="------------mtQfKfDi0kBFmczWY6OJdxhz"

--------------mtQfKfDi0kBFmczWY6OJdxhz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMTIuMjIgMDg6NDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4xMi4yMDIy
IDE3OjM2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTQuMTIuMjIgMTc6MjUsIERh
bmllbCBQLiBTbWl0aCB3cm90ZToNCj4+PiBPbiAxMi8xNC8yMiAxMDozMSwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+Pj4gT24gMTQuMTIuMjIgMTY6MDMsIERhbmllbCBQLiBTbWl0aCB3
cm90ZToNCj4+Pj4+DQo+Pj4+PiBPbiA5LzEwLzIyIDExOjQ5LCBKdWVyZ2VuIEdyb3NzIHdy
b3RlOg0KPj4+Pj4+IEluc3RlYWQgb2YgYmVpbmcgYWJsZSB0byB1c2Ugbm9ybWFsIHNwaW5s
b2NrcyBhcyByZWN1cnNpdmUgb25lcywgdG9vLA0KPj4+Pj4+IG1ha2UgcmVjdXJzaXZlIHNw
aW5sb2NrcyBhIHNwZWNpYWwgbG9jayB0eXBlLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhpcyB3aWxs
IG1ha2UgdGhlIHNwaW5sb2NrIHN0cnVjdHVyZSBzbWFsbGVyIGluIHByb2R1Y3Rpb24gYnVp
bGRzIGFuZA0KPj4+Pj4+IGFkZCB0eXBlLXNhZmV0eS4NCj4+Pj4+DQo+Pj4+PiBKdXN0IGEg
bGl0dGxlIHlhayBzaGF2aW5nLCBJTUhPIGEgc3BpbmxvY2sgaXMgbm9ybWFsbHkgbm90IGV4
cGVjdGVkIHRvIGJlDQo+Pj4+PiByZWN1cnNpdmUuIFRodXMgZXhwbGljaXRseSBuYW1pbmcg
YSBzcGlubG9jayBhcyBub24tcmVjdXJzaXZlIEkgZmluZCB0byBiZQ0KPj4+Pj4gcmVkdW5k
YW50IGFsb25nIHdpdGggYmVpbmcgZXhwZW5zaXZlIGZvciB0eXBpbmcuIFdoZXJlYXMgYSBy
ZWN1cnNpdmUgc3BpbmxvY2sNCj4+Pj4+IGlzIHRoZSBzcGVjaWFsIGluc3RhbmNlIGFuZCBz
aG91bGQgaGF2ZSBhIGRlY2xhcmF0aXZlIGRpc3RpbmN0aW9uLiBPbmx5DQo+Pj4+PiBjb2Rp
ZnlpbmcgdGhlIHJlY3Vyc2l2ZSB0eXBlIHdvdWxkIHNpZ25pZmljYW50bHkgY3V0IGRvd24g
b24gdGhlIHNpemUgb2YgdGhlDQo+Pj4+PiBzZXJpZXMgYW5kIHN0aWxsIHByb3ZpZGUgZXF1
YWwgdHlwZSBhbmQgdmlzdWFsIGNsYXJpZmljYXRpb24uDQo+Pj4+DQo+Pj4+IEEgIm5vcm1h
bCIgc3BpbmxvY2sgaXMgbm9uLXJlY3Vyc2l2ZS4NCj4+Pj4NCj4+Pj4gQSByZWN1cnNpdmUg
c3BpbmxvY2sgaW4gWGVuIGNhbiBiZSBlaXRoZXIgdGFrZW4gcmVjdXJzaXZlLCBvciBpdCBj
YW4gYmUgdGFrZW4NCj4+Pj4gbm9uLXJlY3Vyc2l2ZSwgY2F1c2luZyBmdXJ0aGVyIHJlY3Vy
c2l2ZSBhdHRlbXB0cyB0byBzcGluLg0KPj4+DQo+Pj4gWWVzLCBJIHVuZGVyc3RhbmQgdGhl
IGN1cnJlbnQgc2l0dWF0aW9uLg0KPj4+DQo+Pj4+IFNvIHRoZSBleHBsaWNpdCBub24tcmVj
dXJzaXZlIGxvY2tpbmcgYXBwbGllcyB0byB0aGF0IHNwZWNpYWwgdHJlYXRtZW50IG9mDQo+
Pj4+IHJlY3Vyc2l2ZSBzcGlubG9ja3MuDQo+Pj4NCj4+PiBJIHVuZGVyc3RhbmQgdGhpcywg
YnV0IHRvIGhlbHAgY2xhcmlmeSB3aGF0IEkgYW0gc2F5aW5nIGlzIHRoYXQgaW5kaXZpZHVh
bHMNCj4+PiBjb21pbmcgZnJvbSBvdXRzaWRlIFhlbiB3b3VsZCBleHBlY3QgaXMgdGhlIHNw
aW5sb2NrIGZhbWlseSBvZiBjYWxscyB0byBiZWhhdmUNCj4+PiBhcyBhIG5vbi1yZWN1cnNp
dmUgc3BpbmxvY2tzIGFuZCByZWN1cnNpdmUgc3BpbmxvY2sgZmFtaWx5IG9mIGNhbGxzIHdv
dWxkDQo+Pj4gcHJvdmlkZSB0aGUgcmVjdXJzaXZlIGJlaGF2aW9yLiBDdXJyZW50bHkgWGVu
J3MgYmVoYXZpb3IgaXMgYmFja3dhcmRzIHRvIHRoaXMsDQo+Pj4gd2hpY2ggdGhpcyBzZXJp
ZXMgY29udGludWVzIGFuZCBpcyBhIHZhbGlkIGFwcHJvYWNoLiBIZXJlIHNwaW5sb2NrIGFu
ZCByZWN1cnNpdmUNCj4+PiBzcGlubG9jayBmYW1pbHkgb2YgY2FsbHMgYXJlIHJlY3Vyc2l2
ZSBhbmQgbXVzdCB1c2Ugbm9uLXJlY3Vyc2l2ZSBzcGlubG9jaw0KPj4+IGZhbWlseSB0byBo
YXZlICJub3JtYWwiIHNwaW5sb2NrIGJlaGF2aW9yLiBJTUhPIGl0IHdvdWxkIGdyZWF0bHkg
c2ltcGxpZnkgdGhlDQo+Pg0KPj4gTXkgc2VyaWVzIGRvZXNuJ3QgY2hhbmdlIHRyZWF0bWVu
dCBvZiBub3JtYWwgc3BpbmxvY2tzLiBUaGV5IGFyZSBzdGlsbCB1c2VkIHZpYQ0KPj4gc3Bp
bl97bG9jayxsb2NrZWQsdW5sb2NrfS4NCj4+DQo+Pj4gY29kZSBhbmQgYWxpZ24gd2l0aCB0
aGUgIm5vcm1hbCIgdW5kZXJzdGFuZGluZyBvZiBzcGlubG9ja3MgaWYgaW5zdGVhZA0KPj4+
IHNwaW5fe2xvY2ssbG9ja2VkLHVubG9ja30gbWFjcm9zIHdlcmUgdGhlIG5vbi1yZWN1cnNp
dmUgY2FsbHMgYW5kDQo+Pj4gc3Bpbl97bG9jayxsb2NrZWQsdW5sb2NrfV9yZWN1cnNpdmUg
bWFjcm9zIHdlcmUgdGhlIHJlY3Vyc2l2ZSBjYWxscy4gVGhlbiB0aGVyZQ0KPj4+IHdvdWxk
IG9ubHkgYmUgdHdvIHN1aXRlcyBvZiBjYWxscyBmb3Igc3BpbmxvY2tzIGFuZCBhIGxvdCBs
ZXNzIGtleXN0cm9rZXMgZm9yDQo+Pj4gbmVlZCBmb3IgbW9zdCBkZXZlbG9wbWVudC4NCj4+
DQo+PiBPbmx5IHRoZSByZWN1cnNpdmUgc3BpbmxvY2sgdHlwZSB1c2VyIG11c3Qgc3BlY2lm
eSwgd2hldGhlciBhIGxvY2sgaXMgbWVhbnQgdG8NCj4+IGJlIGhhbmRsZWQgYXMgYSByZWN1
cnNpdmUgb3IgYSBub24tcmVjdXJzaXZlIGxvY2sgYXR0ZW1wdC4gVGhpcyBpcyBzaW1pbGFy
IHRvDQo+PiBhIHJ3bG9jaywgd2hlcmUgdGhlIHVzZXIgbXVzdCBzcGVjaWZ5IHdoZXRoZXIg
dG8gbG9jayBhcyBhIHJlYWRlciBvciBhIHdyaXRlci4NCj4gDQo+IFdoaWxlIEkgY2FuJ3Qg
Y29tZSB1cCB3aXRoIGFueXRoaW5nIG5lYXQgcmlnaHQgYXdheSwgaXQgZmVlbHMgbGlrZSBp
dCBzaG91bGQgYmUNCj4gcG9zc2libGUgdG8gY29tZSB1cCB3aXRoIHNvbWUgdHJpY2tlcnkg
dG8gbWFrZSBzcGluX2xvY2soKSB1c2FibGUgb24gYm90aCBsb2NrDQo+IHR5cGVzLCBlbGlt
aW5hdGluZyB0aGUgbmVlZCB0byAuLi5fbm9ucmVjdXJzaXZlKCkgdmFyaWFudHMgdmlzaWJs
ZSBhdCB1c2Ugc2l0ZXMNCj4gKHRoZXkgbWF5IHN0aWxsIGJlIG5lY2Vzc2FyeSBhcyBoZWxw
ZXJzIHRoZW4pLiBBdCBsZWFzdCBpZiBhIHNwaW5sb2NrX3QgaW5zdGFuY2UNCj4gd2Fzbid0
IGVtYmVkZGVkIGluIHRoZSByZWN1cnNpdmUgbG9jayBzdHJ1Y3QgKGFzIEkgZGlkIHN1Z2dl
c3QpLCB0aGVuIHNvbWV0aGluZw0KPiBhbG9uZyB0aGUgbGluZXMgb2Ygd2hhdCB0Z21hdGgu
aCBkb2VzIG1heSBiZSBwb3NzaWJsZS4NCg0KTWlnaHQgYmUsIGJ1dCBkbyB3ZSByZWFsbHkg
d2FudCB0aGF0Pw0KDQpXb3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2UgdG8gbGV0IHRoZSB1
c2VyIGV4cGxpY2l0bHkgc2F5IHRoYXQgaGUgd2FudHMgYSBsb2NrDQp0byBiZSB0YWtlbiBu
b24tcmVjdXJzaXZlbHk/IEFsbG93aW5nICJzcGluX2xvY2soKSIgd291bGQgYWRkIHNvbWUg
bW9yZSByaXNrIHRvDQp1c2UgaXQgYnkgYWNjaWRlbnQgZS5nLiBiZWNhdXNlIG9mIGNvcHkv
cGFzdGUgd2l0aG91dCBub3RpY2luZyB0aGF0IGl0IGlzIGENCnJlY3Vyc2l2ZSBsb2NrIHRo
YXQgaXMgdGFrZW4gbm9uLXJlY3Vyc2l2ZWx5LiBTYW1lIGFwcGxpZXMgZm9yIHBhdGNoIHJl
dmlld3MuDQoNCkknZCBwcmVmZXIgdG8gbWFrZSB0aGlzIGVhc2lseSB2aXNpYmxlLg0KDQoN
Ckp1ZXJnZW4NCg==
--------------mtQfKfDi0kBFmczWY6OJdxhz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mtQfKfDi0kBFmczWY6OJdxhz--

--------------MuaQ07EDBklgIoYJB1Wh38vk--

--------------mrw3n1i81lmQMkQlx41MiBhH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOa1MUFAwAAAAAACgkQsN6d1ii/Ey+5
jggAkhZGOc8UOKHz/3D/BuEgz0ZGTD4AhXRwBwNm2qEo6fE+n93+x93Lh3MWss3/PkfR9ZWtTIrO
iPjKLMzNqWZe/olVRkIw0qB3IvGicgUBvd6fEFlbM8XH+M8qd3nHSHlljHqbUEsZet4tIiHzUdYm
g/lLXr2ZaCIi4K18rO/OXQRqmKcmkcLlow9/hfV/Lq/eMDl2YuB4Q9ls/Q5V6Ux2XXpio3Hyf1MX
Pm8iw7ihoHcGvy3KXFDFXT7Kst/q/3q9GxuBDVAF//yhrsX9GHb0q2uV9c9UMb5Bsu+rKytpHUHE
pYZfXoCrIu5ijhJiZMSPyx+pcTj8FqqOofV+kq9QhQ==
=VIsc
-----END PGP SIGNATURE-----

--------------mrw3n1i81lmQMkQlx41MiBhH--

