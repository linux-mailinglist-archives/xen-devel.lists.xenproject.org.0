Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8AA565080
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 11:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360027.589378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8I8G-0005Xp-Ld; Mon, 04 Jul 2022 09:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360027.589378; Mon, 04 Jul 2022 09:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8I8G-0005V4-Fs; Mon, 04 Jul 2022 09:12:40 +0000
Received: by outflank-mailman (input) for mailman id 360027;
 Mon, 04 Jul 2022 09:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o8I8E-0005Ud-B0
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 09:12:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7263228a-fb79-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 11:12:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5E8E22115;
 Mon,  4 Jul 2022 09:12:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 942B213451;
 Mon,  4 Jul 2022 09:12:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WYO9IgSvwmLwUwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 04 Jul 2022 09:12:36 +0000
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
X-Inumbo-ID: 7263228a-fb79-11ec-a8e4-439420d8e422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656925956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LXOT3yR+5Wp7bs9dYLPLh10uymGAXlQbTvddjWlsmJU=;
	b=Hmqdwnu6FYfmKuDpURSCgce8u/92LmC1athQx8S7s/eHopVD/0GR/u1WMHhv6f2TvubO9J
	POHZ93xLwYCdEaGjO91v38XfTylh3SL9tDkHu87wBOwxq0xkOF20mzzCb9eDlpcz98YLgt
	pa1IGRM2f4YvU2bsg7TLcte/oBb+hkU=
Message-ID: <f1a6c96d-6f65-358e-7a31-5f0ead3e3a10@suse.com>
Date: Mon, 4 Jul 2022 11:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/4] mini-os: some memory map updates for PVH
Content-Language: en-US
To: Julien Grall <julien@xen.org>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220621072314.16382-1-jgross@suse.com>
 <3349c933-ed0d-3177-b494-ef4a6654d12d@suse.com>
 <bfe594da-dbc7-70c3-72f6-a1056e3a549d@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <bfe594da-dbc7-70c3-72f6-a1056e3a549d@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ICnBgoyAkQKi2xtoV4mGQ40s"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ICnBgoyAkQKi2xtoV4mGQ40s
Content-Type: multipart/mixed; boundary="------------Ifqr1xpTe8i4teiHijuDhmlk";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <f1a6c96d-6f65-358e-7a31-5f0ead3e3a10@suse.com>
Subject: Re: [PATCH v3 0/4] mini-os: some memory map updates for PVH
References: <20220621072314.16382-1-jgross@suse.com>
 <3349c933-ed0d-3177-b494-ef4a6654d12d@suse.com>
 <bfe594da-dbc7-70c3-72f6-a1056e3a549d@xen.org>
In-Reply-To: <bfe594da-dbc7-70c3-72f6-a1056e3a549d@xen.org>

--------------Ifqr1xpTe8i4teiHijuDhmlk
Content-Type: multipart/mixed; boundary="------------r0KinztdotDSxGuhzfw8MqP4"

--------------r0KinztdotDSxGuhzfw8MqP4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDcuMjIgMTA6NTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA0LzA3LzIwMjIgMDk6MzgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyMS4wNi4yMiAwOToyMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+PiBEbyBzb21lIG1l
bW9yeSBtYXAgcmVsYXRlZCBjaGFuZ2VzL2ZpeGVzIGZvciBQVkggbW9kZToNCj4+Pg0KPj4+
IC0gUHJlZmVyIHRoZSBtZW1vcnkgbWFwIGRlbGl2ZXJlZCB2aWEgc3RhcnQtaW5mbyBvdmVy
IHRoZSBvbmUgb2J0YWluZWQNCj4+PiDCoMKgIGZyb20gdGhlIGh5cGVydmlzb3IuIFRoaXMg
aXMgYSBwcmVyZXF1aXNpdGUgZm9yIFhlbnN0b3JlLXN0dWJkb20NCj4+PiDCoMKgIGxpdmUt
dXBkYXRlIHdpdGggcmlzaW5nIHRoZSBtZW1vcnkgbGltaXQuDQo+Pj4NCj4+PiAtIEZpeCBh
IGJ1ZyByZWxhdGVkIHRvIGJhbGxvb25pbmcgaW4gUFZIIG1vZGU6IFBWSCBYZW5zdG9yZS1z
dHViZG9tDQo+Pj4gwqDCoCBjYW4ndCByZWFkIGl0cyB0YXJnZXQgbWVtb3J5IHNpemUgZnJv
bSBYZW5zdG9yZSwgYXMgdGhpcyBpbnRyb2R1Y2VzDQo+Pj4gwqDCoCBhIGNoaWNrZW4tYW5k
LWVnZyBwcm9ibGVtLiBUaGUgbWVtb3J5IHNpemUgcmVhZCBmcm9tIHRoZSBoeXBlcnZpc29y
DQo+Pj4gwqDCoCBPVE9IIGluY2x1ZGVzIGFkZGl0aW9uYWwgInNwZWNpYWwiIHBhZ2VzIG1h
cmtlZCBhcyByZXNlcnZlZCBpbiB0aGUNCj4+PiDCoMKgIG1lbW9yeSBtYXAuIFRob3NlIHBh
Z2VzIG5lZWQgdG8gYmUgc3VidHJhY3RlZCBmcm9tIHRoZSByZWFkIHNpemUuDQo+Pj4NCj4+
PiAtIEZpeCBhIGJ1ZyBpbiBiYWxsb29uaW5nIGNvZGUgaW4gUFZIIG1vZGUgd2hlbiB1c2lu
ZyBtZW1vcnkgYmV5b25kDQo+Pj4gwqDCoCBhIFJBTSBob2xlIGluIHRoZSBtZW1vcnkgbWFw
DQo+Pj4NCj4+PiBDaGFuZ2VzIGluIFYzOg0KPj4+IC0gbWlub3IgY29tbWVudCBmb3IgcGF0
Y2ggMyBhZGRyZXNzZWQNCj4+Pg0KPj4+IENoYW5nZXMgaW4gVjI6DQo+Pj4gLSBhZGRlZCBw
YXRjaCA0DQo+Pj4gLSBhZGRyZXNzZWQgY29tbWVudCByZWdhcmRpbmcgcGF0Y2ggMw0KPj4+
DQo+Pj4gSnVlcmdlbiBHcm9zcyAoNCk6DQo+Pj4gwqDCoCBtaW5pLW9zOiB0YWtlIG5ld2Vz
dCB2ZXJzaW9uIG9mIGFyY2gteDg2L2h2bS9zdGFydF9pbmZvLmgNCj4+PiDCoMKgIG1pbmkt
b3M6IHByZWZlciBtZW1vcnkgbWFwIHZpYSBzdGFydF9pbmZvIGZvciBQVkgNCj4+PiDCoMKg
IG1pbmktb3M6IGZpeCBudW1iZXIgb2YgcGFnZXMgZm9yIFBWSA0KPj4+IMKgwqAgbWluaS1v
czogZml4IGJ1ZyBpbiBiYWxsb29uaW5nIG9uIFBWSA0KPj4+DQo+Pj4gwqAgYXJjaC94ODYv
bW0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDIzICsrKystLS0tDQo+Pj4gwqAgYmFsbG9vbi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxOCArKy0tLS0NCj4+PiDCoCBl
ODIwLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDgzICsrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPj4+IMKg
IGluY2x1ZGUvZTgyMC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgNiArKw0KPj4+IMKgIGluY2x1ZGUveDg2L2FyY2hfbW0uaMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsNCj4+PiDCoCBpbmNsdWRlL3hlbi9h
cmNoLXg4Ni9odm0vc3RhcnRfaW5mby5oIHwgNjMgKysrKysrKysrKysrKysrKysrKy0NCj4+
PiDCoCA2IGZpbGVzIGNoYW5nZWQsIDE2MyBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMo
LSkNCj4+Pg0KPj4NCj4+IENvdWxkIHNvbWVvbmUgcGxlYXNlIGNvbW1pdCB0aGlzIHNlcmll
cz8gDQo+IA0KPiBEb25lLg0KPiANCj4+IFNhbXVlbCBnYXZlIGhpcyBSLWIgbmVhcmx5IDIg
d2Vla3MNCj4+IGFnby4NCj4gDQo+IHhlbi1kZXZlbCBpcyBxdWl0ZSBoaWdoIHZvbHVtZSBh
bmQgSSBkb24ndCByZWFkIGFsbCB0aGUgZS1tYWlscy4gSWYgeW91IG5lZWQgDQo+IHNvbWVv
bmUgdG8gY29tbWl0IHRoZW4gcGxlYXNlIENDIGNvbW1pdHRlcnNAIGFuZCB0aGlzIHdpbGwg
bGFuZCBpbiBteSBpbmJveC4NCg0KVGhpcyBpcyB0aGUgcmVhc29uIHdoeSBXZWkgd2FudGVk
IHRvIGJlIENDLWVkIGZvciBNaW5pLU9TIHBhdGNoZXMgaW4gdGhlDQpwYXN0LiBIZSBkb2Vz
bid0IHNlZW0gdG8gYmUgaW50ZXJlc3RlZCBhbnkgbW9yZSwgdW5mb3J0dW5hdGVseS4uLg0K
DQoNCkp1ZXJnZW4NCg0K
--------------r0KinztdotDSxGuhzfw8MqP4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------r0KinztdotDSxGuhzfw8MqP4--

--------------Ifqr1xpTe8i4teiHijuDhmlk--

--------------ICnBgoyAkQKi2xtoV4mGQ40s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLCrwQFAwAAAAAACgkQsN6d1ii/Ey9s
aQf+OcidFRagq8IT5ad0Zr9HaoKTtXxFDrnj9hgsUxXX1Q1gpRg1l/15oCwp3/8OgZazO/Hl2RP4
8I23yZs3Ft16v7Br19O5mOMTzyQYLwfSiAAAdpaRCaJw08sp/4/fpuYrSujGh+aLH1p1gmD37TKW
km7E8IPycYEdKk6jHnGCjoa/+0l4YBcPkw0oZiG1pGRwYZi3eQPp41+VT8f3+5XHZCgjqkvGrbX2
EzGvIekjBdWZ9cQz+hV7V96I/IogZoaeSRUk8zkBssPNMZLkJ8ugnSvWRErb56qskzzgIcvWZCcs
AyNbuiw75xZxgc8RTrZymyXP6M+c0uVtQipBYjsu3A==
=lf0w
-----END PGP SIGNATURE-----

--------------ICnBgoyAkQKi2xtoV4mGQ40s--

