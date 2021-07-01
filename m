Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680C63B913F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 13:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148637.274675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyuzo-00019G-Ip; Thu, 01 Jul 2021 11:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148637.274675; Thu, 01 Jul 2021 11:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyuzo-00016D-FD; Thu, 01 Jul 2021 11:36:40 +0000
Received: by outflank-mailman (input) for mailman id 148637;
 Thu, 01 Jul 2021 11:36:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lyuzm-000167-Oy
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 11:36:39 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e469171b-012d-4977-9272-025a76b7e0f0;
 Thu, 01 Jul 2021 11:36:37 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61BaZ6AK
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 13:36:35 +0200 (CEST)
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
X-Inumbo-ID: e469171b-012d-4977-9272-025a76b7e0f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625139396;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=EaTkDCsxmG/5LAoOL5R5PfPFMnYdKWar3UPZ1YO5J0w=;
    b=hKQzMm0H8qKtThJK/InXZzNpNWjZbVuJEX5fsWtiGnp1nsYyTINWEfhaFtawIBOJcp
    NRmjKF6DMjoY/4XXzTOTLrAAn9MMo6GhW/R5NlyZ5007Qr274aV0ymAg3c7oh8uR2Bjb
    fE70EB8VfcdSMLkGA81f5JoujOdPUDO8dxC4zXRayQSU7vuOc27fWdhNv9r56J62IlIz
    VjcRPb+tSsTAqBgL4rbv5i3R3ceVFfjv7AtK7/7cupCrfFgd+RlIp+FGTun/S9gAn55V
    /IABpN7o1iflBlwalipOOCVQ93VGmcWWZimtWvZmf3DfgWMPz7W9SX9dJQE17zvC9eqx
    EK/w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 13:36:28 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
Message-ID: <20210701133628.1667a344.olaf@aepfle.de>
In-Reply-To: <20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
References: <20210701125623.593fe3ae.olaf@aepfle.de>
	<20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V3f5fxObco4H8QqtSU1IZEa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/V3f5fxObco4H8QqtSU1IZEa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 12:19:24 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> This *ought* to be "grab default, edit a few details, send back to
> Xen".=C2=A0 Where is the 51 leaves coming in?=C2=A0 Do you have cpuid=3D =
lines in
> the xl cfg file?

No cpuid=3D or anything in domU.cfg or Xen cmdline.
If I understand x86_cpuid_copy_to_buffer correctly, it copies all of basic+=
extd and viridian+xen leaves, which is apparently more than 31.

Olaf=20

--Sig_/V3f5fxObco4H8QqtSU1IZEa
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDdqL0ACgkQ86SN7mm1
DoBpUA//SB0yjRi7AFikeKxfZKvWSpI00sf+1jzVHYGWzQEwH7jT5qtRLpRYwgBS
PQm/nyc34yBQDZN7OJWbzrFBOPifrhM3DkQqp3H9tcg5xfogvUOWRV7x/U+i86iP
1ibN4h9rwldj+AYQ0EXKHdt1DWMPQ6KIDpDuXNJscLEECE7B5wy8zOyglVOsivYJ
ZnlnOy13xzPmf1V3B7aW4R5pDLkGu3rO8xxB9bsTLDrEdSMzFoPlAaqjBJgo1fLE
pj+ycafjcFLXL5W8hrIofJ4cGfJVu8S2DNhuPHRo/D+aO1yESIfUh4sveYItQO2n
Ds8Q2NwLgcFmRr7wmNYvKFeRDRIemz/F+eQPbH/L0c/2mZxg3mU3rIsPJzLtwbCI
RDeY1JX2ZLL+CIf0NDilePOeytalJlnfJLlPb9HcgDaAia2qzBY1FEM6Qn0tmc4m
HeHA6/7Ck0KDTIspfdfrYekH6nBLoAoTOfWQWeI+WVMZna55n17vQFQqFcxQDX0k
rsjHTnq90HKDTE2uHSnmqoBCq+w2621Bn4ifL/0PGpnEjMeGWPxx5ZHCdrgTU+Bc
Imrh+xrLq6cCnzgY/WwZRIm10yCw78mkCWBp0p+MuV76/AFrSuaXS+hX+DjmXjMM
q83aoyRxMggFAYU03oVLUGVj01jB5SVBCof/H2O3NyHOItuhU+I=
=FgNt
-----END PGP SIGNATURE-----

--Sig_/V3f5fxObco4H8QqtSU1IZEa--

