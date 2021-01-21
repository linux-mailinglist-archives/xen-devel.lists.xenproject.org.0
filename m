Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8851A2FE53A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 09:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71926.129172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2VVT-00039L-VA; Thu, 21 Jan 2021 08:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71926.129172; Thu, 21 Jan 2021 08:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2VVT-00038w-R4; Thu, 21 Jan 2021 08:39:55 +0000
Received: by outflank-mailman (input) for mailman id 71926;
 Thu, 21 Jan 2021 08:39:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hfWZ=GY=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l2VVS-00038r-Os
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 08:39:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac1957a0-354a-4eec-a5bf-0d749540f39a;
 Thu, 21 Jan 2021 08:39:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0D76AAAE;
 Thu, 21 Jan 2021 08:39:51 +0000 (UTC)
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
X-Inumbo-ID: ac1957a0-354a-4eec-a5bf-0d749540f39a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611218391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=klFNv04A1Hybj05crkH0aOT7to3vpUK20UkoZCAgCHg=;
	b=ETtF1QeWVZUFbBBVJ9ZjATS4fiqu/Ep0otr82o04FTiQ5Xzu6VQXtZrkrf+nEfPP/M7DXa
	iDuu/ZuY0HM6hRqINLBBUt4Ph0J+K9wh7DaFBtkgm0Jj7dzTDwjK22XTjnY15IMkiTHYk7
	o0JqqeVkypDkt8xVGwl9ZnqVwGG+qL8=
Message-ID: <616efdeb8c3bc6bec1c02de05e0cfe0eda5b4e56.camel@suse.com>
Subject: Re: IRQ latency measurements in hypervisor
From: Dario Faggioli <dfaggioli@suse.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Dario Faggioli <dario.faggioli@suse.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, 
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Date: Thu, 21 Jan 2021 09:39:50 +0100
In-Reply-To: <87turb13wp.fsf@epam.com>
References: <87pn294szv.fsf@epam.com>
	 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
	 <e9d0a07ff4dd8f1d94922f3b8e6b415bfd9ea02f.camel@suse.com>
	 <87turb13wp.fsf@epam.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-M2+9Hxe+L0unJ0+QZsZ7"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-M2+9Hxe+L0unJ0+QZsZ7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-01-21 at 01:20 +0000, Volodymyr Babchuk wrote:
> Hi Dario,
>=20
Hi :-)

> Dario Faggioli writes:
> > Anyway, as I was saying, having a latency which is ~ 2x of your
> > period
> > is ok, and it should be expected (when you size the period). In
> > fact,
> > let's say that your budget is Xus, and your period is 30us. This
> > means
> > that you get to execute for Xus every 30us. So, basically, at time
> > t0
> > you are given a budget of Xus and you are guaranteed to be able to
> > use
> > it all within time t1=3Dt0+30us. At that time (t1=3Dt0+30us) you are
> > given
> > another Xus amount of budget, and you are guaranteed to be able to
> > use
> > it all within t2=3Dt1+30us=3Dt0+60us.
>=20
> Well, I'm not sure if I got you right. Are you saying that unused
> budget
> is preserved?
>=20
No, it's not preserved and that's not what I meant... sorry if I did
not manage to make myself clear.

> If I understood it correct, any unused budget is lost. So, basically
> RDTS guarantees that your vcpu will able to run Xus in total every
> Yus,
> where X is the budget and Y is the period.=C2=A0
>
Yep. Every Y, you are given X and you can use it. When, after Y, a new
replenishment happens, you are given X again, so if you did not use all
of X during the previous period, the amount you didn't use is lost.

> Also, it does not guarantee
> that vCPU will be scheduled right away, so for period of 100us and
> budget of 30us it will be perfectly fine to have latency of 70+us:
>=20
Exactly, that kind of more what I was trying to say myself.

In fact, as you say, with period 100 and budget 30, it is perfectly
"legal" for the vcpu to start executing at 70 after the replenishment
(i.e., after the beginning of a new period).

And that is also why, theoretically, the maximum latency between to
consecutive execution of a vcpu could be, in the worst possible case,
2*P-2*B (where, this time, P is the period and B is the budget).

> If at t=3D0 new period begins and in the same time IRQ fires, but RDTS
> decides to run another task, it is possible that your vCPU will be
> scheduled at only t=3D70us.
>
Exactly.

> > What it will therefore record would be a latency to t2-5us, which
> > in
> > fact is:
> >=20
> > =C2=A0 t1 + 30us - 5us =3D t0 + 30us + 30us - 5us =3D
> > =3D 0 + 60us - 5us =3D 55us ~=3D 60us
> >=20
> > So... May this be the case?
>=20
> Yes, probably this is the issue. I used budget of 15us in this
> case. But, taking into account that minimal observed latency is 3us
> and
> typical is ~10us, it is quite possible that budget will be emptied
> before IRQ handler will have a chance to complete.
>=20
Indeed.

> It would be great to have priorities in RTDS, so more critical task
> can
> preempt less critical one.=C2=A0
>
Well, I see from where this comes but it's a dynamic scheduler, so the
priority is given by the (absolute) deadline. The challenge, therefore,
is to determine the proper period and budget to be assigned to each
vcpu, given your workload and your requirement.

With fixed priority schedulers, this "modelling" part could be easier,
but then the scheduler themselves have most of the time worse
performance and only allow you to utilize a fraction of the resources
that you have available.

And adding some kind of priority on top of a dynamic scheduler such as
RTDS --although it may sound appealing when thinking about it-- would
mess up both the theoretical analysis and the implementation of the
algorithm itself, believe me. :-)

> I believe, I have seen corresponding patches
> somewhere...
>=20
Mmm... not sure. Maybe you're referring to how "extratime" is handled?
Because there is a concept of priority in the way it's handled, but
it's mostly an implementation detail.

That being said, was extratime enabled, in your experiments, for the
various vcpus?

Of course, it's not that you can rely on a particular vcpu to be able
to take advantage of it, because it's not how it works. But at the same
time it does not disrupt the real-time guarantees so it's safe to
use... It may be interesting to give it a try.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-M2+9Hxe+L0unJ0+QZsZ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAJPdYACgkQFkJ4iaW4
c+4pZRAA4j1p77DvdAPspZoHTVPT7Rnwh2FM9euryoUH35ba86v0j9q6PR5jGu0T
YNbXxPmQZ6Bcm0ZNhM56PzNci9d/99uTV/dkPClgZH6uOpMvB4Md0lHsylVatebz
CZrrr/gbJZWnOSEeEK0TpNiJD7Qs10yXvH8dOQMEKOaa2XGhcIBbMjfe3JvoQcNQ
OR+ZU6Mp1bnOQRFvuUCn0vpWP3XPRWiL5BJ4a80VyJus3J5kOI9221DN7TIXy4wS
5TwvjuelehZz9vvk5Ojjljsmg3yOGnOsgLJBZHyp9EWk0sOTyoBL1/7d4Wl8oEbz
Gait7JhtBH3Rs+nQHG2D63aZfsSSf41tT6rfcWnFnCNn8DdNWmbSRuqjrfePVmRb
clyAqNrXmjn3FkwmmamFBE8MUGZrNkSP6/HqBTT6kjIesey2IEAFfvzgJFnVWpN7
5HlV0rmWmedoB8UCHh5P7Fed6mUAnTYhGuGr0FY9UTmIiNGuu4TjOG1PTSe8YwaB
ReNTOcb1TeTtPxVPE5bi6YBSWCOwzfrAexKqlLLp+yD38vNKweW6GAqKk2EADz4C
P4RFAk1L1ccKuRKaCcGf88zKs8yTFpj/5/QIvCIf0eqmnA4DZN3JZppmN9AYGHwH
OLTgi9v2ivNfpvw8b/iErZ4gOhuHNoqGPEFHolRPSUwmJeL44oQ=
=/CT7
-----END PGP SIGNATURE-----

--=-M2+9Hxe+L0unJ0+QZsZ7--


