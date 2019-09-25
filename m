Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77153BE171
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:37:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Is-0007iL-ED; Wed, 25 Sep 2019 15:34:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iD9Ir-0007iG-Iw
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:34:05 +0000
X-Inumbo-ID: e7d5db56-dfa9-11e9-9637-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e7d5db56-dfa9-11e9-9637-12813bfff9fa;
 Wed, 25 Sep 2019 15:34:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D2C27AD35;
 Wed, 25 Sep 2019 15:34:03 +0000 (UTC)
Message-ID: <c55b7b2561cdaeb363b6fd757b0f0a0723d1e005.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Date: Wed, 25 Sep 2019 17:34:02 +0200
In-Reply-To: <96661f8e-31e4-8557-e29b-2350a74c586f@arm.com>
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
 <1afcf0e569f68dbfe2c79668f17e1846a7dc3a1b.camel@suse.com>
 <96661f8e-31e4-8557-e29b-2350a74c586f@arm.com>
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
 Juergen Gross <jgross@suse.com>
Content-Type: multipart/mixed; boundary="===============4339660979680007473=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4339660979680007473==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-6yhxCPY2q5/BgR0NadYV"


--=-6yhxCPY2q5/BgR0NadYV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-25 at 16:19 +0100, Julien Grall wrote:
> (+Juergen)
>=20
> Hi Dario,
>=20
Hi,

> On 11/09/2019 14:53, Dario Faggioli wrote:
> > On Fri, 2019-08-23 at 18:16 -0700, Stefano Stabellini wrote:
> > Ok, thanks again for testing, and good to know.
> >=20
> > I'm still catching up after vacations, and I'm traveling next week.
> > But
> > I'll submit a proper patch as soon as I find time.
>=20
> Just wanted to follow-up on this. Do you have an update for the fix?
>=20
> I would rather not want to see Xen 4.13 released with this. So I have
> CCed=20
> Juergen to mark it as a blocker.
>=20
Yep, I spoke with Juergen about this last week (in person). Basically,
since we decided to try to push core-scheduling in, I'm focusing on
that series right now.

In fact, this fix can go in after code-freeze as well, since it's,
well, a fix. :-)

After code freeze, I'll prepare and send the patch (and if core-
scheduling would have gone in, I'll rebase it on top of that, of
course).

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-6yhxCPY2q5/BgR0NadYV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2LiOoACgkQFkJ4iaW4
c+6pzA/+K2LH09tvmMzBZ5RD0k1BBGY70aOUB84tTyic9WDomE29dpWHfo3lGlDt
AcfXfNPm0le9YaA7fVHJrx8vZDhBbFSctRo4Qn/eKip63u/V8EjcLe2kDI5UAP2A
wI/KGdxD0WRu6HZR8qcZV45ytqPT970BLFRbROdcXbjHyCSqE3N2m15nJG+PLZzW
fI/hbcMNkRl/ups6jIHtRqb0QGEloVGY+/mLOWfcwCZJis0eTdVFzeD5bPjcncJt
HZgaARHyw+ec5eb5Y+y534kbOyVfNhmSfz6HUBdw0K4mRGxysZzlzSYWmIwkjLYh
z1TP0LUufySyKGuQWPyQgI9lQ5ScF2Q+FLOkBlCpdCv2IwS0aPGqtWtCC3XDWFCU
7Badbplpe0KmwO1dqBbPfhVgnUakDumN6Ad3Cz1S23bm2ZIgiw8wSqbaVGDuH0Mz
LPqBb1oMaLLhM1RA0rXgVUqARU53Svl2MTs7ITaHEi95nsoWdAmS+qbYgKDtMdwT
RPcjvc88cGOwrvLivUy7RrFWxduL021xwVPEBW+ev3W+otHNLjzC4mAsNHZmOTQE
J8oFuklHM9Hof23F8ATI3mdgWUoSI9i+BkW1PJsq0cRZMW1uU1qLSscNdZO7Ap2Y
4tQpaautsg0jlwlBhjrE1PV1B1ohMI3VfzHYkzCBtX/KWeagCUc=
=98oG
-----END PGP SIGNATURE-----

--=-6yhxCPY2q5/BgR0NadYV--



--===============4339660979680007473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4339660979680007473==--


