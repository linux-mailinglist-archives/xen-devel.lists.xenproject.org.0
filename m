Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5587E9ADB5
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 12:57:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i17DA-0000Bk-LP; Fri, 23 Aug 2019 10:54:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rX0E=WT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i17D8-0000Ba-Ea
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 10:54:26 +0000
X-Inumbo-ID: 5e8f0a40-c594-11e9-ade4-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e8f0a40-c594-11e9-ade4-12813bfff9fa;
 Fri, 23 Aug 2019 10:54:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0AA29ADBF;
 Fri, 23 Aug 2019 10:54:24 +0000 (UTC)
Message-ID: <0197d20b8edb7e33db7d4aa18377f73a8072a20e.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 23 Aug 2019 12:54:22 +0200
In-Reply-To: <20190809145833.1020-5-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-5-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 04/48] xen/sched: introduce struct
 sched_resource
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============2214126953591316409=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2214126953591316409==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-aWGWVMFvcuhveOrnxsk6"


--=-aWGWVMFvcuhveOrnxsk6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-09 at 16:57 +0200, Juergen Gross wrote:
> Add a scheduling abstraction layer between physical processors and
> the
> schedulers by introducing a struct sched_resource. Each scheduler
> unit
> running is active on such a scheduler resource. For the time being
> there is one struct sched_resource per cpu, but in future there might
> be one for each core or socket only.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V1:
> - add accessor functions
> - use DEFINE_PER_CPU_READ_MOSTLY (Dario Faggioli)
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards=20
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-aWGWVMFvcuhveOrnxsk6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1fxd4ACgkQFkJ4iaW4
c+5QzxAA5R3gygSUXNwwZ05xKdNhszYbORbusgC6tX0ZV8b8HhdgF1HgPBP1EYZd
yj9Ykc7YU9e8UdpgA3GiXvxUq3B5ojIW5k0+fZ9JlYsvpfL8PI5sTJpoPedPMiCQ
EzAjIhWU5nE7/fdHE8X0BI92MUpQeqM1/pBF8NKNAYQehXKrFUYxrjOUTOUtbx42
8shk4R0VK1VAj2EJ/P/E4YZ3GEigwU6VeF3i3JIhBYm3/WAMEJoxj07KvTCImvs3
+z9IOkZasApKxweRqQykCSJdDUGUAYfQjVM6HktqsI3MGDmUD07bM1oX/BHsRlzE
TpSxvmz+ovTMhqJOuSY/YUJ2ernrkgIie4I80/pQuGzp/lEIM0NOabkk6IleiUUw
vtpejbtIz77x74UoENIprvqE0Czh8qLPrO/GmAw/okcBRaTyFyRQkLlv5mbcf/JI
tWIYuxlaXdVZFeBEMYLlxJDayPvhtjfSNZCyLICOjWfpTyqtwUe0zXIW8azszkmY
GQ8e2PQjkrHk+LbbJr81pcFehCLsXqvDUS3l0G4rOb/lehihaHFM0ddcCfBaSNPD
WSybHJ4ylZ6xVLO8MIrvmLHBU86dcMsdtk5rpmSJiZhDCDXb9TIhsnPEbrO/qV3B
8g8Fjrql309AV++u5N3/haSTQyfDbqqQVHrlleJm1Zu8gdTYMvY=
=qrSy
-----END PGP SIGNATURE-----

--=-aWGWVMFvcuhveOrnxsk6--



--===============2214126953591316409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2214126953591316409==--


