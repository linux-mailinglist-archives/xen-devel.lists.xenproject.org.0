Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C87442605
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 04:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219650.380521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhkQg-00067k-4o; Tue, 02 Nov 2021 03:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219650.380521; Tue, 02 Nov 2021 03:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhkQg-00064q-1p; Tue, 02 Nov 2021 03:25:42 +0000
Received: by outflank-mailman (input) for mailman id 219650;
 Tue, 02 Nov 2021 03:25:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBjp=PV=canb.auug.org.au=sfr@srs-us1.protection.inumbo.net>)
 id 1mhkQd-00064k-2P
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 03:25:40 +0000
Received: from gandalf.ozlabs.org (unknown [150.107.74.76])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8abba112-3b8c-11ec-854e-12813bfff9fa;
 Tue, 02 Nov 2021 03:25:36 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjwJr4qd9z4xbG;
 Tue,  2 Nov 2021 14:25:32 +1100 (AEDT)
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
X-Inumbo-ID: 8abba112-3b8c-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1635823533;
	bh=kQQNzCvwzxdUuDSfmbavyv5NvfpdyD0xurk8gKK4fQU=;
	h=Date:From:To:Cc:Subject:From;
	b=HY3DLknuf0ueGGBFXZ1usE/kI2EfQZCxPVOngoS9D+G+sTQn7sns05nhYVPmBt1Qh
	 Ek6rUQoULmCgcsQbmtftl0wE+b6cCu6UJ03nrHz06pG98Sc2il+y+49vPfApzihxWQ
	 jSv3zoMWuFbHCxT8cdAnLKEUVF3zIMJS10RZw6qKJ3huhWZ5mB4VIbjQJmO8GF5Vgh
	 stp8MJ+mUwU8dOTlKQXDLZh19ZeFBCZkWg7RJ4LW0eUvM4su6SPdk94v0pfyk2oz8i
	 Bgv+XVtw1ELKpqg3AWLdQ9/vz8wQmLuA6knmpJH4G9SQWKS4hIMpKPrf2uU15Gyjqb
	 XJFp+W2iFwPZw==
Date: Tue, 2 Nov 2021 14:25:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>
Subject: linux-next: manual merge of the xen-tip tree with Linus' tree
Message-ID: <20211102142531.600cd8c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/to2PmTmvm2+Zd5uiRp+Mb3Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/to2PmTmvm2+Zd5uiRp+Mb3Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/include/asm/xen/hypercall.h

between commits:

  f4afb713e5c3 ("x86/xen: Make get_debugreg() noinstr")
  7361fac0465b ("x86/xen: Make set_debugreg() noinstr")

from Linus' tree and commit:

  321d124f13fd ("xen: allow pv-only hypercalls only with CONFIG_XEN_PV")

from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/to2PmTmvm2+Zd5uiRp+Mb3Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGAr6sACgkQAVBC80lX
0GxhEQf/aR2pdzgnAazQxMsNREPH1IeUYV3HVhejE2JQirQl3UfGQay1RxKEuKea
q75ctvmRgD3+zh1MfW8Z4hsQTW3WOKc4QzasPr/xNgs1zucyzCnxF0Zjd2tj5M6C
Jl8apkM5tKinLsAeSAZYLml614Jyh6L5e/4KImg2IEyu4dyZ4n5lfV3GrJcixe8L
kvMCiTB+lWI4sDNxd5lfi/2a/2gTSZNvN8OjCT93MunhBDYq/5SYStJiRT0usDYt
LbRow1YA2Zd3FWhBLRbFThmMRyVtON1FxJ6rm1wrS9GFVNgPEJkJfxDrP6k76J0v
uWlQ31YChu/INl8pjJPpSNdb++TKqA==
=zaTN
-----END PGP SIGNATURE-----

--Sig_/to2PmTmvm2+Zd5uiRp+Mb3Z--

