Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C11D16158C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 16:07:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3hwc-0004Xz-O6; Mon, 17 Feb 2020 15:04:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XGn0=4F=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1j3hwa-0004Xs-Va
 for xen-devel@lists.xen.org; Mon, 17 Feb 2020 15:04:21 +0000
X-Inumbo-ID: c5266bb6-5196-11ea-bc8e-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::8])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5266bb6-5196-11ea-bc8e-bc764e2007e4;
 Mon, 17 Feb 2020 15:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581951858;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=/CNtMw631LWdeR4+mvFuWBwRLGpTo9mA+OeDWPYt2ik=;
 b=F9PmRixw0kp2KF43tROwQRKVdf9Lx2LkHLn84quXkeBoZbDXgzQ7lPZch5vKxsB7lI
 gv/naxulpGrN9MOddd2a6i6Ov/9oRe0ojF+xBx5EnhfJRdpqX2lAtvP0S0Htc4WKHokQ
 9go+OLZSBw7ZbGeI2ppG3yTgbIFlILArPkFX/bZAXiPJEtG7jKJYT0WKQQ/HPt5nmJiE
 JO2NCzDCU2UAoYTTh6TT+gTbA/HxOG00+NUf24KRDX20AdT4/7Agv3C7ttN6axulw206
 /7KDhP/TspTa3txFp+9Fz/GmIC8l9kh6QkWEHe91+zV0wLvdkHcn02VtEB2VfAPPRK0a
 P0Aw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMlkjQ=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.12 SBL|AUTH)
 with ESMTPSA id 605caew1HF4H9W6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 17 Feb 2020 16:04:17 +0100 (CET)
Date: Mon, 17 Feb 2020 16:04:06 +0100
From: Olaf Hering <olaf@aepfle.de>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200217160406.65aa2ed1.olaf@aepfle.de>
In-Reply-To: <580201e5daa849399b79641bd610ec93@EX13D32EUC003.ant.amazon.com>
References: <20200113113627.08786ba0.olaf@aepfle.de>
 <20200127123005.7d6767c2.olaf@aepfle.de>
 <580201e5daa849399b79641bd610ec93@EX13D32EUC003.ant.amazon.com>
X-Mailer: Claws Mail 2019.12.31 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] live migration from 4.12 to 4.13 fails due to
 qemu-xen bug
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: multipart/mixed; boundary="===============9025244030896199714=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============9025244030896199714==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0j0OWmzMEKvz37n9mdNZSER"; protocol="application/pgp-signature"

--Sig_/0j0OWmzMEKvz37n9mdNZSER
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 27 Jan 2020 11:54:37 +0000
schrieb "Durrant, Paul" <pdurrant@amazon.co.uk>:

> I suppose. Could we have "pc-i440fx" as the default, which libxl prefix m=
atches against qemu's supported versions to select the latest? I guess that=
 would work.

This can not be fixed in libxl because libxl can not possibly know what is =
inside the domU.

With '-machine xenfv' the PCI device is at 0000:00:02.0/platform, while wit=
h '-machine pc-i440fx-3.1,accel=3Dxen -device xen-platform' the PCI device =
is somewhere else. As a result the receiving host rejects this approach:

qemu-system-i386: Unknown savevm section or instance '0000:00:02.0/platform=
' 0. Make sure that your current VM setup matches your saved VM setup, incl=
uding any hotplugged devices

In my earlier testing I forced -machine pc-i440fx* on the sending side, and=
 did not spot the flaw in this patch for libxl.

For short: we are doomed...


Olaf

--Sig_/0j0OWmzMEKvz37n9mdNZSER
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl5Kq2YACgkQ86SN7mm1
DoDPXw//QpKNCoE1vaUiWWcEbht+8GL7NqV8Aus+zTdOjrrUsiFgT/MBgvefUqY2
YkrbSy8HM/B+dxdgiyJPVL/RQj6ccz6kWcVYzc7CLEKWZUAODShBLNiYYYB84BnH
jjV5VE0Wcl/fwkuKgec8ocsH7mAvFEDgT5iAYORcuPoFkFgMKPpf/aaYddAqBV5Z
R49ncDkNAdbby2lTvof4Z4tClnOyuOhtW5yOhu/mXtXLcJXCvlDWgile8WyPlBMM
eUii7o5mxGbNdrPZsZaQXAa7iQHFAxajauWJEBvptxsxChu5g8V8RhO+ISJ1JM0P
EFKNp6yBjLfPuVlo8euQw81t+88wzKQYKYHSA2u9eo817dKijhsDJgQMiY2I5bOP
h9In3oY3fH2UrJXS0Ag0djSTqJzrZTcgo1HPPg4liORanSN10WtUweoAxDLfhE0/
I4QfMNVmdoO/ODMCZDixyrwPzqljVSW1SPcNn+J+BcFvsWynfuyWyAx0TjkyG6+Y
ixMEXv10NjbLP9DlCV6hi8XP9taXDuQln4vcoBt6tutf5zSLuFgNwhxgVP26l9Ly
l4eG/nUKoEYYxMqnIMHL0y9m2s5ExnLaIqlaGlWeVRipr6x1tGA7/PlsLRWQfWuo
Gvxr76eifPRuW7sCcFpFeDUpQh12D85qhbGtdVfk1k8KTkf0d1A=
=762T
-----END PGP SIGNATURE-----

--Sig_/0j0OWmzMEKvz37n9mdNZSER--


--===============9025244030896199714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9025244030896199714==--

