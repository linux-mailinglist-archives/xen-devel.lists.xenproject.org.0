Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43C26DF78
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 17:20:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIvhu-0001Tw-2I; Thu, 17 Sep 2020 15:20:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yDaX=C2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kIvhs-0001To-2G
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 15:20:20 +0000
X-Inumbo-ID: a6b404ed-2946-451f-a481-935c770ed144
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6b404ed-2946-451f-a481-935c770ed144;
 Thu, 17 Sep 2020 15:20:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600356018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S5JXFLUGt+TeJtZQJlzJs2tB8xxAF9D9CNEoj+vflrc=;
 b=m6Bq7lsCFSK3TejQEGLEG44IgxOWj7bk/OlBHyJJrks3UA1/0AWnuBkEN5jA0qEJucm6bN
 gLOXcsuy5b/yPNFdNlwoDQrnKJaP8JjR6X2vl3nzFry9+OLHjC27i9r5WvVFcg9F2PW3yh
 5kc3xmYKdz/vO1kWZVOJ84hqihPSkV2sCHpVpV/1gdTwXHZYOx6rkWLwOxSaE2Fevjty6u
 moJ6N+sOfi+da3mvdfs6HK8s1fBA3PemXPhG4Tnx/U2n47cf3YPExB8+NTKBH+FE+X1Ima
 o3jGrTOlkEs2uZfLq0EBnziJnsAjsgZ3IbkKAhPtc8FgXK8HFuaw4Rcq/d2hPQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B04CB276;
 Thu, 17 Sep 2020 15:20:51 +0000 (UTC)
Message-ID: <5b758105ee47638c36ef19eb3804b76ee19020a8.camel@suse.com>
Subject: Re: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
From: Dario Faggioli <dfaggioli@suse.com>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, 
 =?ISO-8859-1?Q?J=FCrgen_Gro=DF?=
 <jgross@suse.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: xen-devel <xen-devel@dornerworks.com>, Josh Whitehead
 <Josh.Whitehead@dornerworks.com>, George Dunlap <george.dunlap@citrix.com>
Date: Thu, 17 Sep 2020 17:20:14 +0200
In-Reply-To: <CY1P110MB055125447405A5DA2202BF028C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <d2973002-86b5-17b7-cbfa-ba235af75ba3@suse.com>
 <CY1P110MB055125447405A5DA2202BF028C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-sCWw+G32AAlgSeAJ+N8c"
User-Agent: Evolution 3.36.5 (by Flathub.org) 
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-sCWw+G32AAlgSeAJ+N8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-17 at 15:10 +0000, Stewart Hildebrand wrote:
> On Thursday, September 17, 2020 5:04 AM, J=C3=BCrgen Gro=C3=9F wrote:
> > On 16.09.20 20:18, Jeff Kubascik wrote:
> > > This change is an overhaul of the ARINC653 scheduler to enable
> > > CAST-32A
> > > multicore scheduling. CAST-32A specifies that only one partition
> > > (domain) can run during a minor frame, but that domain is now
> > > allowed to
> > > have more than one vCPU.
> >=20
> > It might be worth to consider using just the core scheduling
> > framework
> > in order to achive this. Using a sched_granularity with the number
> > of
> > cpus in the cpupool running ARINC653 scheduler should already do
> > the
> > trick. There should be no further midification of ARINC653
> > scheduler
> > required.
> >=20
>=20
> This CAST-32A multicore patch series allows you to have a different
> number of vCPUs (UNITs, I guess) assigned to domUs.=20
>
Yep, you can have domains with different numbers of vCPUs, when using
core-scheduling (or socket-scheduling, or ...), if this is what you're
asking.

> For example, dom1 has a single vCPU, and dom2 has 4 vCPUs. I didn't
> think the core scheduling framework had this flexibility?
>
It does.

And if you have domain A with 1 vCPU and domain B with 2 vCPUs, with
sched-gran=3Dcore:
- when the vCPU of domain A is scheduled on a pCPU of a core, no vCPU=20
  from domain B can be scheduled on the same core;
- when one of the vCPUs of domain B is scheduled on a pCPU of a core,=20
  no other vCPUs, except the other vCPU of domain B can run on the=20
  same core.

With sched-gran=3Dsocket, the same, with s/core/socket. :-)

So indeed it seems that sched-gran=3DNR_CPUS (actually, number of CPUs in
the pool, as Juergen is saying) may indeed do what you want.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-sCWw+G32AAlgSeAJ+N8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl9jfq4ACgkQFkJ4iaW4
c+49bA/6A3jT5f/N7/jikDz0zHmVcbhBRJ3TsEhuenneO11n7XKgugCKIMyMGy8a
LAALKbA2NJvfBJYWsw7TQkTvSv0Dd47u6NNeY9MM1C99LJcBuHovgUm95rT8xOkT
Q3eGnkqtAGI11g9AClD3rSRPlItBLvv4VrMDDZPIojx4zoeRu6uiAt7TFwuzWEpY
wyFOtmJXDPNyv+4+mMThcPrBOOECKUdw4EWpFXlAXKHsguzxe5EJELMPnnUq9V0Y
k8iCsigUAhbzRHOomy6cm0kCeQ3CdxgGk61LPwLvp7kkt1GhrrUTNz5BS+I7EuBs
qL+tP9mBv6OufWtGwXe7Id9TE96M41ZnGlMGI87W1yA5t7dBEK92wA92pfeafP1m
0+qGAD5iMYx2sIOZ/tP7p5sxjDrV2e3mig51HCHgsGdUceFMim7RdmcHVuSb15DL
XbJ403e2WZ5dBJB4Ikem+JRhrTgUP7IQb4oeSfEfqjiiOJC88mKoXexlpr0Ur9DB
6dTFYSsyu6bCpideBJi7ChqMIYKLd4OHuTwa2ukkyGnA6dZFvvsLK+5Rsjldptwn
L7ykSvMn8oPUxJ3bA++dKtSu6oPqQC08n+O2NRGVo0vh4121g9xlgcHPZLx6+xqR
awQWjxHvxrFHMeIb4pN4LCshScNMtedVOW8PZimazTKpbfC3374=
=F4hE
-----END PGP SIGNATURE-----

--=-sCWw+G32AAlgSeAJ+N8c--


