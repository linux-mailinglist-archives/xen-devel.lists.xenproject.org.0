Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC3A17A1C2
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 09:57:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9mGa-00033N-2l; Thu, 05 Mar 2020 08:54:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwMB=4W=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j9mGY-00033I-VY
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 08:54:02 +0000
X-Inumbo-ID: dbafc24e-5ebe-11ea-a529-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbafc24e-5ebe-11ea-a529-12813bfff9fa;
 Thu, 05 Mar 2020 08:54:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AA97FAC91;
 Thu,  5 Mar 2020 08:54:00 +0000 (UTC)
Message-ID: <ae66ce58d2548deaab15d1f430e2aa7a41448ce1.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 05 Mar 2020 09:53:59 +0100
In-Reply-To: <E1j9RHW-0007Ya-1K@osstest.test-lab.xenproject.org>
References: <E1j9RHW-0007Ya-1K@osstest.test-lab.xenproject.org>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [linux-linus bisection] complete
 test-amd64-amd64-xl-credit2
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============4118226156235631889=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4118226156235631889==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QIhnFtnv/mfvnJtU2Lua"


--=-QIhnFtnv/mfvnJtU2Lua
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-03-04 at 10:29 +0000, osstest service owner wrote:
> branch xen-unstable
> xenbranch xen-unstable
> job test-amd64-amd64-xl-credit2
> testid guest-start
>=20
I was having a look at this. A question:

> Tree: linux
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: seabios git://xenbits.xen.org/osstest/seabios.git
> Tree: xen git://xenbits.xen.org/xen.git
>=20
> *** Found and reproduced problem changeset ***
>=20
>   Bug is in tree:  linux
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
>   Bug introduced:  98d54f81e36ba3bf92172791eba5ca5bd813989b
>   Bug not present: d6d5df1db6e9d7f8f76d2911707f7d5877251b02
>   Last fail repro:=20
> http://logs.test-lab.xenproject.org/osstest/logs/148053/
>=20
In OSSTest, we don't capture and save the guest serial console output,
or do we?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-QIhnFtnv/mfvnJtU2Lua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5gvicACgkQFkJ4iaW4
c+5XRg//cCm7th8Nr49tNXUHNIkx91qKDmeZefUeEPNzjFOP/qcM8JBcNK3H/vl1
st5xSrH8Qa5+YtAQG6nLU8i4Ct0NEuM+NSSzzafguc7U5Ihy1CD5dHPKY/G7peyx
I+RXto91SUJCysjFhs7lLxkwWNi1uoZMDn24zguvGy8rz4NjCUMgaclKW75t/3Ev
WNiPpwXELYlKqE4YoYSibGXxjj/D2MsTh3PilRwRMJTpSaQD671tXkR9xYL0sjFE
bE76IWNgaZYbKQ0+NlXyekdXRLN4N0QtczvGhrvmjn6IDs8/ckdmSGnM3pQOcc3a
k/pSLZyJKphXNLXFC0BfQuGznYTQqxngA/1E8Pzkr4jSWmuX/JfUmMXvCiymMuOK
gJaoTrsvb7Phy/MRH7WwhpfHLJlj5qtWSeOsDcGJ1scLQpTUu/8ZhAF6EGf1FPtF
7iCxSofs/ci4vxkW+M5xPOPMV00Iqtf1YQLXPzLw4szozX1cva/9ZCoxDSQ3C9bv
uexPIFME1AlFHphfTsIEmgbshGYCwoToakUzC10GuIjidf7sIZPUvvJL5bdpa6Ry
6z5DXjccSBod7NFEMFcw3Dtn2qdwg26wGrc+PEwgEtrMM6Dfl2Tw4wx7J5dMrZFH
1UCpRuBlf7N68F1naYxDJLPXGx/9H0GRvEQz6OGsPcb2JEWLPeQ=
=CF6C
-----END PGP SIGNATURE-----

--=-QIhnFtnv/mfvnJtU2Lua--



--===============4118226156235631889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4118226156235631889==--


