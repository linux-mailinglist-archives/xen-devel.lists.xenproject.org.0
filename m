Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F6D591F28
	for <lists+xen-devel@lfdr.de>; Sun, 14 Aug 2022 10:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386656.622629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oN99b-0003IK-G1; Sun, 14 Aug 2022 08:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386656.622629; Sun, 14 Aug 2022 08:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oN99b-0003DH-CA; Sun, 14 Aug 2022 08:39:27 +0000
Received: by outflank-mailman (input) for mailman id 386656;
 Sun, 14 Aug 2022 08:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AepH=YS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oN99B-0000pr-A2
 for xen-devel@lists.xenproject.org; Sun, 14 Aug 2022 08:39:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b41d97f-1bac-11ed-924f-1f966e50362f;
 Sun, 14 Aug 2022 10:39:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 33553207C4;
 Sun, 14 Aug 2022 08:39:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE45B13AAE;
 Sun, 14 Aug 2022 08:38:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nZmdOKO0+GJfNwAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 14 Aug 2022 08:38:59 +0000
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
X-Inumbo-ID: 8b41d97f-1bac-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660466340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qBzbzLXtOGncnq/z3oqFXpq5/qj6DfqjuoQxQOYKlBc=;
	b=aCkHozMaJD0Z+z/puNBMYfMQ+oBfWZltq9MI2noljckk1OsopQR4qrKlghyKDAcwIIHowx
	31dga2qDFqOaPASwwlgGQqaGqPaKILAoHON0QdaA7OPVQNXBZwznxLAGLS5iqGhaWs0STJ
	o2slZ2P/kaMYQ2LF3gJeD1lrVk1x/KE=
Message-ID: <f0f4e689-edcf-8e83-8834-f4f9f5b6c958@suse.com>
Date: Sun, 14 Aug 2022 10:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/pciback: Fix comment typo
Content-Language: en-US
To: Jason Wang <wangborong@cdjrlc.com>, oleksandr_tyshchenko@epam.com
Cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20220811120918.17961-1-wangborong@cdjrlc.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220811120918.17961-1-wangborong@cdjrlc.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KY9NMxrc1K5xHV9Tw20fFlQD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KY9NMxrc1K5xHV9Tw20fFlQD
Content-Type: multipart/mixed; boundary="------------Mjd00y3Fgda5L7ku70jresb7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Wang <wangborong@cdjrlc.com>, oleksandr_tyshchenko@epam.com
Cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <f0f4e689-edcf-8e83-8834-f4f9f5b6c958@suse.com>
Subject: Re: [PATCH] xen/pciback: Fix comment typo
References: <20220811120918.17961-1-wangborong@cdjrlc.com>
In-Reply-To: <20220811120918.17961-1-wangborong@cdjrlc.com>

--------------Mjd00y3Fgda5L7ku70jresb7
Content-Type: multipart/mixed; boundary="------------xVf50BFAXQG4NSewdX9YOZKm"

--------------xVf50BFAXQG4NSewdX9YOZKm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDguMjIgMTQ6MDksIEphc29uIFdhbmcgd3JvdGU6DQo+IFRoZSBkb3VibGUgYHRo
ZScgaXMgZHVwbGljYXRlZCBpbiB0aGUgY29tbWVudCwgcmVtb3ZlIG9uZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEphc29uIFdhbmcgPHdhbmdib3JvbmdAY2RqcmxjLmNvbT4NCg0KUHVz
aGVkIHRvIHhlbi90aXAuZ2l0IGZvci1saW51cy02LjANCg0KDQpKdWVyZ2VuDQo=
--------------xVf50BFAXQG4NSewdX9YOZKm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------xVf50BFAXQG4NSewdX9YOZKm--

--------------Mjd00y3Fgda5L7ku70jresb7--

--------------KY9NMxrc1K5xHV9Tw20fFlQD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL4tKMFAwAAAAAACgkQsN6d1ii/Ey+D
BAf+IYj/XixMTL0nYWHf+oFmHp6g5p+YHDKNc+mJX0BOU0l326ecrDqO6WhFfwb6AbTZgz4+HZqv
dIunzNoWLM3nQZWjq6P1NEoi8VqvxRjh2Mm8LZIROTjuds4UlGcmCYA1l7bhVSOHwby7qhmjrojx
zxUMO0G9a3aoGATDxuOfb+P7JrkIw48wmOGtxsd6geCRXdX9kAJhwfneue2sdaZ0q86PdH7YQRFc
2R3X+/L71SqcbdP6jROOXDxFpyvQFGpml2NMkWGlGobflNG9WZ0kNVXt0wZq556R4A6h85/uE51c
1C7sw6YJh93rWHGccuSuF1FoFDvxBL9hos1pB76ZEw==
=WoxE
-----END PGP SIGNATURE-----

--------------KY9NMxrc1K5xHV9Tw20fFlQD--

