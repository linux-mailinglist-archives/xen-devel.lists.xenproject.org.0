Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE7815C8FF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 17:58:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Hmk-0003Em-PV; Thu, 13 Feb 2020 16:56:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bW8p=4B=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j2Hmi-0003Eh-Su
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 16:56:16 +0000
X-Inumbo-ID: bf62b1ac-4e81-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf62b1ac-4e81-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 16:56:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51D70ACF2;
 Thu, 13 Feb 2020 16:56:15 +0000 (UTC)
Message-ID: <dff51bd44f3f129f5f9d4100d43ac401604b9d15.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 13 Feb 2020 17:56:13 +0100
In-Reply-To: <20200211121530.11665-1-jgross@suse.com>
References: <20200211121530.11665-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: remove sched_init_pdata()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Meng Xu <mengxu@cis.upenn.edu>
Content-Type: multipart/mixed; boundary="===============6296400557718954401=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6296400557718954401==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-mz3ZS9cjRkx84CNDr4kF"


--=-mz3ZS9cjRkx84CNDr4kF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-02-11 at 13:15 +0100, Juergen Gross wrote:
> sched_init_pdata() is used nowhere, it can be removed. Same applies
> to
> the .init_pdata hook of the per-scheduler interface. The last caller
> has been removed with commit f855dd962523b6cb47a92037bdd28b1485141abe
> ("sched: add minimalistic idle scheduler for free cpus").
>=20
> With the idle scheduler introduction the switch_sched hook became the
> only place where new cpus get added to a normal scheduler, so the
> init_pdata functionality is performed inside that hook.
>=20
> Adjust some comments as well to reflect reality. While at it correct
> a
> typo in a comment next to a modified comment.
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


--=-mz3ZS9cjRkx84CNDr4kF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5Ff60ACgkQFkJ4iaW4
c+5ezQ//SawSl9L8ui4Vyocp/CR514zttzFL//Z3S8C+se49KdJXn8jsuv3AOvvS
R/DHCVJWMh4Up9yKD+Iuc3VVeeMdXoGTTJnV4cJf2Wgk8+BZ0PnoeaIgdIvhdzXe
OdhbkPHeW4CZcyI9tAzfikLi1OL400SKEN958tZqEpL9qkO7NIxm3jwlSgPK5FRa
iWyN+J5buEsJentnn0Wf11bibiZlcXTViSQ6VMZA4IlQhKB75fDxjJ922KbOFrLy
1X1cyZDArDMwpdsVBM7/VO7jaXs4KklPiZjNMMVlG0Kl0BQuxKvxII+3I92DU4PY
vUbJwVQX3NCWeZIr7emvdnieIDlRPC+II+5eE2av6jRfLIPmuZwMv2Ik4+2ejZXY
lFQU12tYodt5hpp80Vpa9Gk4je/U3Cgrez0jZ9KLzeHeMmXYCO3M2cdmxcCzbTTH
cm3DR6zUu+eGFeaf8eJOq/BfeNvbNnCWxPghtwt7t+QKv3IitLyUC/DLKPmY2sPO
5rytCKccL5VJanM7S+eVvmxcOBxZuLs1nTnn0QNmarJcWInNMohOAYgxUc7jzviV
YT9/BMwAF34P8JVzd2Q4rww26tqT8kc/EoaP3VQCE72rpyZp1wxmF7rMnOlnZ963
vvxuVNQvyDCwlHN5XBiTQp2Z/7phwqE9LRwnWRYccLBK+uXSnCA=
=SGg6
-----END PGP SIGNATURE-----

--=-mz3ZS9cjRkx84CNDr4kF--



--===============6296400557718954401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6296400557718954401==--


