Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9941777C4
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 14:51:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j97v0-000333-98; Tue, 03 Mar 2020 13:49:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LxAa=4U=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j97uy-00032x-Su
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 13:49:04 +0000
X-Inumbo-ID: be65358a-5d55-11ea-8efe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be65358a-5d55-11ea-8efe-bc764e2007e4;
 Tue, 03 Mar 2020 13:49:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59BB8B14B;
 Tue,  3 Mar 2020 13:49:03 +0000 (UTC)
Message-ID: <dfbac1e0727088386933d88c3fb86e1ea13b6c73.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 03 Mar 2020 14:49:01 +0100
In-Reply-To: <20200303092733.14983-1-jgross@suse.com>
References: <20200303092733.14983-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: fix error path in
 cpupool_unassign_cpu_start()
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
Cc: George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/mixed; boundary="===============8163087557368132595=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8163087557368132595==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-4YUXJ/9jclaIlfghsppQ"


--=-4YUXJ/9jclaIlfghsppQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-03 at 10:27 +0100, Juergen Gross wrote:
> In case moving away all domains from the cpu to be removed is failing
> in cpupool_unassign_cpu_start() the error path is missing to release
> sched_res_rculock.
>=20
> The normal exit path is releasing domlist_read_lock instead (this is
> currently no problem as the reference to the specific rcu lock is not
> used by rcu_read_unlock()).
>=20
> While at it indent the present error label by one space.
>=20
> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
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


--=-4YUXJ/9jclaIlfghsppQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5eYE4ACgkQFkJ4iaW4
c+7tshAAmf+ma4oNWAr1gXw13CmuQapxMaZchkSwXgLvnTx+Qs/3tgbBpeTMXpxx
R+VweABD8rQIgMAC5wg7Vey4WvLwEXcTepRwbMyebrQ8yHZovFzFB61P3Lh1iTDA
cyUlmvkLw3hbJ6icdCevr3aJOo2MqKYKajLikkdk09U1VGnU59rSea7wOkuRcqgw
rYmhqLpyV2uppHRHVrKrlK0w1mxeuLShZgzVRMUi9AcXnRUDkglVmKSX6TdQ37P5
6JF5as53C5KYLvzkleczzoVMA3KGTULUYs2yn2d262p5PLbAIlJKvbT2/HTvEzqO
fMQ0lKSloxHX/iBvy4GqvPugRdfJJCWGUS4t6sFC5muCCI9jnYcbTEOAZ5llzT7n
0HFs2btSH0lbFLMQBB6hPF1ihTMA0vxAQXeugToGupR+HhFePknYmaYLTSOgSH2T
DDljF5m+nrVlElCzFqdaNiyj+6wdkIf4Wlri3917Wq0pGZbJT9l1WbOGbMG6wSb+
430m//L0pOoaIB/0tmn1Lj0IQs3Rh3TRx+RkU2VbA7lfQ9ts6sLsLdwiN1WGAzHF
VMBN5w+liK9SFZUUmjdaFLwrETlNXOCqs09nOx3Vg76HxhBYsclEngeUqVaGtlHM
Y6+9oAsLnWV0ZD1sAHScBKLH1E437adb7fCUMK5E3ZeoVpoAWqQ=
=xkZs
-----END PGP SIGNATURE-----

--=-4YUXJ/9jclaIlfghsppQ--



--===============8163087557368132595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8163087557368132595==--


