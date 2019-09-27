Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB23BC0845
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:05:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDrlu-0001kf-Gp; Fri, 27 Sep 2019 15:03:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDrls-0001kV-Q2
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:03:00 +0000
X-Inumbo-ID: e5387f4a-e137-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e5387f4a-e137-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 15:03:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 671FAB168;
 Fri, 27 Sep 2019 15:02:59 +0000 (UTC)
Message-ID: <bd095375495bc2a0f7bf4a909368d73d8ff07063.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 17:02:58 +0200
In-Reply-To: <20190927070050.12405-34-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-34-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 33/46] xen/sched: add a percpu resource
 index
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
Content-Type: multipart/mixed; boundary="===============2939795783117513357=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2939795783117513357==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-OsiKXGc9AisnlhzwKIQ+"


--=-OsiKXGc9AisnlhzwKIQ+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> Add a percpu variable holding the index of the cpu in the current
> sched_resource structure. This index is used to get the correct vcpu
> of a sched_unit on a specific cpu.
>=20
> For now this index will be zero for all cpus, but with core
> scheduling
> it will be possible to have higher values, too.
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


--=-OsiKXGc9AisnlhzwKIQ+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2OJKIACgkQFkJ4iaW4
c+6f1xAAirXlLJ2mzmPW/8pZzlnUamMOV0M4T4+VISI3L8yHMPWWmXcTgCPyMwBS
hUMt1e/hMEWLUreD4uzjrv9OelYR5SUKQ5QgIcdDQ4TXp+Eol3Vcab8SYt7F4shI
GpZXdIjcMzQqgxYFexmhs+8u5FVsGJzcPKsxb64M79wN6pgWldBv3c9M03mlzSCZ
wQYdq7RJ8UmDHcfdKgrjEZXsZ36uS/hCmSJstK6CgZGYQo5nSsRBcd1vyNqLk7YT
b8TELPHzQUFxDvK7F2SuQYbeG7ow9CBnl8MAKn6luVSS6SfWLLOnCtcW5POlOMHL
5dqFk8m+pPgzcklY3iBN2KfwvKxMFmCFRl/QFGSm/pK4CcYbtJeFJ0IsWWiPeC0F
2pjngehw7ERKbWV6qO6yb2dDLTatoV1HIgWSerCzAJr4z/W642URiaXW0GTZtiuU
7DQ994Hz7E2vSEUpjyhrG8PXWfJVxfReC4X6bQrhjMXbN7TSqSE/6zbQOcTHo8wl
LWBB5EMKZsI17DejN9O461p4A0Gdd0EdiiWdgDVv7WhOP3mmL3UN5o1sAm8vfclN
060v9ZsarooUOiiLLRVY1fVWnCCje1ptHrnOvou8uAdAOrObfezpnb4f1Akt9TOP
IpPkoZ0698Vx2d/oEh+qsriMKCdoYh3i6/S1zRShDggtZkpaVOw=
=4lJ+
-----END PGP SIGNATURE-----

--=-OsiKXGc9AisnlhzwKIQ+--



--===============2939795783117513357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2939795783117513357==--


