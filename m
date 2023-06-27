Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B45373F50B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 09:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555862.868001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE2l5-00076o-60; Tue, 27 Jun 2023 07:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555862.868001; Tue, 27 Jun 2023 07:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE2l5-00074r-2r; Tue, 27 Jun 2023 07:05:03 +0000
Received: by outflank-mailman (input) for mailman id 555862;
 Tue, 27 Jun 2023 07:05:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EZfr=CP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qE2l4-00074l-2g
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 07:05:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec0b729d-14b8-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 09:04:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3FE111F8BA;
 Tue, 27 Jun 2023 07:04:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFF7313462;
 Tue, 27 Jun 2023 07:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L/rQOBeKmmTNEAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 27 Jun 2023 07:04:55 +0000
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
X-Inumbo-ID: ec0b729d-14b8-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687849496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JbVvGd8Ypf9Dg3FeuffhhjHqA1IzrhFctCXgoKplMvY=;
	b=nBUdk9Q9e0+zTt1u3kb3v5l/bCR12Wz5yf1n+Q2DajC8XKkX55lHObRomf8Cuoi4J/yl4T
	M1vp076FwTLSoPrEBg0HT+R0DiQMUfUl6EvD4siAzYL8S4iu/GyBkMhvGX3NPNkhUho9se
	U1VI6sXUcv4F8tqPnqCPukGJIzp3zBE=
Message-ID: <ede5628d-31c2-9637-df60-209d0c9107d8@suse.com>
Date: Tue, 27 Jun 2023 09:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] doc: clarify intended usage of ~/control/ xentore
 path
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Yann Dirson <yann.dirson@vates.fr>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230531103427.1551719-1-yann.dirson@vates.fr>
 <20230531103427.1551719-2-yann.dirson@vates.fr>
 <d28b77ef-f6c8-e95c-c484-4025c6f51eb7@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <d28b77ef-f6c8-e95c-c484-4025c6f51eb7@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Zv90Zum6ayqTnb0bVkxU1qzn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Zv90Zum6ayqTnb0bVkxU1qzn
Content-Type: multipart/mixed; boundary="------------3uv83bdeqdBZKA7lnu0pcm4u";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Yann Dirson <yann.dirson@vates.fr>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <ede5628d-31c2-9637-df60-209d0c9107d8@suse.com>
Subject: Re: [PATCH 1/1] doc: clarify intended usage of ~/control/ xentore
 path
References: <20230531103427.1551719-1-yann.dirson@vates.fr>
 <20230531103427.1551719-2-yann.dirson@vates.fr>
 <d28b77ef-f6c8-e95c-c484-4025c6f51eb7@xen.org>
In-Reply-To: <d28b77ef-f6c8-e95c-c484-4025c6f51eb7@xen.org>

--------------3uv83bdeqdBZKA7lnu0pcm4u
Content-Type: multipart/mixed; boundary="------------ESvYPfo0FqwsiIB0jX1bOJL4"

--------------ESvYPfo0FqwsiIB0jX1bOJL4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDYuMjMgMTY6MDcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgWWFubiwNCj4g
DQo+IEFkZGluZyBKdWVyZ2VuLg0KPiANCj4gT24gMzEvMDUvMjAyMyAxMTozNSwgWWFubiBE
aXJzb24gd3JvdGU6DQo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5uIERpcnNvbiA8eWFubi5kaXJz
b25AdmF0ZXMuZnI+DQo+IA0KPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxA
YW1hem9uLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------ESvYPfo0FqwsiIB0jX1bOJL4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ESvYPfo0FqwsiIB0jX1bOJL4--

--------------3uv83bdeqdBZKA7lnu0pcm4u--

--------------Zv90Zum6ayqTnb0bVkxU1qzn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSaihcFAwAAAAAACgkQsN6d1ii/Ey/b
pAf+MsXtdw5irm0Uu1AvkohPmpN9mNheDzHvz0y0ti9d5buK6slNylGdQkA9+11nuVzyifscuZNk
v5Znc/THEVsrtevdHeWt+XEm/TB9Uj10NadoYn3VEgyovSLKEbA+h3l17gzZegVtvCtCYDqtUVkm
+wl1/QHAiv32mzNKSUfznOCA8kDcn+Y41d6zYrZJ7WOSCxBjJp+wKDOeFeUN37DGE+Jv32VuYt0D
U7mZCzYsRg19IFVzqNIE6NXep9GvlCbx6XzlO5FaRNhTOxfRntZNz2gcXKwQ5Pq5qn52wC2Bq88Q
cx+POEmZdjNe9BCHNQ7UMr9PeP1LiQvZSZgzfZrzWQ==
=g71A
-----END PGP SIGNATURE-----

--------------Zv90Zum6ayqTnb0bVkxU1qzn--

