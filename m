Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90C74AF394
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 15:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269209.463229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnZK-0006Ip-B5; Wed, 09 Feb 2022 14:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269209.463229; Wed, 09 Feb 2022 14:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnZK-0006GQ-86; Wed, 09 Feb 2022 14:03:38 +0000
Received: by outflank-mailman (input) for mailman id 269209;
 Wed, 09 Feb 2022 14:03:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sex7=SY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nHnZI-0006GI-Oc
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 14:03:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 122a3e89-89b1-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 15:03:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35C3B1F38E;
 Wed,  9 Feb 2022 14:03:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2E0813D45;
 Wed,  9 Feb 2022 14:03:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Vw3rObbJA2KAWwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 09 Feb 2022 14:03:34 +0000
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
X-Inumbo-ID: 122a3e89-89b1-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644415415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qQeVxDW58I1Wm5a5sQ17XHIIiFpw1Le/dQzkrt7htxY=;
	b=At3eME/p67IiWkO0cFeLu28el1quzDhPwb6NwG/a0ZEv/Xm7QiAnoeZ0RMdX0GrjdicKLY
	oWvM+LgGkdMrlXBhSmuMkNh+v4bdOMzRrtM07pOoDIorSL8jb1wM/jKtN8BrveAew6gOhb
	yGR+Gn1pNDZSoa1bacLCAsc2qi7k/VU=
Message-ID: <e2963fd7-f72b-2d30-12cf-863b7360c5e5@suse.com>
Date: Wed, 9 Feb 2022 15:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <e440e4f16a506ecc87078635dbb3fda2ebd45346.1644341635.git.oleksii_moisieiev@epam.com>
 <b88f6a50-6e9e-5679-8d25-89e26031e88e@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
In-Reply-To: <b88f6a50-6e9e-5679-8d25-89e26031e88e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6ED4muG9qsy8Q4jg7GNzLCEU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6ED4muG9qsy8Q4jg7GNzLCEU
Content-Type: multipart/mixed; boundary="------------1TeGN6qRLquh01mBhc2Qm2JU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <e2963fd7-f72b-2d30-12cf-863b7360c5e5@suse.com>
Subject: Re: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <e440e4f16a506ecc87078635dbb3fda2ebd45346.1644341635.git.oleksii_moisieiev@epam.com>
 <b88f6a50-6e9e-5679-8d25-89e26031e88e@xen.org>
In-Reply-To: <b88f6a50-6e9e-5679-8d25-89e26031e88e@xen.org>

--------------1TeGN6qRLquh01mBhc2Qm2JU
Content-Type: multipart/mixed; boundary="------------L6xQ8qcnbg8OAMFmXm0n1YTi"

--------------L6xQ8qcnbg8OAMFmXm0n1YTi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDIuMjIgMTk6MjYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgT2xla3NpaSwN
Cj4gDQo+IE9uIDA4LzAyLzIwMjIgMTg6MDAsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0K
Pj4gSWYgZW5hYmxlZCwgaG9zdCBkZXZpY2UtdHJlZSB3aWxsIGJlIGV4cG9ydGVkIHRvIGh5
cGZzIGFuZCBjYW4gYmUNCj4+IGFjY2Vzc2VkIHRocm91Z2ggL2RldmljZXRyZWUgcGF0aC4N
Cj4+IEV4cG9ydGVkIGRldmljZS10cmVlIGhhcyB0aGUgc2FtZSBmb3JtYXQsIGFzIHRoZSBk
ZXZpY2UtdHJlZQ0KPj4gZXhwb3J0ZWQgdG8gdGhlIHN5c2ZzIGJ5IHRoZSBMaW51eCBrZXJu
ZWwuDQo+PiBUaGlzIGlzIHVzZWZ1bCB3aGVuIFhFTiB0b29sc3RhY2sgbmVlZHMgYW4gYWNj
ZXNzIHRvIHRoZSBob3N0IA0KPj4gZGV2aWNlLXRyZWUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogT2xla3NpaSBNb2lzaWVpZXYgPG9sZWtzaWlfbW9pc2llaWV2QGVwYW0uY29tPg0KPj4g
LS0tDQo+PiDCoCB4ZW4vYXJjaC9hcm0vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDggKw0KPj4gwqAgeGVuL2FyY2gvYXJtL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDEgKw0KPj4gwqAgeGVuL2FyY2gvYXJtL2hvc3RfZHRiX2V4cG9ydC5jIHwgMzA3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KDQpUaGUgcmVsYXRlZCBkb2Mg
Y2hhbmdlcyBpbiBkb2NzL21pc2MvaHlwZnMtcGF0aHMucGFuZG9jIGFyZSBtaXNzaW5nLg0K
DQpXaXRob3V0IHRob3NlIGl0cyByYXRoZXIgaGFyZCB0byB2ZXJpZnkgdGhlIGNvZGUgaXMg
Y29ycmVjdC4NCg0KDQpKdWVyZ2VuDQo=
--------------L6xQ8qcnbg8OAMFmXm0n1YTi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------L6xQ8qcnbg8OAMFmXm0n1YTi--

--------------1TeGN6qRLquh01mBhc2Qm2JU--

--------------6ED4muG9qsy8Q4jg7GNzLCEU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIDybYFAwAAAAAACgkQsN6d1ii/Ey/s
AAf+KBzThgoTOSs8tNeh9F/pmQQeHUccTgsle3S+BwwU/BRhpbC07osxvH16dMGBYWI+RofScGNM
mmBps/dIgOTEze+psKOy0ZzkV04iPr91Q8+2vNx/SVVPaeBo1Euspu49ZxFCak60pd/V2F072T1N
17vruOAv2PJJOTfu8E0pU0kqwfCNG/DoDHA4Jl1hStVewa8A+mL9WwzgxgWZNjBjToNMvp4Hlyzk
AShvDCZLvpzmLVRfAHQjqpS1iMH2WT7uQNcuTE2vMmTiwVp9px083NMdgHihj/enTQlD22yKL3Ov
S/KIobfK9xoL3gXfVK0aMLB6xrdYJUazkslMgHUogA==
=bdTB
-----END PGP SIGNATURE-----

--------------6ED4muG9qsy8Q4jg7GNzLCEU--

