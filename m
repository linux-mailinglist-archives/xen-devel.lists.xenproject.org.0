Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB95B0150
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:10:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401123.642829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVs08-000825-Tp; Wed, 07 Sep 2022 10:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401123.642829; Wed, 07 Sep 2022 10:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVs08-0007zG-RC; Wed, 07 Sep 2022 10:09:44 +0000
Received: by outflank-mailman (input) for mailman id 401123;
 Wed, 07 Sep 2022 10:09:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eRBh=ZK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oVs07-0007zA-79
 for xen-devel@lists.xen.org; Wed, 07 Sep 2022 10:09:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3046a165-2e95-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 12:09:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF665202A9;
 Wed,  7 Sep 2022 10:09:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D270A13A66;
 Wed,  7 Sep 2022 10:09:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6ApsMeRtGGOUQQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 07 Sep 2022 10:09:40 +0000
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
X-Inumbo-ID: 3046a165-2e95-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662545380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P0KX2vj0xLvusjQPhujZEm13Y2kwtoe4W22C/UmCzjE=;
	b=ZGiYxerReFYyDGZUqxnzlVcpB8DKrqCUVOZH2kxpvB8AVbD4WX8vm5hyInSpGHJfxlqE94
	jFjBU43kVNOXYeGTjDl3UMOMFJp2q89qZCHXxFE9cB1Jifc5BVMFJej2bB+T06P3zZsqyw
	zkibxI/LDQtX26yKSNcXNxOwimHYWck=
Message-ID: <aaa317f6-f2d4-a2e4-aff6-f5053964102c@suse.com>
Date: Wed, 7 Sep 2022 12:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] .gitignore: Add *.patch
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, xen-devel@lists.xen.org
References: <cd8683878852a55f1b28807a470e078d21a5e689.1662545140.git.viresh.kumar@linaro.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <cd8683878852a55f1b28807a470e078d21a5e689.1662545140.git.viresh.kumar@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8vgCbuaJQ38fp0mEOhgX35iN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8vgCbuaJQ38fp0mEOhgX35iN
Content-Type: multipart/mixed; boundary="------------4PIsxVnvAUzLJ7bzp86qQzqm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, xen-devel@lists.xen.org
Message-ID: <aaa317f6-f2d4-a2e4-aff6-f5053964102c@suse.com>
Subject: Re: [PATCH] .gitignore: Add *.patch
References: <cd8683878852a55f1b28807a470e078d21a5e689.1662545140.git.viresh.kumar@linaro.org>
In-Reply-To: <cd8683878852a55f1b28807a470e078d21a5e689.1662545140.git.viresh.kumar@linaro.org>

--------------4PIsxVnvAUzLJ7bzp86qQzqm
Content-Type: multipart/mixed; boundary="------------2hQLZXB7r8PtfvK7a5HTQz3m"

--------------2hQLZXB7r8PtfvK7a5HTQz3m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDkuMjIgMTI6MDUsIFZpcmVzaCBLdW1hciB3cm90ZToNCj4gQWRkICoucGF0Y2gg
ZW50cnkgdG8gLmdpdGlnbm9yZSBmaWxlIHRvIHN0b3Agc2hvd2luZyBnaXQgZ2VuZXJhdGVk
DQo+IHBhdGNoZXMgaW4gY29tbWFuZHMgbGlrZSAnZ2l0IHN0YXR1cycuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPg0KPiAt
LS0NCj4gICAuZ2l0aWdub3JlIHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvLmdpdGlnbm9yZSBiLy5naXRpZ25vcmUNCj4g
aW5kZXggOWY5ZjE4Yzk3ZDVmLi5kOWE0ZmQwMzgxNDUgMTAwNjQ0DQo+IC0tLSBhLy5naXRp
Z25vcmUNCj4gKysrIGIvLmdpdGlnbm9yZQ0KPiBAQCAtMjAsNiArMjAsNyBAQA0KPiAgICou
Z2Nubw0KPiAgICouZ2NkYQ0KPiAgICoucHlbb2NkXQ0KPiArKi5wYXRjaA0KPiAgIFRBR1MN
Cj4gICBHVEFHUw0KPiAgIEdSVEFHUw0KDQpOQUsuDQoNCldlIGhhdmUgc29tZSBmaWxlcyBu
YW1lZCAqLnBhdGNoIGluIG91ciB0cmVlIChlLmcuIHN0dWJkb20vcG9sYXJzc2wucGF0Y2gp
Lg0KDQoNCkp1ZXJnZW4NCg==
--------------2hQLZXB7r8PtfvK7a5HTQz3m
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2hQLZXB7r8PtfvK7a5HTQz3m--

--------------4PIsxVnvAUzLJ7bzp86qQzqm--

--------------8vgCbuaJQ38fp0mEOhgX35iN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMYbeQFAwAAAAAACgkQsN6d1ii/Ey+M
Bgf/QgIU6wIXsDLkDnwBmvcOnN6zuirK30y2cq7qBMMIfgUWMD6cElwpgAZl2tND6CaqnC7TM9j2
7ebpsI+9Sz55WhSI73QZga3JyWwAyIjCC9hJRCgLtyQvslt+4WhBJPyVEtJ4j8sga4aT0ZkGJIwT
30Lr2WXwC1/6cwU9n/gQY3jaqp60mVlEq7ry5IG/9GRMLunKAtoFrepoz63AzQjndQTQiRHa/QVj
nOlUOfehaImFgKnERYhL7w52xZCaj2Tvrg/KFNxvTM5iRrXr8m45GupjmteJXXGfqJsJhyPFmnRY
9JYNWcmMsJrGs9Z5uMiujUZ32w1U1tCnpqLs4V8mAw==
=74yq
-----END PGP SIGNATURE-----

--------------8vgCbuaJQ38fp0mEOhgX35iN--

