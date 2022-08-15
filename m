Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0818259316B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 17:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387592.623905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbm3-000527-If; Mon, 15 Aug 2022 15:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387592.623905; Mon, 15 Aug 2022 15:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbm3-0004yg-Fa; Mon, 15 Aug 2022 15:13:03 +0000
Received: by outflank-mailman (input) for mailman id 387592;
 Mon, 15 Aug 2022 15:13:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dGwN=YT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNbm2-0004ya-It
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 15:13:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c09c32f6-1cac-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 17:13:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B84BA351FE;
 Mon, 15 Aug 2022 15:13:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8919113A99;
 Mon, 15 Aug 2022 15:13:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2nkHIHxi+mJscwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 15 Aug 2022 15:13:00 +0000
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
X-Inumbo-ID: c09c32f6-1cac-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660576380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=stgMn8NdygL2toBvHczgoJpZfK1iJA0jGjnkG3tqbz0=;
	b=qL8A56llW2ApEHXvimoy1aSh/bxUzjpUny7LhJguw9fm9qsUujGG5Puyskg+aolITP4BvP
	yjdKFDn3KDa4VqjnLKH/8OEkpAb6sGZB9ByeCMaQQ6B+lNkB7DdForrMvDBkIQ9zYwp0Fk
	4ZNT1aQxdXZOr7DodiIRT8iY9bnWABw=
Message-ID: <caea2bb5-a37b-8660-4a8a-03aa7476af35@suse.com>
Date: Mon, 15 Aug 2022 17:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cc65eb5f-310e-b51b-71c6-17b93cbe7d0d@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86: rework hypercall argument count table instantiation
 & use
In-Reply-To: <cc65eb5f-310e-b51b-71c6-17b93cbe7d0d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------y1fs1iMlKr3UR072ShgLUqBJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------y1fs1iMlKr3UR072ShgLUqBJ
Content-Type: multipart/mixed; boundary="------------Cw2tRIz2GPNTqEMTKNGgizfu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <caea2bb5-a37b-8660-4a8a-03aa7476af35@suse.com>
Subject: Re: [PATCH] x86: rework hypercall argument count table instantiation
 & use
References: <cc65eb5f-310e-b51b-71c6-17b93cbe7d0d@suse.com>
In-Reply-To: <cc65eb5f-310e-b51b-71c6-17b93cbe7d0d@suse.com>

--------------Cw2tRIz2GPNTqEMTKNGgizfu
Content-Type: multipart/mixed; boundary="------------eZB0deH3pYm7k1O1dYqcpRC6"

--------------eZB0deH3pYm7k1O1dYqcpRC6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDcuMjIgMTg6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBUaGUgaW5pdGlhbCBv
YnNlcnZhdGlvbiB3ZXJlIGR1cGxpY2F0ZSBzeW1ib2xzIHRoYXQgb3VyIGNoZWNraW5nIHdh
cm5zDQo+IGFib3V0LiBJbnN0ZWFkIG9mIG1lcmVseSByZW5hbWluZyBvbmUgb3IgYm90aCBw
YWlyKHMpIG9mIHN5bWJvbHMsDQo+IHJlZHVjZSAjaWZkZWYtYXJ5IGF0IHRoZSBzYW1lIHRp
bWUgYnkgbW92aW5nIHRoZSBpbnN0YW50aWF0aW9uIG9mIHRoZQ0KPiBhcnJheXMgaW50byBt
YWNyb3MgKGEgbmF0aXZlIGFuZCBhIDMyLWJpdCBvbmUgZWFjaCwgd2hlcmUgbGlrZWx5IG1v
cmUNCj4gcmVkdW5kYW5jeSBjb3VsZCBiZSBlbGltaW5hdGVkLCBpZiB3ZSByZWFsbHkgd2Fu
dGVkIHRvKS4gV2hpbGUgZG9pbmcgdGhlDQo+IGNvbnZlcnNpb24gYWxzbyBzdG9wIG9wZW4t
Y29kaW5nIGFycmF5X2FjY2Vzc19ub3NwZWMoKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KV2l0aCBvbmUgc21hbGwgbml0IC4uLg0KDQo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcmNhbGwuaA0KPiArKysgYi94
ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHlwZXJjYWxsLmgNCj4gQEAgLTQzLDE2ICs0Myw2
IEBAIGNvbXBhdF9jb21tb25fdmNwdV9vcCgNCj4gICANCj4gICAjZW5kaWYgLyogQ09ORklH
X0NPTVBBVCAqLw0KPiAgIA0KPiAtI2lmbmRlZiBOREVCVUcNCj4gLXN0YXRpYyBpbmxpbmUg
dW5zaWduZWQgaW50IF9nZXRfbmFyZ3MoY29uc3QgdW5zaWduZWQgY2hhciAqdGJsLCB1bnNp
Z25lZCBpbnQgYykNCj4gLXsNCj4gLSAgICByZXR1cm4gdGJsW2NdOw0KPiAtfQ0KPiAtI2Rl
ZmluZSBnZXRfbmFyZ3ModCwgYykgX2dldF9uYXJncyh0LCBhcnJheV9pbmRleF9ub3NwZWMo
YywgQVJSQVlfU0laRSh0KSkpDQo+IC0jZWxzZQ0KPiAtI2RlZmluZSBnZXRfbmFyZ3ModGJs
LCBjKSAwDQo+IC0jZW5kaWYNCj4gLQ0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBjbG9iYmVy
X3JlZ3Moc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbmFyZ3MpDQo+ICAgew0KPiBAQCAtNjks
NiArNTksMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIGNsb2JiZXJfcmVncyhzdHJ1Y3QgYw0K
PiAgICNlbmRpZg0KPiAgIH0NCj4gICANCj4gKyNkZWZpbmUgY2xvYmJlcl9yZWdzKHIsIG4s
IHQpICh7IFwNCj4gKyAgICBzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciB0W10gPSBoeXBl
cmNhbGxfYXJnc18gIyMgdDsgXA0KPiArICAgIGNsb2JiZXJfcmVncyhyLCBhcnJheV9hY2Nl
c3Nfbm9zcGVjKHQsIG4pKTsgXA0KPiArfSkNCj4gKw0KDQouLi4gY291bGQgSSB0YWxrIHlv
dSBpbnRvIG5vdCBvdmVybG9hZGluZyB0aGUgbmFtZXMgb2YgdGhlIGlubGluZQ0KZnVuY3Rp
b25zIHdpdGggbWFjcm9zPyBZb3UgYXJlIGNoYW5naW5nIGFsbCB0aGUgY2FsbCBzaXRlcyBh
bnl3YXkuDQoNCg0KSnVlcmdlbg0K
--------------eZB0deH3pYm7k1O1dYqcpRC6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------eZB0deH3pYm7k1O1dYqcpRC6--

--------------Cw2tRIz2GPNTqEMTKNGgizfu--

--------------y1fs1iMlKr3UR072ShgLUqBJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL6YnwFAwAAAAAACgkQsN6d1ii/Ey9n
Lgf+I8jTL0gBt3OWLIyGndcz9xONEsXRa9lN9EK3qj743Rujbm6B/nuh0Bm23toRehXU3Zk0KI9n
af3hXBmS5F/xcIHaTFhM9ukQb8vTizhGfnSMpCWiXfcDrKsN/RaiCM3jZj9XeT4MJiDA4n9SQ/LP
GT2HYsT3svzMwEEiKFTT+dFD0m+aIghlc1kIIhAehHLPgEXnFpYQT80EtsxzI/g7vCgOa22V1U5D
TdFAx4ZA7T0NekvFg1AnbTv0RpJrl7Kt1biQaA0sE9VsjJAat6avmcPle2iAn6MU8VaCx7HAtAIq
EFNbTzdepVy4qv2/KcA5s9E5lTe0TYhicAGdhk1ovg==
=Zfgq
-----END PGP SIGNATURE-----

--------------y1fs1iMlKr3UR072ShgLUqBJ--

