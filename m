Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E904C0254
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:28:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDmVV-0000MD-Hj; Fri, 27 Sep 2019 09:25:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDmVU-0000M6-2Q
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:25:44 +0000
X-Inumbo-ID: c6faa2d0-e108-11e9-9672-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c6faa2d0-e108-11e9-9672-12813bfff9fa;
 Fri, 27 Sep 2019 09:25:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19065ABE9;
 Fri, 27 Sep 2019 09:25:42 +0000 (UTC)
Message-ID: <4a4c4238fdd9503dc4f01d526b1d2dcdf0170865.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 11:25:40 +0200
In-Reply-To: <20190927070050.12405-26-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-26-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 25/46] xen/sched: add runstate counters
 to struct sched_unit
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============8887710698144263190=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8887710698144263190==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YTbzsh9HgH0JQDQrNYGO"


--=-YTbzsh9HgH0JQDQrNYGO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> Add counters to struct sched_unit summing up runstates of associated
> vcpus. This allows doing quick checks whether a unit has any vcpu
> running or whether only a single vcpu of a unit is running.
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


--=-YTbzsh9HgH0JQDQrNYGO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2N1ZQACgkQFkJ4iaW4
c+6L0Q//ZKVE1dG3McOBiTXiHrXm0ZY6hUEaeaGbKMbX1LfR1waIELql+ArAVeBP
Qm/+zMbZ8mNgr2xUyIfhQYbY3zr5zTYprYiu0i542sTPaOpyPjTfoKd2dTY8csly
dYL3FiNb9b19FPJeNleQk91MpoDIce0o3diklQHk4uCJQN/JEYaPoxUko/IBgeOk
7A/ADsj4UUHM6D3A8/lmC+NA/FBYaP8yfFxlGJsDLlu5THjoqW5REpkgnq5kQhAA
jCvqjVzz0AvGgjJ1FgXLooM9/O3qIx/lDYb8jhpu5VKrhRj3+lCZ1dfFOZy4Xytu
9BY5c/6lzF16MMnxSJ6D6Yb3HdYnQfzBq2cAZX/99tE90BlRHHkFW473d6/5JrED
eOpv6IKf9LW8sZE+5E0dIv9ky7Z6cxdXvv/cGSWdc3TvkUncFJdN6v01KWBXB1OL
Hes1t9fzmP32YsYcY6sjJMCLrDnKH8ReVH6IZXJSr4gSotYstDJnmMu8p7RGhJvw
PN17hW6rJ++4WYiEhSi74gSZBiSmop1KOR+mpAG3PyLmYrp9VsgeThRHLLmmpY0p
KLRqwuukUX+GOCuMRpa2N2nhQrif+KHiQuoYDmUjZA0/hNXxteUYQgoCmWOLxOzB
0ZhbG3tEhI6x1MKxO1B8KZ8t/DaOXU36gW6wWzN+qWe8Hq4roZQ=
=urRS
-----END PGP SIGNATURE-----

--=-YTbzsh9HgH0JQDQrNYGO--



--===============8887710698144263190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8887710698144263190==--


