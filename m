Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA80B0A48
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 10:26:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8KPP-0001i3-G0; Thu, 12 Sep 2019 08:24:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uvwM=XH=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i8KPO-0001hw-0M
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 08:24:54 +0000
X-Inumbo-ID: cb3a78da-d536-11e9-83e4-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb3a78da-d536-11e9-83e4-12813bfff9fa;
 Thu, 12 Sep 2019 08:24:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AEFA3B87C;
 Thu, 12 Sep 2019 08:24:51 +0000 (UTC)
Message-ID: <0d9a01160d9389b939b07a92759d1be9a372bd29.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2019 10:24:34 +0200
In-Reply-To: <20190909093339.7134-5-jgross@suse.com>
References: <20190909093339.7134-1-jgross@suse.com>
 <20190909093339.7134-5-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 4/4] xen/sched: switch to debugtrace in
 cpupool handling
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
Content-Type: multipart/mixed; boundary="===============5365614991064236680=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5365614991064236680==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ipxZ7UgxxTBVTtw9xv6K"


--=-ipxZ7UgxxTBVTtw9xv6K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-09 at 11:33 +0200, Juergen Gross wrote:
> Instead of having a cpupool_dprintk() define just use debugtrace.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-ipxZ7UgxxTBVTtw9xv6K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl16AMIACgkQFkJ4iaW4
c+78IRAAwrb2gflG1j4cU4wjpDUvkdDZmQSqSU61PPXi5FgGMZtgeRoMKRsiv9sp
UWjuC2Djni0Mflis7K0JCLN6WbcloHF8ogZkp8SUsas77a7U5WJJKItme1MhlHkw
NvEF+jdg7hewWjjTBT3Fu3BndWcj7GBYunxZ+Ll4DAyDIg9FxViFzfhdmrunbT/G
7eQ2pnOQ4wrGT+esyaXaQHtRB7/xy543feL+hv2pVtYAYdavG2eZSjv6dIRjDkT0
qP0JTOojMiBrambXGgWCSiWAO/9d8fKX+WjxOCyJ1tfKHM5pViduruobHx5JxF/N
uZumZgAih6ijt+G6zbvsz4/IyBlNU4X4zThg2OMIIewJK7H0fLuf0lfp3FoKxPSh
duMBTBzCP5LXgvLVSeTRVadugCGu2Ibg/wGKkbsr9ZCXiHgl4vZE2Urm69P0Xm3o
KKMXaasgiK/+wIVmcr0LVRD69wapcFSFF7tDY0f629858+JbANCD+DwcE9Zj3y/Q
84YJcOg+FqHrs0Fn95BV23AGvjqlZGBZs9A0WLBqF3p8kWw8CGwAd7O0EHzrghyu
9qK8Js12LYSmhv7Ap8Eb5wczbmX8KhcxdL0PFWy703Sn7hwxeMUOSKp8jqAPY7GR
TMVkpSVdtObe79Ly+tSOzTHjTwmvCTGkurXxDg1+Y+yyLLBnu3Y=
=TUmf
-----END PGP SIGNATURE-----

--=-ipxZ7UgxxTBVTtw9xv6K--



--===============5365614991064236680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5365614991064236680==--


