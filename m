Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57171564FD9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 10:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359960.589262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HbI-0006Ne-V8; Mon, 04 Jul 2022 08:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359960.589262; Mon, 04 Jul 2022 08:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HbI-0006Kl-Qw; Mon, 04 Jul 2022 08:38:36 +0000
Received: by outflank-mailman (input) for mailman id 359960;
 Mon, 04 Jul 2022 08:38:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o8HbH-0006Ia-Rw
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 08:38:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afa0763d-fb74-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 10:38:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D69D22C8C;
 Mon,  4 Jul 2022 08:38:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EB0A71342C;
 Mon,  4 Jul 2022 08:38:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EvWQNwenwmJdRQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 04 Jul 2022 08:38:31 +0000
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
X-Inumbo-ID: afa0763d-fb74-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656923912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g59baueviiuVxbnrE4vMTCgyQzKbt3DIfj+P6+Br8yQ=;
	b=OnlUFgCigruRaPtoJyIelwUh3gs8XrhY4Ggrx32qE7k2utUdBuueY1H7u4NBXxw23ShEZM
	OA2b27LS72AkOe8lS5zLKP4ObgZb4kYAB38z+MaRhK3YRYmjXdHZV6SWel+hPcnTDd8I9C
	TVhHnBYQB9A9sgL17uF/AOnduRweCbQ=
Message-ID: <3349c933-ed0d-3177-b494-ef4a6654d12d@suse.com>
Date: Mon, 4 Jul 2022 10:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/4] mini-os: some memory map updates for PVH
Content-Language: en-US
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220621072314.16382-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220621072314.16382-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jZ47KsstpPBBJ5dPHTVPZItc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jZ47KsstpPBBJ5dPHTVPZItc
Content-Type: multipart/mixed; boundary="------------RtEMhtC7U0oUWFG1YItA0vTj";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <3349c933-ed0d-3177-b494-ef4a6654d12d@suse.com>
Subject: Re: [PATCH v3 0/4] mini-os: some memory map updates for PVH
References: <20220621072314.16382-1-jgross@suse.com>
In-Reply-To: <20220621072314.16382-1-jgross@suse.com>

--------------RtEMhtC7U0oUWFG1YItA0vTj
Content-Type: multipart/mixed; boundary="------------sBNXBlmh9DtZYMunS1MqSTep"

--------------sBNXBlmh9DtZYMunS1MqSTep
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDYuMjIgMDk6MjMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IERvIHNvbWUgbWVt
b3J5IG1hcCByZWxhdGVkIGNoYW5nZXMvZml4ZXMgZm9yIFBWSCBtb2RlOg0KPiANCj4gLSBQ
cmVmZXIgdGhlIG1lbW9yeSBtYXAgZGVsaXZlcmVkIHZpYSBzdGFydC1pbmZvIG92ZXIgdGhl
IG9uZSBvYnRhaW5lZA0KPiAgICBmcm9tIHRoZSBoeXBlcnZpc29yLiBUaGlzIGlzIGEgcHJl
cmVxdWlzaXRlIGZvciBYZW5zdG9yZS1zdHViZG9tDQo+ICAgIGxpdmUtdXBkYXRlIHdpdGgg
cmlzaW5nIHRoZSBtZW1vcnkgbGltaXQuDQo+IA0KPiAtIEZpeCBhIGJ1ZyByZWxhdGVkIHRv
IGJhbGxvb25pbmcgaW4gUFZIIG1vZGU6IFBWSCBYZW5zdG9yZS1zdHViZG9tDQo+ICAgIGNh
bid0IHJlYWQgaXRzIHRhcmdldCBtZW1vcnkgc2l6ZSBmcm9tIFhlbnN0b3JlLCBhcyB0aGlz
IGludHJvZHVjZXMNCj4gICAgYSBjaGlja2VuLWFuZC1lZ2cgcHJvYmxlbS4gVGhlIG1lbW9y
eSBzaXplIHJlYWQgZnJvbSB0aGUgaHlwZXJ2aXNvcg0KPiAgICBPVE9IIGluY2x1ZGVzIGFk
ZGl0aW9uYWwgInNwZWNpYWwiIHBhZ2VzIG1hcmtlZCBhcyByZXNlcnZlZCBpbiB0aGUNCj4g
ICAgbWVtb3J5IG1hcC4gVGhvc2UgcGFnZXMgbmVlZCB0byBiZSBzdWJ0cmFjdGVkIGZyb20g
dGhlIHJlYWQgc2l6ZS4NCj4gDQo+IC0gRml4IGEgYnVnIGluIGJhbGxvb25pbmcgY29kZSBp
biBQVkggbW9kZSB3aGVuIHVzaW5nIG1lbW9yeSBiZXlvbmQNCj4gICAgYSBSQU0gaG9sZSBp
biB0aGUgbWVtb3J5IG1hcA0KPiANCj4gQ2hhbmdlcyBpbiBWMzoNCj4gLSBtaW5vciBjb21t
ZW50IGZvciBwYXRjaCAzIGFkZHJlc3NlZA0KPiANCj4gQ2hhbmdlcyBpbiBWMjoNCj4gLSBh
ZGRlZCBwYXRjaCA0DQo+IC0gYWRkcmVzc2VkIGNvbW1lbnQgcmVnYXJkaW5nIHBhdGNoIDMN
Cj4gDQo+IEp1ZXJnZW4gR3Jvc3MgKDQpOg0KPiAgICBtaW5pLW9zOiB0YWtlIG5ld2VzdCB2
ZXJzaW9uIG9mIGFyY2gteDg2L2h2bS9zdGFydF9pbmZvLmgNCj4gICAgbWluaS1vczogcHJl
ZmVyIG1lbW9yeSBtYXAgdmlhIHN0YXJ0X2luZm8gZm9yIFBWSA0KPiAgICBtaW5pLW9zOiBm
aXggbnVtYmVyIG9mIHBhZ2VzIGZvciBQVkgNCj4gICAgbWluaS1vczogZml4IGJ1ZyBpbiBi
YWxsb29uaW5nIG9uIFBWSA0KPiANCj4gICBhcmNoL3g4Ni9tbS5jICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMjMgKysrKy0tLS0NCj4gICBiYWxsb29uLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMTggKystLS0tDQo+ICAgZTgyMC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDgzICsrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAgIGlu
Y2x1ZGUvZTgyMC5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKw0KPiAgIGluY2x1
ZGUveDg2L2FyY2hfbW0uaCAgICAgICAgICAgICAgICAgfCAgMiArDQo+ICAgaW5jbHVkZS94
ZW4vYXJjaC14ODYvaHZtL3N0YXJ0X2luZm8uaCB8IDYzICsrKysrKysrKysrKysrKysrKyst
DQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCAxNjMgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25z
KC0pDQo+IA0KDQpDb3VsZCBzb21lb25lIHBsZWFzZSBjb21taXQgdGhpcyBzZXJpZXM/IFNh
bXVlbCBnYXZlIGhpcyBSLWIgbmVhcmx5IDIgd2Vla3MNCmFnby4NCg0KDQpKdWVyZ2VuDQo=

--------------sBNXBlmh9DtZYMunS1MqSTep
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------sBNXBlmh9DtZYMunS1MqSTep--

--------------RtEMhtC7U0oUWFG1YItA0vTj--

--------------jZ47KsstpPBBJ5dPHTVPZItc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLCpwcFAwAAAAAACgkQsN6d1ii/Ey96
Dgf9EmO7gCzs0ZHnQcTkbSahVT22QI2ubWJFdUgFZB6UaHV7wibN2MDi2pxdEVROwmKv6FmtnAfC
UWETqaBeNgln+85maH6LVjWkVSGWRliUjSwP6cvUfYk3pEGaaXvb7goKSAc3JFMOsAzvGbNO7V1Q
UgtbIN/iRebw++7lJbsY7X0aWv9Co4+2g0cdKtq/J1RHmZ5VbOeEEpl4jr9YqhjjPQJfNcvjn59e
FgEbK3ogP4ax/3CsJw858/ryIn4b5jy/HJGIlUPKxo+GB9tWbztip9IUre66xa7RYcob6Z4ZZEQT
R697Go43fB79BsfejRWNNIIovRjeIKwiPUKGOKcJjw==
=Tq1f
-----END PGP SIGNATURE-----

--------------jZ47KsstpPBBJ5dPHTVPZItc--

