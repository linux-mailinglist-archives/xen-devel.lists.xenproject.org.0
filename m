Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255023B6F0D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jun 2021 10:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147984.273273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ly8fG-00054j-1Z; Tue, 29 Jun 2021 08:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147984.273273; Tue, 29 Jun 2021 08:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ly8fF-00051p-Tl; Tue, 29 Jun 2021 08:00:13 +0000
Received: by outflank-mailman (input) for mailman id 147984;
 Tue, 29 Jun 2021 08:00:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qa6d=LX=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ly8fE-00051j-EO
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 08:00:12 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.218])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18742f92-622f-4363-bd14-615c76220192;
 Tue, 29 Jun 2021 08:00:11 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.5 AUTH)
 with ESMTPSA id j0443ex5T806MRU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 29 Jun 2021 10:00:06 +0200 (CEST)
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
X-Inumbo-ID: 18742f92-622f-4363-bd14-615c76220192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624953606;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=AQC/aLt0DhgMo86ylACoJ5llLFOF5Po/NEv6BWbDGJI=;
    b=fBBcJS1Q9YZMjhAGEMURNiTNlZ+/nnnu0XxpM8WVri182NIl2sESM5/UTA8EABsdvl
    obogMCzCn3KhCffA5WDcD/3ryREg3M8UJRfcItN3lkfPFvTGuXXwdCir7CfT1FOPIFug
    +JnZzVpd28iaAimb3MY+H1R8CB0R6lIBc1HO96sTnGUwFWqckEvQ6TI4w4UoFcfeRpzC
    dVlEV0sCuCQyahLBL497nmiMZ04Xu9V7rsRc+vFFAiri6dLPiBBT9xyUV/XD6/zmH5+s
    XdJ0BqWLb+bFQYU5sLuXnaeU5sBZpsfuyhgR1ukRIdPMn/CGDh8ldMxCUYIM9oUZZbum
    CW9A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF1Uh6FPk3sesKYv+F4ULcnddTEqNLurekxi0Bc"
X-RZG-CLASS-ID: mo00
Date: Tue, 29 Jun 2021 09:59:52 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 0/8] Fix libxl with QEMU 6.0 + remove some more
 deprecated usages.
Message-ID: <20210629095952.7b0b94c1.olaf@aepfle.de>
In-Reply-To: <20210511092810.13759-1-anthony.perard@citrix.com>
References: <20210511092810.13759-1-anthony.perard@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GghZSpkOBNpF6VHlirqC1PP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GghZSpkOBNpF6VHlirqC1PP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 11 May 2021 10:28:02 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> All of the series should be backported to at least Xen 4.15 or it won't be
> possible to migrate, hotplug cpu or change cdrom on HVM guest when QEMU 6=
.0 and
> newer is used. QEMU 6.0 is about to be release, within a week.
>=20
> Backport: 4.15

In case a backport to 4.15 is actually done, please backport this and the f=
olluwup fixes also to 4.14.

Thank you.

Olaf

--Sig_/GghZSpkOBNpF6VHlirqC1PP
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDa0vgACgkQ86SN7mm1
DoB8gQ//e45QbOVD/114S0DXcxv2bjNoYEVY26eFRTUqugcnhpDTFK9LrbMYbF4p
O4uDwyx+I5yr0m+7pOd1UnaoBvTJzQNMbfH4vvKqKb7ypoMKqyGrP7eOXkJAvCYx
t+HRYrPIOq2+YE5mxeGgm729dxVThIqi085uP+PoItBkKUkloMNOs6oKw090IR+j
b1Zfeh6aHgqslmPp3pSdLEf6MpC3f7D4cHSJHjDIGF0BHyNBnhj+tV3zvepg7QXI
Z7mR3aUQva4JqGt/T1CepYxM+3QC8maxxB8AJI0aufDTg32Pfuj82TGEjTA4HKkA
obAbSexmy+ds482HilpbK1k5FccF28sChBia7SAl1wMge18lOQDyaW303f6FNVg8
sVnjrvG1mQtVudtnASBzWpJ5YL2dOJ5r86SZiFmIJq2dY9vaz13xhWeGQLa8CM5j
W2UjkkmvKUyFq6N6Ukpuxl73Frh3EJKE6dxm2jQLg6r5ucVW8PVvUyiKCFvmNHfn
7NMWA/XYHaHY7cp0E+U/p+tN3bPkbZdCv6gSdFuql0AmI2fn2/MhtZBn+LExQfZJ
+ncmT/ZKx/42P0lCHyKAp57fcAkJQUsv0vP6HpbFd+cAdYSrVfI7KHxDAqh9jHA0
EikQD5EBsc7zh6ahDkwRgie6X7V6KnJuCTZbrsf69vZ8mAZh4j0=
=UgkB
-----END PGP SIGNATURE-----

--Sig_/GghZSpkOBNpF6VHlirqC1PP--

