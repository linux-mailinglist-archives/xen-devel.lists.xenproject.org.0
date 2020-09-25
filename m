Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E812793B5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 23:43:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLvU1-0002Cu-U6; Fri, 25 Sep 2020 21:42:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEdM=DC=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kLvU0-0002Cp-Q1
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 21:42:24 +0000
X-Inumbo-ID: eb7d0a93-4281-4cf9-8e76-8aa53950fbb6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb7d0a93-4281-4cf9-8e76-8aa53950fbb6;
 Fri, 25 Sep 2020 21:42:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601070142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=brdiBX7/pBWvJkYovNB/4PjqQQ3M4l1nathoh2+W3TY=;
 b=U6vwwfmctLWa0di2iqdhCFmT6r9yM8GrNJv9E2W5zhyphSn2s6oKiaOzIv3sDoai5GfOjq
 +eBlOtFIpUXhVrWuD86POo/kimzwIyWhAC0jVPpzP7OKsb628c396ilafsh3bvXb2EJBWY
 mtSLv6BsZK2ujhF7rNz3S499PNALZNY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B328CAB9F;
 Fri, 25 Sep 2020 21:42:22 +0000 (UTC)
Message-ID: <d90516dcec0443bfbdce93e9ef2c87b93a7a6bc8.camel@suse.com>
Subject: Re: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
From: Dario Faggioli <dfaggioli@suse.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
 "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>, 
 "jbeulich@suse.com"
 <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "ian.jackson@eu.citrix.com"
 <ian.jackson@eu.citrix.com>, "george.dunlap@citrix.com"
 <george.dunlap@citrix.com>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>
Date: Fri, 25 Sep 2020 23:42:20 +0200
In-Reply-To: <87r1qpa9pk.fsf@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-3-volodymyr_babchuk@epam.com>
 <a40aac2a-326b-9efa-fed3-49826bb2ff9c@suse.com>
 <daf3aa1c6fa565076755437e7e74347b58e3a9b6.camel@epam.com>
 <918fa2e1-232c-a3ff-d0a9-776b470ee5db@suse.com> <87d02bavz7.fsf@epam.com>
 <66880caef018abdbf9fe99116594a2826efcb603.camel@suse.com>
 <87r1qpa9pk.fsf@epam.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-kGkEgoXDetvzxsez2QPr"
User-Agent: Evolution 3.38.0 (by Flathub.org) 
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


--=-kGkEgoXDetvzxsez2QPr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-09-25 at 20:21 +0000, Volodymyr Babchuk wrote:
> Hi Dario,
>=20
Hi! :-)

> Dario Faggioli writes:
> > And what about the cases where schedule() does return?
>=20
> Can it return on x86? I want to test this case, but how force it?
> Null
> scheduler, perhaps?
>=20
> > Are these also fine because they're handled within __do_softirq()
> > (i.e., without actually going back to do_softirq() and hence never
> > calling end_hyp_task() for a second time)?
>=20
> I afraid, that there will be a bug. schedule() calls end_hyp_task(),
> and
> if it will eventually return from __do_softirq() to do_softirq(),
> end_hyp_task() will be called twice.
>
Yeah, exactly. That's why I was asking whether you had verified that we
actually never get to this. Either because we context switch or because
we stay inside __do_schedule() and never go back to do_schedule().

I was, in fact, referring to all the various cases of handling primary
and secondary scheduling request, when core-scheduling is enabled.

> > > I have put bunch of ASSERTs to ensure that vcpu_begin_hyp_task()
> > > or
> > > vcpu_end_hyp_task() are not called twice and that
> > > vcpu_end_hyp_task()
> > > is
> > > called after vcpu_begin_hyp_task(). Those asserts are not
> > > failing, so
> > > I
> > > assume that I did all this in the right way :)
> > >=20
> > Yeah, good to know. :-)
> >=20
> > Are you doing these tests with both core-scheduling disabled and
> > enabled?
>=20
> Good question. On x86 I am running Xen in QEMU. With -smp=3D2 it sees
> two
> CPUs:
>=20
> (XEN) Brought up 2 CPUs
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
>=20
> You are right, I need to try other variants of scheduling
> granularity.
>=20
> Do you by any chance know how to emulate more complex setup in QEMU?
>
Like enabling a virtual topology, on top of which you could test core
(or socket) scheduling? If yes, indeed you can do that in QEMU:

https://www.qemu.org/docs/master/qemu-doc.html

-smp [cpus=3D]n[,cores=3Dcores][,threads=3Dthreads][,dies=3Ddies]
     [,sockets=3Dsockets][,maxcpus=3Dmaxcpus]

Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
are supported. On Sparc32 target, Linux limits the number of usable
CPUs to 4. For the PC target, the number of cores per die, the number
of threads per cores, the number of dies per packages and the total
number of sockets can be specified. Missing values will be computed. If
any on the three values is given, the total number of CPUs n can be
omitted. maxcpus specifies the maximum number of hotpluggable CPUs.

Once you have an SMT virtual topology, you can boot Xen inside, with an
higher scheduling granularity.

A (rather big!) example would be:

-smp 224,sockets=3D4,cores=3D28,threads=3D2

You can even define a virtual NUMA topology, if you want.

And you can pin the vCPUs to the physical CPUs of the hosts, in such a
way that the virtual topology is mapped to the physical one. This is
good for performance but also increase a little bit the accuracy of
testing.

> Also, what is the preferred way to test/debug Xen on x86?
>=20
I test on real hardware, at least most of the times, if this is what
you're asking.

Checking if the code is "functionally correct" is ok-ish if done in a
VM first. But then, especially for scheduling related things, where
timing plays a rather significant role, I personally prefer to test on
actual hardware sooner rather than later.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-kGkEgoXDetvzxsez2QPr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl9uZD0ACgkQFkJ4iaW4
c+4+vQ//f99XEctFDArSu6mPKwgyEga+Ch0ZJi7fy1RV7V4R5O7um+gbsdS5xkPI
Fb3ifZNk2JnQGLmovBqBT58G8SBzkVSpLS5Vo+PuBk9rdcP332jzz029Be4UmZqg
3FLkQd5TTetWeGILbgRa++0fu6V+5eKiP320O2zhEo5uLdKye9rOHx7v/Go1Hlms
94CBuBhoNiaxvw1cx8tScCBGLUC2a8jLP1ZTF66CBZ2/XBLzcILrZ7oS+cwFzoMY
c1R2zbILmdJAiyXhMzHajV02040O2v4x1W8Fts3aFj1yYTSJjw1dr7uR6/dkGkeA
Lyc0NGP52XoFQG5hXY1h9eMfzS51WKldAwLSrEbIUAC+Lq9QVZc1zbaQQ7aGJU9N
Lw634ZMV0U1s4u7w8iX2YBh5zU3F+BV18lkyVPYF8DFGzS7b0onGZDCP7kCSMPt1
WfSOKQnmibFQ8gaIr/2D438f15FuQQPnZVn9VHDRDTHkpWsbAIO8DwYkiLdDxEDt
QZK8xs8PFKoueCV4YF6wzjLZpsejyG67eWDQf45/01H7+xbSJ5CE84t37NFm46EZ
Q2ACtc/Lev3f32qajTUQADCqXGSwodD+V7X3Bw/+241iPB5yAmQZwW0H4mLHGYQS
wOtRyAJo2gjeJDoyYk+lz4ue7nc0MqrLeCc1tUh483c/Bm8jwEU=
=Hf6u
-----END PGP SIGNATURE-----

--=-kGkEgoXDetvzxsez2QPr--


