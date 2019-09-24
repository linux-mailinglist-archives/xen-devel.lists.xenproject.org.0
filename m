Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE87EBD0AC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:31:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCocn-00045S-6g; Tue, 24 Sep 2019 17:29:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCa0=XT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iCocl-00045L-7h
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:29:15 +0000
X-Inumbo-ID: d3e14f4a-def0-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d3e14f4a-def0-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 17:29:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 907E8AE1C;
 Tue, 24 Sep 2019 17:29:13 +0000 (UTC)
Message-ID: <655618d04190c02caaee22327ea439e332bd9f78.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, Juergen Gross
 <jgross@suse.com>,  xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 19:29:12 +0200
In-Reply-To: <12d5ec32-8f7f-1cba-183c-d61dd8c4c10a@citrix.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <12d5ec32-8f7f-1cba-183c-d61dd8c4c10a@citrix.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 00/47] xen: add core scheduling support
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
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
Content-Type: multipart/mixed; boundary="===============2261908678442183272=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2261908678442183272==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-3FycelopyR/8rbA4eJvE"


--=-3FycelopyR/8rbA4eJvE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-09-24 at 12:15 +0100, Sergey Dyasli wrote:
> Hi Juergen,
>=20
> After an extensive testing of your jgross1/sched-v3 branch in XenRT,
> I'm happy to say that we've found no functional regressions so far
> when running in the default (thread/cpu) mode.
>=20
> Hopefully this gives some level of confidence to this series and the
> plan about including it into 4.13 [1]
>=20
Thanks a lot for doing this, and for letting us know.

Can I ask whether the tests were done using Credit2 (i.e., upstream
default) or Credit1, as scheduler?

Thanks again and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-3FycelopyR/8rbA4eJvE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2KUmgACgkQFkJ4iaW4
c+5Wzg//YOswAY+Z6+mVArrl2rDQru2Hu/7EKcK7vC+ml5deoxIniQR18xzJDIkq
r64roVlbF/Ch9opdhCSBCqUFpC+b8+hUPJTL0I7yVa1lhekoqUpzSaVQQwZUZMGm
ZimPl8+l9Lfjn7CWMSslTTwalQLmfQ4OGP1jlZ2PDbl30B2StsGlkDk3iu+TYi8U
LRyIKClICo9Kg6v9636VAo6mGjTRT7bvoAimdCThCQaRC1IB1509z8nsSO2c7+zc
325JzamwLJPEW5FpqsaCXvTsWtDHyFlLlBl97dd4mqroBN4GNfPhLOz5g4FTtM78
V8i9TVZqlbnFBs7/DdllsOYYHA04roS96hOjmJ/hrJMfKlYj/QTO9cDSW7kx3fvn
7wDFr0PvaDpVN5tIb+/PaD1CBJ/MdJ4fESHglKJ/FyTTDWbLVelT1MVtj5QXkBJH
GZJx5HV8pKuk1CQyjaPd6iDKQ3z0JhZTt6EJ2qMzy9heG70AlEv3pAEcHegearbe
T+DwWRhZg+BkObKgiAt0TWcFn7Hmr5TfdA7jqSBdBE30sJ5FFdfjryUNGyPr1CwF
c32pwI0lHxCoDH9HQhNPWgCWoptn0Z22/G6ryZxGvlU3+18lddBbEYuSfuHDOob3
MEY++3cTBVuf8l1OxvC7mL38B/yNnkHIei2wi6n2E4zEBqM/LGU=
=059b
-----END PGP SIGNATURE-----

--=-3FycelopyR/8rbA4eJvE--



--===============2261908678442183272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2261908678442183272==--


