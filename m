Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44108C019B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 10:59:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDm3n-00046K-VH; Fri, 27 Sep 2019 08:57:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDm3m-00046F-FM
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 08:57:06 +0000
X-Inumbo-ID: c71c3ade-e104-11e9-9670-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c71c3ade-e104-11e9-9670-12813bfff9fa;
 Fri, 27 Sep 2019 08:57:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8330FAFCB;
 Fri, 27 Sep 2019 08:57:04 +0000 (UTC)
Message-ID: <35d6eb9152d43277e9bd05c1ea7f5922f0d6d34a.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 10:57:03 +0200
In-Reply-To: <20190927070050.12405-20-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-20-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 19/46] xen: add sched_unit_pause_nosync()
 and sched_unit_unpause()
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============0492490562998620342=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0492490562998620342==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-FTGnfl3KEsLhDX88sKIG"


--=-FTGnfl3KEsLhDX88sKIG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> The credit scheduler calls vcpu_pause_nosync() and vcpu_unpause()
> today. Add sched_unit_pause_nosync() and sched_unit_unpause() to
> perform the same operations on scheduler units instead.
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


--=-FTGnfl3KEsLhDX88sKIG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Nzt8ACgkQFkJ4iaW4
c+73wBAAgPe/hvxJ/uEOMubC2UwqHGCrv1EBIDqSqk7fHgl+yHhDGq2YwSMhAmCP
cTmjbn9mNTgSB7mTbz8KIkG9fgqPIhww82AH+jhxwhNl8nAq4MyowDKbtiorSVyG
xk3qqwjrBjSn1A0C97+Xmib4SYnPaVBu0BT3rd7Bg8UXgMJIGVBnKlapcCdHStWC
4SNbdEWHADT3RBrU9PiDbTPvecxUW68O+RxpT6ZPP5takimoyOtXf+rKxPgZUwYx
iAJCrZVZHPI7nysZ5OreFjrK3LfcMkGyBcpnLhlHlgRLJiY6trmBl5/xs9Y/AZFT
BeEtjkSn7owl4ywdXIUpe/vABVaXmsiEEwX6Am+lMeLVV1jF2Hs841fyweVbnY5+
dUtctKu8TpPKWM2E6ErchEbjtUd70ZdMFKkz1NupghRdGhkH8lhKgln+ZtDdb7HV
Wn8qqa7QGgiGnBiUi9n589Oq/GPxUYkiKqqwyhmBek0ToxdgLpiaJt3XNOcojz0t
lqaK4pEGnEnKEN6KMnff4976uO5VPXnht0oSx+ZIVqfaP8ZAC6BMkbbJsw8wfHVS
pmZxa0A6JA+etjg1+59h8cvQpI3KBFIs5bWqrBTWsc3x+rdY1zKX1yy8gcAwRpFU
c+E6D6YiSElnh+W11HgYrh/g1fKPkqUjbYLOGXKE0rWCecQyF9o=
=03d/
-----END PGP SIGNATURE-----

--=-FTGnfl3KEsLhDX88sKIG--



--===============0492490562998620342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0492490562998620342==--


