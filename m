Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4E5C09B0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 18:38:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDtCa-0004Zc-Iz; Fri, 27 Sep 2019 16:34:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDtCY-0004ZX-V3
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 16:34:38 +0000
X-Inumbo-ID: b232c738-e144-11e9-967f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id b232c738-e144-11e9-967f-12813bfff9fa;
 Fri, 27 Sep 2019 16:34:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E777AAC8C;
 Fri, 27 Sep 2019 16:34:36 +0000 (UTC)
Message-ID: <eb38fc47cc2552f7017ad376ef8dcbc582a8338d.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 18:34:34 +0200
In-Reply-To: <20190927070050.12405-1-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 00/46] xen: add core scheduling support
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
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============2462960167009030763=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2462960167009030763==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-auKuof+77zDgrmGn2Vtt"


--=-auKuof+77zDgrmGn2Vtt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> Add support for core- and socket-scheduling in the Xen hypervisor.
>=20
Ok, I think I've reviewed all the patches. They all should have the
appropriate tag for going in (unless I've missed any) except patch 35,
for which I've asked more comments this morning.

If the patch have to go in by today, I guess I'm fine with that patch
going in as it is (i.e., committers can add my `Reviewed-by:`), as far
as the additional comments come in a follow-up patch as soon as
possible.

Thanks and Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-auKuof+77zDgrmGn2Vtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2OOhsACgkQFkJ4iaW4
c+4mEQ//Q3su2OpxXc8hIXgEbW7r5vHq5CFUHYo9A13kF/WjSr/3gaatqUHyirxL
hb05ekOTBDr0zHzkhIelxmWz6fiRz0Ar9ZhUOjlMAHd2dsR8un0BgW5tk6aQ2+3J
gGWc7lexx0OyLNitYHF0cO4Pm9rB/09wA7ozCUSsTilWEgRWho9kicCpPKFNP3uQ
3EVqZJzn0tzslgYuv9vRc0sOu1rOQcdrpErjxoqRCOuxgZrxP+bIW0CAfJdSs8C1
gudtYlHIuUf8ds+Scg1xTKEQ0oCuay+Q6yXHqZ1sVKcAYtx40ffFBFdqe2r9XpAw
xWKSwEv3UfyrfH4Uz+wW6ASxdz7ArUaGnL6WVg/EQI/Uagme1Hb86+HBnbWn6CPc
w8psP0HGsledqWPitF0mGc2C0q2y+IuTe3XUlyFBuwwH+Ao0CzkhxyTaufxsDMt3
sMPdfE+5ttGOtSo4EfPD3GnlKoAQpZXy/3n2OKoxyWt1RXu1fstf0jm9EaNIni+b
HnArwAwxSIZYcoMIeq3zztbXNJOXCCXDhrCUAWBZKI55TMCrBERiLTRfqDQwOfNZ
q9eI2vP9unRhpMjt4dRBwAJDXfQKMW+Kv77hpbkN+08Zb8FPZJxh/yhK/mepIh7r
l1CB2zzi62O5vGMzh6JAdSZcmxMYQl1PjPlhMz1P44MTpmlFvYc=
=NKM0
-----END PGP SIGNATURE-----

--=-auKuof+77zDgrmGn2Vtt--



--===============2462960167009030763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2462960167009030763==--


