Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA52FA678
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 17:41:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69890.125268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Xa4-0004Ca-Ib; Mon, 18 Jan 2021 16:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69890.125268; Mon, 18 Jan 2021 16:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Xa4-0004CB-Ew; Mon, 18 Jan 2021 16:40:40 +0000
Received: by outflank-mailman (input) for mailman id 69890;
 Mon, 18 Jan 2021 16:40:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qNeq=GV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l1Xa2-0004C6-M6
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:40:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a37360d-893f-4ee5-9899-2329f4d8e874;
 Mon, 18 Jan 2021 16:40:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0747AC6E;
 Mon, 18 Jan 2021 16:40:36 +0000 (UTC)
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
X-Inumbo-ID: 1a37360d-893f-4ee5-9899-2329f4d8e874
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610988036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lcgGk/fujg1U7gwSm9XZQirf2Fo2HNnmNkGVXFaCYKo=;
	b=rcnPtW7PTvL2UKUZlmWMWI3rjV8WglU9zY1eCyQrF3/giucXRsZvBwWzZDjG1PYmXcpcDN
	WST099jMoW4TAQu0LJygr0nnyukcR3jElm+5hIIpBBJALbUY4MCVtew7IzCqmE0wYf9Lj+
	pdZI6D8Dv+46j733zH8gnDPn7u+zBp0=
Message-ID: <e9d0a07ff4dd8f1d94922f3b8e6b415bfd9ea02f.camel@suse.com>
Subject: Re: IRQ latency measurements in hypervisor
From: Dario Faggioli <dfaggioli@suse.com>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr Babchuk
	 <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Julien Grall <jgrall@amazon.com>, Dario Faggioli <dario.faggioli@suse.com>,
 Bertrand.Marquis@arm.com,  andrew.cooper3@citrix.com
Date: Mon, 18 Jan 2021 17:40:35 +0100
In-Reply-To: <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
References: <87pn294szv.fsf@epam.com>
	 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-H/zas1xRqY+jxbnOyN1v"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-H/zas1xRqY+jxbnOyN1v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-01-14 at 15:33 -0800, Stefano Stabellini wrote:
> On Tue, 12 Jan 2021, Volodymyr Babchuk wrote:
> > 2. RTDS scheduler. With console disabled, things like "hexdump -v
> > =C2=A0=C2=A0 /dev/zero" didn't affected the latency so badly, but anywa=
ys,
> > =C2=A0=C2=A0 sometimes I got ~600us spikes. This is not a surprise, bec=
ause
> > of
> > =C2=A0=C2=A0 default RTDS configuration. I changed period for DomU from
> > default
> > =C2=A0=C2=A0 10ms to 100us and things got better: with Dom0 burning CPU=
 I am
> > =C2=A0=C2=A0 rarely getting max latency of about ~30us with mean latenc=
y of
> > ~9us
> > =C2=A0=C2=A0 and deviation of ~0.5us. On other hand, when I tried to se=
t
> > period
> > =C2=A0=C2=A0 to 30us, max latency rose up to ~60us.
>=20
> This is very interestingi too. Did you get any spikes with the period
> set to 100us? It would be fantastic if there were none.
>=20
This *probably* makes some sense. Where the *probably* comes from the
fact that all the following reasoning assumes that what I recall about
real-time scheduling theory is correct, on which I would not bet.

Perhaps Stefano can ask to my good old friend Marko Bertogna, from the
Univeristy of Modena, as they're collaborating on cache-coloring, what
he his team think. He was already much better than me with this things,
back in the days of the Ph.D... So for sure he's much better than me
know! :-)

Anyway, as I was saying, having a latency which is ~ 2x of your period
is ok, and it should be expected (when you size the period). In fact,
let's say that your budget is Xus, and your period is 30us.=C2=A0This means
that you get to execute for Xus every 30us. So, basically, at time t0
you are given a budget of Xus and you are guaranteed to be able to use
it all within time t1=3Dt0+30us. At that time (t1=3Dt0+30us) you are given
another Xus amount of budget, and you are guaranteed to be able to use
it all within t2=3Dt1+30us=3Dt0+60us.

Now, with a period as small as 30us, your budget is also going to be
pretty small (how much was that? If it was in your mail, I must have
missed it). Are you sure that the vCPU is able to wake up and run until
the point that your driver has done all the latency measurement in
_just_one_ instance (i.e., all this takes less than the budget)?.

In fact, lat's say your budget is 10us, and it the vCPU needs 15us for
waking up and doing the measurements. At time t0 the vCPU is scheduler,
and let's say that the latency at that time is exactly 0. The vCPU
start to run but, at time t0+10us (where 10us is the budget) it is
stopped. at time t1=3Dt0+30us, the vCPU receives a budget replenishment
but that does not mean that it will start to run immediately, if the
system is busy.

In fact, what RTDS guarantees is that the vCPU will be able to execute
for 10us within time t2=3Dt1+30us. So, in theory, it can start to run as
far as t2-10us, without violating any guarantee.

If that is, in fact, what happens, i.e., the vCPU starts to run only at
t2-10us, and it is only then that it manages to finish computing and
recording the latency (after running for 5us more, as we said it takes
15us).

What it will therefore record would be a latency to t2-5us, which in
fact is:

  t1 + 30us - 5us =3D t0 + 30us + 30us - 5us =3D
=3D 0 + 60us - 5us =3D 55us ~=3D 60us

So... May this be the case?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-H/zas1xRqY+jxbnOyN1v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAFugMACgkQFkJ4iaW4
c+4RpA//d1ATNna4dYur2du9GnSiCdUSjVYqiCCzns3VuWDTyVJqxRuxlQo1X8eQ
I22WG9TtMYThFVAKbBYM7urV+QRz+Rk6NTu8tzlIqmtDr+sRb+X5MBpHRC3ZqdLI
Z88QWcH6qgUxF2riloVtmDBUX5K4VR7lQzi/SwTvFRW+PaRMSsJH+jfNvjcnKKj/
M/Urwt1FRxmI27Sk+HuXfmaburXSGXlC+c9Ph0LWgxP6Go7lay+jnlta3z6c6zZM
jn2/r5r5LfEeAq5GBHYC4WCkBvuINkcvtVpUq8a4+9mhozau35bGa9t4eRMMFwLY
FPsv3e6GW8LY221yEQr1VI0R4AHV+jxNMtTVU0H383YsILTAlbOHtvxFZxMdkodo
fNwlaBnTVlK004bhlC9jNEMlkDK+tUWIPl22CW6VWjizjUgDqsm3h8KIW1CjpoVY
zZCX5zWPZgAW5UtsZiMFpIDtKAUmhziwXSVHFfJfPBjJSJHon91oDsWX58yYPSoO
r6aothOkR6tH9pShoqdeDwfozlJhHe5kpBTOlB/himCLyAa+JAS/HVPm3XagCRMX
qYJ8Mv+SHNDGBaM1+O4XUO5zPnOAAuMDiFmBzirubGAe674wdqvvydJYEE2R6axJ
yr5vH+lYCnxI1cDlIIc/+FJevKjc57MRBX0Os2VEHKhlpwGAQbE=
=ZidO
-----END PGP SIGNATURE-----

--=-H/zas1xRqY+jxbnOyN1v--


