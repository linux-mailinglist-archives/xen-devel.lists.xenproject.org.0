Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF9A6FD888
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 09:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532671.828913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pweYG-0001OC-Dp; Wed, 10 May 2023 07:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532671.828913; Wed, 10 May 2023 07:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pweYG-0001MG-A7; Wed, 10 May 2023 07:47:56 +0000
Received: by outflank-mailman (input) for mailman id 532671;
 Wed, 10 May 2023 07:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rbbI=A7=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pweYD-0001M4-7f
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 07:47:54 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6d6652d-ef06-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 09:47:51 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4A7lY8oh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 10 May 2023 09:47:34 +0200 (CEST)
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
X-Inumbo-ID: f6d6652d-ef06-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683704854; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=c+CEDxctFw9MGyl+F0u5UkTweo5v0QOac6s+9XQ6Ohek4sU9Nb3NjkBNLbSQc3X29p
    2CdyvI911gHLpvKz5hoLu9JjuuFsgzR03VUCr3SZIXms9NAuW4Vy/4dkmPrw/6Bmb3VE
    UaKnuTGT9JE19bACRywlR5HYy5J9SP5i+dEpyT0WfPDm+I1nkuMMxICFkySkA8PBh//v
    zYzqBsOlfTKBjA5deCHf/cJKV82V3nAqC+1UXGM60F9mI92Y7GYFpBzciNLxVDzBA3FR
    xyNUlQNb3+DhS06zMkpwAnhugHKGDm9+gjh8CWGnwJ9h94hc8eWIx8zj2CkabD+uw4zd
    DTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683704854;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=fpMbxRbaAtliiEqD3yXPNT5MQEGuwjFCZILVH7eZVLE=;
    b=XkgGWnjmjh0LovQ0y1CUSjs5+WREcOsUOUk2zLuJUHTOca4+aEyZByxpsEApoFkNRP
    3vb/lhdYvmeiRPtqOpm+hO1CnErrXS3BbUw3z7UXTxAPf6IM6u/fYlRmL/f1ncMbd5Vd
    vc4PvG8GsrAWhNm9AWYo+sKFlMdH0Hxq7+tfiMdv+1UbkfeuqJ8o9sBaFNC3dvXfYQ+N
    K2RHk8N/icC5Qdh+7z6PT7Qfi2nSU6NZlRagbdQzoEUpOpF1fUI/D3C/cK+CJ4y26ogE
    OikicXS+faaliiYj5wACVqMsdvoINRbdK0p9qbyFkdc7RigZiHZqSIuBUk/WE3Gi70iT
    ei1Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683704854;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=fpMbxRbaAtliiEqD3yXPNT5MQEGuwjFCZILVH7eZVLE=;
    b=VtAUsFP4F+JSerLh8MZ7ULl38l9Hj85X55W1atDN/NNfPVXUtGM+qCJwizusxv+wTa
    k1OQywRxHqXhEF3+6Tp3C0rZfJ0hnxu3t5FZPVAgSMlFNIiQrS/l2caM/mw8BlrSQ+bc
    I1o3q2aH4XKDsO5iMgxenQnNE1DsBRu47zqWRl4wMrLEtwXfffrG1DHxQn4SEg/rAcDK
    2xPb1GStX2e7yg6n1ZFTCf/sY+bfKs97VNWNNnBmaIX5Ji+bO9t9VZPxvKRa6rB2yuIN
    4v4Fkyoq3W4RFutJiRg+JvonSO8WuY1KmqSLnkXwsfRM4BxaiI4/ehGUgDCBfKozldBN
    2IiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683704854;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=fpMbxRbaAtliiEqD3yXPNT5MQEGuwjFCZILVH7eZVLE=;
    b=krAmvBX6oRNRFqJB0vvQOHessJgvwMw5kZBnFSJhW2UNLeDlEB/rHcpLzraKPVRrcM
    4iIe2hNTHbCfynLvd7Dg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4ARWIYxzstZKeVom+bauo0LKSCjuo5iX5xLikmg=="
Date: Wed, 10 May 2023 09:47:19 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
Message-ID: <20230510094719.26fb79e5.olaf@aepfle.de>
In-Reply-To: <20230509225818.GA16290@aepfle.de>
References: <20210317070046.17860-1-olaf@aepfle.de>
	<4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
	<20210325121219.7b5daf76.olaf@aepfle.de>
	<dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
	<20230509225818.GA16290@aepfle.de>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R/2sS42QIzwYzqn.D6NtiKf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/R/2sS42QIzwYzqn.D6NtiKf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 10 May 2023 00:58:27 +0200 Olaf Hering <olaf@aepfle.de>:

> In my debugging (with v8.0.0) it turned out the three pci_set_word
> causes the domU to hang. In fact, it is just the last one:
>=20
>    pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>=20
> It changes the value from 0xc121 to 0x1.

If I disable just "pci_set_word(pci_conf + PCI_COMMAND, 0x0000);" it works =
as well.
It changes the value from 0x5 to 0.

In general I feel it is wrong to fiddle with PCI from the host side.
This is most likely not the intention of the Xen unplug protocol.
I'm sure the guest does not expect such changes under the hood.
It happens to work by luck with pvops kernels because their PCI discovery
is done after the unplug.

So, what do we do here to get this off the table?


Olaf

--Sig_/R/2sS42QIzwYzqn.D6NtiKf
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRbTAcACgkQ86SN7mm1
DoBRfg//cAC+i271H3HLPzevJR+ToZ3Ywxfz+e53Xk6RnVZfy79aWT9delbKNvoo
/sEmxurXHIjU2vHju5bE7C4s8J8oTjjY/vgJrnBp0IIoDNF7s2DNPdpWP31bdC32
AzWMm2kzCWYbTf2k0ByGQ2FlyxJi17fbXaIgwMsmhG6WhCbf2CTD+ZPoW5DLPlI6
nhJaFpge2Lw5PjebKkZh/eHB9GmQ7o/Z1fs2VnghfJeeyeBAtx7UuBwol3ZX6rTS
V76Ftd+PcXPvrw3UkUyj6VE38YJT95bIHpEf4oR9iiPlvE/Lv8wYq7fdCdbvkKQd
yIyJzrg8S2YAFWxBVpQVNOYXhFTbhgyQr331OslGBGMRaZ/F9vQkuBzK+d6pVAHv
bTJJhDYqY1kr+gJerGPW5+gWoaCegEIzMj7fjYNVWHCh51hG7eJw8cYkFEPWApIP
XhKyulCg+vaCRO1/TTsrq2mXQ8GDUp+Xm1iorJ69CC9i2qQ8fWM8EJ8lVZZddas2
3tSwjtdrt/MWvmetZK0yM4jZint6nj0w4iTOs/MR8Kya/3bLbKRNDZczsIrNd8p6
5UrR33AMreG41Nkob/IRltibnHEDhHPgK9GJfC2yWj49Tf4H8PYTlT6HxOIeyX4r
OXp83UJ40RKuyvu7GJIxNfOgFdLTeZZEQSxAkxW4lrTFxuTQgls=
=+t5t
-----END PGP SIGNATURE-----

--Sig_/R/2sS42QIzwYzqn.D6NtiKf--

