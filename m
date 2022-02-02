Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555EB4A7170
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 14:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264173.457178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFb3-000210-QN; Wed, 02 Feb 2022 13:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264173.457178; Wed, 02 Feb 2022 13:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFb3-0001yG-Ly; Wed, 02 Feb 2022 13:22:53 +0000
Received: by outflank-mailman (input) for mailman id 264173;
 Wed, 02 Feb 2022 13:22:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CazJ=SR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nFFb1-0001y5-LY
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 13:22:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 369ca52b-842b-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 14:22:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D1633212B9;
 Wed,  2 Feb 2022 13:22:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD6AD13E48;
 Wed,  2 Feb 2022 13:22:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PlVeKKmF+mFCRQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 02 Feb 2022 13:22:49 +0000
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
X-Inumbo-ID: 369ca52b-842b-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643808169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gi5sr4L3f+kSSumZliFKKqERlJ5d9Kjr87jme9eoCio=;
	b=YPmJUdA6WSWwlwV5aHNix+gPwGGfbKQhymsBwzmGHlkqKaAki9kiL9hzlaC+LxpBrDudJh
	R06+z2vOPF9kt1CBU7t96H7z2NGXx1ZDjv9GVOURL/PGB8oKeTbU+DafRUmYLzBgLQJvLM
	3JgbI54R4Zfo+uGksk3gxsyq/4yqVxM=
Message-ID: <a47d10ac-15f4-65a1-afef-813c15d88a78@suse.com>
Date: Wed, 2 Feb 2022 14:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/5] tools/include: generate a _xen_list.h file
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220130084343.19070-1-jgross@suse.com>
 <20220130084343.19070-2-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220130084343.19070-2-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EVFoQKlMPjDOK32MqIi0l3xJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EVFoQKlMPjDOK32MqIi0l3xJ
Content-Type: multipart/mixed; boundary="------------yv055hrw4vZbU5014i25qK51";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <a47d10ac-15f4-65a1-afef-813c15d88a78@suse.com>
Subject: Re: [PATCH 1/5] tools/include: generate a _xen_list.h file
References: <20220130084343.19070-1-jgross@suse.com>
 <20220130084343.19070-2-jgross@suse.com>
In-Reply-To: <20220130084343.19070-2-jgross@suse.com>

--------------yv055hrw4vZbU5014i25qK51
Content-Type: multipart/mixed; boundary="------------xBCMaiDQTgYCBQx2YjgGioke"

--------------xBCMaiDQTgYCBQx2YjgGioke
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDEuMjIgMDk6NDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFRvZGF5IHRvb2xz
L2luY2x1ZGUgY29udGFpbnMgdHdvIGJhc2ljYWxseSBpZGVudGljYWwgaGVhZGVyIGZpbGVz
DQo+IGdlbmVyYXRlZCBmcm9tIHRoZSBzYW1lIHNvdXJjZS4gVGhleSBqdXN0IGRpZmZlciBi
eSB0aGUgdXNlZCBuYW1lIHNwYWNlDQo+IGFuZCB0aGV5IGFyZSBiZWluZyBnZW5lcmF0ZWQg
ZnJvbSBkaWZmZXJlbnQgTWFrZWZpbGVzIHZpYSBhIHBlcmwNCj4gc2NyaXB0Lg0KPiANCj4g
UHJlcGFyZSB0byBoYXZlIG9ubHkgb25lIHN1Y2ggaGVhZGVyIGJ5IHVzaW5nIGEgbW9yZSBn
ZW5lcmljIG5hbWVzcGFjZQ0KPiAiWEVOIiBmb3IgX3hlbl9saXN0LmguDQo+IA0KPiBBcyB0
aGUgb3JpZ2luYWwgaGVhZGVyIGhhc24ndCBiZWVuIHVwZGF0ZWQgaW4gdGhlIFhlbiB0cmVl
IHNpbmNlIGl0cw0KPiBpbnRyb2R1Y3Rpb24gYWJvdXQgMTAgeWVhcnMgYWdvLCBhbmQgdGhl
IHVwZGF0ZXMgb2YgRnJlZUJTRCBzaWRlIGhhdmUNCj4gbW9zdGx5IGNvdmVyZWQgQlNEIGlu
dGVybmFsIGRlYnVnZ2luZyBhaWRzLCBqdXN0IGRvbid0IGdlbmVyYXRlIHRoZQ0KPiBuZXcg
aGVhZGVyIGR1cmluZyBidWlsZCwgZXNwZWNpYWxseSBhcyB1c2luZyB0aGUgY3VycmVudCBG
cmVlQlNEDQo+IHZlcnNpb24gb2YgdGhlIGZpbGUgd291bGQgcmVxdWlyZSBzb21lIHVwZGF0
ZXMgb2YgdGhlIHBlcmwgc2NyaXB0LA0KPiB3aGljaCBhcmUgcG90ZW50aWFsbHkgbW9yZSB3
b3JrIHRoYW4ganVzdCBkb2luZyB0aGUgbmVlZGVkIGVkaXRpbmcgYnkNCj4gaGFuZC4gQWRk
aXRpb25hbGx5IHRoaXMgZW5hYmxlcyB0byByZW1vdmUgdGhlIG5vdCBuZWVkZWQgZGVidWdn
aW5nDQo+IGV4dGVuc2lvbnMgb2YgRnJlZUJTRC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gLS0tDQo+ICAgdG9vbHMvaW5jbHVk
ZS9NYWtlZmlsZSAgICB8ICAgMiArDQo+ICAgdG9vbHMvaW5jbHVkZS9feGVuX2xpc3QuaCB8
IDUyMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgNTI1IGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
dG9vbHMvaW5jbHVkZS9feGVuX2xpc3QuaA0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2lu
Y2x1ZGUvTWFrZWZpbGUgYi90b29scy9pbmNsdWRlL01ha2VmaWxlDQo+IGluZGV4IGQ3YjUx
MDA2ZTAuLmQ5NjU5ODdmNTUgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2luY2x1ZGUvTWFrZWZp
bGUNCj4gKysrIGIvdG9vbHMvaW5jbHVkZS9NYWtlZmlsZQ0KPiBAQCAtNzAsMTEgKzcwLDEz
IEBAIGluc3RhbGw6IGFsbA0KPiAgIAkkKElOU1RBTExfREFUQSkgeGVuL2lvLyouaCAkKERF
U1RESVIpJChpbmNsdWRlZGlyKS94ZW4vaW8NCj4gICAJJChJTlNUQUxMX0RBVEEpIHhlbi9z
eXMvKi5oICQoREVTVERJUikkKGluY2x1ZGVkaXIpL3hlbi9zeXMNCj4gICAJJChJTlNUQUxM
X0RBVEEpIHhlbi94c20vKi5oICQoREVTVERJUikkKGluY2x1ZGVkaXIpL3hlbi94c20NCj4g
KwkkKElOU1RBTExfREFUQSkgX3hlbl9saXN0LmggJChERVNURElSKSQoaW5jbHVkZWRpcikN
Cj4gICANCj4gICAuUEhPTlk6IHVuaW5zdGFsbA0KPiAgIHVuaW5zdGFsbDoNCj4gICAJZWNo
byAiW0ZJWE1FXSB1bmluc3RhbGwgaGVhZGVycyINCj4gICAJcm0gLXJmICQoREVTVERJUikk
KGluY2x1ZGVkaXIpL3hlbg0KPiArCXJtIC1mICQoREVTVERJUikkKGluY2x1ZGVkaXIpL194
ZW5fbGlzdC5oDQo+ICAgDQo+ICAgLlBIT05ZOiBjbGVhbg0KPiAgIGNsZWFuOg0KPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS9feGVuX2xpc3QuaCBiL3Rvb2xzL2luY2x1ZGUvX3hl
bl9saXN0LmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4u
NzlhY2FmNGNmMw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3Rvb2xzL2luY2x1ZGUvX3hl
bl9saXN0LmgNCj4gQEAgLTAsMCArMSw1MjMgQEANCj4gKy8qDQo+ICsgKiBETyBOT1QgRURJ
VCBUSElTIEZJTEUNCj4gKyAqDQo+ICsgKiBHZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBi
c2Qtc3lzLXF1ZXVlLWgtc2VkZGVyeSB0bw0KPiArICogIC0gaW50cm9kdWNlIFhFTl8gYW5k
IFhFTl8gbmFtZXNwYWNlIHByZWZpeGVzDQo+ICsgKiAgLSB0dXJuICJzdHJ1Y3QgdHlwZSIg
aW50byAidHlwZSIgc28gdGhhdCB0eXBlIGFyZ3VtZW50cw0KPiArICogICAgIHRvIHRoZSBt
YWNyb3MgYXJlIHR5cGUgbmFtZXMgbm90IHN0cnVjdCB0YWdzDQo+ICsgKiAgLSByZW1vdmUg
dGhlIHJlZmVyZW5jZSB0byBzeXMvY2RlZnMuaCwgd2hpY2ggaXMgbm90IG5lZWRlZA0KPiAr
ICoNCj4gKyAqIFRoZSBwdXJwb3NlIG9mIHRoaXMgc2VkZGVyeSBpcyB0byBhbGxvdyB0aGUg
cmVzdWx0aW5nIGZpbGUgdG8gYmUNCj4gKyAqIGZyZWVseSBpbmNsdWRlZCBieSBzb2Z0d2Fy
ZSB3aGljaCBtaWdodCBhbHNvIHdhbnQgdG8gaW5jbHVkZSBvdGhlcg0KPiArICogbGlzdCBt
YWNyb3M7IHRvIG1ha2UgaXQgdXNhYmxlIHdoZW4gc3RydWN0IHRhZ3MgYXJlIG5vdCBiZWlu
ZyB1c2VkDQo+ICsgKiBvciBub3Qga25vd247IHRvIG1ha2UgaXQgbW9yZSBwb3J0YWJsZS4N
Cj4gKyAqLw0KDQpTb3JyeSwgZm9yZ290IHRvIHJlbW92ZSBhYm92ZSBjb21tZW50LiBJJ2xs
IHdhaXQgZm9yIG1vcmUgY29tbWVudHMNCmJlZm9yZSByZXNlbmRpbmcuDQoNCg0KSnVlcmdl
bg0K
--------------xBCMaiDQTgYCBQx2YjgGioke
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------xBCMaiDQTgYCBQx2YjgGioke--

--------------yv055hrw4vZbU5014i25qK51--

--------------EVFoQKlMPjDOK32MqIi0l3xJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmH6hakFAwAAAAAACgkQsN6d1ii/Ey91
Bgf/Yo0gId47r6U8zgb4SOfaOq6tuZ+JQst8ZUHdfJxKGbTMbz+f9WJCeEEg8NOuUQVI+UpJCG1p
BWH12TnJfktLG14+8uDxmOeOAM7bcbe/bLCy015Mrm8hXACFdLeSukXT6qnl/+04RwO1w6Ze/Huk
g2QSAlcOSno59PzpvpkjW86CLJB3bEZ8HREEkPOtwIIn+cBut7Md9HLxcoIqwii7egpH+WEKhdtL
CIJafnHUaCmx5+A2h+6xCnHv2lpftv10VUamk2Ck1MMlDm8nQ1CJLQ8S3PUq4Jch9GVAfMWbGIOh
q0oYulMqLOhXRDxEHeTK+kOsEmdk76qNmIziDnCskw==
=yhot
-----END PGP SIGNATURE-----

--------------EVFoQKlMPjDOK32MqIi0l3xJ--

