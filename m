Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE92BE139
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:26:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD98n-0005qB-AF; Wed, 25 Sep 2019 15:23:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iD98l-0005pw-V8
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:23:40 +0000
X-Inumbo-ID: 72bd3aa4-dfa8-11e9-9636-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 72bd3aa4-dfa8-11e9-9636-12813bfff9fa;
 Wed, 25 Sep 2019 15:23:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0C778ACA5;
 Wed, 25 Sep 2019 15:23:38 +0000 (UTC)
Message-ID: <8e5e63c80905b62baa7ee552ecdeb7399e4a73f3.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 17:23:36 +0200
In-Reply-To: <20190914085251.18816-13-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-13-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 12/47] xen/sched: switch struct
 task_slice from vcpu to sched_unit
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
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============0072877754128793539=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0072877754128793539==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0f2E2+JPRkNhBNaICWUG"


--=-0f2E2+JPRkNhBNaICWUG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Let the schedulers put a sched_unit pointer into struct task_slice
> instead of a vcpu pointer.
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


--=-0f2E2+JPRkNhBNaICWUG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2LhngACgkQFkJ4iaW4
c+73zhAAy4LU0b1vcQkrp9fqH3b7jTsagFhwWE51hAxEhDpI8H03CSBTMp6L7ljV
Zc7nPoByTAjHcCct/cGcdqnGTFQFaSrZRyxJvAWN7+uY1fsz0vXQDQ91cs0Tsf+G
ZgUxGoEZbZse7AtaN7NyhLvsw1vw1prCmTIEFufe4WIIhC7gv6Hbe4EN6cxr1Ayi
zbQqep9PH60I4K+OQYXiC6QK0NWr6rbkyNvwUklgte31yWd+fTSToSFCjfPlc07t
VsTtPTwwrTAD9PWM2Edgo/7BI2tJVlDP/7z/FyqT61Y9wjNRZFwqdkrIEFWJqSPK
CVP1dEMxFN1jH6yLbQG3kKFUlHgxlxYvTHMMOULOx1CbHB+5RsYqvzcsEm8U6xP4
6xbPihdli00snU/5mRZAdXkxo12nZkdiAfQgjmQUsySUIAw+EbVir11Ym+SdxO2D
XofizgixwAocB8KVLK1NKg0w/3dbVscY167/zmWSSaDa1aUNgTLHnKL6Mii8L+3I
XKZC/Jj+M6jE7DMu5RKxESFx6xd5e7ZllZlkkSzxTfslViCKcd+PhjjlQ/lxOtQI
fQzw3HGB+Ae8XFCdC+WH40asrsW81uSeqodmiWMh/He4sq49ZA2SDxKlINpV09Sb
aEdBIxnI2CHpor1FGWR9sPEMjv5mYqThDk4r9ZHKkbZK2moZDEo=
=xSCf
-----END PGP SIGNATURE-----

--=-0f2E2+JPRkNhBNaICWUG--



--===============0072877754128793539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0072877754128793539==--


