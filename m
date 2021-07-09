Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0256F3C2362
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 14:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153627.283809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1pXs-0000MI-12; Fri, 09 Jul 2021 12:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153627.283809; Fri, 09 Jul 2021 12:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1pXr-0000Jn-UM; Fri, 09 Jul 2021 12:23:51 +0000
Received: by outflank-mailman (input) for mailman id 153627;
 Fri, 09 Jul 2021 12:23:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AxIF=MB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1pXq-0000Jh-Kb
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 12:23:50 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83233834-e0b0-11eb-85e4-12813bfff9fa;
 Fri, 09 Jul 2021 12:23:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx69CNleeT
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 9 Jul 2021 14:23:47 +0200 (CEST)
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
X-Inumbo-ID: 83233834-e0b0-11eb-85e4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625833427;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=m1wERmyKbLHuKhYrgWINBK+zaTeCYTMFvHW6vRjiDrw=;
    b=r1gPUeplpKi/P2qGLdnSZ6vxspoPNEEYTTpc0wj1f0fjgzY55NkvMvuMkcAcHSYhKf
    g7jl90ILtlvsXZK6wqqiahkFmpxc02E+ARvX7PROAzMlPRbn9uimitoyB31MVUsGGtGy
    8jk/j6vo0uj1BFzrG5mXg154aqZtSgSUz0y+czfSYo813evU2Eh6G3nssIG5l6eH94U1
    Ydu2Btc/M1/LXDdNyuOkSu+QL4McS3MiAdZYEkiXnLpB95OxTqpBBM0OwN7gsESuZaSL
    Uy+JTjskD4fmi2zkeWyVIdeOpQCNsyuxV4MwWlA5ARtiZVceqfhiy8XVpepPG37rdvwt
    Awlw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Fri, 9 Jul 2021 14:23:33 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: document how to refresh a container
Message-ID: <20210709142333.45b5795b.olaf@aepfle.de>
In-Reply-To: <b405e7c8-44ac-56c0-8fcc-3c25ac4b3914@citrix.com>
References: <20210708145628.8902-1-olaf@aepfle.de>
	<b405e7c8-44ac-56c0-8fcc-3c25ac4b3914@citrix.com>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fSp7cjdb3B7qEhhk7JRUC3w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fSp7cjdb3B7qEhhk7JRUC3w
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Fri, 9 Jul 2021 13:02:54 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Do we need the ls here?=C2=A0 That sounds a little like debugging.

Maybe not, it may show a long list of unrelated stuff.
It is just to verify a fresh container exists, as you said, just for debugg=
ing.

Olaf

--Sig_/fSp7cjdb3B7qEhhk7JRUC3w
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDoP8UACgkQ86SN7mm1
DoA7jA/+PosQIbbOV3yRAF5u9tDoYYc8vYsV4d4xUW4jKHvI2HTele4VpDjnv/LY
eRtwbeed2fowKPASVCpEkPsfEmTCgTdzRMz0niNQoQBqNfqp6zmC2P8DUzgrznl+
ysMXokoG9QUTjehEaehHXd7UCqJlYBOAKE4gcd92Q4eCiXbOdlAzJ55OW7bKTNiK
54QC4zyMaWgnwC21VzhKPq8tn6Qp4TNUUS8/kcKwFocNGuPZmxcLNvrJgxD3ksXG
8pqINBHAFRDehxEYREHClzf87ODVfzhvR6/fSW7CTBNu135k2HNUWDHyvC8tC25D
MhrO7AtFwMEqUSD9GQlhgjY7rDjBUgJ7SgYegtNuxKL1FpAVWWJkJ4K9IA7GeuGG
fsrleyNEkgc9bUbvzpeI2cCMStKtEknBywFphjOJichH6a7uQvEEN9cIY+VHQiiW
7dZzoMEkhos14DzVUlwzMRAFVT9yzt5XNKmDJhTyiQXSxYytP6avBPzBpGUU3NsD
Pww3ccmgxBrQZJ64LZ6ky0vrOaxo2G2L+jogwxEUfrxLxZYF+uogc82dBr5KL8ZS
HpJ3lo8Jjv7OXm+l33bHwAkL8fueEaksi0gxnQPPqb7W1j4N2sbRYgOTWWJV574T
lbNom9tzaxpFcKLw0irwiQF5kJKyI9F5jHLjPp8r3FLGvtBKRMg=
=sW94
-----END PGP SIGNATURE-----

--Sig_/fSp7cjdb3B7qEhhk7JRUC3w--

