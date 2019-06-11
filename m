Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F423D22D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 18:25:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hajX6-0002NE-E2; Tue, 11 Jun 2019 16:22:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5o1B=UK=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hajX5-0002M3-0u
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 16:21:59 +0000
X-Inumbo-ID: 084477a0-8c65-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 084477a0-8c65-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 16:21:57 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Tue, 11 Jun 2019 18:21:56 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Tue, 11 Jun 2019 17:21:37 +0100
Message-ID: <bd6924c8a97718a4ab56d9c43b62b3d7a57a226e.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 11 Jun 2019 18:21:36 +0200
In-Reply-To: <20190528103313.1343-3-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-3-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 02/60] xen/sched: add inline wrappers for
 calling per-scheduler functions
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============8722992319120784089=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8722992319120784089==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7d0BccIVa+Wc+3vHiNx9"


--=-7d0BccIVa+Wc+3vHiNx9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> Instead of using the SCHED_OP() macro to call the different scheduler
> specific functions add inline wrappers for that purpose.
>=20
Yep, a cleanup that we were thinking to make since quite some time. :-)

> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-7d0BccIVa+Wc+3vHiNx9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlz/1RAACgkQFkJ4iaW4
c+5PvBAAw1R/CX5vVylD6ZmXT2N0ehEe7hg0U9NASawgLBiuCgiiTJoZj00PJKNT
Zu5BF0QKAsxPH7BPQw0DYcFw7gq+EBrgeBUqtnqNLszjo0zd+p4U24TwdNAsdevK
jeevE/O8UyL52jLWxi/m5L2NcIMkycE44ipQRofWRJXPdj880OQtwSFUE4/r9B8x
2eI2n8Hta7KmOqSVZBUOSQNtVX8GUNAOL7xM0z2HlJaVOpXytJg1hxrHIz/1Xz4a
iyWJmVJLFok3fdzICSh8oSDGs2qNgp76sUr3gLuLgCpxo5BLAV7ghKuby402aj3X
eytxeECJpEN7hgUsyVTikaLsqA+oM9bHQUULDCbr9MeWeQ97DKJTmGC/9+qM5lXn
ca7MXdESfcuPqSxiVOjFwhgUiwUIP/UbxlF6rhKiax4UpjTHGUAnrwkt+81owW+j
E5/xXPD/LFUTW1oFDyZDKYS8x2w6BWWc7OgEUD5I8OoSiJnQkxQuGxoGi+DbT1C1
q9Fgx7sk+GweelffRuSJH0s2uRkejvmeLyT8LeNoflLBLlpTnYIZ3tvva897REL0
bSQ0SP3a5MOCfIdjtCYLobo2oXGdp2T/mGrw5zvfOjtnFiZTAIiPoZ4pA64YR3aX
lbwAtllggSXjxct+5S0yyKf8Wf5mPrKEa0OsRWO7Qp/pxI1ImC0=
=N0bL
-----END PGP SIGNATURE-----

--=-7d0BccIVa+Wc+3vHiNx9--



--===============8722992319120784089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8722992319120784089==--


