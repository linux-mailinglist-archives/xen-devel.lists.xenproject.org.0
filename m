Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9FEA742FD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 05:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930109.1332797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty1CI-0000eQ-LC; Fri, 28 Mar 2025 04:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930109.1332797; Fri, 28 Mar 2025 04:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty1CI-0000cX-IT; Fri, 28 Mar 2025 04:19:58 +0000
Received: by outflank-mailman (input) for mailman id 930109;
 Fri, 28 Mar 2025 04:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Zkq=WP=canb.auug.org.au=sfr@srs-se1.protection.inumbo.net>)
 id 1ty1CH-0000cR-45
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 04:19:58 +0000
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e126de97-0b8b-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 05:19:49 +0100 (CET)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZP6k74mgmz4x2c;
 Fri, 28 Mar 2025 15:19:43 +1100 (AEDT)
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
X-Inumbo-ID: e126de97-0b8b-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743135584;
	bh=1JI8Spr8CQJwiv/5zUbjBL/c6fAB1sqcE9kasiVrFP4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jnpzymAv1zAA0RWvb91quB+H+w3pYz1u+Sk3y4FjosfTjwqwQlnBkbPffP/iBFpn/
	 tyUK+2MnYG6l6Zxv8W5d6Yw/rCzNgaJf5CMFE4YglDxJZeRQyvAQX0BxHn6ZParBwZ
	 nuPEwuimk0eEzaTAZIA0ts9y/6N1DbO2Q292dD1rCbCUAxidj6jJuo4yJtA4cA3bUh
	 lGqyPrBvNpX2q1ECH7Nkc8iHNKMhvS0Zuqi8RahKvGBg5xLluuBJLxmq5EAcGjan4P
	 9vMR5Em0kNGdLu1DqPNJw1fudx1tuf5QY80hnWp3EgU01DYUG6edINd/wHUo0JB5jq
	 szsfPUiVCJh5A==
Date: Fri, 28 Mar 2025 15:19:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the xen-tip tree
Message-ID: <20250328151942.4f7010c0@canb.auug.org.au>
In-Reply-To: <20250326090310.4f162838@canb.auug.org.au>
References: <20250326090310.4f162838@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VaLoMydcT4kXtExIf_CvhVI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VaLoMydcT4kXtExIf_CvhVI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, 26 Mar 2025 09:03:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
>=20
>   d9f2164238d8 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain f=
lag")
>   cae5129fccb1 ("PCI: vmd: Disable MSI remapping bypass under Xen")
>=20
> These are commits
>=20
>   c3164d2e0d18 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain f=
lag")
>   6c4d5aadf5df ("PCI: vmd: Disable MSI remapping bypass under Xen")
>=20
> in Linus' tree.

This is now causing an unnecessary conflict.

--=20
Cheers,
Stephen Rothwell

--Sig_/VaLoMydcT4kXtExIf_CvhVI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfmI14ACgkQAVBC80lX
0Gzh/Af9FOi+c8QohCH1jPO+K+gzuS9jsyRS/J5hUklhzkTeytANSpuw+zJSBLzX
QlxsbuMb7jmDQMRSZZzVT12rOirCjiUheNFWv+zW3Tu6BfUaIzLWmM3+fA9QIVef
mfvZZxKhsY7WTCM90A4s0bPYMbT34GpNFL2NKkODmtxHzr+y0rEzCYPByhuceyaL
ID7dpaXk9yMDiyqu+0ngRUV4D4Yihns/f5aqnePlI9vRUxU9fdqqZZTeahU9YEvl
DbBKy42zaBWxn/m6FpND3y1XmMEEPsAIGK/howEm9d4vfPb6K6utCbkDURhApB+9
JH0+nKQglk9ZowFvG86GBX1ljWfGHQ==
=EJ1Z
-----END PGP SIGNATURE-----

--Sig_/VaLoMydcT4kXtExIf_CvhVI--

