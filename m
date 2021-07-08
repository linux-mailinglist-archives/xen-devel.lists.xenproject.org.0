Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047573C153B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 16:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153168.282976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1V6R-0008FI-4D; Thu, 08 Jul 2021 14:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153168.282976; Thu, 08 Jul 2021 14:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1V6R-0008Ck-18; Thu, 08 Jul 2021 14:34:11 +0000
Received: by outflank-mailman (input) for mailman id 153168;
 Thu, 08 Jul 2021 14:34:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1V6P-0008Ce-Sg
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 14:34:09 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d937c64-dff9-11eb-8586-12813bfff9fa;
 Thu, 08 Jul 2021 14:34:08 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx68EY6avp
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 16:34:06 +0200 (CEST)
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
X-Inumbo-ID: 8d937c64-dff9-11eb-8586-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625754847;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=ZqCEmnNfSXnJYVa9GBuB7RsNZxVDoHcpp8odhGs654A=;
    b=mgv7Jjw0zb/uXbFkDPnbd7ZQXSW1/HeWV9/dWOyBser8v7l+Ovxm6OvNy66/8dl2ly
    YIzKoSizNtDxfRj22mMny7s6k7nQOjvRUpqP/mHr1oDnjHH8FaXFKY6X1amBZr6RJSBu
    SH9+it3ZnCTjV4i42hJq+gkNQgmlEbMJuvTClu2MMgV+wNDo1eF52wyy5UXGUxwCt5s2
    xDEababAubC4aQNsh0IShYj4vza3KzMRuW6fVlm4nGBB1REaBUAqpFdr17m4kpBQ3177
    uVtNKlKAuavf/3gy4e625iu7aCQyH0XUUJNvNtzDmXCwYWfGHcEhF5+i5dXEv0Ee5D69
    y0SA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Thu, 8 Jul 2021 16:33:52 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: use zypper dup in tumbleweed dockerfile
Message-ID: <20210708163352.08da715a.olaf@aepfle.de>
In-Reply-To: <0b16fc43-9b5b-1edb-0e21-024bd9cd9708@citrix.com>
References: <20210708135704.25626-1-olaf@aepfle.de>
	<0b16fc43-9b5b-1edb-0e21-024bd9cd9708@citrix.com>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/135sV0iSmbPhKtRVL/Jo=XR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/135sV0iSmbPhKtRVL/Jo=XR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 8 Jul 2021 15:30:09 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Have you rebuilt with this change in place, or shall I do that after
> committing?

The current image has the latest snapshot 20210706, so today it has no effe=
ct.

I'm testing this new build and will update the README before pushing an upd=
ate.


Olaf

--Sig_/135sV0iSmbPhKtRVL/Jo=XR
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDnDNAACgkQ86SN7mm1
DoC1eQ/+Nydk2MqIGo7TOItHfsljlvWnLwel7deuHi1i7VeyX3WAiG6lpPQkeaqQ
wfR8HLywBRsUqvhti7W7fCjDrc4EglxPdZH1Mo2k0QoZ9TqJKT8uE1By8GhhlzqA
rpyusnjMGJAk9ivzhmBv+Hp5T4CB5k+97Mq5c46/Ned08QTri7bVUvAQw5JWmcCG
Lcoc8t3Zz5+H6ucxLQF2VyKasDquVgufC7EqPESxILYzO1DzI8j710P1HnLwW92l
E+sM3iGRwaeAl/zwKmO6byUvjg4h5g0Fe5M16uAy2f11qVXz8VXbaoqyurI6PWcW
FQCoyRyLTICBObqFg1rQtTwJu+c1UCp8ORXn3KekgLjGZOJ9zkU07sboJkbtbXFa
IaTDcN/44+8PQ5M7cot8dTJhr6ZwUuQDaiAMlj1wsRj2gBsdFpmsfWujeuhzzWa6
9Gz/E6q+5TzsiEVf0N4AQwJY1Cg4X9EoSX8EkEnFGKhXr7DijHjaG1RIBKbmwSzq
DV/y85O+2032/F6KPdqvDhj5V43Ucuj3mu2bcKu3mzEenizugUkVzvQmcdWQGbr9
ZIlVPZdnvfu+HTZyj0qSoziCU2TH419u7d0F7qxTferwdwlrzquUg7pSBgqf1Pm0
GibcI5RgQSS/4nEAuqzl0dMLuOePB68K2cPjCNhq1WtrO2AVwkA=
=TovD
-----END PGP SIGNATURE-----

--Sig_/135sV0iSmbPhKtRVL/Jo=XR--

