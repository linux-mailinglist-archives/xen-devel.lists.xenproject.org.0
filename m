Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B957F67514C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 10:36:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481534.746489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pInog-0004AV-NM; Fri, 20 Jan 2023 09:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481534.746489; Fri, 20 Jan 2023 09:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pInog-00047e-KX; Fri, 20 Jan 2023 09:36:10 +0000
Received: by outflank-mailman (input) for mailman id 481534;
 Fri, 20 Jan 2023 09:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NYwS=5R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pInof-000464-1T
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 09:36:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddb963c8-98a5-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 10:36:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 42DC75F79A
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 09:36:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30DFB1390C
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 09:36:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hOKPCodgymMJNwAAMHmgww
 (envelope-from <jgross@suse.com>)
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 09:36:07 +0000
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
X-Inumbo-ID: ddb963c8-98a5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674207367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1+h9LaKYjKKkfhzp15y9beCI3q5/6EfhcdDhCVc0xw=;
	b=QodfrZcdoB/KHVXAcg8RF2h3E701Rb1WTo6Osw1ox3XYs3yROVAkfgbJ/qgSt2svIXMRFl
	TtMlPHVUJIV6T2cBrr9nqtLsuIx5xtFigQddQcrQvuW5yWGl6RTW8k1cvizFJ3JS0O5UHd
	f0LzpsjJR5GViX/JFKqlyMUJowAuyR0=
Message-ID: <425b75cb-b19e-3282-c574-4165215030f5@suse.com>
Date: Fri, 20 Jan 2023 10:36:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 00/17] tools/xenstore: do some cleanup and fixes
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20230118095016.13091-1-jgross@suse.com>
 <b5cb6edf-d97a-5a83-09a7-7ef5d154dcb1@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b5cb6edf-d97a-5a83-09a7-7ef5d154dcb1@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------u04B9IWPjBARkhPwTcUD00oW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------u04B9IWPjBARkhPwTcUD00oW
Content-Type: multipart/mixed; boundary="------------hvTsCjM0fbQLKaRxQS9cdHJt";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Message-ID: <425b75cb-b19e-3282-c574-4165215030f5@suse.com>
Subject: Re: [PATCH v4 00/17] tools/xenstore: do some cleanup and fixes
References: <20230118095016.13091-1-jgross@suse.com>
 <b5cb6edf-d97a-5a83-09a7-7ef5d154dcb1@xen.org>
In-Reply-To: <b5cb6edf-d97a-5a83-09a7-7ef5d154dcb1@xen.org>

--------------hvTsCjM0fbQLKaRxQS9cdHJt
Content-Type: multipart/mixed; boundary="------------9Jvatl388eZ3g5lFZCncCwTO"

--------------9Jvatl388eZ3g5lFZCncCwTO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDEuMjMgMTA6MjUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE4LzAxLzIwMjMgMDk6NDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
aGlzIGlzIGEgZmlyc3QgcnVuIG9mIHBvc3QtWFNBIHBhdGNoZXMgd2hpY2ggcGlsZWQgdXAg
ZHVyaW5nIHRoZQ0KPj4gZGV2ZWxvcG1lbnQgcGhhc2Ugb2YgYWxsIHRoZSByZWNlbnQgWGVu
c3RvcmUgcmVsYXRlZCBYU0EgcGF0Y2hlcy4NCj4+DQo+PiBUaGlzIGlzIGEgbWl4dHVyZSBv
ZiBzbWFsbCBmaXhlcywgZW5oYW5jZW1lbnRzIGFuZCBjbGVhbnVwcy4NCj4+DQo+PiBDaGFu
Z2VzIGluIFY0Og0KPj4gLSByZW9yZGVyZWQgdGhlIHBhdGNoZXMgYSBsaXR0bGUgYml0IChw
YXRjaCA0IGFuZCBwYXRjaCAxNyBvZiBWNCBoYXZlDQo+PiDCoMKgIGJlZW4gbW92ZWQpDQo+
PiAtIGFkZHJlc3NlZCBjb21tZW50cw0KPj4NCj4+IENoYW5nZXMgaW4gVjM6DQo+PiAtIHBh
dGNoZXMgMiwgMywgYW5kIDUgb2YgVjIgaGF2ZSBiZWVuIGFwcGxpZWQgYWxyZWFkeQ0KPj4g
LSBuZXcgcGF0Y2ggMTINCj4+IC0gYWRkcmVzc2VkIGNvbW1lbnRzDQo+Pg0KPj4gQ2hhbmdl
cyBpbiBWMjoNCj4+IC0gcGF0Y2hlcyAxKzIgb2YgVjEgaGF2ZSBiZWVuIGFwcGxpZWQgYWxy
ZWFkeQ0KPj4gLSBhZGRyZXNzZWQgY29tbWVudHMNCj4+IC0gbmV3IHBhdGNoIDE5DQo+Pg0K
Pj4gSnVlcmdlbiBHcm9zcyAoMTcpOg0KPj4gwqDCoCB0b29scy94ZW5zdG9yZTogbGV0IHRh
bGxvY19mcmVlKCkgcHJlc2VydmUgZXJybm8NCj4+IMKgwqAgdG9vbHMveGVuc3RvcmU6IHJl
bW92ZSBhbGwgd2F0Y2hlcyB3aGVuIGEgZG9tYWluIGhhcyBzdG9wcGVkDQo+PiDCoMKgIHRv
b2xzL3hlbnN0b3JlOiBhZGQgaGFzaGxpc3QgZm9yIGZpbmRpbmcgc3RydWN0IGRvbWFpbiBi
eSBkb21pZA0KPj4gwqDCoCB0b29scy94ZW5zdG9yZTogbWFrZSBsb2cgbWFjcm8gZ2xvYmFs
bHkgYXZhaWxhYmxlDQo+PiDCoMKgIHRvb2xzL3hlbnN0b3JlOiBpbnRyb2R1Y2UgZHVtbXkg
bm9kZXMgZm9yIHNwZWNpYWwgd2F0Y2ggcGF0aHMNCj4+IMKgwqAgdG9vbHMveGVuc3RvcmU6
IHJlcGxhY2Ugd2F0Y2gtPnJlbGF0aXZlX3BhdGggd2l0aCBhIHByZWZpeCBsZW5ndGgNCj4+
IMKgwqAgdG9vbHMveGVuc3RvcmU6IG1vdmUgY2hhbmdlZCBkb21haW4gaGFuZGxpbmcNCj4+
IMKgwqAgdG9vbHMveGVuc3RvcmU6IGNoYW5nZSBwZXItZG9tYWluIG5vZGUgYWNjb3VudGlu
ZyBpbnRlcmZhY2UNCj4+IMKgwqAgdG9vbHMveGVuc3RvcmU6IHJlcGxhY2UgbGl0ZXJhbCBk
b21pZCAwIHdpdGggZG9tMF9kb21pZA0KPj4gwqDCoCB0b29scy94ZW5zdG9yZTogbWFrZSBk
b21haW5faXNfdW5wcml2aWxlZ2VkKCkgYW4gaW5saW5lIGZ1bmN0aW9uDQo+PiDCoMKgIHRv
b2xzL3hlbnN0b3JlOiBsZXQgY2hrX2RvbWFpbl9nZW5lcmF0aW9uKCkgcmV0dXJuIGEgYm9v
bA0KPj4gwqDCoCB0b29scy94ZW5zdG9yZTogZG9uJ3QgbGV0IGhhc2h0YWJsZV9yZW1vdmUo
KSByZXR1cm4gdGhlIHJlbW92ZWQgdmFsdWUNCj4+IMKgwqAgdG9vbHMveGVuc3RvcmU6IHN3
aXRjaCBoYXNodGFibGUgdG8gdXNlIHRoZSB0YWxsb2MgZnJhbWV3b3JrDQo+PiDCoMKgIHRv
b2xzL3hlbnN0b3JlOiBpbnRyb2R1Y2UgdHJhY2UgY2xhc3Nlcw0KPj4gwqDCoCB0b29scy94
ZW5zdG9yZTogbGV0IGNoZWNrX3N0b3JlKCkgY2hlY2sgdGhlIGFjY291bnRpbmcgZGF0YQ0K
Pj4gwqDCoCB0b29scy94ZW5zdG9yZTogbWFrZSBvdXRwdXQgb2YgInhlbnN0b3JlLWNvbnRy
b2wgaGVscCIgbW9yZSBwcmV0dHkNCj4gDQo+IEkgaGF2ZSBjb21taXR0ZWQgdXAgdG8gdGhp
cyBwYXRjaC4gVGhlIGxhc3Qgb25lLi4uDQo+IA0KPj4gwqDCoCB0b29scy94ZW5zdG9yZTog
ZG9uJ3QgYWxsb3cgY3JlYXRpbmcgdG9vIG1hbnkgbm9kZXMgaW4gYSB0cmFuc2FjdGlvbg0K
PiANCj4gLi4uIG5lZWRzIHNvbWUgcmV2aWV3IHdoaWNoIEkgd2lsbCBkbyB3aXRoIHBhcnQg
MiBvZiB0aGUgeGVuc3RvcmVkIHNlcmllcy4NCg0KSSdsbCBkbyBhIHJlc2VuZCBvZiB0aGUg
cGFydCAyIHJlYmFzZWQgdG8gdGhlIGNvbW1pdHRlZCBzdHVmZiwgaW5jbHVkaW5nDQp0aGlz
IGxlZnRvdmVyIHBhdGNoLg0KDQoNCkp1ZXJnZW4NCg0K
--------------9Jvatl388eZ3g5lFZCncCwTO
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------9Jvatl388eZ3g5lFZCncCwTO--

--------------hvTsCjM0fbQLKaRxQS9cdHJt--

--------------u04B9IWPjBARkhPwTcUD00oW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPKYIYFAwAAAAAACgkQsN6d1ii/Ey+c
Vgf8CAFEvE/bVvYWC37NBmCN9MwdIDInHaHHjmKraR8IcEVOo/a4k4ivhG4jpy9TmnrWuVZfaetG
smagnoVJ6ikDb2m9U+xz1uPcuM9B7g0n3Azflt93iaWtGa8Ouu20RN/RqbCmTwcVuwCDXDZZRM4z
mwqXzw/25wBIJwdoOggEkuHAEoXfYpCe7OTDB+1RmK+CnZgrzKHKHk2po7hz0nz3gfqyqI8b7eUI
Naiwf1Ogm9V1t4D6NwWWrubmhTBmmINXEiu97Nio+GoqJvhYWLhKdWM+7Gx3iQWopRlCN7xx40pA
yEACX5/GB1Cnkt5wz2l4juCnvMK8fIn2qclD8yysOA==
=8hax
-----END PGP SIGNATURE-----

--------------u04B9IWPjBARkhPwTcUD00oW--

