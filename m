Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E967DBD07F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:20:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCoSF-0002lr-6A; Tue, 24 Sep 2019 17:18:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCa0=XT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iCoSD-0002lH-FS
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:18:21 +0000
X-Inumbo-ID: 4de66a0c-deef-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4de66a0c-deef-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 17:18:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 307BEAFCE;
 Tue, 24 Sep 2019 17:18:19 +0000 (UTC)
Message-ID: <024b21634c57a86959d97261dae68af4f7826381.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 19:18:17 +0200
In-Reply-To: <20190914085251.18816-9-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-9-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 08/47] xen/sched: switch
 vcpu_schedule_lock to unit_schedule_lock
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
Content-Type: multipart/mixed; boundary="===============0142859748723306012=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0142859748723306012==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RGjZwQI3iBnEGnaZ5iNy"


--=-RGjZwQI3iBnEGnaZ5iNy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Rename vcpu_schedule_[un]lock[_irq]() to
> unit_schedule_[un]lock[_irq]()
> and let it take a sched_unit pointer instead of a vcpu pointer as
> parameter.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

I guess 'No functional change', or something like that, could be added
to the changelog.

This is not a strong requirement, tough, as I think it could become
quite repetitive, if it is really added to all the patches doing only
mechanical changes.

So I leave this to committers to decide if we really want it.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-RGjZwQI3iBnEGnaZ5iNy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2KT9oACgkQFkJ4iaW4
c+59PRAAqPZJDh23kuFmnWgIvhuY0qq6nWYMSdI8ayaM1qhLUU1lu3lRaOCyVui0
kc+S6yHrqdSF2ph/RbJt69GvVDb6zt+TjIorA6/E6msit3mxsSsSa/nL66mHdgLH
TzLiu9nJIeca7DIG0hQeeupGprWzWYZ4+mcl39VkVtKhztOqngP1rJjq1RC1uK3j
zX0WmXew2nOpWVfnRBUYcdd6UXB6aAd9pTD2gSLe6hVpYmrLJ+BVoIiP/7NCbmrQ
7W/wGp5CaMQfUzcJypusLgrsYn3e817Hzi+k374Jjfmnatw8PuS57G3y0FA7LHOI
LQvj36EoQIORn/volff/ZeBnboX0kieBeX6laYeFjAQ04KgVUtRHfY64Pyr5mZ1F
LL/QnNZ6RCl3yfoNtLVc06aW/QmB6B7/cYwAEf9BCFczub1xvwA+cDmkJofj6WVD
08aqII8KxgCh5kW+NJ7H8h8q1YEhysNSFUAMMwBYtMqu0XxJwcAF6vu16GajoX/t
GatC3KDaiGmTUcIhaWAkc9qsHFy+uRZdrk+PtccjDC5CVa7AEtpm9R7ulOnZrox+
DLgXMcI8zZ5GNWJDkTcm/dQ49fJxXSkmeQBLK/9tSKsHS9FxRoURBdc1hmrM0InQ
RUYjX+ylpVE4nJDPmwT20WlD2D9XBp16+2LHDlc1UVJ/RYuPX8g=
=Q55d
-----END PGP SIGNATURE-----

--=-RGjZwQI3iBnEGnaZ5iNy--



--===============0142859748723306012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0142859748723306012==--


