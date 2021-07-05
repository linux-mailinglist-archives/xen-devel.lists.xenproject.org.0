Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E888F3BB870
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 09:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149838.277146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JQf-0006c2-GA; Mon, 05 Jul 2021 07:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149838.277146; Mon, 05 Jul 2021 07:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JQf-0006YT-BM; Mon, 05 Jul 2021 07:54:09 +0000
Received: by outflank-mailman (input) for mailman id 149838;
 Mon, 05 Jul 2021 07:54:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0JQe-0006Wy-Ck
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 07:54:08 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 927b3d5d-f83d-4132-a77f-c0d8e077d985;
 Mon, 05 Jul 2021 07:54:07 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx657s1KWz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 09:54:01 +0200 (CEST)
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
X-Inumbo-ID: 927b3d5d-f83d-4132-a77f-c0d8e077d985
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625471642;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=JV+LJl7nJl9afvBx8gXKE9+tqVLRE/Strneb576nBkM=;
    b=Vq3CZncIhD2KBHvbI/569Mdl7TdD/J58OoZX72jJu3rYVpnEsxB3YTLyyMnhegDuHB
    HPshcmKTNZOc0KpKh4Fi8afXFnIZHUJseK+oHNfL/JGeN9sRuqqMySESCeHV7jPcPFjX
    IU3hpPepe4c6ARsPPotSDJ2HczGnZKHvTkQtiQ52hiMfZDwnXLHjaLxbIbv9+YNV1qBc
    jdXbUn9nc9inyMTfuMO3Mlj1lgZ+14r1YCKc5OY4KJFfQUgS/M+jnVK8T7qhW1+TWUiT
    3pW9vcGXbBvt6XvzqmNfKI3g7zxky9nN6bXYCx1zbrb9jbdJJ/M84ylW92gQJ8eG5u2A
    r6ww==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 09:53:53 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libxenguest: Fix migration's debug option
Message-ID: <20210705095353.6ff58d0f.olaf@aepfle.de>
In-Reply-To: <20210702190342.31319-1-andrew.cooper3@citrix.com>
References: <20210702190342.31319-1-andrew.cooper3@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vTUTvSUi3yzBKNd.k+04xVq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vTUTvSUi3yzBKNd.k+04xVq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 2 Jul 2021 20:03:42 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> The code has gone through many refactors, but the first refactor was the =
one
> which broke it by inverting the check with respect to checkpointed stream=
s.
>=20
> Fixes: 7449fb36c6c8 ("migration/save: pass checkpointed_stream from libxl=
 to libxc")
> Reported-by: Olaf Hering <olaf@aepfle.de>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Olaf Hering <olaf@aepfle.de>

Olaf

--Sig_/vTUTvSUi3yzBKNd.k+04xVq
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDiupEACgkQ86SN7mm1
DoDIXRAAglTWm3uEwsF1P8g2OClf5p+bXwBXOHbMeCLJSFj9FZDEoapFvZO2/uGB
Txey2rEWf6njre5/AGGHLCJ0czPAbpGxFSf1H4/XeRrhdn/bWmNPvrW38pmCvKjH
vbseyCp4IaF0s2Ub/lBImE45Bxn23LzaVCrIqy+lP/fGlTW1sjfBs+c2pczdnxwX
P+/t5hfuYVhB+oU1b14u9Pg9VMDgzeaVPLPOwfGjrO4X5rJmPHLaE2CKzeL8TfVh
w/9F/zI1VzrlYCQ23exrdK4rU+7odnltxNer5LsURDj+1Qompt1NvGJ69pEcc950
LLX8goyPjhEl4Y0J+dhJaqFcAe254f4Yi/XKiaJdLYQXb8ve5P8QyQGjjyPe5rtS
x/KQNDQkw7IarQ+QZJvsnTkJI933bycHTBCpN7W7xujVPyMvE/z0HzdU0UWn7PAj
M0hVrQ5jXKym4z6NTX3X/Xy5t+4K0RVgAAKdx1PTwGECqPOnw2wpdO8sMZbQvuGr
/Uvl6zazYtjeAXXrjdd1c7ugDRbmUoyeVtrXZaS0hlUhtceok+ijtIm1tNfcmjwa
uGzQDpZ6ozCEdvLE6eg8qMlHpCWq3PpwuZbNbZa/X8icOt3mZ8F3MK7RqwbyYzGl
EZyUxgiVLSR5OJ0VAjtjDcTqpP08xHiqDX3R8p1fwQFe2DED5lw=
=krAC
-----END PGP SIGNATURE-----

--Sig_/vTUTvSUi3yzBKNd.k+04xVq--

