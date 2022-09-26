Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE45E9ED7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 12:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411608.654580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocl8E-0004KN-Jl; Mon, 26 Sep 2022 10:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411608.654580; Mon, 26 Sep 2022 10:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocl8E-0004Hb-H9; Mon, 26 Sep 2022 10:14:34 +0000
Received: by outflank-mailman (input) for mailman id 411608;
 Mon, 26 Sep 2022 10:14:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ba90=Z5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ocl8D-0004HV-JF
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 10:14:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 035b8b77-3d84-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 12:14:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B53982208F;
 Mon, 26 Sep 2022 10:14:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9529C139BD;
 Mon, 26 Sep 2022 10:14:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DeeGIod7MWP5DgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 26 Sep 2022 10:14:31 +0000
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
X-Inumbo-ID: 035b8b77-3d84-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664187271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7PjyGWDL7Egnvvl4GyOrzeb8Uhxg+k4GQVEGhECWzhw=;
	b=EtI3F5Bc1zGYys9Y7UPsACfg3h0ycda8qrgDjhaea+sWztIEt137Ppo9I/A0NEmIqaYt4J
	3wgjD9mdzk2Ge/3jexNw69q86NyPdUCi2CpungcKsPHVVb1U6UPGzKlqoH3H9gbH89bUIZ
	2Y0bp8rkOqBf/f1DOPzPVTlXK0MlAC4=
Message-ID: <ebdf4843-be55-5a14-e305-5884f7412290@suse.com>
Date: Mon, 26 Sep 2022 12:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YyszY+qHOVkCTe92@mail-itl>
 <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
 <bbb0a75f-4687-3e18-6219-ee32de298664@suse.com>
 <8de37e96-cf67-2306-b586-dd45019a536d@suse.com>
 <065ff8d4-2f8a-a771-e3a1-6853bb332b3c@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Design session PVH dom0
In-Reply-To: <065ff8d4-2f8a-a771-e3a1-6853bb332b3c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rJx9uWaYWlntyfTYj9fQPLQO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rJx9uWaYWlntyfTYj9fQPLQO
Content-Type: multipart/mixed; boundary="------------53x0PcWNttmXfliWw1OjjfKo";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <ebdf4843-be55-5a14-e305-5884f7412290@suse.com>
Subject: Re: Design session PVH dom0
References: <YyszY+qHOVkCTe92@mail-itl>
 <e81e9b3a-baf2-cba1-01f1-89ba4a9ccf33@suse.com>
 <bbb0a75f-4687-3e18-6219-ee32de298664@suse.com>
 <8de37e96-cf67-2306-b586-dd45019a536d@suse.com>
 <065ff8d4-2f8a-a771-e3a1-6853bb332b3c@suse.com>
In-Reply-To: <065ff8d4-2f8a-a771-e3a1-6853bb332b3c@suse.com>

--------------53x0PcWNttmXfliWw1OjjfKo
Content-Type: multipart/mixed; boundary="------------4AbDxf7Tvk6DUwUBhZ8zcBPl"

--------------4AbDxf7Tvk6DUwUBhZ8zcBPl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDkuMjIgMTE6MzAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4wOS4yMDIy
IDEwOjMzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjYuMDkuMjIgMDk6NTMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIzLjA5LjIwMjIgMTA6MjAsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDIxLjA5LjIyIDE3OjUzLCBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgd3JvdGU6DQo+Pj4+PiBTZXNzaW9uIGRlc2NyaXB0aW9uIChieSBKYW4pOg0K
Pj4+Pj4gSW4gdGhlIGNvdXJzZSBvZiB3b3JraW5nIG9uIGFuIFhTQSBJIGhhZCB0byBmaW5h
bGx5IGdldCBQVkggRG9tMCB3b3JrIG9uIGF0IGxlYXN0IG9uZSBvZiBteSBzeXN0ZW1zLCBp
biBhIG1pbmltYWwgZmFzaGlvbi4gVGhpcyBoYWQgdHVybmVkIHVwIGEgbnVtYmVyIG9mIGlz
c3Vlcywgc29tZSBvZiB3aGljaCBoYXZlIHNpbmNlIHJlbWFpbmVkIHBlbmRpbmcuIFRoZXJl
Zm9yZSBJ4oCZZCBsaWtlIHRvIGdhaW4gdW5kZXJzdGFuZGluZyBvbiB3aGV0aGVyIHRoZXJl
IGlzIGFueSBmdXR1cmUgdG8gdGhpcyBtb2RlIG9mIERvbTAgb3BlcmF0aW9uLCBhbmQgaWYg
c28gd2hlbiBpdCBjYW4gYmUgZXhwZWN0ZWQgdG8gYmUgYmV0dGVyIHRoYW4gdGVjaCBwcmV2
aWV3IG9yIGV2ZW4ganVzdCBleHBlcmltZW50YWwuDQo+Pj4+DQo+Pj4+IC4uLg0KPj4+Pg0K
Pj4+Pj4gSsO8cmdlbjogUFZIIGRvbTAgcGVyZm9ybWFuY2U/DQo+Pj4+Pg0KPj4+Pj4gUm9n
ZXI6IGl0J3MgYmFkOyBtb3N0bHkgcmVsZXZhbnQgaXMgcWVtdSBpbnRlcmZhY2VzDQo+Pj4+
Pg0KPj4+Pj4gR2VvcmdlOiBvbmx5IGZvciBzYWZldHkgY2VydGlmaWNhdGlvbnM/IHBlcmZv
cm1hbmNlIHBlbmFsdHkgbWF5IGJlIG9rYXkNCj4+Pj4+DQo+Pj4+PiBKw7xyZ2VuOiBoeXBl
cmNhbGxzIGNhbiBiZSBpbXByb3ZlZCAodmlydHVhbCBidWZmZXJzPykNCj4+Pj4NCj4+Pj4g
U29tZSBtb3JlIHRob3VnaHRzIG9uIHRoaXMgdG9waWM6IEhhdmluZyBoeXBlcmNhbGwgdmFy
aWFudHMgd2l0aCBwaHlzaWNhbGx5DQo+Pj4+IGFkZHJlc3NlZCBidWZmZXJzIHdpbGwgaGVs
cCwgYnV0IHRoZXJlIGlzIGFuIGFkZGl0aW9uYWwgY29tcGxleGl0eTogd2hhdA0KPj4+PiBh
Ym91dCBoeXBlcmNhbGxzIHdpdGggcmVhbGx5IGxhcmdlIGJ1ZmZlcnMgKGUuZy4gdGhlIGJp
dG1hcCBmb3IgbW9kaWZpZWQNCj4+Pj4gcGFnZXMgZm9yIGd1ZXN0IG1pZ3JhdGlvbikuIElu
IG9yZGVyIHRvIGF2b2lkIGhhdmluZyB0byBhbGxvY2F0ZSBodWdlDQo+Pj4+IHBoeXNpY2Fs
bHkgY29udGlndW91cyBidWZmZXJzIGZvciB0aG9zZSBwdXJwb3NlcyB3ZSdkIHByb2JhYmx5
IG5lZWQNCj4+Pj4gc29tZXRoaW5nIGxpa2Ugc2NhdHRlci9nYXRoZXIgbGlzdHMgZm9yIGh5
cGVyY2FsbCBidWZmZXJzLg0KPj4+DQo+Pj4gTm90IHN1cmUuIEknZCByYXRoZXIgc2VlIHVz
IGFkZCBuZXcgKHN1YiloeXBlcmNhbGxzIGZvciBzdWNoIG5vbi1zdGFuZGFyZA0KPj4+IGNh
c2VzLiBFLmcuIHRoZSBiaXRtYXAgZXhhbXBsZSB5b3UgZ2l2ZSB3b3VsZCBiZSBhbWVuZGVk
IGJ5IGEgbmV3IGZsYXZvcg0KPj4+IGhhdmluZyB0aGUgY2FsbGVyIHBhc3MgaW4gYW4gYXJy
YXkgb2YgR0ZOcyAocGVyaGFwcywgYXMgeW91IHNheSwgd2l0aA0KPj4+IGZ1cnRoZXIgaW5k
aXJlY3Rpb24gdG8gZGVhbCB3aXRoIHRoYXQgYXJyYXkgYWxzbyBncm93aW5nIGxhcmdlKS4g
SSdkDQo+Pj4gcmVhbGx5IGxpa2UgdG8ga2VlcCB0aGUgY29tbW9uIGNhc2Ugc2ltcGxlLg0K
Pj4NCj4+IFRoZSBxdWVzdGlvbiBpcyBob3cgbWFueSBoeXBlcmNhbGxzIHdvdWxkIGJlIGhp
dCBieSB0aGUgbm90IGNvbW1vbiBjYXNlLg0KPj4NCj4+IFRha2luZyBhIHF1aWNrIGdsYW5j
ZSBJIHNwb3R0ZWQ6DQo+Pg0KPj4gLSBncmFudF90YWJsZV9vcCAoc3Vib3BzIHNldHVwX3Rh
YmxlIGFuZCBnZXRfc3RhdHVzX2ZyYW1lcykNCj4+IC0gbWVtb3J5X29wIChzZXZlcmFsIHN1
Yi1vcHMpDQo+PiAtIG11bHRpY2FsbCAobWFpbiBsaXN0IG9mIGNhbGxzKQ0KPj4gLSBjb25z
b2xlX2lvIChjb25zb2xlIGRhdGEpDQo+PiAtIG1tdWV4dF9vcCAoc29tZSBvcHMgYWxsb3cg
bGlzdHMpDQo+PiAtIHhzbV9vcCAobm90IHN1cmUgYSBidWZmZXIgY2FuIHNwYW4gcGFnZXMs
IGJ1dCBpbnRlcmZhY2Ugd291bGQgYWxsb3cgaXQpDQo+PiAtIHBoeXNkZXZfb3AgKHN1Ym9w
IHNldF9pb2JpdG1hcCkNCj4+IC0gaHZtX29wIChhbHRwMm0gaGFuZGxpbmcpDQo+PiAtIHN5
c2N0bCAobXVsdGlwbGUgc3ViLW9wcykNCj4+IC0gZG9tY3RsIChtdWx0aXBsZSBzdWItb3Bz
KQ0KPj4gLSBoeXBmcyAobm9kZSBkYXRhIGNhbiBleGNlZWQgcGFnZSBzaXplKQ0KPj4NCj4+
IERvIHdlIHJlYWxseSB3YW50IHRvIHNwZWNpYWwgY2FzZSBhbGwgb2YgdGhvc2U/DQo+IA0K
PiBMb29raW5nIGF0IHRoZSBMaW51eCB1c2VzIG9mIHNldmVyYWwgb2YgdGhlIG9uZXMgY292
ZXJlZCBieSB0aGUgdG9wIHRocmVlDQo+IGVudHJpZXMgaW4geW91ciBsaXN0IEkgZmluZCB0
aGV5IGFsbCB1c2UgY29udGlndW91cyBidWZmZXJzIGFscmVhZHksIHRvIGENCj4gZmFpciBw
YXJ0IGJlY2F1c2Ugb2YgbGltaXRpbmcgbWF4aW11bSBudW1iZXIgb2YgZW50cmllcy4gVGhl
cmVmb3JlIEkgZG9uJ3QNCj4gcmVhbGx5IHRoaW5rIGFsbCBvZiB0aGVzZSB3b3VsZCBuZWVk
IHNwZWNpYWwgY2FzaW5nLCB1bnRpbCBhIHJlYXNvbmFibGUNCj4gdXNlIGNhc2UgaXMgZGVt
b25zdHJhdGVkIHdoZXJlIHN1Y2ggbGFyZ2UgbGlzdHMgYXJlIGFjdHVhbGx5IG5lZWRlZC4N
Cg0KLi4uIGFuZCB0aGVuIHRoZXJlIGFyZSB0aGUgdXNlIGNhc2VzIG9mIFhlbiB0b29scyB2
aWEgdGhlIHByaXZjbWQgZHJpdmVyLg0KDQpFc3BlY2lhbGx5IHRoZSB0b29scyBzaWRlIHVz
ZSBjYXNlcyBtaWdodCBiZSBhYmxlIHRvIGJlIHVzYWJsZSB2aWEgYSBnZW5lcmljDQpmcmFt
ZXdvcmsgaW4gY2FzZSB3ZSBtYWtlIHRoZSBidWZmZXIgcXVhbGlmaWNhdGlvbiBnZW5lcmlj
IGluc3RlYWQgb2Ygc3BlY2lhbA0KY2FzaW5nIGl0IGZvciB0aGUgZGlmZmVyZW50IGh5cGVy
Y2FsbHMuDQoNCg0KSnVlcmdlbg0K
--------------4AbDxf7Tvk6DUwUBhZ8zcBPl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4AbDxf7Tvk6DUwUBhZ8zcBPl--

--------------53x0PcWNttmXfliWw1OjjfKo--

--------------rJx9uWaYWlntyfTYj9fQPLQO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMxe4cFAwAAAAAACgkQsN6d1ii/Ey+h
5gf/Q2paBMBZk3K/fN0Sh1O4tDa30TOoa3tl47bdMdvKG2zCZd00+05pYWNF1L7+NFwJQXNKHUus
eegw8/VZO+Jf/B+MVyl++Yfr4/1Ui7FhjObj/H1pvnR9t+mJaXT5n2X7h5XKKXBM44rEFA65fxNT
eSrh1eRNkm5PIfDxsFbW8jfhi+EB1zRPD1CgD4V6hcxqwBnQgTKqwjlqTD37+ItNNg4MU+C4AxZy
A2Ix0Ur4cNF1gVA25uNX+9SISo+dXPRWkg8gbtgmthiBwPNebULIYC1/l2B/eBiGJ5ZXGrcfOcio
jfJ3EARQU02QYXKzl/WyqwqL/5/fy7A18I2fvf/YgA==
=SqEW
-----END PGP SIGNATURE-----

--------------rJx9uWaYWlntyfTYj9fQPLQO--

