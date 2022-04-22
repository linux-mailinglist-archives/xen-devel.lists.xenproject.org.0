Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D5C50AD22
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 03:15:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310590.527492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhhsr-0008HE-NA; Fri, 22 Apr 2022 01:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310590.527492; Fri, 22 Apr 2022 01:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhhsr-0008FP-Jp; Fri, 22 Apr 2022 01:14:53 +0000
Received: by outflank-mailman (input) for mailman id 310590;
 Fri, 22 Apr 2022 01:14:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FogU=VA=canb.auug.org.au=sfr@srs-se1.protection.inumbo.net>)
 id 1nhhso-0008FI-Vm
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 01:14:52 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 975d26ca-c1d9-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 03:14:47 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KkxJv1RSRz4xPw;
 Fri, 22 Apr 2022 11:14:39 +1000 (AEST)
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
X-Inumbo-ID: 975d26ca-c1d9-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1650590080;
	bh=PDwdWAr3d36JH4WWt/FccU1tk8rwMVXRWseC7stMlsM=;
	h=Date:From:To:Cc:Subject:From;
	b=Gb0CDA7eukAe0P/i42k0HOKCRwRH1jA0+DZp3nt5xb6JkQ0rWrOxTtzbS5rtS9cAv
	 m/ID0RHAA+E/piY2anrEQd5QWOOlJoOnGbpUDDsWmwZarEAHd96x5Xfdyb/0xRtKli
	 jaB8pUmxihzbcKKPSdjUj9g6VFjN8HaVt8QJOLW7yQ/umCokGXl3jqn1BmpQdi69RZ
	 QS/r6LCAsohc24zzjcrIkr8+qfXhqY4bvWJlSlsj/IKYqkDFIvzUDcoqZIOTtmZt0J
	 nvG7qNLx+AksBZXA1fJwifkgEQFuxI8SeaVpgjQvl9ky6J1/sRhwQkhU3g9ddUBYaY
	 8Bhl8Thc6Z31Q==
Date: Fri, 22 Apr 2022 11:14:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the xen-tip tree
Message-ID: <20220422111438.3946dbae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Acwu5MAWinYu7DVgoSV1rm.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Acwu5MAWinYu7DVgoSV1rm.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b12d41716e32 ("arm/xen: Fix some refcount leaks")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Acwu5MAWinYu7DVgoSV1rm.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJiAX4ACgkQAVBC80lX
0GzLbQf/cAY5DZMoJcCtPP8hz0H5FOYfij/KKWzsQQ2SwET5tZnJunLuHEgGyaMQ
nAZK8EBg4cGBoabLnmdSzYL1gT68MlQJu3YPkBDPXmiJwZ0byd1LYMdex5z3isG/
ttkeb6VzAflpwtMGT3rS/C9ClH/WdISXofDOHK8jrQVKgZyg9fuC1pi0yfwlw80O
WgKGPAjawSdG6rh4urP0M9RoFH0bDoV1T66NYPflGMUqXC3pEQpEFiq27mXkwu38
5yk0zlGMy8YsW9J0pmgDU3foENCua+CqYppn61WgA+FDrfzPCVu6Q2BWdRfuHBh0
QvlCAOMLaHN4AL9g6aiI/X1YtqWZQQ==
=kNGi
-----END PGP SIGNATURE-----

--Sig_/Acwu5MAWinYu7DVgoSV1rm.--

