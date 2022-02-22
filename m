Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A82B14BF795
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 13:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276741.473017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMTq7-0005Df-1m; Tue, 22 Feb 2022 12:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276741.473017; Tue, 22 Feb 2022 12:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMTq6-0005Ay-UL; Tue, 22 Feb 2022 12:00:18 +0000
Received: by outflank-mailman (input) for mailman id 276741;
 Tue, 22 Feb 2022 12:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+X7=TF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nMTq5-0005AY-IP
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 12:00:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dced82b7-93d6-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 12:59:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 40C8C2111A;
 Tue, 22 Feb 2022 12:00:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1974713BA0;
 Tue, 22 Feb 2022 12:00:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VoR2BE7QFGKpLgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 22 Feb 2022 12:00:14 +0000
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
X-Inumbo-ID: dced82b7-93d6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645531214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6BLb5XcbqZJtIcPXPva2CifELU1+vhtfmhwJQnQI+JU=;
	b=u6QI7nUAAYKc6EuB54do5upbsxnlTmmHfcDm0imKOzNn2I5TraVihxr4Kvl6ADb3XL+lT9
	tBNE+q97/D1fZz6E/Js2iGwCrJASlJZk0WZGE/72p0AEGXVijpKU6v170r62xjYJG0K5Ct
	fFya2JfLSobJ69hEdcwDshI0+TG8/2s=
Message-ID: <255e0ec0-f149-57a5-e427-c08e4e4ac089@suse.com>
Date: Tue, 22 Feb 2022 13:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen: use helper macro __ATTR_RW
Content-Language: en-US
To: Miaohe Lin <linmiaohe@huawei.com>, boris.ostrovsky@oracle.com
Cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20220222111222.56877-1-linmiaohe@huawei.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220222111222.56877-1-linmiaohe@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------av7j8gkw3ZknX8slXpyTRAQc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------av7j8gkw3ZknX8slXpyTRAQc
Content-Type: multipart/mixed; boundary="------------O0AnTHRyLwSCFZmZzLZB8kvb";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Miaohe Lin <linmiaohe@huawei.com>, boris.ostrovsky@oracle.com
Cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <255e0ec0-f149-57a5-e427-c08e4e4ac089@suse.com>
Subject: Re: [PATCH] xen: use helper macro __ATTR_RW
References: <20220222111222.56877-1-linmiaohe@huawei.com>
In-Reply-To: <20220222111222.56877-1-linmiaohe@huawei.com>

--------------O0AnTHRyLwSCFZmZzLZB8kvb
Content-Type: multipart/mixed; boundary="------------c9jPJK05xZt7K9BVP0wUq03m"

--------------c9jPJK05xZt7K9BVP0wUq03m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDIuMjIgMTI6MTIsIE1pYW9oZSBMaW4gd3JvdGU6DQo+IFVzZSBoZWxwZXIgbWFj
cm8gX19BVFRSX1JXIHRvIGRlZmluZSBoeXBfc3lzZnNfYXR0ciB0byBtYWtlIGNvZGUgbW9y
ZQ0KPiBjbGVhci4gTWlub3IgcmVhZGFiaWxpdHkgaW1wcm92ZW1lbnQuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBNaWFvaGUgTGluIDxsaW5taWFvaGVAaHVhd2VpLmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=

--------------c9jPJK05xZt7K9BVP0wUq03m
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------c9jPJK05xZt7K9BVP0wUq03m--

--------------O0AnTHRyLwSCFZmZzLZB8kvb--

--------------av7j8gkw3ZknX8slXpyTRAQc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIU0E0FAwAAAAAACgkQsN6d1ii/Ey8p
pQf7BTCdL1oioe61gyPLVoGdBlXS35F8/zIB/arzqcp6jVq7tMIh08sf2fUbBNj3zXK08fnbCiJk
c52NUUHfIOFCHJYr/Lu+Mjdl1QwkmZ4IW9d9Ez6dH5me5oU2xj6r0sf17Dufu2eLw8ZJpfbBNgFM
hmf4jv8j2r04dNBXXRLYor8EeJsNM6HGGGZbFr58K6sPWuPZmTH1IFRbFQ1PWRq/24/mE0D4ukFP
XpESILrQI8b2tR/wAKRfhcQsY7/n7WQRK7FO2CnQkY0H6jvIpZOVdwvoY3DWXiK1rZvbyRMfpMY1
khzEadik9eeuznzydmbhkqoJ4TgBbzTjJKcgLWNZYQ==
=E2UA
-----END PGP SIGNATURE-----

--------------av7j8gkw3ZknX8slXpyTRAQc--

