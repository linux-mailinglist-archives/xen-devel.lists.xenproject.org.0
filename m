Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1474A70C81
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 23:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926974.1329789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txCMp-0008Ac-Ln; Tue, 25 Mar 2025 22:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926974.1329789; Tue, 25 Mar 2025 22:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txCMp-00088S-Iz; Tue, 25 Mar 2025 22:03:27 +0000
Received: by outflank-mailman (input) for mailman id 926974;
 Tue, 25 Mar 2025 22:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmVN=WM=canb.auug.org.au=sfr@srs-se1.protection.inumbo.net>)
 id 1txCMm-00088M-Mc
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 22:03:26 +0000
Received: from mail.ozlabs.org (mail.ozlabs.org [2404:9400:2221:ea00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f28243cc-09c4-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 23:03:21 +0100 (CET)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMkSb34QMz4x3S;
 Wed, 26 Mar 2025 09:03:11 +1100 (AEDT)
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
X-Inumbo-ID: f28243cc-09c4-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742940191;
	bh=38W8upVMOF87Aaqs8SXomZEIZnrWoUhgAIMPG3P4yZM=;
	h=Date:From:To:Cc:Subject:From;
	b=RggYCKbAoCiOHYSJV+bY2Hl3iw6i4MSLGTV5DvNF7h9DNq2h6S2sufhSUSaLXhAHQ
	 qbW3rHyi24rHHrvluWOkTYB0/fyqfqHQ4wUdK2ITeHrgOFEpp0KXD2nGtBZx2c2NPX
	 LZIfQGsXJiwNNV8tFxqw8XAiwASSJ8INdDfykTyDjopnA+kRF71oUSSL9y0dVWIgq3
	 aXvXH6YlQmpjJnfi+wgnYUt3pLWOYstY87gjrFEOSSXY/6fwfLPyLcfgFWyuaPQt5/
	 6pZ/+5l1EcM3BnMCnMKIf0S4/niaX/kjt7pX0PAuKsVLmXrPVlJpEajWOmGm34CSc8
	 8cuYn7MF1DpYw==
Date: Wed, 26 Mar 2025 09:03:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel
 <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the xen-tip tree
Message-ID: <20250326090310.4f162838@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FIk6u8s3DQ3M9mmnBRSUw+D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FIk6u8s3DQ3M9mmnBRSUw+D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  d9f2164238d8 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain fla=
g")
  cae5129fccb1 ("PCI: vmd: Disable MSI remapping bypass under Xen")

These are commits

  c3164d2e0d18 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain fla=
g")
  6c4d5aadf5df ("PCI: vmd: Disable MSI remapping bypass under Xen")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/FIk6u8s3DQ3M9mmnBRSUw+D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjKB4ACgkQAVBC80lX
0GwvEQf8Cax0RQJCNfhf8Gk3G999eeL2bfU+Cz1UURF+bFcV8xCQyVjrgqh5iksV
Mod2f+MVSKcsaJ4Ssj4hpuTbU7MJw9rBWuQymBKs7ImPMKFB5XXK/kOg1uhvQZsk
YSygHcbKRTp5aUzf0G7NP29JVQWV1MSL/IK6R85DYnp5ieu9bB/evcXsOs+r/MAh
YdgutM1IaZXBy7wb6StjxGQ+TNtbrEnUS+wUbkvFDt0QwGFOIXV32e95CwyKAXnc
ztgPHPurzAKR7jWqjjdxne9+IopPVwDCyaHE/w0CrV8vhuuAapyuqASNejMuJR5m
quRcnpAzoQOo7S2PECRraGvEdvI6Rw==
=k2y0
-----END PGP SIGNATURE-----

--Sig_/FIk6u8s3DQ3M9mmnBRSUw+D--

