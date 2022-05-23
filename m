Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B085C530991
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:31:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335381.559605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1af-0005fh-Vl; Mon, 23 May 2022 06:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335381.559605; Mon, 23 May 2022 06:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1af-0005dw-Sz; Mon, 23 May 2022 06:30:53 +0000
Received: by outflank-mailman (input) for mailman id 335381;
 Mon, 23 May 2022 06:30:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGJF=V7=canb.auug.org.au=sfr@srs-se1.protection.inumbo.net>)
 id 1nt1ae-0005dq-8U
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:30:53 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0a41347-da61-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 08:30:48 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L66sG0b1tz4xD8;
 Mon, 23 May 2022 16:30:41 +1000 (AEST)
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
X-Inumbo-ID: e0a41347-da61-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1653287444;
	bh=xgg1hS9BSFr5BuV1JPPaBTBshDJNljlVHdKXJO5tQ78=;
	h=Date:From:To:Cc:Subject:From;
	b=sYnPmLi8oYAqcYCjY6GHNChs5KYvus+P0r4Ha+hu2Qpo4kVIGVj3bhfLVwJn2ECT9
	 PItx4IuEgzjyncJt2ukJrkkvkgo/Fv1BP4r3Sg01O985QC2dDBSVqergEj1J6aeBmX
	 ixUmaX8DtshIG85goiSPBdK6QLcd+4Upjjm8mwLFnhm21hocfXOfWy3xy9rOrqLOqU
	 ah63LfYwt5wNL9w1tP47lwxGiCsdZJRhodfw3bW4nWXtmpm5os/6fD7q7RffpbUVdE
	 GDUC0EEl/UfPdyuTfLneQT6/f8y+tw87u/TO1lbIuDfaV7ECB1+RjP5meIVBOmXYfT
	 GTl8/z/PRXEbg==
Date: Mon, 23 May 2022 16:30:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>
Cc: Xen Devel <xen-devel@lists.xenproject.org>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Maximilian Heyne <mheyne@amazon.de>, "Rafael
 J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: linux-next: manual merge of the xen-tip tree with the pm tree
Message-ID: <20220523163040.6064b190@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LHaDpV_gDAUXQ2VrDx=4El=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LHaDpV_gDAUXQ2VrDx=4El=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/enlighten_pv.c

between commit:

  f089ab674cea ("xen/x86: Use do_kernel_power_off()")

from the pm tree and commit:

  1591a65f55bc ("x86: xen: remove STACK_FRAME_NON_STANDARD from xen_cpuid")

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

diff --cc arch/x86/xen/enlighten_pv.c
index af1f6e886225,ca85d1409917..000000000000
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@@ -30,8 -30,6 +30,7 @@@
  #include <linux/pci.h>
  #include <linux/gfp.h>
  #include <linux/edd.h>
- #include <linux/objtool.h>
 +#include <linux/reboot.h>
 =20
  #include <xen/xen.h>
  #include <xen/events.h>

--Sig_/LHaDpV_gDAUXQ2VrDx=4El=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKLKhAACgkQAVBC80lX
0GwP1QgAm4zlmI0lzfyk52XGg8pKpPdKKocChsJEtTH1iwbUUM+owKfGB6L7OMlY
bRZFmQUgIy581cwpFPqYhi1vOcTkOX3E6npA1fhBdamYar7tCqu4xwq2f1A0rTjZ
Zb9+lcJZHYcp5nApkqC0Us7UICIrvI0ylGXF3okKtscKsoMLPT1jfqrUGo8UIjyA
l2jPDtIFntlk5bKhcjH4Bk1igoNW/hX97iPzsgj9KTrtVwQ2ISq5PjptZToaiaS0
JCE4UGrHdiXjmzaDo7saPc5lEs9cUpvLm1TV+9VHYDfs3/UJvS29BTlCHra02K6e
j3xKHiad9zTxderG5aSSt88c1YZ3AA==
=BbA2
-----END PGP SIGNATURE-----

--Sig_/LHaDpV_gDAUXQ2VrDx=4El=--

