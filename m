Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4465114A464
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 14:02:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw3zl-0000dl-2D; Mon, 27 Jan 2020 13:00:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZsnO=3Q=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iw3zi-0000dZ-RS
 for xen-devel@lists.xen.org; Mon, 27 Jan 2020 12:59:59 +0000
X-Inumbo-ID: eaff9f12-4104-11ea-b833-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eaff9f12-4104-11ea-b833-bc764e2007e4;
 Mon, 27 Jan 2020 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1580129996;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=LGd25sfmhruJsjDL8SKY0sxs8YMYVTLGg0i2+CyYqSg=;
 b=WuDR5weSO3C05t1ygo3GeeFspPgbnktcjAsmQEwf4vPaUvBDznNv3x4wO4VpFoSC06
 3zS2prVjZ2vHoLDnkCLQ6YCzh8RXxZL0CUR+3xseDUtvlPvAwwSywbbLoE4IGg1gg0SS
 RT0bDKNDKCRMribYlqMHodTMcgTkfykykh4DUWq/R//Ggy6ZSitqkbgMRu0aeTVJ+i0L
 magtdgbw2w/SjUJpNQiGUoRYrhvotq7AKttRw0WSmHAj1Wi/ByNB2KuHmywrlUt+xmY8
 yujEa6oG3PRX4U1R9T09VcZVn89gRUTPSTV7ytd38LgbCpI2BSHfY9QiKxZDWvCVKA0h
 njRQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.7 AUTH)
 with ESMTPSA id j07b1dw0RCxuCkG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 27 Jan 2020 13:59:56 +0100 (CET)
Date: Mon, 27 Jan 2020 13:59:45 +0100
From: Olaf Hering <olaf@aepfle.de>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200127135945.54fe945d.olaf@aepfle.de>
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
Content-Type: multipart/mixed; boundary="===============7070514628135377040=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7070514628135377040==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3KR2i3jEaAxEN5nDYmcbqKS"; protocol="application/pgp-signature"

--Sig_/3KR2i3jEaAxEN5nDYmcbqKS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 27 Jan 2020 11:54:37 +0000
schrieb "Durrant, Paul" <pdurrant@amazon.co.uk>:

> > Should the string "pc-i440fx-3.0" become a configure option?
> I suppose. Could we have "pc-i440fx" as the default, which libxl prefix m=
atches against qemu's supported versions to select the latest?

I think the qemu machine variant must become a property of the running domU=
, so that it will not get lost during migration. For incoming domUs without=
 such property some default must be selected by libxl. libxl at runtime has=
 no info what the initial qemu command was. So this fallback must become a =
compile or runtime knob as well. Not sure if it would be too cumbersome for=
 host admins to apply the equivalent of "device_model_args_hvm=3D" to a fiv=
e or six digit number of running domUs during or prior their migration.

There should be a --qemuu-hvm-machine, which may just default to 'pc-1.0' i=
f not specified. That string should go to domain_build_info.u.hvm.qemuu_mac=
hine, so that it becomes part of the domU properties.


Olaf

--Sig_/3KR2i3jEaAxEN5nDYmcbqKS
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl4u3sEACgkQ86SN7mm1
DoATxg//aaoUcRDADKFGGlnoMqLh9S1AdZbgGbDqMix1REGzO0V7QQ0aPEpB7QZZ
hFhlhclG3LF1G+MoOQv0Fld927FSvokzr6+qEdA6TuBZq77YrwNVsU+lPEv1VnN+
wjEu8iMP0BHu9F5GMeDJbbqaATvBqvU5b3EGafvRWEuPCjUcDcSq025yaMLjJCG0
UQvQAdMzTrtABYpI/iGrECDlhZCsUI01uAiFSTTxbz9khq3EP/sRKmgOrqdC/wt6
nl4wOb76/C+tivA6LRvjFn5DfMPgwxBkReqpp0A3IMvQlUSesHW0xeMdBAA2r9l4
UOHs/NuEz01KroxL9GMUYV/OWccnRvwTHprkBAMmQE481rb/tKKbyGSmY7AyAn1q
5zyptwQ+RuU6VAE3OWNocOeJ1mCpr+Sk+BLrtgyeqdD/FzjqMIegQoxHRtNBOKjL
rQV4ez/yvY8SSSqfbHAhMxFXWyM/xvvgXmUp6upxJqYsGfoF4dgYAs8TKRDV85Bx
/MIgFQKE/nR3cNtO4Zs7XSxTzLgjjk+AfkOnHplHaJivGi0lJ3gSzGi6wO9xARfN
sagyE+lUwGwthyR7PRVhpSFl7DAkQPgwPvGu0r4B13ggL0GCL3KYagdkf4DMNGhR
XkwHD6pA5eVGCyVQfzAJQFjs6z8GoTMTkzE0Aq2qUyeAeOTcNXc=
=dkGz
-----END PGP SIGNATURE-----

--Sig_/3KR2i3jEaAxEN5nDYmcbqKS--


--===============7070514628135377040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7070514628135377040==--

