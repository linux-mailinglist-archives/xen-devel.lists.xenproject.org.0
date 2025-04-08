Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AC6A7F280
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 03:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941339.1340851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1yEL-0001eV-FS; Tue, 08 Apr 2025 01:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941339.1340851; Tue, 08 Apr 2025 01:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1yEL-0001bN-Cn; Tue, 08 Apr 2025 01:58:25 +0000
Received: by outflank-mailman (input) for mailman id 941339;
 Tue, 08 Apr 2025 01:58:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4ml=W2=canb.auug.org.au=sfr@srs-se1.protection.inumbo.net>)
 id 1u1yEI-0001bH-Tq
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 01:58:24 +0000
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efb76569-141c-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 03:58:18 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZWq3n6VGBz4xD3;
 Tue,  8 Apr 2025 11:58:13 +1000 (AEST)
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
X-Inumbo-ID: efb76569-141c-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744077494;
	bh=qnLYYmYvnpLXTLKkHmioRRUvl7SLbInyp4kptnR45Yw=;
	h=Date:From:To:Cc:Subject:From;
	b=tBL8B2tgStLHvHWmwqXWGaSc+oIewgPKObOeyBmIT5wMeIh3ZZY4pOvzeli0IjiIT
	 NzP5XtCAjoUtAXvWEiBOhJCwlrYnLoeMii941WBPE1S3X0yg6K7d4ctTDF8I3Bz6h/
	 4me65N+gmEFubDjqxAIalTE3laGjCpVq9uhkDY4no5iQG/ozCYQ3JDztgJ5myG+Qn4
	 ayJ97AlCeuXSTDq3P90ANOmRqwlKl2KkwkI+75YeGMCvtFi2tTrNqbdtibVREN8n4L
	 c0/uyACpyD5qx34kLGEQEk3hZyZC+7T++shwss5y8SlJfb8+tYb3/oZL9x6mSgjVcn
	 cT58gq+HsAFow==
Date: Tue, 8 Apr 2025 11:58:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Xen Devel
 <xen-devel@lists.xenproject.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the xen-tip tree with the mm-hotfixes
 tree
Message-ID: <20250408115813.0a5365ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1wsli=Gj.rBDPyMX/OFziTq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1wsli=Gj.rBDPyMX/OFziTq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  drivers/xen/xenbus/xenbus_probe_frontend.c

between commit:

  5be5772b1f96 ("xenbus: add module description")

from the mm-hotfixes tree and commit:

  b40c54648158 ("xenbus: add module description")

from the xen-tip tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/1wsli=Gj.rBDPyMX/OFziTq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf0grUACgkQAVBC80lX
0GyZmgf+KunX/Z/1JkX41sS/t6EuxwP5hAu4bZm1qBZSLS56Hjd2GFLUMfvzz0Yd
TXxXxEqtmPwVdAR3VppX9R85PsQS4xJszzjf+PfYnq1My7Kk0qT1vQ6IDESkdPJ4
//SzYnNbjIpE/gC0fDDM1fEfJ+E9qx8nXUR9pl/CzanjBsdgWApS/0auRAzdDcL/
C9yMUg8SaR8HNYHrl/8dtsTL5TgKf6sh+Y0DLk6iKdFW/GNjBmosNB9RQnP92o6B
9mVVGbw3cZBggk5H1qdOmeevvH+kdGTcfXsD/ra2ulM9eyUDHr9IBlMYQkAv/wh4
oZlGaRaDmq+e9e2NgzJxDwB7OP9s1g==
=/eeY
-----END PGP SIGNATURE-----

--Sig_/1wsli=Gj.rBDPyMX/OFziTq--

