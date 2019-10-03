Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AB4C9C72
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 12:38:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFyRn-0005ar-8Q; Thu, 03 Oct 2019 10:34:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J+CV=X4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iFyRl-0005am-Cv
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 10:34:57 +0000
X-Inumbo-ID: 708897ca-e5c9-11e9-9722-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 708897ca-e5c9-11e9-9722-12813bfff9fa;
 Thu, 03 Oct 2019 10:34:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42096B158;
 Thu,  3 Oct 2019 10:34:54 +0000 (UTC)
Message-ID: <fa48de5eeee27b08ca52ca704dc14611deaae746.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien.grall@arm.com>, Juergen Gross <jgross@suse.com>, 
 xen-devel@lists.xenproject.org
Date: Thu, 03 Oct 2019 12:34:52 +0200
In-Reply-To: <48cce409-0ec4-a952-a564-f089683b189b@arm.com>
References: <20191002144330.21392-1-jgross@suse.com>
 <48cce409-0ec4-a952-a564-f089683b189b@arm.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6.1 08/20] xen/sched: make vcpu_wake() and
 vcpu_sleep() core scheduling aware
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============2444471037402214727=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2444471037402214727==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qjLrZ1R6UtNd97hKp93x"


--=-qjLrZ1R6UtNd97hKp93x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-10-02 at 15:52 +0100, Julien Grall wrote:
> On 10/2/19 3:43 PM, Juergen Gross wrote:
> > vcpu_wake() and vcpu_sleep() need to be made core scheduling aware:
> > [...]
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> Acked-by: Julien Grall <julien.grall@arm.com>
>=20
> Dario, can you confirm you are happy with the slight changes to cater
> Arm?
>=20
It's not super pretty, but I think it's good enough for now.

In case it's needed:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-qjLrZ1R6UtNd97hKp93x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2VzswACgkQFkJ4iaW4
c+5xKw/+KXleYRu4E7k7xXEz7xmIl9TyM7IFWbZex56YYSJMBFmt+sAgGpDaUtMd
jg3fH4jBHQlMbasfDZABR2e2Zr0qRVMJpSK0x+ouXYIlS/+Q8x59YnRpkW7ZI1OM
EpW0zrrA69KfiwijmugD2ZuQWU+pVAkM97Jzp8YGuu2T+QGL4h9oPUHr8AO+cq6g
TBSarnK8dumaE/zKCxGsAV+gKfkEkjp0FxVyiVFuIk6RXUBGTWgQ56YgatU3bdgw
O7UfL+qwVgLLEQa0ZRPmroRIMtkW9GDPn9Fxbq3ZvQmxfCPDjDLf56CYxAcIE8Cd
7rgn5xZcKPnA7NyjQUb8wEcMO2+8hIsDSC2v/3C/yyEq8jmTGGPzTGcHqmduRfJa
fiYNdKpe4HkxE707DokZgcQlzHFXFdPWvu2gOLXET4jnqI1I9mZx0iKHlaJeKeM6
QZvyKQ8UFZyQ/7c6eeKrgQsMILhWga6sTTlYkUgmL3yGoOSORNyVqiOvo40G3Hrn
Ezdufx7FEsanAJrLB2XxW0RzqtMle9t0/HBhd0FwVWehB1YvidSTPQbUKFcx7pJY
MvLFhGNoPl31D/IMZx93L+m5ikvSyjN/6kSkpSsH2qlrkWfM2vKA4VcAoybwHVor
bUKfxaCo+9+xTJym1z8EPUh9rdbbjuFIV2ghr1f93i7uz3e90vU=
=JXLU
-----END PGP SIGNATURE-----

--=-qjLrZ1R6UtNd97hKp93x--



--===============2444471037402214727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2444471037402214727==--


