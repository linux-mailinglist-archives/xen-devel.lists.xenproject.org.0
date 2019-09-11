Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A533AFE2B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 15:56:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i833m-00027e-Dh; Wed, 11 Sep 2019 13:53:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ltH=XG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i833k-00027Z-Ji
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 13:53:24 +0000
X-Inumbo-ID: 853c8aee-d49b-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 853c8aee-d49b-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 13:53:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CBA5FC11D;
 Wed, 11 Sep 2019 13:53:22 +0000 (UTC)
Message-ID: <1afcf0e569f68dbfe2c79668f17e1846a7dc3a1b.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Date: Wed, 11 Sep 2019 15:53:21 +0200
In-Reply-To: <alpine.DEB.2.21.1908231722430.26226@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <alpine.DEB.2.21.1908131413200.30179@sstabellini-ThinkPad-T480s>
 <71cbab87f4929766bf4293419e50425ab62e822a.camel@suse.com>
 <alpine.DEB.2.21.1908140927100.8737@sstabellini-ThinkPad-T480s>
 <78072866796e1dedd9068e4298a13c58a30e74e7.camel@suse.com>
 <197c435e78f47b0deb376493911abdc0922863b4.camel@suse.com>
 <alpine.DEB.2.21.1908231722430.26226@sstabellini-ThinkPad-T480s>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: multipart/mixed; boundary="===============0147646663414051845=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0147646663414051845==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-TGv5C4AagoZb5Z9VZ78M"


--=-TGv5C4AagoZb5Z9VZ78M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-23 at 18:16 -0700, Stefano Stabellini wrote:
> On Wed, 21 Aug 2019, Dario Faggioli wrote:
> >=20
> > Hey, Stefano, Julien,
> >=20
> > Here's another patch.
> >=20
> > Rather than a debug patch, this is rather an actual "proposed
> > solution".
> >=20
> > Can you give it a go? If it works, I'll spin it as a proper patch.
>=20
> Yes, this seems to solve the problem, thank you!
>=20
Ok, thanks again for testing, and good to know.

I'm still catching up after vacations, and I'm traveling next week. But
I'll submit a proper patch as soon as I find time.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-TGv5C4AagoZb5Z9VZ78M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl14/FEACgkQFkJ4iaW4
c+4zghAA6I/LVfz6e1QdknLCLmMmKOFo1va2zUW4FUSz90z7ArrvyFZiyEimgJ72
ZGhvau/zBkdxCx/gNawbNzobYI22neHEh4H7W9XFFOZpVVo6POr3e4NR11XV4/7x
N2JepzEBX2QmF0Tu7bPUq43JVd41DUga+fX/jqkH3ahcKalmRT1ig55S4eQsKBIQ
Ic544EdVOCtJPIwLp6iiWpjsnjHR1B/JH8bV2Xw7VSDUfPGiU1UDyvJ0p1a3SlAq
ZVt90jU0KZ3kMseJmhQOPtGeUxo51k868IWhhpv/xxtS1ev9hbEkqHbWCP+KZMM0
RunTD2AaH7LDGTGcM1+j0U9eHTkW64cNB1F4ERLMCfuki40ksnltqNfqshG6dlO5
ANo7IY17yJ92tcL+mM7VicC6Eu1JcZcTUEPkhaqlQ7a+gM7qIu3Abov1jUHelyTD
/9wBtZmQm23eQBbV0wIphFLgF2zJOBuQyJPgMiKJuk8Ket2A1dQyEtUM6zaT5Pzr
71QFywGzm65yT+zp/HXiM6RYxXe3Zj7G+KZ1p3dhXrtv1EmSM/9PEqv2xBgqSi87
2UF0cH76HMrm4+H0atdjK7/hY1XrAeeKcVrDYfBpbpvB7TVbmjon8m42k9YFkHsm
uCcTxo5q7dl9EOoeibM/B1sH2L7nW8RauOW/Eu9Se3+Lkj9jERY=
=2/SD
-----END PGP SIGNATURE-----

--=-TGv5C4AagoZb5Z9VZ78M--



--===============0147646663414051845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0147646663414051845==--


