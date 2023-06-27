Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062A873F518
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 09:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555867.868021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE2rm-0000Sy-43; Tue, 27 Jun 2023 07:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555867.868021; Tue, 27 Jun 2023 07:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE2rm-0000Qn-09; Tue, 27 Jun 2023 07:11:58 +0000
Received: by outflank-mailman (input) for mailman id 555867;
 Tue, 27 Jun 2023 07:11:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EZfr=CP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qE2rk-0000Q4-IH
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 07:11:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e50f7946-14b9-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 09:11:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0091E21892;
 Tue, 27 Jun 2023 07:11:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5EA313462;
 Tue, 27 Jun 2023 07:11:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CUrnLbmLmmQNFAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 27 Jun 2023 07:11:53 +0000
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
X-Inumbo-ID: e50f7946-14b9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687849914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jdZCCe8zGFsqTvVG1F70S1wqNKDrzIu74Vl0hUG1jDM=;
	b=nRb9Ea9EL0HLtucEZFgOvW6HvXNdU4rAgKyxJ1OEHdcKHg9kV7fkITK+hTSoFDCffXBamc
	kgGDvuMSqfrIoWRHETHgq5zt3NZ5KRoB6mdeLQtDkbq94BhUo5ZJ7j2nvrU1JNPBZPGemw
	p1LYoGwjVgabzGMIiBq4GSeFwnxyyIs=
Message-ID: <e394390a-af3d-116e-62e4-51954de037e6@suse.com>
Date: Tue, 27 Jun 2023 09:11:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] x86/Xen: tidy xen-head.S
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <f99bacc6-2a2f-41b0-5c0b-e01b7051cb07@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f99bacc6-2a2f-41b0-5c0b-e01b7051cb07@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------y0KXmCk07sGKtGptMmO01Kj7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------y0KXmCk07sGKtGptMmO01Kj7
Content-Type: multipart/mixed; boundary="------------J4CFifFihhwrzi8i0W4HlkiH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <e394390a-af3d-116e-62e4-51954de037e6@suse.com>
Subject: Re: [PATCH v2] x86/Xen: tidy xen-head.S
References: <f99bacc6-2a2f-41b0-5c0b-e01b7051cb07@suse.com>
In-Reply-To: <f99bacc6-2a2f-41b0-5c0b-e01b7051cb07@suse.com>

--------------J4CFifFihhwrzi8i0W4HlkiH
Content-Type: multipart/mixed; boundary="------------05t0xuXZJscnF6c2q5fIjgms"

--------------05t0xuXZJscnF6c2q5fIjgms
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDYuMjMgMDg6MzYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBGaXJzdCBvZiBhbGwg
bW92ZSBQVi1vbmx5IEVMRiBub3RlcyBpbnNpZGUgdGhlIFhFTl9QViBjb25kaXRpb25hbDsg
bm90ZQ0KPiB0aGF0DQo+IC0gSFZfU1RBUlRfTE9XIGlzIGRyb3BwZWQgYWx0b2dldGhlciwg
YXMgaXQgd2FzIG1lYW5pbmdmdWwgZm9yIDMyLWJpdCBQVg0KPiAgICBvbmx5LA0KPiAtIHRo
ZSAzMi1iaXQgaW5zdGFuY2Ugb2YgVklSVF9CQVNFIGlzIGRyb3BwZWQsIGFzIGl0IHdvdWxk
IGJlIGRlYWQgY29kZQ0KPiAgICBvbmNlIGluc2lkZSB0aGUgY29uZGl0aW9uYWwsDQo+IC0g
d2hpbGUgUEFERFJfT0ZGU0VUIGlzIG5vdCBleGFjdGx5IHVudXNlZCBmb3IgUFZILCBpdCBk
ZWZhdWx0cyB0byB6ZXJvDQo+ICAgIHRoZXJlLCBhbmQgdGhlIGh5cGVydmlzb3IgKG9yIHRv
b2wgc3RhY2spIGNvbXBsYWlucyBpZiBpdCBpcyBwcmVzZW50DQo+ICAgIGJ1dCBWSVJUX0JB
U0UgaXNuJ3QuDQo+IFRoZW4gaGF2ZSB0aGUgInN1cHBvcnRlZCBmZWF0dXJlcyIgbm90ZSBh
Y3R1YWxseSByZXBvcnQgcmVhbGl0eTogQWxsDQo+IHRocmVlIG9mIHRoZSBmZWF0dXJlcyB0
aGVyZSBhcmUgc3VwcG9ydGVkIGFuZC9vciBhcHBsaWNhYmxlIG9ubHkgaW4NCj4gY2VydGFp
biBjYXNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------05t0xuXZJscnF6c2q5fIjgms
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------05t0xuXZJscnF6c2q5fIjgms--

--------------J4CFifFihhwrzi8i0W4HlkiH--

--------------y0KXmCk07sGKtGptMmO01Kj7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSai7kFAwAAAAAACgkQsN6d1ii/Ey/r
Hwf/eBLk4fYruatNEUKEt0PUHwjY+27SEKb+KD5jVX/1nu1QY1zCfQjg33ucHFAHbtljtrUN79hp
jdJj96cwrNyDKm3Zk7gdxGCXXSevsQNO04k7kyNtwhciq1NtdVrl7JsXa4pBV04XUla8WTCBtMrf
n+VlXqsVI9cA/0nIiIS+pXMIQRRaR/Dbr6dWQPwpj9jmPqpqj9SqDBWrdqCjMxk6ssCebFXy0tUv
/N1U/LEEMu+W+JSf0ZlfPT/ZWl0tj4gtnnU+QBM3Todnr5uNf5we9gMD/zkZ32n2l0pW0U6ds5db
3t43PIDl7fN9lyoiQaroM33kFy9H+s5qxu6Aob7dKQ==
=xcsl
-----END PGP SIGNATURE-----

--------------y0KXmCk07sGKtGptMmO01Kj7--

