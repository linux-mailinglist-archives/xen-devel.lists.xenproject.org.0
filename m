Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85076877A2
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 12:38:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw2FP-0001Tm-Ni; Fri, 09 Aug 2019 10:35:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XXK4=WF=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hw2FO-0001Tc-2s
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 10:35:46 +0000
X-Inumbo-ID: 711b156d-ba91-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 711b156d-ba91-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 10:35:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D3038AE72;
 Fri,  9 Aug 2019 10:35:43 +0000 (UTC)
Message-ID: <cb3023500f970acd7d63fe3455030bb62e618a8d.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 09 Aug 2019 12:35:42 +0200
In-Reply-To: <631515e6-2426-940b-63a0-bd2f770083ae@suse.com>
References: <20190802130730.15942-1-jgross@suse.com>
 <631515e6-2426-940b-63a0-bd2f770083ae@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 0/3] xen/sched: use new idle scheduler for
 free cpus
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============7078819850129697838=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7078819850129697838==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-GCbQcu3/MkMvTYARFi5+"


--=-GCbQcu3/MkMvTYARFi5+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-09 at 11:47 +0200, Juergen Gross wrote:
> On 02.08.19 15:07, Juergen Gross wrote:
> >=20
> > Juergen Gross (3):
> >    xen/sched: populate cpupool0 only after all cpus are up
> >    xen/sched: remove cpu from pool0 before removing it
> >    xen/sched: add minimalistic idle scheduler for free cpus
>=20
> Would it be possible to have some feedback on this series?
>
Mmm... Sorry.=20

I like the idea. In fact, while looking at the core-scheduling series,
I was indeed thinking that something like this could be done. But then
I somehow missed this series.

I'll have a look today.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-GCbQcu3/MkMvTYARFi5+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1NTH4ACgkQFkJ4iaW4
c+6Rzw//aYHH53iq++iveCxZtvVdMK5BdEffnPwZRrc1CXRXbFTT82jmvIhFFxYC
Cb/lSnmqpk/oKeTmeJ4F4Gf105Ib3qyLcEzWyoow6Ls6vxfGHaNU/wREnxLLhLWR
aZzrppAyfEoSzg0J9OGIF0p7+hkr+azA+jTwpKaIZFM83FfV4Cd/t6M0RBjz1X0r
dGqfVYDy/38KJd1NihhdBsFIE3QFvOKfqwR6/u2ewym4MydPqPtguzj24C6xqbCp
cbxc65YDDzGrWJRYyFtBGTrwxTkbicSnXTAMN+lyBroodb+7sJCgESA6j669ykQm
GJuPNgXjA63FY4SeOTmha7ehl4GvPbnMubrpjF2EeOlGmuroRbon4FBnf6yZ1EI4
DNYNPUPpPQBBkQWEVWv6jtk8ZYJII79XHnCR7BWwVE1Y358FiD4hsYwTpcDV0Kr5
jzkaaeNZmVwd6u1E6FGnDQYs6aDnDTEorXIFwetrkmS4aBt/lNWJWltFtOZTZGsd
q37fv88LPQCzvPKxXjYK+PD1ZqKILqYz0o9J/OYxHpEhq7ekGjxZyoQYA7MkuE0E
xjRX3TQmYR7YaVdxZV8zGTZ3LNn5nozbDpkNVZZqWYaJgIjKQeBHu73OdikKZQIg
+xfE5aB0bVUKqtTicdlqqMTjrJGIHwKDsfAWMsmqXh1sGC87OzU=
=crbb
-----END PGP SIGNATURE-----

--=-GCbQcu3/MkMvTYARFi5+--



--===============7078819850129697838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7078819850129697838==--


