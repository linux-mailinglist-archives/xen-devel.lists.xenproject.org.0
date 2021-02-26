Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5153265DB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 17:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90465.171262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFgJX-0002Xh-HQ; Fri, 26 Feb 2021 16:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90465.171262; Fri, 26 Feb 2021 16:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFgJX-0002X1-Da; Fri, 26 Feb 2021 16:50:03 +0000
Received: by outflank-mailman (input) for mailman id 90465;
 Fri, 26 Feb 2021 16:50:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsVJ=H4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lFgJW-0002QE-Fm
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 16:50:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a1738df-d4cb-4b78-98c9-ed2f1e89001f;
 Fri, 26 Feb 2021 16:50:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC48BAC6E;
 Fri, 26 Feb 2021 16:50:00 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6a1738df-d4cb-4b78-98c9-ed2f1e89001f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614358200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MQAut+uWR0IdJHP1Ov+l+NFEplJCkTn5IaOK0g2Xjyk=;
	b=ONBBvTbr6p8QbDbDiHLm5T5Kl8Bq6h2SLsqgGICCfeIHXcnzzrjnRNHY/PlcJxsXo4yBlQ
	SaxAH87OErZVODDmIut/D+dAXEfTTWk30colUwje5nH9x/KDXwz98HV7CkEp1ZvvkJVYnH
	tl1WaVWdg3pk5qQO6Fmz5g67gLhnLk4=
Message-ID: <8afb67d3185ecece6853eb04663be088a84d48c5.camel@suse.com>
Subject: Re: [PATCH for-next 3/6] xen/sched: Fix build when NR_CPUS == 1
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, George Dunlap
	 <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Date: Fri, 26 Feb 2021 17:49:59 +0100
In-Reply-To: <eb19a389-d2b3-d0cc-fd25-62bbb121cf98@suse.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
	 <d0922adc698ab76223d76a0a7f328a72cedf00ad.1614265718.git.connojdavis@gmail.com>
	 <b4ad0f83-e071-49f8-17a8-7fec0e226b9a@suse.com>
	 <20210226030833.uugfojf5kkxhlpr7@thewall>
	 <eb19a389-d2b3-d0cc-fd25-62bbb121cf98@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-aaKHRH6qYFvpUc2r7pER"
User-Agent: Evolution 3.38.4 (by Flathub.org) 
MIME-Version: 1.0


--=-aaKHRH6qYFvpUc2r7pER
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-02-26 at 09:31 +0100, Jan Beulich wrote:
> On 26.02.2021 04:08, Connor Davis wrote:
> > On Thu, Feb 25, 2021 at 04:50:02PM +0100, Jan Beulich wrote:
> > > On 25.02.2021 16:24, Connor Davis wrote:
> > > > index 9745a77eee..f5ec65bf9b 100644
> > > > --- a/xen/common/sched/core.c
> > > > +++ b/xen/common/sched/core.c
> > > > @@ -2763,7 +2763,7 @@ static int cpu_schedule_up(unsigned int
> > > > cpu)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 cpumask_set_cpu(cpu, &sched_res_mask);
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 /* Boot CPU is dealt with later in schedul=
er_init(). */
> > > > -=C2=A0=C2=A0=C2=A0 if ( cpu =3D=3D 0 )
> > > > +=C2=A0=C2=A0=C2=A0 if ( cpu =3D=3D 0 || NR_CPUS =3D=3D 1 )
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 if ( idle_vcpu[cpu] =3D=3D NULL )
>=20
> @@ -2769,6 +2769,12 @@ static int cpu_schedule_up(unsigned int
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( cpu =3D=3D 0 )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Guard in particular also against the compiler=
 suspecting out-
> of-bounds
> +=C2=A0=C2=A0=C2=A0=C2=A0 * array accesses below when NR_CPUS=3D1.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 BUG_ON(cpu >=3D NR_CPUS);
> +
>
I would be fine with this.

Actually, I do prefer it too, over the "is index 0 or is the array
length 1" check, which I also find confusing.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-aaKHRH6qYFvpUc2r7pER
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmA5JrcACgkQFkJ4iaW4
c+4F1w/9FQ8Y0D8cR4vdcVl6CzNI8uHXmXEvvjx0NiSID4wm8/gLYIJGhp6DeEv6
7wgI/L85EaYVdUCByR44uS8lnCOeu1SRQOd3Av/drGUtor3zs1f+u1h4umcVKPlr
DibSqQyi4CsjvIWVfakWiYNGzYubQ15YI6KVPfBlxm2iFt6MFuWi8WvQGQgnV9EZ
1DCD+lMkjYvzVbg+G/3B5CqC+6jDp7GrZsS2TmdKhU7A1/xOpQvYGs/GjWXgGO79
xtXO9kRvOVMNjhCwNkWZf620xOg9F8Pqz21xXijDogjv4Ugm7Vdc6vfsV36d8ddv
u8X5YB4GVsrOpU1IrD/GnoZmL6z7cGXzHkFBIb4ywvp4vZGbpzNAiwlgg5+fZa9l
RkCZac6iYZegNv4yY1VwNUI5HGxLBm89/64tO17f/baLdMHHA/mV7rBNtWIuGvD/
51G93wGBHWemZS0P00cOZxVIuG8pk7Hb9n0YsCGrbrX8GCiLEAnac0eVsDikUQ+a
nYvU9IHl7rk1RAli+fteTVaTsqPjmbHvhoo+OiAmeMT/Ssh0YlWef2rB375Bxf9H
VWJXXW56jAJ3tzeVIxd5q1RrYoNTEIpF6Tuoc+APONGU3vWmIpM3CUHGQbVBVnL1
OttplLJla25LOsvQDa1YlYJt9fvbAX5iqBlYLf9fLfZ7HppX2vs=
=S++2
-----END PGP SIGNATURE-----

--=-aaKHRH6qYFvpUc2r7pER--


