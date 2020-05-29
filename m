Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F55E1E7A6C
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:20:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jec7p-0007aG-Mo; Fri, 29 May 2020 10:20:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsAk=7L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jec7p-0007aB-66
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:20:29 +0000
X-Inumbo-ID: 043dd8a8-a196-11ea-a88b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 043dd8a8-a196-11ea-a88b-12813bfff9fa;
 Fri, 29 May 2020 10:20:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 023CCB11F;
 Fri, 29 May 2020 10:20:26 +0000 (UTC)
Message-ID: <78e986122386915cacba8b4c3b572a460f9622e1.camel@suse.com>
Subject: Re: [PATCH 0/3] Automation: improve openSUSE containers + podman
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 29 May 2020 12:20:25 +0200
In-Reply-To: <86969ba1ea7e270267cfaa3408a89b55c86b3dca.camel@suse.com>
References: <158827088416.19371.17008531228521109457.stgit@Palanthas>
 <86969ba1ea7e270267cfaa3408a89b55c86b3dca.camel@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-3lN/oI1im3UMHAh5rfeP"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-3lN/oI1im3UMHAh5rfeP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-05-21 at 09:43 +0200, Dario Faggioli wrote:
> On Thu, 2020-04-30 at 20:27 +0200, Dario Faggioli wrote:
> > Hello,
> >=20
> > This short series contains some improvements for building Xen in
> > openSUSE containers. In fact, the build dependencies inside the
> > Tumbleweed container are updated and more handy helpers are added,
> > in
> > containerize, for referring to both Leap and Tumbleweed containers.
> >=20
> > In addition to that, in patch 3, the containerize script is
> > enhanced
> > so
> > that it is now possible to use podman, instead of docker. Rootless
> > mode
> > for podman also works (provided the system is properly configured)
> > which,
> > IMO, is rather nice.
> >=20
> > Docker of course continue to work, and is kept as the default.
> >=20
> Ping?
>
Ping^2? :-D

Adding Wei. get-maintainers.pl seems told me I should no Cc him, so I
dind't, but I've seen automation/ stuff Acked-by him recently, so...

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-3lN/oI1im3UMHAh5rfeP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7Q4ekACgkQFkJ4iaW4
c+4Qug/+PmeZZaWX05mKFCir7jn9Xs/ZmFB/wn0nuPWeD2OxfuljSt22VPhMgM97
qz6s1BHgZuFEbEZUFflwxJN2349Uo2fPrMhCyqgbsrxRNjbKjFYGtWW0iqvnaenN
NJ222mH6TOodrfWQ8WBUCW3fooMuNi3GZJxLW8C5olsPxv3HK3647gSntGheWpob
HDtT8dAEwLK4AJEZccc5ZaIUB7I9f0sSAtO2lbEEITVNi4QMD9dqu8Lv/S2rffZ+
CjVPJy2IeanIv4q59j2pgTny7RfiiluoSoF1xMyjKTnqOWy//X+S+S0EhGG3R6Ep
NHmxmgG2SMP9yFPY6jvWWh/XoylBUF6JGXnKeljt32wao7J903uDv9bIOs+jnTtg
movSk0TDdujaiWw6Irj3SKejr+YqgOOJHoekxXNsGOdQx/TjTWVAoqp446yBVseb
ltMrTyjM1nfO53LHQrim4S6zEe+amJ3NM0P3aN2Wds82Qm0es5fCxgGmYsUZI8I2
mMES962iSk32TGBkeTkhwgFi6Wcd1ZKhXmlpjva2rICqNFwDnd4pRGyjGg14L87z
swOY1Y/XzIW5fMQ0YE293ugN/DwyTQOOg+ZO2KHjl250f3XueLc8/E1k1/1rIqXd
QqgwKm2ILNWTpcilup2eCi2gHDQ2nyUwj29lKvny2nyJuJzZs84=
=AZEr
-----END PGP SIGNATURE-----

--=-3lN/oI1im3UMHAh5rfeP--


