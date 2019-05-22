Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC3E25EA9
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 09:29:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTLdX-0003UE-45; Wed, 22 May 2019 07:26:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8yeh=TW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hTLdV-0003U9-8G
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 07:26:05 +0000
X-Inumbo-ID: da8136f7-7c62-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::9])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id da8136f7-7c62-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558509962;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Gwvy//d5/p+qUOaXGJ8b4HPM71jvSQpitGKz3H4vxzE=;
 b=MCHlLT187Fr8DhJ8AuVfLrgnVkNOb0muhtUaYZNdCfkPsyWxGId2tQnffpAb23n5G0
 t4/WBfoO9HObR2AALbj630N36+QDdV6H6G6WmswIurZDcjMmwhvvyE2u+nf7v3Gpw3Re
 QafWse5fkWUY4g/aiz/n6YOFKUlInBCLUbpuCx5KC95itE5m8pPNgcQusthBOgJ7Xy7f
 Grh77q+F2JjUfJJy/vTGpyERMWJKWqg/gUXYKTPssZIAUrmgH6C1PkLJz9an0l4jFKjl
 ACy/5EhUwTj2MOfuAVDe6tYm0R64ol3olsSSoahopqucEHhWA8/QxWHrxfYcj1XzeKLl
 zVlg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMhmsQ=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.21 DYNA|AUTH)
 with ESMTPSA id N09966v4M7PrA6Y
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 22 May 2019 09:25:53 +0200 (CEST)
Date: Wed, 22 May 2019 09:25:44 +0200
From: Olaf Hering <olaf@aepfle.de>
To: "Wei Liu" <wei.liu2@citrix.com>, "Ian Jackson" <Ian.Jackson@eu.citrix.com>
Message-ID: <20190522092544.2d7d835f.olaf@aepfle.de>
In-Reply-To: <5CE4F63A0200007800231313@prv1-mh.provo.novell.com>
References: <5CE4F63A0200007800231313@prv1-mh.provo.novell.com>
X-Mailer: Claws Mail 2019.05.14 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] libxl assertion failure when creating any kind of
 guest
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============7562584524095899778=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7562584524095899778==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/sQ8m7A.nCf8msNkD/ZrJRvw"; protocol="application/pgp-signature"

--Sig_/sQ8m7A.nCf8msNkD/ZrJRvw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 22 May 2019 01:11:54 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> libxl__domain_build_info_setdefault (gc=3D0x7fffffffdee0, b_info=3D0x7fff=
ffffdb80)
>     at libxl_create.c:143

This is libxl_defbool_val(b_info->device_model_stubdomain).

Due to the lack of a proper way to describe all the dependencies within
libxl I suggest to revert these commits for the time being:

278c64519c libxl: fix libxl_domain_need_memory after 899433f149d
899433f149 libxl: fix migration of PV and PVH domUs with and without qemu
3802ecbaa9 libxl: add helper function to set device_model_version


Olaf

--Sig_/sQ8m7A.nCf8msNkD/ZrJRvw
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXOT5eAAKCRBdQqD6ppg2
ftNZAJ43wMY20NHlszA5sZGz0g3YfPf7SQCgxVmf7AiyOLK6xi/I1K/BYZQRSp4=
=vc+W
-----END PGP SIGNATURE-----

--Sig_/sQ8m7A.nCf8msNkD/ZrJRvw--


--===============7562584524095899778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7562584524095899778==--

