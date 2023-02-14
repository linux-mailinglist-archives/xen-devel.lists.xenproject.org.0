Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D2695619
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 02:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494937.765158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRkPe-0000Lq-Af; Tue, 14 Feb 2023 01:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494937.765158; Tue, 14 Feb 2023 01:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRkPe-0000K5-77; Tue, 14 Feb 2023 01:47:18 +0000
Received: by outflank-mailman (input) for mailman id 494937;
 Tue, 14 Feb 2023 01:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xYay=6K=canb.auug.org.au=sfr@srs-se1.protection.inumbo.net>)
 id 1pRkPa-0000Jz-Vh
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 01:47:17 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bd1acd7-ac09-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 02:47:08 +0100 (CET)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PG3wj2fBzz4x83;
 Tue, 14 Feb 2023 12:47:01 +1100 (AEDT)
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
X-Inumbo-ID: 7bd1acd7-ac09-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1676339222;
	bh=DqG9DcQPn7xEsXKwyAD0SLlB4Lu9cg4zqBqI7Y1r0YY=;
	h=Date:From:To:Cc:Subject:From;
	b=H7r1FGI9TymjxOnLcB046feu8PvCXoVRO2aP7Jr5UiZYcL1j6sxc7zJw1uedY3R1Y
	 NPGwSbSdJ6vwT9DNEMWHQDbpNCL73+IgVxob0TEQ8bQ3wqF6kVbPMfqALI1B5vUuiJ
	 D0O7oJFKZWYl72phOFRo/ZZ2qVDq58GcgLpEQ+WtwLxjq5qm+4sWdLzKp3D3WRWeka
	 zCGy28KEBrzA8QGvGnBnoQ29PVTljU8upmpVbN5z1N0ERH94bz1W5ON9UxJsTafhVe
	 fOe/miajREj61jfWr8Qxn9Os/lYIN92fyV8LPKD05j7J2jsRIEndbUVoMEuIoXlDSy
	 wvSuG+IrW4seg==
Date: Tue, 14 Feb 2023 12:47:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Xen Devel <xen-devel@lists.xenproject.org>, Per Bilse
 <per.bilse@citrix.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the xen-tip tree
Message-ID: <20230214124700.22f0a62e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/trHzM3Ym2fGntxRvaoo7o_b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/trHzM3Ym2fGntxRvaoo7o_b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the tip tree as different commits
(but the same patches):

  415dab3c1796 ("drivers/xen/hypervisor: Expose Xen SIF flags to userspace")
  336f560a8917 ("x86/xen: don't let xen_pv_play_dead() return")
  f697cb00afa9 ("x86/xen: mark xen_pv_play_dead() as __noreturn")

These are commits

  859761e770f8 ("drivers/xen/hypervisor: Expose Xen SIF flags to userspace")
  076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead() return")
  1aff0d2658e5 ("x86/xen: mark xen_pv_play_dead() as __noreturn")

in the tip tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/trHzM3Ym2fGntxRvaoo7o_b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPq6BQACgkQAVBC80lX
0GxOTwf8DeEtZRvi1HXWn6+sBS00XW/6BjrAguO5FZ8ihWzFqa3iyRGdb1/psFx2
/OTLtK52lGWaQlPX8f19NNNY13l2gbzfJtWs7QoIS3UnxPuauKcPryVOzKNpUVLe
w4ooJkMnYuFXNTtKuNh5UyuEhyUKAaohZchzqSjxjIFDRbYbd+4kYZNNVriIRPhx
eu9LC1eWZBCFFRJoJ5hqNdezalxw69rlLT2dGcFRPV6neeKIjROFFNADm14xktQo
gzEZG7mg+B8RNbhHw4qwKspoc2wYS2tMCd2rGP/HuihzHvAYSpo2wnAe72QYX3UM
ocU4tc07CA7R33n4y9qbv1DiRV/Q2A==
=nOdd
-----END PGP SIGNATURE-----

--Sig_/trHzM3Ym2fGntxRvaoo7o_b--

