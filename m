Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F66BDC8E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 13:01:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD50n-0004Q2-QS; Wed, 25 Sep 2019 10:59:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iD50m-0004Ps-Fy
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 10:59:08 +0000
X-Inumbo-ID: 7ec42bc0-df83-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 7ec42bc0-df83-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 10:59:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DDF5EAFA4;
 Wed, 25 Sep 2019 10:59:06 +0000 (UTC)
Message-ID: <26e09877d338d3801dbb38b881e8890cca2255ab.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 12:59:05 +0200
In-Reply-To: <20190925070503.13850-2-jgross@suse.com>
References: <20190925070503.13850-1-jgross@suse.com>
 <20190925070503.13850-2-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 a653sched_free_vdata()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>
Content-Type: multipart/mixed; boundary="===============5909762732802038820=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5909762732802038820==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-rCM5PIQ+rkvLC9QROooL"


--=-rCM5PIQ+rkvLC9QROooL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-25 at 09:05 +0200, Juergen Gross wrote:
> The arinc653 scheduler's free_vdata() function is missing proper
> locking: as it is modifying the scheduler's private vcpu list it
> needs
> to take the scheduler lock during that operation.
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


--=-rCM5PIQ+rkvLC9QROooL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2LSHkACgkQFkJ4iaW4
c+7h7xAAgZ3ZaPlvOW4fm/LEfABRt+aCWy/MF1WhnY+3IyvsF3JeGG9sHyzWWHBG
cCivzluaqq94xX3Y/1H2W/XNHl9hVUKrAXIPwatbstfYk0bUfSgiB36T/G2UIhUT
7dBZdEFjd6hzMwJigoL/zcIRQKv+87gkO/MXSgU0LcKgGyUzjP3JPvVrf9cU3IEq
hr1PwCZCCpnxVoV2/70LVkyhxy90igDuVhFlyfnNLMtJvUTslCkJiRwrOsDJWeyE
2dpaUXaPVUYHGCcWRg9rHmyjp/5fy3GyqSOCaLukhCJPt9B4mmCCf7M0XkJxSNQd
XTYCoAlujtGJ/2i8hg/4FVU5RcvQoRSLcj6sVZHj2a1riq0gN1uHJbZQ+Dp185Si
YskI8WXqPjmVCm2qihzAmAlktL3XIXxMuDjnr6OJF2Jhwfx3suR2EWfnD8ud2IjI
J8Dhc7HvZzUASjY/cZUcKWlpO6HEzPMUHdrG96iOIXPPFsfcPmyvp6hAZoelNVZg
JaGLD1dwrzN8wXMKrb9cUaSyAHI8JojF6Zn38q/SjV4au+8YIOQGQ7pLaU2qhZZp
260i6/2xtgbgXTcdu+Fngps8DvqIAzsU6H28alU+3ulbuh8pBOufmWjjIqcVv6Qk
Ylxe/XMsrC0b2dBeHs430ZHsx3Ok3wxXPvZ+yl81b4P3bLriaeM=
=VytS
-----END PGP SIGNATURE-----

--=-rCM5PIQ+rkvLC9QROooL--



--===============5909762732802038820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5909762732802038820==--


