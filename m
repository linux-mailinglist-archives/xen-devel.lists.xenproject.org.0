Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBBC25265
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 16:44:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT5xN-0001je-Hg; Tue, 21 May 2019 14:41:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dk3M=TV=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hT5xL-0001jO-4r
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 14:41:31 +0000
X-Inumbo-ID: 8492761b-7bd6-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::6])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8492761b-7bd6-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558449688;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=W55QGQjy4UmJvVHmAMWaVcnzxXdYYFtaR0A7BBGV8gI=;
 b=Kw2K3UXBRgU/mAtEZO48JaH/tujepl+Xdv2d8BzfDRpneVkIjGDPTXb1lkrQaPeXZ/
 EI/xNGQEsCDCFlZH6ZmoK0BhrPv/1V7agIYkr/e95e0mhb9vP8UNQKxtTy1MG4wwEBSP
 zG0RjMsXdp35O8kzBP8+wx2K5+i44eBPu6hdH+AXhvJh22a3tMsIOe6bqIX81qSR1o2F
 A1rGVWonlM7+ctcomv6R/fyf8kGOUfR2S87Ph4AAbJcKurTyn93pn+ihEaGn9dOoOkUs
 Ywpoc9ppCL29c2IWFC6DLKzMhJcIfnqjmK3+E1jtonOcML3Za+9RQlcW60zgyS6acWLF
 Obtw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivcDRdyQYd1tcFv0/JdfdtvRXB+qTKkPmBD1yBGL"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.21 AUTH)
 with ESMTPSA id N09966v4LEfS7Th
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 21 May 2019 16:41:28 +0200 (CEST)
Date: Tue, 21 May 2019 16:41:22 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190521164122.187e51f6.olaf@aepfle.de>
In-Reply-To: <20190521143702.GH1846@zion.uk.xensource.com>
References: <20190521143702.GH1846@zion.uk.xensource.com>
X-Mailer: Claws Mail 2019.05.14 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Unhandle NONE type device model broke QDISK backend
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============2615390872009050347=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2615390872009050347==
Content-Type: multipart/signed; boundary="Sig_/577UeSupctbd4OY/M6=PxHO";
 protocol="application/pgp-signature"; micalg=pgp-sha1

--Sig_/577UeSupctbd4OY/M6=PxHO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 21 May 2019 15:37:02 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> bxl: debug: libxl_device.c:380:libxl__device_disk_set_backend: Disk vdev=
=3Dxvda spec.backend=3Dqdisk
> libxl: debug: libxl_linux.c:235:libxl__get_hotplug_script_info: Domain 1:=
backend_kind 3, no need to execute scripts

I will check why qdisk does not trigger QEMU_XEN.

Olaf

--Sig_/577UeSupctbd4OY/M6=PxHO
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXOQOEwAKCRBdQqD6ppg2
fnwlAJ44eksUmzZ1fKMY9rmDRjeuGheBFgCgsZwnTRdE+xoN/+FlAxo6VNl5LiM=
=Q9u+
-----END PGP SIGNATURE-----

--Sig_/577UeSupctbd4OY/M6=PxHO--


--===============2615390872009050347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2615390872009050347==--

