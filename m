Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D0F18CCF
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 17:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOkl8-0005GG-6f; Thu, 09 May 2019 15:14:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vYVB=TJ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hOkl5-0005GB-Nc
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 15:14:56 +0000
X-Inumbo-ID: 322372a4-726d-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 322372a4-726d-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 15:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557414892;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=XoHoJihmzz7MhEBBWHubzek3XuIMlVSUkt/PLfgbtq8=;
 b=pWckALzbPW02oZl2wYh2Ufld2U8AXj+Sop5HctWeNyKoouGWeVtSGrJUJyJNY6LTwb
 ngDQbIArYk73MBht4kEKKgc8kkI3GaWPWXGH36a70Afbe1fb5zFiH+m63uaVU0W5PzAd
 SZtbpVwD/Beg0WEBYjz0Br+nlw4jwdDwIigGEhEq95ob2uNn00l/lvLrLTjuJ3txlBk+
 fd1I6el2I0VSzzsKRDjznthtsgJRoY/Ih/+YVfsujO3ZE9kpxee+wtK6azyRsmFCctqd
 WzwtcuQTUEUuUlkUNrFfNTffFwh/NheK1tFHsyFZ3oMySFDeRLD6BbLLJmNrH5MpGwA7
 c7CQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 AUTH)
 with ESMTPSA id 60a847v49FEnnH0
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 9 May 2019 17:14:49 +0200 (CEST)
Date: Thu, 9 May 2019 17:14:41 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190509171441.6b611c34.olaf@aepfle.de>
In-Reply-To: <20190509162956.23c4d6ab.olaf@aepfle.de>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
 <20190509155621.20698a9f.olaf@aepfle.de>
 <20190509162956.23c4d6ab.olaf@aepfle.de>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix migration of PV and PVH domUs
 with and without qemu
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: multipart/mixed; boundary="===============8831462029988955631=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8831462029988955631==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/RvbN/vsYQe3FDrtvZXwu1K2"; protocol="application/pgp-signature"

--Sig_/RvbN/vsYQe3FDrtvZXwu1K2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 9 May 2019 16:29:56 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> Are you saying the current users of libxl__need_xenpv_qemu (libxl__dm_che=
ck_start,
> spawn_stub_launch_dm and domcreate_launch_dm) do not only run in dom0, but
> also somewhere else?

And if it is indeed running somewhere else, would libxl__get_domain_configu=
ration
provide the content of b_info.device_model_version?
At least in my testing /var/lib/xen/userdata-d.domid.uuid.libxl-json has no=
 such
info in the "b_info" field.

Olaf

--Sig_/RvbN/vsYQe3FDrtvZXwu1K2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNRD4QAKCRBdQqD6ppg2
fggtAKCQxyAd64V3bvUGJXhB0laBITe0GQCfd2bLugl/ub0UZ9cYG9Yr0f1x3u4=
=GGNs
-----END PGP SIGNATURE-----

--Sig_/RvbN/vsYQe3FDrtvZXwu1K2--


--===============8831462029988955631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8831462029988955631==--

