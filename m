Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502F06713DF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 07:24:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480152.744385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI1rX-0001tQ-T7; Wed, 18 Jan 2023 06:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480152.744385; Wed, 18 Jan 2023 06:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI1rX-0001rM-Pi; Wed, 18 Jan 2023 06:23:55 +0000
Received: by outflank-mailman (input) for mailman id 480152;
 Wed, 18 Jan 2023 06:23:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI1rV-0001qn-Ko
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 06:23:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acf1f3bc-96f8-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 07:23:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A45F20DAA;
 Wed, 18 Jan 2023 06:23:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23831138FE;
 Wed, 18 Jan 2023 06:23:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Fb9OB3eQx2OpWwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 06:23:51 +0000
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
X-Inumbo-ID: acf1f3bc-96f8-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674023031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XOvtrcVkOmWGlRiKMRwAPmgBhb7IY9GEt8qZ1c/GQo=;
	b=vAOA6b0GobqNo+F0IJwjnktMskaJs1BWXBWWFX9GvvyiNX85Jjxt3h+Jlsz1YkZ+ghH7PD
	Io12bYqYqNbTdZ4GH8PxnAX8yehsNmdCinWRks6fkuCqrcpW1uHg5WuxBgEYJyBBM8mF6b
	CdzdWIPOQO129tNsBJK5I1JC9YWx6yQ=
Message-ID: <c541fcd7-a829-f757-c949-1b4a089ac6c3@suse.com>
Date: Wed, 18 Jan 2023 07:23:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-17-jgross@suse.com>
 <17595b1f-1523-9526-85da-99b9300f3218@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 16/17] tools/xenstore: let check_store() check the
 accounting data
In-Reply-To: <17595b1f-1523-9526-85da-99b9300f3218@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZdnA3t4tQLev6YkcScSpCVHu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZdnA3t4tQLev6YkcScSpCVHu
Content-Type: multipart/mixed; boundary="------------sLtV0tiM8qoUHUo5rAMFMqaY";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <c541fcd7-a829-f757-c949-1b4a089ac6c3@suse.com>
Subject: Re: [PATCH v3 16/17] tools/xenstore: let check_store() check the
 accounting data
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-17-jgross@suse.com>
 <17595b1f-1523-9526-85da-99b9300f3218@xen.org>
In-Reply-To: <17595b1f-1523-9526-85da-99b9300f3218@xen.org>

--------------sLtV0tiM8qoUHUo5rAMFMqaY
Content-Type: multipart/mixed; boundary="------------Tjd0oT0yPHUqbzgRn50tnlO6"

--------------Tjd0oT0yPHUqbzgRn50tnlO6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDEuMjMgMjM6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE3LzAxLzIwMjMgMDk6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
b2RheSBjaGVja19zdG9yZSgpIGlzIG9ubHkgdGVzdGluZyB0aGUgY29ycmVjdG5lc3Mgb2Yg
dGhlIG5vZGUgdHJlZS4NCj4+DQo+PiBBZGQgdmVyaWZpY2F0aW9uIG9mIHRoZSBhY2NvdW50
aW5nIGRhdGEgKG51bWJlciBvZiBub2RlcynCoCBhbmQgY29ycmVjdA0KPiANCj4gTklUOiBv
bmUgdG9vIG1hbnkgc3BhY2UgYmVmb3JlICdhbmQnLg0KPiANCj4+IHRoZSBkYXRhIGlmIGl0
IGlzIHdyb25nLg0KPj4NCj4+IERvIHRoZSBpbml0aWFsIGNoZWNrX3N0b3JlKCkgY2FsbCBv
bmx5IGFmdGVyIFhlbnN0b3JlIGVudHJpZXMgb2YgYQ0KPj4gbGl2ZSB1cGRhdGUgaGF2ZSBi
ZWVuIHJlYWQuDQo+IA0KPiBDYW4geW91IGNsYXJpZnkgd2hldGhlciB0aGlzIGlzIG5lZWRl
ZCBmb3IgdGhlIHJlc3Qgb2YgdGhlIHBhdGNoLCBvciBzaW1wbHkgYSANCj4gbmljZSB0aGlu
ZyB0byBoYXZlIGluIGdlbmVyYWw/DQoNCkknbGwgYWRkOiAiVGhpcyBpcyB3YW50ZWQgdG8g
bWFrZSBzdXJlIHRoZSBhY2NvdW50aW5nIGRhdGEgaXMgY29ycmVjdCBhZnRlcg0KYSBsaXZl
IHVwZGF0ZS4iDQoNCj4gDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfY29yZS5jwqDCoCB8IDYyICsrKysrKysrKysrKysrKystLS0tLS0NCj4+IMKgIHRvb2xz
L3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYyB8IDg2ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uaCB8
wqAgNCArKw0KPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxMzcgaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0
b3JlZF9jb3JlLmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBpbmRl
eCAzMDk5MDc3YTg2Li5lMjAxZjE0MDUzIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3Rv
cmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVk
X2NvcmUuYw0KPj4gQEAgLTIzODksOCArMjM4OSw2IEBAIHZvaWQgc2V0dXBfc3RydWN0dXJl
KGJvb2wgbGl2ZV91cGRhdGUpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbWFudWFsX25vZGUo
IkBpbnRyb2R1Y2VEb21haW4iLCBOVUxMKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkb21h
aW5fbmJlbnRyeV9maXgoZG9tMF9kb21pZCwgNSwgdHJ1ZSk7DQo+PiDCoMKgwqDCoMKgIH0N
Cj4+IC0NCj4+IC3CoMKgwqAgY2hlY2tfc3RvcmUoKTsNCj4+IMKgIH0NCj4+IMKgIHN0YXRp
YyB1bnNpZ25lZCBpbnQgaGFzaF9mcm9tX2tleV9mbih2b2lkICprKQ0KPj4gQEAgLTI0MzMs
MjAgKzI0MzEsMjggQEAgaW50IHJlbWVtYmVyX3N0cmluZyhzdHJ1Y3QgaGFzaHRhYmxlICpo
YXNoLCBjb25zdCBjaGFyIA0KPj4gKnN0cikNCj4+IMKgwqAgKiBBcyB3ZSBnbywgd2UgcmVj
b3JkIGVhY2ggbm9kZSBpbiB0aGUgZ2l2ZW4gcmVhY2hhYmxlIGhhc2h0YWJsZS7CoCBUaGVz
ZQ0KPj4gwqDCoCAqIGVudHJpZXMgd2lsbCBiZSB1c2VkIGxhdGVyIGluIGNsZWFuX3N0b3Jl
Lg0KPj4gwqDCoCAqLw0KPj4gKw0KPj4gK3N0cnVjdCBjaGVja19zdG9yZV9kYXRhIHsNCj4+
ICvCoMKgwqAgc3RydWN0IGhhc2h0YWJsZSAqcmVhY2hhYmxlOw0KPj4gK8KgwqDCoCBzdHJ1
Y3QgaGFzaHRhYmxlICpkb21haW5zOw0KPj4gK307DQo+PiArDQo+PiDCoCBzdGF0aWMgaW50
IGNoZWNrX3N0b3JlX3N0ZXAoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiAq
Y29ubiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG5v
ZGUgKm5vZGUsIHZvaWQgKmFyZykNCj4+IMKgIHsNCj4+IC3CoMKgwqAgc3RydWN0IGhhc2h0
YWJsZSAqcmVhY2hhYmxlID0gYXJnOw0KPj4gK8KgwqDCoCBzdHJ1Y3QgY2hlY2tfc3RvcmVf
ZGF0YSAqZGF0YSA9IGFyZzsNCj4+IC3CoMKgwqAgaWYgKGhhc2h0YWJsZV9zZWFyY2gocmVh
Y2hhYmxlLCAodm9pZCAqKW5vZGUtPm5hbWUpKSB7DQo+PiArwqDCoMKgIGlmIChoYXNodGFi
bGVfc2VhcmNoKGRhdGEtPnJlYWNoYWJsZSwgKHZvaWQgKilub2RlLT5uYW1lKSkgew0KPiAN
Cj4gSUlVQyB0aGUgY2FzdCBpcyBvbmx5IG5lY2Vzc2FyeSBiZWNhdXNlIGhhc2h0YWJsZV9z
ZWFyY2goKSBleHBlY3RzIGEgbm9uLWNvbnN0IA0KPiB2YWx1ZS4gSSBjYW4ndCB0aGluayBm
b3IgYSByZWFzb24gZm9yIHRoZSBrZXkgdG8gYmUgbm9uLWNvbnN0LiBTbyBJIHdpbGwgbG9v
ayB0byANCj4gc2VuZCBhIGZvbGxvdy11cCBwYXRjaC4NCg0KSXQgaXMgcG9zc2libGUsIGJ1
dCBuYXN0eSwgZHVlIHRvIHRhbGxvY19mcmVlKCkgbm90IHRha2luZyBhIGNvbnN0IHBvaW50
ZXIuDQoNCj4gDQo+PiArDQo+PiArdm9pZCBkb21haW5fY2hlY2tfYWNjX2FkZChjb25zdCBz
dHJ1Y3Qgbm9kZSAqbm9kZSwgc3RydWN0IGhhc2h0YWJsZSAqZG9tYWlucykNCj4+ICt7DQo+
PiArwqDCoMKgIHN0cnVjdCBkb21haW5fYWNjICpkb207DQo+PiArwqDCoMKgIHVuc2lnbmVk
IGludCBkb21pZDsNCj4+ICsNCj4+ICvCoMKgwqAgZG9taWQgPSBub2RlLT5wZXJtcy5wWzBd
LmlkOw0KPiANCj4gVGhpcyBjb3VsZCBiZSByZXBsYWNlZCB3aXRoIGdldF9ub2RlX293bmVy
KCkuDQoNCkluZGVlZC4NCg0KPiANCj4+ICvCoMKgwqAgZG9tID0gaGFzaHRhYmxlX3NlYXJj
aChkb21haW5zLCAmZG9taWQpOw0KPj4gK8KgwqDCoCBpZiAoIWRvbSkNCj4+ICvCoMKgwqDC
oMKgwqDCoCBsb2coIk5vZGUgJXMgb3duZWQgYnkgdW5rbm93biBkb21haW4gJXUiLCBub2Rl
LT5uYW1lLCBkb21pZCk7DQo+PiArwqDCoMKgIGVsc2UNCj4+ICvCoMKgwqDCoMKgwqDCoCBk
b20tPm5vZGVzKys7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgZG9tYWluX2NoZWNr
X2FjY19zdWIoY29uc3Qgdm9pZCAqaywgdm9pZCAqdiwgdm9pZCAqYXJnKQ0KPiANCj4gSSBm
aW5kIHRoZSBzdWZmaXggJ3N1YicgbWlzbGVhZGluZyBiZWNhdXNlIHdlIGhhdmUgYSBmdW5j
dGlvbiB3aXRoIGEgdmVyeSANCj4gc2ltaWxhciBuYW1lIChpbnN0ZWFkIHN1ZmZpeGVkICdz
dWInKS4gWWV0LCBBRkFJQ1QsIGl0IGlzIG5vdCBtZWFudCB0byBzdWJzdHJhY3QuDQo+IA0K
PiBTbyBJIHdvdWxkIHByZWZpeCB3aXRoICdfY2InIGluc3RlYWQuDQoNCkZpbmUgd2l0aCBt
ZS4NCg0KDQpKdWVyZ2VuDQo=
--------------Tjd0oT0yPHUqbzgRn50tnlO6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Tjd0oT0yPHUqbzgRn50tnlO6--

--------------sLtV0tiM8qoUHUo5rAMFMqaY--

--------------ZdnA3t4tQLev6YkcScSpCVHu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPHkHYFAwAAAAAACgkQsN6d1ii/Ey+L
gwf/Q0KKbxefmzYmbxpBUZazWvEiddgz3S8jdBSl9re6R/48eGBlpdTYcV0ZhK5II6IfwSsjaT3C
dNcLh6xhiWqlERdMVkVUrDwOZqL4VC6o42R0g6Cb9+uO94HlD9JgRbT3pLkd9O9g/0mnzZTxJDfr
jVILugznQe6xpFa/+pR8LFQdNpNXfciEI4YvScugZXm0TLfsn2DjplLX1ZHuPQzOWE0Ymm7vkp0a
GC8z/BLBVBvUZq0Lesirq90aAPP1T7fr7J1cX0KLkTg+eaUPcJUhmcwxCmmOHsUaO2ohLPaTVeNe
+YtoFvEeQqtRRBYbTYyFGRYKEWmB7qrRkJI+E4BoGQ==
=BTqi
-----END PGP SIGNATURE-----

--------------ZdnA3t4tQLev6YkcScSpCVHu--

