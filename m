Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4972F6A41C2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 13:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502500.774345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWciA-00022s-An; Mon, 27 Feb 2023 12:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502500.774345; Mon, 27 Feb 2023 12:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWciA-0001zu-86; Mon, 27 Feb 2023 12:34:34 +0000
Received: by outflank-mailman (input) for mailman id 502500;
 Mon, 27 Feb 2023 12:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQU0=6X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pWci9-0001zo-2X
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 12:34:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15cd0b57-b69b-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 13:34:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B1BA81FD63;
 Mon, 27 Feb 2023 12:34:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BF2913A43;
 Mon, 27 Feb 2023 12:34:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bA3QHFej/GNRRQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Feb 2023 12:34:31 +0000
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
X-Inumbo-ID: 15cd0b57-b69b-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677501271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EQtS2CvPLO4bZlv8n7hFzPJd0jivW3NjQsa4viiIQTY=;
	b=CfG6v9wAI9BP0HIhNC/9wVE7kOimnT7UFEJrsM6ipqhCeYsRyL654kAy8QjyMxGBDOA+aN
	xUa5rtaS6iJUh/4p9MlKXnGUL+zEPS/kbHuQoilbedg6HKHtOmkoBdD6z5XpWS2JKS3uR6
	DLlwgnnWU5UCtKoWIjfa1al8y/+tSlg=
Message-ID: <809b25b3-1e8e-43ee-dc3a-1a54a938c9f7@suse.com>
Date: Mon, 27 Feb 2023 13:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] tools: add offsetof() to xen-tools/libs.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230227120957.10037-1-jgross@suse.com>
 <20230227120957.10037-4-jgross@suse.com>
 <8865a525-b55d-9b4f-ad2c-fe1f70afd0ba@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <8865a525-b55d-9b4f-ad2c-fe1f70afd0ba@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------B3NoBSFE4FL0IJ91z7tB9Tdq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------B3NoBSFE4FL0IJ91z7tB9Tdq
Content-Type: multipart/mixed; boundary="------------USKo6oDw0vBDCvh5HHhPMgun";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <809b25b3-1e8e-43ee-dc3a-1a54a938c9f7@suse.com>
Subject: Re: [PATCH 3/3] tools: add offsetof() to xen-tools/libs.h
References: <20230227120957.10037-1-jgross@suse.com>
 <20230227120957.10037-4-jgross@suse.com>
 <8865a525-b55d-9b4f-ad2c-fe1f70afd0ba@suse.com>
In-Reply-To: <8865a525-b55d-9b4f-ad2c-fe1f70afd0ba@suse.com>

--------------USKo6oDw0vBDCvh5HHhPMgun
Content-Type: multipart/mixed; boundary="------------5cM26yWlPgej9SkUmRZGQ1Nw"

--------------5cM26yWlPgej9SkUmRZGQ1Nw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDIuMjMgMTM6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNy4wMi4yMDIz
IDEzOjA5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvdG9vbHMvZmlybXdhcmUv
aHZtbG9hZGVyL3V0aWwuaA0KPj4gKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3V0
aWwuaA0KPj4gQEAgLTMwLDkgKzMwLDYgQEAgZW51bSB7DQo+PiAgICNkZWZpbmUgU0VMX0RB
VEEzMiAgICAgICAgICAweDAwMjANCj4+ICAgI2RlZmluZSBTRUxfQ09ERTY0ICAgICAgICAg
IDB4MDAyOA0KPj4gICANCj4+IC0jdW5kZWYgb2Zmc2V0b2YNCj4+IC0jZGVmaW5lIG9mZnNl
dG9mKHQsIG0pICgodW5zaWduZWQgbG9uZykmKCh0ICopMCktPm0pDQo+PiAtDQo+PiAgICN1
bmRlZiBOVUxMDQo+PiAgICNkZWZpbmUgTlVMTCAoKHZvaWQqKTApDQo+PiAgIA0KPj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2luY2x1ZGUvc3RkZGVmLmggYi90b29scy9maXJt
d2FyZS9pbmNsdWRlL3N0ZGRlZi5oDQo+PiBpbmRleCBjN2Y5NzQ2MDhhLi45MjZhZTEyZmE1
IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvZmlybXdhcmUvaW5jbHVkZS9zdGRkZWYuaA0KPj4g
KysrIGIvdG9vbHMvZmlybXdhcmUvaW5jbHVkZS9zdGRkZWYuaA0KPj4gQEAgLTEsMTAgKzEs
MTAgQEANCj4+ICAgI2lmbmRlZiBfU1REREVGX0hfDQo+PiAgICNkZWZpbmUgX1NURERFRl9I
Xw0KPj4gICANCj4+ICsjaW5jbHVkZSA8eGVuLXRvb2xzL2xpYnMuaD4NCj4gDQo+IEknbSBu
b3QgY29udmluY2VkIGZpcm13YXJlLyBmaWxlcyBjYW4gdmFsaWRseSBpbmNsdWRlIHRoaXMg
aGVhZGVyLg0KDQpUaGlzIGZpbGUgb25seSBjb250YWlucyBtYWNyb3Mgd2hpY2ggZG9uJ3Qg
Y2FsbCBhbnkgZXh0ZXJuYWwgZnVuY3Rpb25zLg0KDQpXb3VsZCB5b3UgYmUgZmluZSB3aXRo
IG1lIGFkZGluZyBhIHJlbGF0ZWQgY29tbWVudCB0byBpdD8NCg0KDQpKdWVyZ2VuDQoNCg==

--------------5cM26yWlPgej9SkUmRZGQ1Nw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------5cM26yWlPgej9SkUmRZGQ1Nw--

--------------USKo6oDw0vBDCvh5HHhPMgun--

--------------B3NoBSFE4FL0IJ91z7tB9Tdq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP8o1cFAwAAAAAACgkQsN6d1ii/Ey+l
rwf/awPF65Z8Pyr3ckfDvyJz+f6rPTUnAZTJLnvnrxiEg782R5zWMJZucbbSnyJCFP5ujIkc38f0
be7Sc1QW6gZREoT2h6xRy020sYZ4LTpjR0wYPb5JlsHqNhRfkg2E7rcPut9q8iGCGA4DxbDNaH44
d/OSTdRcbFBrKWIgZNl0wY75BP1C34Suk+w/MRpsJzbZv/ZrzCKjliwWIOVve+EZUzj3CXF3i75n
ydsWcdKcWpEUI12c45GTZxdf3IIQUDIG792Apv2Bu8m1tQy6wDZDTV2v+75YmxbXpnpGyGFiEL7S
K7mVz95GkWrvH11Ff1vWCYl3YerDWGGHqhW/L9Z9OA==
=zBkh
-----END PGP SIGNATURE-----

--------------B3NoBSFE4FL0IJ91z7tB9Tdq--

