Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B462304C29
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 23:32:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75581.136071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4WsH-000054-BE; Tue, 26 Jan 2021 22:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75581.136071; Tue, 26 Jan 2021 22:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4WsH-0008WJ-7g; Tue, 26 Jan 2021 22:31:49 +0000
Received: by outflank-mailman (input) for mailman id 75581;
 Tue, 26 Jan 2021 22:31:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9oD3=G5=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l4WsE-0008W9-Sa
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:31:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4496c6b3-e2f5-40a1-a6d4-5bb6846b0618;
 Tue, 26 Jan 2021 22:31:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78712AC45;
 Tue, 26 Jan 2021 22:31:44 +0000 (UTC)
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
X-Inumbo-ID: 4496c6b3-e2f5-40a1-a6d4-5bb6846b0618
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611700304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0inrEoG8j3MsQWDTfECgTBgoc5Mxn6inq4iNnzNvKk=;
	b=Glcl8oampEFX9zXBCJdoYxAR2zXTmomgbrIbQlcSWpXe/NYr4nyx/MdB0+9Yj18D7kpn3W
	08zWfmwvZAkd45hY/kPc+pzpLAQ/ogjLovy+9w40nO7zoinK7sHO3UQd62BSwcbbafVFbt
	GPEvo40T89BZIcE7Wd8A0k4dplFzu0M=
Message-ID: <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
Subject: Re: Null scheduler and vwfi native problem
From: Dario Faggioli <dfaggioli@suse.com>
To: Anders =?ISO-8859-1?Q?T=F6rnqvist?= <anders.tornqvist@codiax.se>, 
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Tue, 26 Jan 2021 23:31:43 +0100
In-Reply-To: <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
	 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
	 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
	 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
	 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
	 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
	 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
	 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VInu8jmLG3qhqV931E4u"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-VInu8jmLG3qhqV931E4u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-01-26 at 18:03 +0100, Anders T=C3=B6rnqvist wrote:
> On 1/25/21 5:11 PM, Dario Faggioli wrote:
> > On Fri, 2021-01-22 at 14:26 +0000, Julien Grall wrote:
> > > Hi Anders,
> > >=20
> > > On 22/01/2021 08:06, Anders T=C3=B6rnqvist wrote:
> > > > On 1/22/21 12:35 AM, Dario Faggioli wrote:
> > > > > On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
> > > > - booting with "sched=3Dnull vwfi=3Dnative" but not doing the IRQ
> > > > passthrough that you mentioned above
> > > > "xl destroy" gives
> > > > (XEN) End of domain_destroy function
> > > >=20
> > > > Then a "xl create" says nothing but the domain has not started
> > > > correct.
> > > > "xl list" look like this for the domain:
> > > > mydomu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=
=A0=C2=A0 512=C2=A0=C2=A0=C2=A0=C2=A0 1 ------
> > > > 0.0
> > > This is odd. I would have expected ``xl create`` to fail if
> > > something
> > > went wrong with the domain creation.
> > >=20
> > So, Anders, would it be possible to issue a:
> >=20
> > # xl debug-keys r
> > # xl dmesg
> >=20
> > And send it to us ?
> >=20
> > Ideally, you'd do it:
> > =C2=A0 - with Julien's patch (the one he sent the other day, and that
> > you
> > =C2=A0=C2=A0=C2=A0 have already given a try to) applied
> > =C2=A0 - while you are in the state above, i.e., after having tried to
> > =C2=A0=C2=A0=C2=A0 destroy a domain and failing
> > =C2=A0 - and maybe again after having tried to start a new domain
> Here are some logs.
>=20
Great, thanks a lot!

> The system is booted as before with the patch and the domu config
> does=20
> not have the IRQs.
>=20
Ok.

> # xl list
> Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ID=C2=A0=C2=A0 Mem VCPUs State=C2=A0=C2=A0=C2=A0
> Time(s)
> Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0 3000=C2=A0=C2=A0=C2=A0=C2=A0 5 r-----=C2=A0=C2=A0=C2=A0=C2=A0
> 820.1
> mydomu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 1=C2=A0=C2=A0 511=C2=A0=C2=A0=C2=A0=C2=A0 1 r-----=C2=A0=C2=A0=
=C2=A0=C2=A0
> 157.0
>=20
> # xl debug-keys r
> (XEN) sched_smt_power_savings: disabled
> (XEN) NOW=3D191793008000
> (XEN) Online Cpus: 0-5
> (XEN) Cpupool 0:
> (XEN) Cpus: 0-5
> (XEN) Scheduler: null Scheduler (null)
> (XEN) =C2=A0=C2=A0=C2=A0 cpus_free =3D
> (XEN) Domain info:
> (XEN) =C2=A0=C2=A0=C2=A0 Domain: 0
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 1: [0.0] pcpu=3D0
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 2: [0.1] pcpu=3D1
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 3: [0.2] pcpu=3D2
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 4: [0.3] pcpu=3D3
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 5: [0.4] pcpu=3D4
> (XEN) =C2=A0=C2=A0=C2=A0 Domain: 1
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 6: [1.0] pcpu=3D5
> (XEN) Waitqueue:
>
So far, so good. All vCPUs are running on their assigned pCPU, and
there is no vCPU wanting to run but not having a vCPU where to do so.

> (XEN) Command line: console=3Ddtuart dtuart=3D/serial@5a060000=20
> dom0_mem=3D3000M dom0_max_vcpus=3D5 hmp-unsafe=3Dtrue dom0_vcpus_pin=20
> sched=3Dnull vwfi=3Dnative
>
Oh, just as a side note (and most likely unrelated to the problem we're
discussing), you should be able to get rid of dom0_vcpus_pin.

The NULL scheduler will do something similar to what that option itself
does anyway. And with the benefit that, if you want, you can actually
change to what pCPUs the dom0's vCPU are pinned. While, if you use
dom0_vcpus_pin, you can't.

So it using it has only downsides (and that's true in general, if you
ask me, but particularly so if using NULL).

> # xl destroy mydomu
> (XEN) End of domain_destroy function
>=20
> # xl list
> Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ID=C2=A0=C2=A0 Mem VCPUs State=C2=A0=C2=A0=C2=A0
> Time(s)
> Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0 3000=C2=A0=C2=A0=C2=A0=C2=A0 5 r-----=C2=A0=C2=A0=C2=A0
> 1057.9
>=20
> # xl debug-keys r
> (XEN) sched_smt_power_savings: disabled
> (XEN) NOW=3D223871439875
> (XEN) Online Cpus: 0-5
> (XEN) Cpupool 0:
> (XEN) Cpus: 0-5
> (XEN) Scheduler: null Scheduler (null)
> (XEN) =C2=A0=C2=A0=C2=A0 cpus_free =3D
> (XEN) Domain info:
> (XEN) =C2=A0=C2=A0=C2=A0 Domain: 0
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 1: [0.0] pcpu=3D0
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 2: [0.1] pcpu=3D1
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 3: [0.2] pcpu=3D2
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 4: [0.3] pcpu=3D3
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 5: [0.4] pcpu=3D4
> (XEN) =C2=A0=C2=A0=C2=A0 Domain: 1
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 6: [1.0] pcpu=3D5
>
Right. And from the fact that: 1) we only see the "End of
domain_destroy function" line in the logs, and 2) we see that the vCPU
is still listed here, we have our confirmation (like there wase the
need for it :-/) that domain destruction is done only partially.

> # xl create mydomu.cfg
> Parsing config from mydomu.cfg
> (XEN) Power on resource 215
>=20
> # xl list
> Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ID=C2=A0=C2=A0 Mem VCPUs State=C2=A0=C2=A0=C2=A0
> Time(s)
> Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0 3000=C2=A0=C2=A0=C2=A0=C2=A0 5 r-----=C2=A0=C2=A0=C2=A0
> 1152.1
> mydomu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2=C2=A0=C2=A0 512=C2=A0=C2=A0=C2=A0=C2=A0 1 ------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.0
>=20
> # xl debug-keys r
> (XEN) sched_smt_power_savings: disabled
> (XEN) NOW=3D241210530250
> (XEN) Online Cpus: 0-5
> (XEN) Cpupool 0:
> (XEN) Cpus: 0-5
> (XEN) Scheduler: null Scheduler (null)
> (XEN) =C2=A0=C2=A0=C2=A0 cpus_free =3D
> (XEN) Domain info:
> (XEN) =C2=A0=C2=A0=C2=A0 Domain: 0
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 1: [0.0] pcpu=3D0
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 2: [0.1] pcpu=3D1
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 3: [0.2] pcpu=3D2
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 4: [0.3] pcpu=3D3
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 5: [0.4] pcpu=3D4
> (XEN) =C2=A0=C2=A0=C2=A0 Domain: 1
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 6: [1.0] pcpu=3D5
> (XEN) =C2=A0=C2=A0=C2=A0 Domain: 2
> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 7: [2.0] pcpu=3D-1
> (XEN) Waitqueue: d2v0
>
Yep, so, as we were suspecting, domain 1 was not destroyed properly.
Specifically, we did not get to the point where the vCPU is deallocated
and the pCPU to which such vCPU has been assigned to by the NULL
scheduler is released.

This means that the new vCPU (i.e., d2v0) has, from the point of view
of the NULL scheduler, no pCPU where to run. And it's therefore parked
in the waitqueue.

There should be a warning about that, which I don't see... but perhaps
I'm just misremembering.

Anyway, cool, this makes things even more clear.

Thanks again for letting us see these logs.
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-VInu8jmLG3qhqV931E4u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAQmE8ACgkQFkJ4iaW4
c+7ZnBAA0riQUE8VqNsbzyOyH0tZgMdR4WvqV284aah+VWhr9b60LOsTpm7vX0TM
TD0KKTzsaUIpTgg5knJuqpNcqLIVbU/lHAODhZxJABnvpqfSrfMkh1XK+w0WrBLc
6/Nou7yAgNpHcvlrhrJJY3jPvYdKV4rpXyK7mzPjKTU5s1ECTKijgN3mD3Q9AHNU
91MpqUT75VAMF+ubqacoTuHeTFuHnvOf1tFx+DYsI0DLz4ceETU0q3ssIeuBkePX
zhnNBP008QK9uVIuinEQ08WRWA3GTwU9E46zAJQAOSZd4ZNaebWTFfHIlSG0p74W
GFnpMnWnXZ2fCb4nBaHDlCN+MtvlvGH+bLRTYrtNDsD4e70N4HAFkW7TlbF5v34l
nfB0O1o+pujnDcFU7/EqUHuugRGxAFPaO2HwDskfR6JBZJs1QX41Bs6BzGmO6uyo
6OUvW4wVnQRabT3tzS7p1klU5JIL7UJPF+2tobf1QseEve2i+tQoSUkC3Ye6RP/M
MuzafcAJDkVVMzI8bbVTLYhGr9vGU+SpFEsatA4XtUoTqvEkNYJCHCESqq69K5bJ
ZWpYCy7dRFGF2L3aZ4gCprEOwlo+I9JGvgjB3YGPPBSnXSS7rruw/EZMN1ip8SPz
1ZokdsTFWgYftV+VUqh3w8p22x3Zv3Aqz60pFU99j/Qh5twCAos=
=AODH
-----END PGP SIGNATURE-----

--=-VInu8jmLG3qhqV931E4u--


