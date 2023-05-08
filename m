Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F476FB3F9
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 17:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531632.827408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw2yn-0008Rk-Fc; Mon, 08 May 2023 15:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531632.827408; Mon, 08 May 2023 15:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw2yn-0008Oy-C8; Mon, 08 May 2023 15:40:49 +0000
Received: by outflank-mailman (input) for mailman id 531632;
 Mon, 08 May 2023 15:40:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fEaP=A5=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pw2ym-0008Os-9l
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 15:40:48 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.217]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2ddfa58-edb6-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 17:40:46 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz48Fec1Vb
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 May 2023 17:40:38 +0200 (CEST)
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
X-Inumbo-ID: b2ddfa58-edb6-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683560438; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LiemzYZrSKziM+y0QPXCKHxyEer0ip+WguU0P9L3lHLZHV+GHN4u66Lh8mHiiLC2R1
    SfMTx6UHgQUicJLkwv597duEDnSOTYDrfnkEIW8bGkLHB/rMSs8z3EMXWPqR95TN24we
    dmYofIL6GbFa/nE+xurTSJHbuXL5dHQafvHc9quXu1cuk/NAMjt8ZTKt7ZzFHyoKUxJh
    9DbBaK7IdsMKMSAOK8nB7DegbfFUbfRCe5iknXxiuZYN0sgxMIQ1ytsomYo2ZreVkWva
    VG7Hb6c9lamGd8jezH72pDtatkwIIc78wZbCyrV8k7O+c1E7H+8kD124eVIoYwKxrXgM
    8LDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683560438;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=GD4pD2lagECFcggREhpTpdjv2A2W+Z6MdThgJKqvj/8=;
    b=KJE4h3TpSUrwe25SXEJMpm3b6rtyVAHYE/yPZ5FBiRl7OG+ZjpBTK9ev5vp0ahF1lC
    L2tvrc93nC+DrPrKLWCOIG5obPjrHQwxYZnZR5K8zf3AXsojG4YZJ4xtcwQIP0TdVfpW
    /eAMR+ek7cycL9FSAmzWNnOmcQibcB05v9fwJ/43QqJYPCPKBdYA+l95AjuBRqkwO66I
    IhUqDdWoMHbz/6+NuFuQWhiuhJjOmDb7GCPeR25oVl41F23XY9AKqvjDt34g4HAXsEbN
    cdFdfWhTED0tCUZbvE2kWNOwhZfc3sWB2RTE+AVMy+suqRPkWm1A1Pd1ywLJqTS4Zus2
    jfMg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683560438;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=GD4pD2lagECFcggREhpTpdjv2A2W+Z6MdThgJKqvj/8=;
    b=jjUN8//RmNZlKrZjZPfjh4TNkajm2kxsYnIITkJbPM/WeCavI4c4cWRfwCUMymMfET
    6R1UWi6uoyP6aRBPEzDPkJMhCPBK8hSTLBuTlHnKTFoAfvf+eMDoQvzocZ76smVWbfxj
    WDWs1nTUn9nSHwnTftOJBqfX0Q36+DcWq4WEClbaqJULI42ZKeYr8+gE36q1El6G7RjO
    Byyf8feYqqCgyDi2zXlRBDq0GkS1SYwaSt5LUw55p6cdaYmJy1wdDWwtDZVSkjVjbgFE
    dFUQfCrHP1WK9QBVNJ1SntAjn9V8UgXj7x6AHgfutiPU7ynIFv28Extff8CdI2V6oKaF
    /ylg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683560438;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=GD4pD2lagECFcggREhpTpdjv2A2W+Z6MdThgJKqvj/8=;
    b=bwHBSPksmyEi/70m2Fo195zb2zZuw2V8D4hYnF6DH2rxvdFWtC2uQHnKurGsbUpqs0
    1WWCqNJW9kLTgQN/afCA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4ARWIYxzstZKeVom+bauo0LKSCjuo5iX5xLikmg=="
Date: Mon, 8 May 2023 17:40:31 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v1] tools: convert bitfields to unsigned type
Message-ID: <20230508174031.585a3288.olaf@aepfle.de>
In-Reply-To: <324fd699-dcd8-9881-a276-167be38622b1@suse.com>
References: <20230503150142.4987-1-olaf@aepfle.de>
	<d8224847-ffc5-3faf-1bc5-6ad3d7966b26@suse.com>
	<20230508120038.74246111.olaf@aepfle.de>
	<324fd699-dcd8-9881-a276-167be38622b1@suse.com>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q0Z3jrQHA4gLbAwmBtbq3Fq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/Q0Z3jrQHA4gLbAwmBtbq3Fq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Mon, 8 May 2023 13:23:27 +0200 Juergen Gross <jgross@suse.com>:

> I have found 18 lines using "unsigned int" for bitfields in this file.

There is indeed a mix of both variants in this file.
I scrolled just down to line 6999, only looking for ':1'.


Olaf

--Sig_/Q0Z3jrQHA4gLbAwmBtbq3Fq
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRZF+8ACgkQ86SN7mm1
DoCJ4A//Q79FIn5hVwGknH3nmxusiPSNdYqcfyRo0QJrCR9gDnZiVMb0zQOgeO61
6fCcMX9UcV1/Dp2M+Z5K6Sgj4g0hLxBiQ+NrHMh4O2tHaPPe++l97i6HCC4b00EY
zdwaW1/oYbO9rXFG45aIlc4CmBvvc2bKEn/6mt1HBsR1IXWQBDBawX+G1CjmOWFR
0niXKVIFkzqaROtaHjwVnCvSahKNRNqhrcXycV0hxYO4ftmtkBbPhhqZofuYnNqy
TYpEXf/A6JgpryoDHOeDD5LfIcETgIQcnZfrS4Jp8e0xWtBlbs5ag3ljISbxHpAf
7hc7RaL+uBrnqQ7YVOGautRMjxHgDsRZfmn4o7LBqsM2wfIIfcVJjLUZB5ChPQ8R
2Ox6xsMPn4RQl9HciQG9wSrfp5cRRzHD8HHrU8Mg+kSEVyc1k7wBlE4Qa2VS55Fu
XW3DykpUd6Wgjr1YZsacDYRpQQtt0dnTO3WvtBsm6VU4VqXmDgApf2dSzPseg7Zh
TO2Ra5SHeSOb4bbXNPjalqKH4zqMAKNoBykHjsUJzdRH4wkeAInZ51t7XdqmWuCQ
HI3f///lG44uwyJQtHzA+mlQQPAKrjq/+AfhSQB27gUii4j613ZTT8dtvLXjQuE1
1gCFWcTs8vAfpfUS0wV6SA731xTtP9PECfQRe9g0LyG0CAwB64U=
=pZnR
-----END PGP SIGNATURE-----

--Sig_/Q0Z3jrQHA4gLbAwmBtbq3Fq--

