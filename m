Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC93B93A8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 17:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148913.275228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyAu-0008Or-CD; Thu, 01 Jul 2021 15:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148913.275228; Thu, 01 Jul 2021 15:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyAu-0008MB-8N; Thu, 01 Jul 2021 15:00:20 +0000
Received: by outflank-mailman (input) for mailman id 148913;
 Thu, 01 Jul 2021 15:00:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lyyAt-0008M5-1l
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 15:00:19 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.164])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68fc91ca-6281-4814-93ea-fcf68e3bd5db;
 Thu, 01 Jul 2021 15:00:18 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61F0G7NZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 17:00:16 +0200 (CEST)
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
X-Inumbo-ID: 68fc91ca-6281-4814-93ea-fcf68e3bd5db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625151616;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=1FRUTA3lx1xmpOp1mKwuBsgpUX+KYHxPk64HZkc7MTI=;
    b=g/z5yD0aJ3oSy0UuR/Wra5UCgZdzo9XYOnqfa10HvSojgcWl5dxTVtKSK3CUFPloeJ
    upFEiKVN7QwYHNGzv9bi7BofWM6I1o9blVSLWEB1XbMTW5wkiHxRa1JxwQx7Blymj7qx
    SO1zVjPQ0bBoO/BO6SAL+zTabDIH9fZdp6FJpzh9DDUARMzb0vwHkHUvrV4w5qi1oshC
    f9B5+/nCk3NRDpzm5rE8gg7toFMnrMZ72pVpqZNljhfT51yqW20SA+pJuDZnN13GXyMd
    HMTwmSoiTV3FpHRo+56eWLfZ60oPm5OqSpjVnQFXzP41ckIC0JekOYbOhPOdyMe/v1L7
    UgWw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 17:00:09 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
Message-ID: <20210701170009.5a8be33f.olaf@aepfle.de>
In-Reply-To: <20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
References: <20210701125623.593fe3ae.olaf@aepfle.de>
	<20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_MbKKWyEwa/888gyYOByhSd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_MbKKWyEwa/888gyYOByhSd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 12:19:24 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

>  Where is the 51 leaves coming in?

I suspect the bug is this line, and the magic "0x1c" value:

p->extd.max_leaf =3D min(p->extd.max_leaf, 0x1cu);

In my testing basic remains at 13, while extd is truncated from 0x80000008 =
to 28.
I think it should be truncated to CPUID_GUEST_NR_EXTD_INTEL?

Olaf

--Sig_/_MbKKWyEwa/888gyYOByhSd
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDd2HkACgkQ86SN7mm1
DoAt5RAAi7YY8rPut4dXconVpm/h1wjL1WGHXNCYK5cNxb7vUjo5nzcWyvUWYGyW
f50OsYYJTtLUt7pjuvymmPNPMomOAnYu6E3lYJ5zNu0yGW4FmB8ekh5IohMeFEdi
RDT725qmdE4vofiR+Apnk6OQ59t0a4u2g2FEPnomsk0Vmj0p9fz3wrbbTNBWPPr+
N61Irs6OtspnBZ/I+qwL5jSCBhE9JvxB+Ni52O0HwTU015zOJQAlqkDpl+bVMrkl
ZZgEmbTs5kKZ/0JvqRm+TMNK0fCHm/f6Olt5lNu4wyDaZEmzjDBgOEGO1WlcASXf
hCzv0WSL5opHRc8GwdHuOipiVR4s2L4w1TCo7+J16+g+96Ctkx10vTKKUjat+xxj
PfZi/+MMeqcKcAmQOoMbcloXBYssW+dDNf9pc3DYxLpMtThC8cn9YX//nEVyLeeg
yHQXxg1usZQLqrcx7Jyj3w6oMsrRPG1jE4vkUtfRBXJ4WGLG4+ObHQw8seyA6KIU
J3oJY1fV0ZAR1kfbnw4w/CreiyKZ86TpBMNx5r2JZPNX9r0xusG3WCrwZneOcnHT
nUoNx8D4+0gnowP8JLSWgAdvl5jrZ/Sd8opSE9muh+6pI0eIsjNFYTJJpUic3sLM
iHkuawfChvXN54vWpEAhnQYACTxgEWPuMLdK2MQJP9aVyDKsjqE=
=Zc2q
-----END PGP SIGNATURE-----

--Sig_/_MbKKWyEwa/888gyYOByhSd--

