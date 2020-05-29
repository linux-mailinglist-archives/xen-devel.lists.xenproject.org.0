Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08E51E78B8
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 10:49:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeahI-00061V-6B; Fri, 29 May 2020 08:49:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsAk=7L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jeahF-00061N-Uj
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 08:48:57 +0000
X-Inumbo-ID: 3b74096c-a189-11ea-81bc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b74096c-a189-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 08:48:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B267BAB3D;
 Fri, 29 May 2020 08:48:55 +0000 (UTC)
Message-ID: <6fcdb69457e5768b0fa2259f83a23158e9c939f5.camel@suse.com>
Subject: Re: [Xen-devel] [RFC 1/9] schedule: Introduce per-pcpu time accounting
From: Dario Faggioli <dfaggioli@suse.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Fri, 29 May 2020 10:48:53 +0200
In-Reply-To: <0e46fc4b29b7c3b3e6b4ca4704b9e7dac5738868.camel@epam.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
 <1568197942-15374-2-git-send-email-andrii.anisov@gmail.com>
 <8c74cacb-ff73-eddc-626c-f6fa862cf5a6@arm.com>
 <f3767489-e46a-3830-8b3c-0b637b71e0b8@gmail.com>
 <0e46fc4b29b7c3b3e6b4ca4704b9e7dac5738868.camel@epam.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-Jlnn4kmmZc/gXVGeGbpT"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-Jlnn4kmmZc/gXVGeGbpT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-05-26 at 02:27 +0000, Volodymyr Babchuk wrote:
> Hello All,
>=20
Hello Volodymyr,

> This is gentle reminder about this RFC.=20
>=20
> Sadly, Andrii Anisov has left our team. But I'm commited to continue
> his work on time accounting and real time scheduling.
>=20
Ok, so, first of all, sorry that this has not been properly addressed.

I personally never forgot about it or anything... Still, I haven't been
able to look into it properly.

> I do realize, that proposed patches have become moldy. I can rebase
> them onto current master, if it would help.=20
>
As a matter of fact, it would. Especially considering that, AFAICT,
this pre-dates core-scheduling.

So, if you're really keen doing such a rebase and resending, I will be
happy to have a look at how it ends up looking like.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Jlnn4kmmZc/gXVGeGbpT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7QzHYACgkQFkJ4iaW4
c+7ypA/8CbBPD3EmaxI68spXbZkuJsC+kYybAazVr7B2PTaQTnQPqL4tDf4h6R8P
Q1gsGH2zdk+8YoXxPGM5Uer4lbk6SRwK0u/KPJuqxTjfsfpYa4n/kgAtZORSbwXk
6eCqLhatSYoLgzWR+9kiq9d5ORAexzO0wUsiiosacynUMMhybTbhidAX2NbItZfL
Ss4gdHx86HGT4ro0DtWuICRG6Rbji6JW40EXrG0e58VGmW+skV0msg1MmdNzNkNm
MrIy1OXNmMqisBNgzHzwKq16M1kW1cYH4QicWPTzIm0pB0mk085M0FzKE6+EnPPR
/qd5sWQKXI2jVoSIxHABoiuLf1Yrc4YKktj6WNPHm/KTZqHkjUP6s/XdOwQCp50m
CmEj0n8zmPMx4AudfCNjdVmE182UhLr6bgXisTKrNV9Mnjz3DVL/CteNMv8ZKAxq
NiH8plUSsd6g7HVSUmFCd/O7W0U2XMiXQphOh82QhOKoneJz/GdJQDkZAcxtEONY
3NWPNHr9VmKc24UNfqwETeWXHcqOjm6Mfb1+PmtX4+kpAek1NuyH6sBCp6sUCE+K
Yl6T051PSWw4CZoCVSi7u1VelSLE9O0bPkMC8xCKto+UetIKb8uyyh9Jw3aIlSbv
p5PG3MLHvkCmzWvPAVABZdUNcrHvuPtWNapeI29hG2zoSxv2rH0=
=xNCK
-----END PGP SIGNATURE-----

--=-Jlnn4kmmZc/gXVGeGbpT--


