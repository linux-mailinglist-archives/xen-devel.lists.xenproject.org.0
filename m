Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A551BE293
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:37:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDAFm-0000XD-I7; Wed, 25 Sep 2019 16:34:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDAFk-0000X6-Po
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:34:56 +0000
X-Inumbo-ID: 67b07982-dfb2-11e9-9638-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 67b07982-dfb2-11e9-9638-12813bfff9fa;
 Wed, 25 Sep 2019 16:34:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CD60AD2A;
 Wed, 25 Sep 2019 16:34:54 +0000 (UTC)
Message-ID: <73adde436f79c2fbb1c14a60974d8987a5c0d214.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 18:34:53 +0200
In-Reply-To: <20190914085251.18816-23-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-23-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 22/47] xen/sched: switch schedule() from
 vcpus to sched_units
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
Content-Type: multipart/mixed; boundary="===============7922672716405821081=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7922672716405821081==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-L5QTaqw+kjsYfk4Mlqh2"


--=-L5QTaqw+kjsYfk4Mlqh2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Use sched_units instead of vcpus in schedule(). This includes the
> introduction of sched_unit_runstate_change() as a replacement of
> vcpu_runstate_change() in schedule().
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


--=-L5QTaqw+kjsYfk4Mlqh2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Lly0ACgkQFkJ4iaW4
c+5vyg/7BfLHJSdL5DNRuK19knSTQQP9YzD1qydbIgkzN87S/au1qoJJ8OfghgAN
DW/HL1yNrduzg/upPDVl2h77+9QmSv8dFxEAgf6OuhB3QQfr8JQ+ucbFdPMK1UU3
2bXwEVrG9+VR25ohdVF2C1Jw8SWJLQC/+hQcdjmb3ZX+M9+2I8JkGHNYMUISv7PX
cT924lSV1LQGvxZ9x5ko662ex/qEGPBvDpAC9ScrgANTHMrtYZEpKnqR2gfsQi/i
FXhXuFPEnrAZNanM2QXQaMTQmTSrNlcicGHRaB2ORzIMy8jBcY646E2IyU03PPLJ
5Vi4fYdzKYtN22UKEsvwvnpFp4U9TXT64QRtWpNJKDYuvSmJetmtq4ZmknR3a4e2
Y1GhOUhQuO0/CP/8gsma9tNxsliXcCH2dTD0C4S80GiTM1TFh57nzSCPFZ67u9l2
FLBGgH90LwH0SDQpimApsPW7md5tqE4/A0/GS+ZafMO7f2TbHY2JzZGCkdt65og8
nXoC+sidVqIaMAHs1hcQB/EwitaBK9ihO4fQB6NLSpm6yaZuiUy5mRtxQFAKRmww
/gHAcUtbujnmycECIkeorEc4cE0pMafnM9kW3iYNv6cWDt/j5prsHtDO39/h6MyB
WF0+d0hjwkPazfcNB5apXqRHYcYitYCvx+EZk+sxG+yazcmxfPI=
=9+z/
-----END PGP SIGNATURE-----

--=-L5QTaqw+kjsYfk4Mlqh2--



--===============7922672716405821081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7922672716405821081==--


