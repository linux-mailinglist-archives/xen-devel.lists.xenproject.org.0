Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD919C0811
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 16:57:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDrdl-0000Mx-9y; Fri, 27 Sep 2019 14:54:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDrdj-0000Ms-BZ
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:54:35 +0000
X-Inumbo-ID: b79c5102-e136-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id b79c5102-e136-11e9-8628-bc764e2007e4;
 Fri, 27 Sep 2019 14:54:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 354D3AE68;
 Fri, 27 Sep 2019 14:54:33 +0000 (UTC)
Message-ID: <eb41ca81c7b3eab7d8c97dfef3f58cca60524ef1.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 16:54:31 +0200
In-Reply-To: <20190927070050.12405-31-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-31-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 30/46] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============7009884303820277313=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7009884303820277313==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ViIBinFvCvrLEQT7gBTS"


--=-ViIBinFvCvrLEQT7gBTS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> In several places there is support for multiple vcpus per sched unit
> missing. Add that missing support (with the exception of initial
> allocation) and missing helpers for that.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
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


--=-ViIBinFvCvrLEQT7gBTS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2OIqgACgkQFkJ4iaW4
c+5Rrg//fGHFj+ePlckLtKH90WmEXcxzXcWaQA7M8zAquAcFZ/WVaFuoeaYHGrF8
ZdX9Mlip8zUuQzWjTBBxjLNntBv9s/XrrUwN5KqoTGptJX7tbizWnO07CmBmaO0g
azmQpe7/WsWDiweWn3L5gbL6SPjD9jF4oEujuRX6AFLE/7nBaetd2vcYwZlyTcWz
F+CVbzt468PWPY54rtox42RVsinlQ7IxDNAn2SMMEfgj529iMk7+cCEduDkLFib5
f8QVG85jeBXJvPRtU2xLzbY8LzZ2J9OP+aaT072Oi+2fKODPHQfge7hWZ8kMoqM+
0i7GEsSYWASpfEGLZpVEUirNVQK8jfheg5di2BIsevlCHCJ/kH6v+8ndX7h/Hn2d
S+7pw6GVZ1LMK5LUo8m0joeuRTE/HcGW6+G8ISv/542J3dppUWdUDOf5NyxeeNU3
MtAZ7GYODy/8odo0ocpVG5TpeaG3qwurwfyPHsz4AiPQU52fyZUJ5ro8pC6I8fyD
aR+XoxKhcENpU/jI0w1jYcMOM65oMpxWCXEQNw6OEM2peDks85q+LoiaeQSLc3el
TTvrH7GvIcJNXD1FyP0ujIUDQgi+ny2KwPxfWO4v+Q5S5GxIo16Ahhor9gTXVBev
ZgvK3T40i1J9bJbJiwiTUVPjgLrZ2W9E7F85e8+DXG+81y4l4dU=
=ojuP
-----END PGP SIGNATURE-----

--=-ViIBinFvCvrLEQT7gBTS--



--===============7009884303820277313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7009884303820277313==--


