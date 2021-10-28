Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A1A43DB00
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 08:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217652.377764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfyiU-0004B4-Uu; Thu, 28 Oct 2021 06:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217652.377764; Thu, 28 Oct 2021 06:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfyiU-000492-Rm; Thu, 28 Oct 2021 06:16:46 +0000
Received: by outflank-mailman (input) for mailman id 217652;
 Thu, 28 Oct 2021 06:16:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7Vm=PQ=canb.auug.org.au=sfr@srs-us1.protection.inumbo.net>)
 id 1mfyiS-00048u-6S
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 06:16:45 +0000
Received: from gandalf.ozlabs.org (unknown [150.107.74.76])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c18ac763-5c92-43e6-90d4-0612c6b33863;
 Thu, 28 Oct 2021 06:16:40 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfwLV6NF6z4xcB;
 Thu, 28 Oct 2021 17:16:34 +1100 (AEDT)
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
X-Inumbo-ID: c18ac763-5c92-43e6-90d4-0612c6b33863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1635401796;
	bh=RZCVeOXwcdZa/nUqU9rKDWY5H15gYWvRWpcvq5i8Ge0=;
	h=Date:From:To:Cc:Subject:From;
	b=KxxaLlCJKUB3tk2ICp52vJiupSdOjd0U/C1dxifNIKXuuczTJpshFtBKr4OTAMVbL
	 2WWLRt0t0dZu+5jgCscb4xEiiZ+Gt+QLSIG7VlRp0zlDxCzhSjNlCzHHkN8KjspCC4
	 +XBmqBPucM69dELcL+TqMLawq6UW3ZCgeTDJeqAbpdG4eVkWqMCVF3z6s8rKFq+rWU
	 WJOFX/qBCn7j0dFLGOQPk0K6Z733SPL39JLULFUdRoYCXaxASve41nXeYyr9KCL/mh
	 Awd/Vs7rvOPUg0ivwkc4vrd4Mod5oXDgPG8B22ItA4AIoU/w6IMVVV2urFbznDE8Sr
	 xMSb5bvMvjFDw==
Date: Thu, 28 Oct 2021 17:16:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Message-ID: <20211028171633.603441ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gjdfCg28mrFUIRBmrXBDBmL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gjdfCg28mrFUIRBmrXBDBmL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/irq.c

between commits:

  20125c872a3f ("x86/xen: Make save_fl() noinstr")
  d7bfc7d57cbe ("x86/xen: Make irq_enable() noinstr")
  09c413071e2d ("x86/xen: Make irq_disable() noinstr")
  1462eb381b4c ("x86/xen: Rework the xen_{cpu,irq,mmu}_opsarrays")

from the tip tree and commit:

  97c79d816979 ("x86/xen: switch initial pvops IRQ functions to dummy ones")

from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

There may be more required, though.
--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/xen/irq.c
index 4fe387e520af,ae8537583102..000000000000
--- a/arch/x86/xen/irq.c
+++ b/arch/x86/xen/irq.c
@@@ -94,16 -40,14 +40,16 @@@ static void xen_halt(void
  		xen_safe_halt();
  }
 =20
 -static const struct pv_irq_ops xen_irq_ops __initconst =3D {
 -	/* Initial interrupt flag handling only called while interrupts off. */
 -	.save_fl =3D __PV_IS_CALLEE_SAVE(paravirt_ret0),
 -	.irq_disable =3D __PV_IS_CALLEE_SAVE(paravirt_nop),
 -	.irq_enable =3D __PV_IS_CALLEE_SAVE(paravirt_BUG),
 +static const typeof(pv_ops) xen_irq_ops __initconst =3D {
 +	.irq =3D {
-=20
- 		.save_fl =3D PV_CALLEE_SAVE(xen_save_fl),
- 		.irq_disable =3D PV_CALLEE_SAVE(xen_irq_disable),
- 		.irq_enable =3D PV_CALLEE_SAVE(xen_irq_enable),
++		/* Initial interrupt flag handling only called while interrupts off. */
++		.save_fl =3D __PV_IS_CALLEE_SAVE(paravirt_ret0),
++		.irq_disable =3D __PV_IS_CALLEE_SAVE(paravirt_nop),
++		.irq_enable =3D __PV_IS_CALLEE_SAVE(paravirt_BUG),
 =20
 -	.safe_halt =3D xen_safe_halt,
 -	.halt =3D xen_halt,
 +		.safe_halt =3D xen_safe_halt,
 +		.halt =3D xen_halt,
 +	},
  };
 =20
  void __init xen_init_irq_ops(void)

--Sig_/gjdfCg28mrFUIRBmrXBDBmL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6QEEACgkQAVBC80lX
0Gxqagf/Td093dl4efT9lndu1gmog0FXF5HLVk8gif87xRq/cT3j5DPqKW8hK5fi
UQ+M974Op+nIw/Eoplf/l1Yn4nND+YJ5krN/5UUbHSBzQs3FL0jJ2dw3B+MOgTwd
SdJn5rW+MXt7HLhcPxkrA+bDZ2Z/CTjUrIpwtmEGzeYUQKjBbMgBMIxnulAd5EqA
3T5aXCG2xjb09NgKN6VJhXSNh7nM5q+9Zdx6v7anYWdahZ9Y4hG720qbf0Wgtu0P
o7nR0InCFnIA3UkG4fFlxGZAvjzlRIb/HPTE4wC2HmcO/PVU+grqT/Mt6eSI+r1g
ciDl8OICcWy0nJTmU+/ZpiNH/UqtRQ==
=T10R
-----END PGP SIGNATURE-----

--Sig_/gjdfCg28mrFUIRBmrXBDBmL--

