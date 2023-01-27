Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF567E252
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 11:56:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485420.752628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMOQ-0006sv-W2; Fri, 27 Jan 2023 10:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485420.752628; Fri, 27 Jan 2023 10:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMOQ-0006rE-Sm; Fri, 27 Jan 2023 10:55:38 +0000
Received: by outflank-mailman (input) for mailman id 485420;
 Fri, 27 Jan 2023 10:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D8Jc=5Y=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pLMOP-0006r8-V2
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 10:55:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 205e9910-9e31-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 11:55:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D5F7A21EF1;
 Fri, 27 Jan 2023 10:55:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADA8F1336F;
 Fri, 27 Jan 2023 10:55:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lbz9KKat02MfSwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 27 Jan 2023 10:55:34 +0000
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
X-Inumbo-ID: 205e9910-9e31-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674816934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tik5Mo8RQiGkhGpFKdBUsc6igXWcZ6MXreo5CUGHB80=;
	b=gNp0m7tcvV9pR3KPb8A54JMoYoBGemPBy99j7pkkRPS10Ep1Q6BGoCkQG4vKDOZJ8ZB/Uu
	Z2fkn/ZfCjz5EweLx20hoUV4TBljpw9qNzgRxZ3tfGgr9yknE9fQedgMohBBHW6iUL1rRs
	a1mM627/u58lIoRLGdetP1NMjG0Xkmg=
Message-ID: <260bfbf4-8a6c-d3ea-a4e6-547a51d59ba1@suse.com>
Date: Fri, 27 Jan 2023 11:55:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230127055421.22945-1-jgross@suse.com>
 <547fab47-d4b5-2c04-74d5-baffa10b9638@srcf.net>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] tools/helpers: don't log errors when trying to load
 PVH xenstore-stubdom
In-Reply-To: <547fab47-d4b5-2c04-74d5-baffa10b9638@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ehhHZFICYFi45f9zaxjsa7Ij"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ehhHZFICYFi45f9zaxjsa7Ij
Content-Type: multipart/mixed; boundary="------------0Hf0Y5jeYYyQNk9QcLRhwTje";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <260bfbf4-8a6c-d3ea-a4e6-547a51d59ba1@suse.com>
Subject: Re: [PATCH v2] tools/helpers: don't log errors when trying to load
 PVH xenstore-stubdom
References: <20230127055421.22945-1-jgross@suse.com>
 <547fab47-d4b5-2c04-74d5-baffa10b9638@srcf.net>
In-Reply-To: <547fab47-d4b5-2c04-74d5-baffa10b9638@srcf.net>

--------------0Hf0Y5jeYYyQNk9QcLRhwTje
Content-Type: multipart/mixed; boundary="------------SBe6Q266FspEqNUdTEPl5Yy0"

--------------SBe6Q266FspEqNUdTEPl5Yy0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDEuMjMgMTE6MjgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI3LzAxLzIw
MjMgNTo1NCBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IFdoZW4gbG9hZGluZyBhIFhl
bnN0b3JlIHN0dWJkb20gdGhlIGxvYWRlciBkb2Vzbid0IGtub3cgd2hldGhlciB0aGUNCj4+
IGxvIGJlIGxvYWRlZCBrZXJuZWwgaXMgYSBQVkggb3IgYSBQViBvbmUuIFNvIGl0IHRyaWVz
IHRvIGxvYWQgaXQgYXMNCj4+IGEgUFZIIG9uZSBmaXJzdCwgYW5kIGlmIHRoaXMgZmFpbHMg
aXQgaXMgbG9hZGluZyBpdCBhcyBhIFBWIGtlcm5lbC4NCj4gDQo+IFdlbGwsIHllcyBpdCBk
b2VzLg0KPiANCj4gV2hhdCBtaWdodCBiZSBtaXNzaW5nIGlzIGxpYnhlbmd1ZXN0J3MgYWJp
bGl0eSB0byBwYXJzZSB0aGUgcHJvdmlkZWQNCj4ga2VybmVsJ3MgRUxGIE5vdGVzIGFoZWFk
IG9mIHRyeWluZyB0byBidWlsZCB0aGUgZG9tYWluLg0KDQpDb3JyZWN0Lg0KDQo+IFRoaXMg
aXMgdGhlIHNhbWUga2luZCBvZiBwb29yIGRlc2lnbiB3aGljaCBoYXMgbGVmdCB1cyB3aXRo
IGENCj4gZG9tMD1wdnxwdmggY21kbGluZSBvcHRpb24gd2hpY2ggbXVzdCBtYXRjaCB0aGUg
a2VybmVsIHRoZSBib290bG9hZGVyDQo+IGdhdmUgdXMsIGlmIHdlIHdhbnQgdG8gbm90IHBh
bmljKCkgb24gYm9vdC4NCg0KSG1tLCB0aGlzIGlzIG9ubHkgcGFydGlhbGx5IHRydWUuDQoN
CkkgYWdyZWUgdGhhdCB3aXRob3V0IGFueSBkb20wIG9wdGlvbiBnaXZlbiBpdCB3b3VsZCBi
ZSBuaWNlIGlmIHRoZQ0KaHlwZXJ2aXNvciBjb3VsZCB1c2UgdGhlIHNwZWNpZmllZCBkb20w
IGtlcm5lbCBhcyBsb25nIGFzIGl0IGlzDQpzdXBwb3J0aW5nIGVpdGhlciBQViBvciBQVkgg
bW9kZS4NCg0KT1RPSCBub3dhZGF5cyBpdCBpcyBlYXNpbHkgcG9zc2libGUgdG8gYnVpbGQg
YSBrZXJuZWwgYmVpbmcgY2FwYWJsZQ0KdG8gc3VwcG9ydCBib3RoIHZhcmlhbnRzLCBpbiB3
aGljaCBjYXNlIHRoZSBoeXBlcnZpc29yIG5lZWRzIHRvDQpzZWxlY3Qgd2hpY2ggbW9kZSB0
byB1c2UuIFRoaXMgbWlnaHQgbmVlZCB0aGUgaGVscCBvZiB0aGUgdXNlciBpbg0KY2FzZSB0
aGUgbm9uLWRlZmF1bHQgbW9kZSBpcyB3YW50ZWQuDQoNCkZvciB4ZW5zdG9yZS1zdHViZG9t
IGl0IGlzIGVhc2llciwgYXMgdGhlcmUgaXMgbm8gcmVhc29uIHRvIHByZWZlcg0KdGhlIFBW
IG1vZGUgb3ZlciBQVkggKGluIGZhY3QgSSdtIHN0aWxsIHdvcmtpbmcgb24gWGVuc3RvcmUg
TFUgZm9yDQp0aGUgUFZIIGNhc2UsIG1ha2luZyB0aGUgZGVjaXNpb24gZXZlbiBlYXNpZXIp
Lg0KDQo+IA0KPiBTbyB3aGlsZSB0aGlzIG1pZ2h0IGJlIGFuIGFjY2VwdGFibGUgZ3Jvc3Mg
Ym9kZ2UgaW4gdGhlIHNob3J0IHRlcm0sIHRoaXMuLi4NCj4gDQo+Pg0KPj4gVGhpcyByZXN1
bHRzIGluIGVycm9ycyBiZWluZyBsb2dnZWQgaW4gY2FzZSB0aGUgc3R1YmRvbSBpcyBhIFBW
IGtlcm5lbC4NCj4+DQo+PiBTdXBwcmVzcyB0aG9zZSBlcnJvcnMgYnkgc2V0dGluZyB0aGUg
bWluaW11bSBsb2dnaW5nIGxldmVsIHRvDQo+PiAiY3JpdGljYWwiIHdoaWxlIHRyeWluZyB0
byBsb2FkIHRoZSBrZXJuZWwgYXMgUFZILg0KPj4NCj4+IEZpeGVzOiBmODk5NTU0NDljNWEg
KCJ0b29scy9pbml0LXhlbnN0b3JlLWRvbWFpbjogc3VwcG9ydCB4ZW5zdG9yZSBwdmggc3R1
YmRvbSIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQo+PiAtLS0NCj4+IFYyOg0KPj4gLSByZXRyeSBQVkggbG9hZGluZyB3aXRoIGxvZ2dp
bmcgaWYgUFYgZmFpbHMsIHRvbyAoSmFuIEJldWxpY2gpDQo+PiAtLS0NCj4+ICAgdG9vbHMv
aGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jIHwgMjQgKysrKysrKysrKysrKysrKy0t
LS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9oZWxwZXJzL2luaXQteGVuc3Rv
cmUtZG9tYWluLmMgYi90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMNCj4+
IGluZGV4IDA0ZTM1MWNhMjkuLjRlMmY4ZDRkYTUgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9o
ZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMNCj4+ICsrKyBiL3Rvb2xzL2hlbHBlcnMv
aW5pdC14ZW5zdG9yZS1kb21haW4uYw0KPj4gQEAgLTMxLDYgKzMxLDggQEAgc3RhdGljIGlu
dCBtZW1vcnk7DQo+PiAgIHN0YXRpYyBpbnQgbWF4bWVtOw0KPj4gICBzdGF0aWMgeGVuX3Bm
bl90IGNvbnNvbGVfZ2ZuOw0KPj4gICBzdGF0aWMgeGNfZXZ0Y2huX3BvcnRfb3JfZXJyb3Jf
dCBjb25zb2xlX2V2dGNobjsNCj4+ICtzdGF0aWMgeGVudG9vbGxvZ19sZXZlbCBtaW5tc2ds
ZXZlbCA9IFhUTF9QUk9HUkVTUzsNCj4+ICtzdGF0aWMgdm9pZCAqbG9nZ2VyOw0KPj4gICAN
Cj4+ICAgc3RhdGljIHN0cnVjdCBvcHRpb24gb3B0aW9uc1tdID0gew0KPj4gICAgICAgeyAi
a2VybmVsIiwgMSwgTlVMTCwgJ2snIH0sDQo+PiBAQCAtMTQxLDE5ICsxNDMsMjkgQEAgc3Rh
dGljIGludCBidWlsZCh4Y19pbnRlcmZhY2UgKnhjaCkNCj4+ICAgICAgICAgICBnb3RvIGVy
cjsNCj4+ICAgICAgIH0NCj4+ICAgDQo+PiArICAgIC8qIFRyeSBQVkggZmlyc3QsIHN1cHBy
ZXNzIGVycm9ycyBieSBzZXR0aW5nIG1pbiBsZXZlbCBoaWdoLiAqLw0KPiANCj4gLi4uIG5l
ZWRzIHRvIG1ha2UgdGhlIHBvc2l0aW9uIGNsZWFyLg0KPiANCj4gLyrCoCBUaGlzIGlzIGEg
Ym9kZ2UuwqAgV2UgY2FuJ3QgY3VycmVudGx5IGluc3BlY3QgdGhlIGtlcm5lbCdzIEVMRiBu
b3Rlcw0KPiBhaGVhZCBvZiBhdHRlbXB0aW5nIHRvIGNvbnN0cnVjdCBhIGRvbWFpbiwgc28g
dHJ5IFBWSCBmaXJzdCwgc3VwcHJlc3NpbmcNCj4gZXJyb3JzIGJ5IHNldHRpbmcgbWluIGxl
dmVsIHRvIGhpZ2gsIGFuZCBmYWxsIGJhY2sgdG8gUFYuICovDQoNCk5vIHByb2JsZW0gd2l0
aCBtZS4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------SBe6Q266FspEqNUdTEPl5Yy0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------SBe6Q266FspEqNUdTEPl5Yy0--

--------------0Hf0Y5jeYYyQNk9QcLRhwTje--

--------------ehhHZFICYFi45f9zaxjsa7Ij
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPTraYFAwAAAAAACgkQsN6d1ii/Ey/v
aggAh2kAqx9HDiiHpaMwITwQTJEYLocJvaerKVHzTliHd3RKAlh2qGkiJ0uF39zP54Vc2YYgmuDj
HgXwoVLakYfgDw36cGvLx8sLDIc7ZiApOVWvIu+PsoZWAjcdszC0HMwqKj9Q1hnzloVr8X0cFnuF
4TPoHLnGTZgHGkDU8+jMDAupuOHxOvnAOj8W0Nd+WdlL7td53XXfPWEYSKgmdwwo6IrZBxMkIUZs
d33geklrdsobWyxr+Z30X6gFOdib56XCJzvxOdyZDwDewhvuZ2gqMGjrBuvnUT3biPdmwSXiyYR2
i7oYBMi4XpHQsmqUEKhjh9fn6GhfCfV+E/x8RTxm+A==
=8OgK
-----END PGP SIGNATURE-----

--------------ehhHZFICYFi45f9zaxjsa7Ij--

