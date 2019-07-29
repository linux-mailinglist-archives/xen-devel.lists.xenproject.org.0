Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54747B72B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 02:26:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hscOg-0005Rp-JV; Wed, 31 Jul 2019 00:23:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=onjf=V4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hscOf-0005Rk-Bd
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 00:23:13 +0000
X-Inumbo-ID: 607a7269-b329-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 607a7269-b329-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 00:23:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5A35B019;
 Wed, 31 Jul 2019 00:23:09 +0000 (UTC)
Message-ID: <253e471fd0138933074d09b184dcc656b209de96.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
In-Reply-To: <20190528103313.1343-12-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-12-jgross@suse.com>
Organization: SUSE
MIME-Version: 1.0
Date: Tue, 30 Jul 2019 00:22:18 +0200
User-Agent: Evolution 3.32.3 
Subject: Re: [Xen-devel] [PATCH 11/60] xen/sched: move per cpu scheduler
 private data into struct sched_resource
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============4294588869030751703=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4294588869030751703==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-d30hnbTyXbYreNME3Mlg"


--=-d30hnbTyXbYreNME3Mlg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> This prepares support of larger scheduling granularities, e.g. core
> scheduling.
>=20
> While at it move sched_has_urgent_vcpu() from include/asm-
> x86/cpuidle.h
> into schedule.c removing the need for including sched-if.h in
> cpuidle.h and multiple other C sources.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regard
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-d30hnbTyXbYreNME3Mlg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0/cZcACgkQFkJ4iaW4
c+41ZhAAt1BQFAZf9AKaNfIwhbWHfhO+EtHDyXdz7VSXd8v9YeTi2cb12cjeUpgR
Erg9o8d4SSTgMzA6QSE5ij1sD3B58XkE1W/3QKgnvrqVUhikx8po/DmUVq6QNjor
EYUFXvAV98kAtx2/D30ZLYjzD2YRlce12sRvbSMLjSUbTmvil2qQ2YXAs1n1bGrX
in6Hu00lco5nvhw1V0hqt24j5HWyqM5h8fT9iecz2zVF1HUClYgb0YJCvKYiK3MO
6S8edCV1lngCtGVSXFRSsyATKCz/mY01+M4LY5Lb4NdOJpP2K1oAv2k9Dmix+fyI
1a8n201GdRG5Y1k12ztu2okBtlgUQxk+U4pmVwgzOEYu9sqPknwDozRzxitF/Xbk
gDHJ/0RSopaiTj9+92Q3JGOVPM34Xvt1b9IbCliFFcrosWqvab9oOG3CDRL1LnJ4
s0mq8cNp9Y0fzL7eQBuOxd87oSvyzY5ZRS2cpbP/sENqFS8v6FEqAzJPlew9sZqa
989tMDciT7kW01mH1+TPjboEaVQY0Kj+Qab/2F0Q1mGjBFOFTdBLa8N/YN/AlOLk
b3hFZFXnyl+N6Nprw+cMv/x+EWmPoscXhLwVhXRyr2rfnF0f8Pjx+VebTqxs+3yl
+7H6d6uj6vTp1bewhX8fUbsDJ74DpurXMT9CsJefCrsWWkzBouQ=
=9z2W
-----END PGP SIGNATURE-----

--=-d30hnbTyXbYreNME3Mlg--



--===============4294588869030751703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4294588869030751703==--


