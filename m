Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3781116496F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:05:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4RnB-0007Xr-8y; Wed, 19 Feb 2020 16:01:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NMhh=4H=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j4RnA-0007Xm-01
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:01:40 +0000
X-Inumbo-ID: 1cde7c40-5331-11ea-83ba-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1cde7c40-5331-11ea-83ba-12813bfff9fa;
 Wed, 19 Feb 2020 16:01:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D1B0BBA27;
 Wed, 19 Feb 2020 16:01:38 +0000 (UTC)
Message-ID: <350a8e7a522fda056e166b5ce6a7d63c0e9f501e.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 19 Feb 2020 17:01:37 +0100
In-Reply-To: <20200219153300.10679-1-jgross@suse.com>
References: <20200219153300.10679-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: don't disable interrupts all the
 time when dumping run-queues
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
Content-Type: multipart/mixed; boundary="===============0245679203529624937=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0245679203529624937==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Q/ZRr7tsPqE1yarzbttO"


--=-Q/ZRr7tsPqE1yarzbttO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-02-19 at 16:33 +0100, Juergen Gross wrote:
> Having interrupts disabled all the time when running dump_runq() is
> not necessary. All the called functions are doing proper locking
> and disable interrupts if needed.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
As said, I'm fine with this other approach as well. :-)

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Q/ZRr7tsPqE1yarzbttO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5NW+EACgkQFkJ4iaW4
c+7F6xAAiYkhekR4fuAcon5H2rrozLwnAh/Z2XMJHZZDTLwQT3lDoolDM1/2MIKn
/86cvBzE2w9kDysk6QX26eVFtLcv7Tpraxjl5zgOkToA4qwqZhMpTvVkDNNT8RGH
Gs+Wlt+yKyESS84u3ZePgyJJsYgWK8SDlKs1++RKiZ1MJDRZh178yRdiWca7IdrS
5+dc1q//tnpdCgehwURlOIpqRPe5vwQ+XDA/7nnvwoItWa6BnRVJIRHH8NBAf8V8
KIxKpcKEXZO1/CSnVodxeHAbCmB2aST60eArhlUaKBQ0Ec9bUg3EE9tk0LkUmDww
3FOLBOjpO0CjOFMbVTxIxTddq7YG8pGwke/A/gNgnx1asCSkNrfWKAQ+ldJc+MP+
6tCGVl0ccKkIeIs6RQlq3/M87fWbABBx4z51bakDlIzYmcQBVFBdDsYsX77do/Fs
5AxLInlycJ/uukwZakrHVSMbR4zEW/XZwA4G+tl2N7oi/ap1G1qZD+9yQqphcfHn
DAg8JCNEtgmD9LEgGQmVQx/2icD5pJImZj+GyhybOXykBbjqitoSd67RtG3/NApF
HuUL2AIYtc0/HPEwxndigWcmMaIG+YI0THLjeFbQLT6JF+Bg5F+Wfl+624VQRR1k
hXPADnSGkhfeIH0AYBTfnhEg0tVSiAfMIW6Kxf/rYYsaTB2lWfA=
=rRuH
-----END PGP SIGNATURE-----

--=-Q/ZRr7tsPqE1yarzbttO--



--===============0245679203529624937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0245679203529624937==--


