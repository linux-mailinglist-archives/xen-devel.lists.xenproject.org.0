Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67859BDFF1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 16:24:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD8Al-0007Vz-Ie; Wed, 25 Sep 2019 14:21:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iD8Ak-0007Vu-54
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 14:21:38 +0000
X-Inumbo-ID: c8511e80-df9f-11e9-9632-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c8511e80-df9f-11e9-9632-12813bfff9fa;
 Wed, 25 Sep 2019 14:21:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 020BAB618;
 Wed, 25 Sep 2019 14:21:35 +0000 (UTC)
Message-ID: <a0dd488a6f902286bdc1d5f0aadf33416750c0a3.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 16:21:34 +0200
In-Reply-To: <20190914085251.18816-17-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-17-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 16/47] xen/sched: make credit scheduler
 vcpu agnostic.
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
Content-Type: multipart/mixed; boundary="===============7228715692750485817=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7228715692750485817==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5hczwJmPiQ21JXRyhiaa"


--=-5hczwJmPiQ21JXRyhiaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Switch credit scheduler completely from vcpu to sched_unit usage.
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


--=-5hczwJmPiQ21JXRyhiaa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Ld+8ACgkQFkJ4iaW4
c+7RNRAAs0Uyv3XKy2R3rMYOkUclUgQWY+0r3SK2614M36ocbYwfJZwuiA4VKlz+
poVLBWVdbon2n1WW36nwqSEpRqxaawJbegHEVUoOo8FjwZkDQV+K73LIdDdpJNZM
gTEjLAZLCZQkEwWvF4DfkCbznodLKu7AcBMz9XpluDlz4CLyLpbPv6zyaZp1Msal
ltRzfK1I7koJGAL36FRMZbDhqGTdtPYVRpP/d5HK/fr3n8oTUEFeBviO4Jik5k+/
ExTagMkEbw52/tcLj7VW/ZgjyTVXzhXmm+NsYCGcCrSyg9HMZ+2VxKvF4Cz3Q39W
O0ljzmZy+WZkq9zIbPgsrOn4JPmoka+pTouG4Vc29bpPeRO1YsOiXNh2PLmwmBKF
3zfPKdAX4fdl1c7vFTwFVq6/a455fKq3aiYPdytmRXe9Uo/zBMtemsrDB7gzxtxg
fCxVIOLQIuEL2NmIVq131Vq4Fk2tjE0G5sxzHeQRKqeih4LH24sAnLDNqsSV8NI2
/5VcRgG7Uit7nuqAxvdBjJXdxFCrQOMpSvTMuwNhAtZn+Q7eOyA5GG5RBZi9znwi
KP7+V0SdOOGTi9oktjGb4vqPmqOclkXsgZeSlOURvbhH1MUYWjyrcsT2ap23wz40
KSjyryDH8KifqDF2+H8JfzMUvt8ZYkEo7mW4CzfZUJCZDx0sABU=
=AXDS
-----END PGP SIGNATURE-----

--=-5hczwJmPiQ21JXRyhiaa--



--===============7228715692750485817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7228715692750485817==--


