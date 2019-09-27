Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FFFC0840
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:03:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDrkJ-0001bR-Pi; Fri, 27 Sep 2019 15:01:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDrkI-0001bM-Cz
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:01:22 +0000
X-Inumbo-ID: a9dbe180-e137-11e9-967c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a9dbe180-e137-11e9-967c-12813bfff9fa;
 Fri, 27 Sep 2019 15:01:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8658BAF5C;
 Fri, 27 Sep 2019 15:01:19 +0000 (UTC)
Message-ID: <80636d592eee15e458b29af8224b41f58a6b7a49.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 17:01:18 +0200
In-Reply-To: <20190927070050.12405-33-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-33-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 32/46] xen/sched: support allocating
 multiple vcpus into one sched unit
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============3684046461957091302=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3684046461957091302==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-OlJttyu6mQEeDP4suYwL"


--=-OlJttyu6mQEeDP4suYwL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> With a scheduling granularity greater than 1 multiple vcpus share the
> same struct sched_unit. Support that.
>=20
> Setting the initial processor must be done carefully: we can't use
> sched_set_res() as that relies on for_each_sched_unit_vcpu() which in
> turn needs the vcpu already as a member of the domain's vcpu linked
> list, which isn't the case.
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


--=-OlJttyu6mQEeDP4suYwL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2OJD4ACgkQFkJ4iaW4
c+4Tdw/+PIYuERdD0diRgn3cRU2wpbOm5Doyw005o6az28/H6AotlIl3uam8UuFi
IUxpwDKCv49NQLnAFfiJks1RBE+PvKN3ctsTQrIZSfM4qsLVvbzKByeYGWpHPxdF
NqNK4wkr2/RExRe4qKlJPW/mDVyyr1crZ+RbSF0Oh96VMnM6+U2tTBbRYnrxjgCf
Gu1iyIOtYVmcb3b2nte1M0B9TjbyQz/BLwkKa1kpcy7tLxSqotDbSfOZ0XkTeNAq
HZ47zopRAuqx2HfW3e/UA5Cnd5ISZuk7V7Oin1ZBMhdbRdn9DMms3rzcIwwpiCfm
ZHDwbfw93UT71Qy8CTHs7kTw1ioLOAzeoYYuYI4Rva0fZi8M5TML9psUohhlM3PP
fovQvptGAMPhHZuOEZBTRBOk/TGPC03cdeeWHvexlsataa4+4JFbQJ2MRslYZ7KN
iWB82yJzmGv/iS3lJyTjJd2GmJsl8UQpJHmX4kulyqVxZt4vVAyuw/VV81vjuATA
TfDlKb1nYSp14hheXSf0QEgjTT/nM5LalAusp6N4man7yR/QLDnmKLrYZ0EcjWzm
0WQIweQMF8UbQBPXVB5cncu61BOmEFpy9GPZ9H+jdv0+cQ/deMz7H3y/u+LIGsBe
gLMhxT7dLiDvMWHaFAC17rMqCINHlzNhxdrjqjEQW29PDtnfLTI=
=DFnt
-----END PGP SIGNATURE-----

--=-OlJttyu6mQEeDP4suYwL--



--===============3684046461957091302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3684046461957091302==--


