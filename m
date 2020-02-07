Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7B0155679
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 12:13:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j01Vs-0001RQ-10; Fri, 07 Feb 2020 11:09:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ndnz=33=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j01Vp-0001Qf-U9
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 11:09:29 +0000
X-Inumbo-ID: 4eb86c44-499a-11ea-b12d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4eb86c44-499a-11ea-b12d-12813bfff9fa;
 Fri, 07 Feb 2020 11:09:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BCCD7ACB8;
 Fri,  7 Feb 2020 11:09:27 +0000 (UTC)
Message-ID: <d2fe8b44aed9e9f3bf51585af1403f2ac1162042.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 07 Feb 2020 12:09:26 +0100
In-Reply-To: <20200207072405.2236-1-jgross@suse.com>
References: <20200207072405.2236-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: add some diagnostic info in the
 run queue keyhandler
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
Content-Type: multipart/mixed; boundary="===============6519161625904490645=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6519161625904490645==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-zeo5+SB8e5q0nX0u9E67"


--=-zeo5+SB8e5q0nX0u9E67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-02-07 at 08:24 +0100, Juergen Gross wrote:
> When dumping the run queue information add some more data regarding
> current and (if known) previous vcpu for each physical cpu.
>
Looks good to me.

Can we have, here in the changelog, a sample of how the new output
looks like?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-zeo5+SB8e5q0nX0u9E67
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl49RWYACgkQFkJ4iaW4
c+7aYg//avy8olWblyo5PxOVPHT80W/FjE+SFD50AXx02NYftkb5NAOdsYNrMCMZ
d+qbj7JVUgPEN50IQjISafFopDkqmwvaCgUJDoLCH/6OkVVtc/N3CEmJOeId76H8
rr9l/07z/YW4FKNmwv7qMLAGbGNDLkxg+ZXtSdkGY2lusQBWJlFpzThug4JuGMkF
PCtPHMmHLVW+XE5kbnSaj5SK5QOw4IiD4CEPvjnGxR57KToJlMsXuDdmhhLnXP52
TPxJ+hSHAbuXw6RL9Jcn1dzndR4uLDNaKvfd5fS44qdMMHw8qvBuN3gLZ9cedkAU
GayKwPuhuXKnnmB3DYrhzRoUfmBDKGcNdQX7sDgEnc0A/Tu7NW8serI0jKh8/+u8
MvC3l2gtqvX8L59JbcZXnVeNprCLlv7VoVgkM6c2FQkPSHkvWrUhXbzsDSh3sxIN
2R0WHcXnOXgY1su91Cd2f+oaMTJtJA9ukFNdLxKhCbTjrAq3E+YuB3UMsDUjrLPi
TmGe8j7dNZ2EvGp76APpcg5WO6GwSyshy/gTMxt+ZFjE24Q+0RxUNJfeRnVU93AB
hQIwsv9IUoD5TantxZyC4SU4VJO4tdylEaVWHxED2mNdCSJcNFSsu6s9zvYEvCOR
c+WCyyshszhAGWVki6lGNwch4mdiM/xhZfcm6jGjVG8hdqFzCIA=
=sGgo
-----END PGP SIGNATURE-----

--=-zeo5+SB8e5q0nX0u9E67--



--===============6519161625904490645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6519161625904490645==--


