Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D269AD9C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 12:50:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i176E-0007kr-Bb; Fri, 23 Aug 2019 10:47:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rX0E=WT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i176C-0007kj-Na
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 10:47:16 +0000
X-Inumbo-ID: 5e94470e-c593-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e94470e-c593-11e9-8980-bc764e2007e4;
 Fri, 23 Aug 2019 10:47:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3C9ACABD6;
 Fri, 23 Aug 2019 10:47:14 +0000 (UTC)
Message-ID: <93e157cfd61020c41b91e28512e1215562bdca4e.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 23 Aug 2019 12:47:11 +0200
In-Reply-To: <20190809145833.1020-3-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-3-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 02/48] xen/sched: move per-vcpu scheduler
 private data pointer to sched_unit
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
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============6264298612284439247=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6264298612284439247==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-+0/dsA9lESoiHsTRFidC"


--=-+0/dsA9lESoiHsTRFidC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-09 at 16:57 +0200, Juergen Gross wrote:
> This prepares making the different schedulers vcpu agnostic.
>=20
> Note that some scheduler specific accessor function are misnamed
> after
> this patch. This will be corrected in later patches.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-+0/dsA9lESoiHsTRFidC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1fxDAACgkQFkJ4iaW4
c+6WHA//WjzxJaKg1p39KWaJSCWKj7WlGSYRtJbxbmEInuxfN/+XujLCzXzFLRSV
Aro5+lcidd1a85kf00jDe/WA2l42fVxVC9hUf4O89ic4DGwqF7uQ/ds9YY0GCb1p
Aff6KH197p6GIoduZGqjaeJnGZWFJFHxLvZ50qTSPF89XttBSE5z4ijFm5eG5w+R
JRQoalpv5xz40kOYZoubUA7fWGUht9SlTYG99Eye8GOi+9jjF2XDoGVSlkwtb7X/
g/YJh2iChTn+WxlIRAFL2uBXx2/L6Qpy9ELgt6u9GvUP1gPU4Uy3lYpppBKctpZ4
4HK46P9vPOMOzih1oVAui+WjCGECdkbXovper2ptbQPYRiXmhgQculgTgVmyh8GA
/uo68mtureXMynqgH/NlaVgm+cSMfk5nMGh8QEcrpczdCErNd3zgToKxHUvD3k2F
1i0pG4aV9acjq09SHWVQhegzAn0gf5Fbavp3aFHkcxfYTzQAn6vSxkCJg79RLFSc
f2K8RcOg78X8/ug6nx1ghHRDua1EdoP/Gz/S1LqqA1oAMX1yKu6El4Y5ikQ7GE6y
ZO6/jF+wAkC58oGjPT5IqK1ccv5F863jfTMpOrbDL88j+0odQMBgpa8Io17KVdk9
YJ0c10kKbm4BtdRTUzRHU/QXAF+1HPChN9Zkk69XbsKvF3TbKHc=
=oNvd
-----END PGP SIGNATURE-----

--=-+0/dsA9lESoiHsTRFidC--



--===============6264298612284439247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6264298612284439247==--


