Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3572E1DCF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 16:15:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58440.102767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5rM-00009z-Kd; Wed, 23 Dec 2020 15:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58440.102767; Wed, 23 Dec 2020 15:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5rM-00009d-HT; Wed, 23 Dec 2020 15:15:28 +0000
Received: by outflank-mailman (input) for mailman id 58440;
 Wed, 23 Dec 2020 15:15:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AJ0=F3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ks5rL-00009Y-0A
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 15:15:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f3677ce-9221-40dc-8940-8c101ed97748;
 Wed, 23 Dec 2020 15:15:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37421AD11;
 Wed, 23 Dec 2020 15:15:25 +0000 (UTC)
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
X-Inumbo-ID: 3f3677ce-9221-40dc-8940-8c101ed97748
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608736525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=emcZMgo805YLJCo94uv+HM2FTIjdYN8Q4gRanWD1aCA=;
	b=KI4czuQRIqvGPV2XjDrm30OeQLVwerXoM5/2xlzaEbAzfSWa3/tjWbtCZSax9c2CvLgA0K
	qmk3o1XOnhlCxutTkxOlybN977Jg77TWXI7P2O9UTWrdKEAGm1zZYGTUyooGF9yRK5SzrD
	U11KdF2DRH4q3AUeyEJ1jq8ogu8AYQo=
Message-ID: <8fef72e972b00f89eb460b292298d755207d9501.camel@suse.com>
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Dylanger Daly
 <dylangerdaly@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Wed, 23 Dec 2020 16:15:24 +0100
In-Reply-To: <5db65e32-31aa-57a5-f82b-ebe497f493f5@suse.com>
References: 
	<9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
	 <72589937-a918-96c8-4589-6d30efaead9a@suse.com>
	 <U00A4lb9CgpRhV9huYxk5kvyAAam9UcFJ7h2K1a6-M84ef8W58V4Shq7hmU5WKh3rKaVRl6EiTXVmDc-czrBJvyf7h1mjh3Dc3SPvj8qIog=@protonmail.com>
	 <5db65e32-31aa-57a5-f82b-ebe497f493f5@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7l6Sh3Yimzwl2y153BMe"
User-Agent: Evolution 3.38.2 (by Flathub.org) 
MIME-Version: 1.0


--=-7l6Sh3Yimzwl2y153BMe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Interesting situation (so to speak... :-O)

On Thu, 2020-10-15 at 11:20 +0200, Jan Beulich wrote:
> On 15.10.2020 11:14, Dylanger Daly wrote:
> > Indeed this is for dom0, I only recently tried limiting a domU to 1
> > core and observed absolutely no softlocks, UI animations are smooth
> > as butter with 1 core only.
> >=20
> > Indeed I believe this is a CPU Scheduling issue, I've tried both
> > the older credit and RTDS however both don't boot correctly.
>=20
> This wants reporting (with sufficient data, i.e. at least a serial
> log)
> as separate issues.
>=20
Indeed.

So, just to be sure I am understanding the symptoms correctly: here you
say that Credit (and RTDS) "don't boot correctly". In another mail, I
think you said that Credit boots, but is unusable due to lag and
lockups... Which is which?

Also, since this looks like it is SMT related, is Credit bootable
and/or usable with SMT off? And with SMT on?

> > The number of cores on this CPU is 8, 16 threads however Qubes by
> > default disables SMT, sched_credit2_max_cpus_runqueue is 16 by
> > default, I've tried testing with setting this to 7 or 8 however
> > it'll either not boot, or nothing will change.
>=20
> Failure to boot, unless with insane command line options, should
> always
> be reported to it can be fixed.
>=20
Yeah and facts are:

1) no value of the sched_credit2_max_cpus_runqueue option should=C2=A0
   prevent the system from booting. If it does, it's definitely a bug.

   It'd be "wonderful" to see _how_ it does that, by seeing the=C2=A0
   stacktrace (preferrably of a debug build), if there is one. Or, if=C2=A0
   the system locks, e.g., knowing whether it is responsive at least=C2=A0
   to=C2=A0debug keys (and, if yest, how the output of the 'r' debug key=C2=
=A0
   looks like)

2) A suboptimal value of sched_credit2_max_cpus_runqueue may indeed be=C2=
=A0
   associated with performance issues, including lags and lookups.=C2=A0
   *BUT* that usually happens on large boxes, with like 128 or 256=C2=A0
   CPUs. In your case, having either 8 or 16 CPUs in the same Credit2
   runqueue (or in two runqueue if you leave SMT on and use 8 as the=C2=A0
   value of that param) should work just fine. And, for sure, it=C2=A0
   shouldn't hang.

So, again, I'm not doubting it's happening, but I can't immediately
think of a root cause, especially without seeing more info.

In absence of that, I only have more questions. :-/ E.g., how are you
enabling and disabling SMT, via the command line parameter, or via
BIOS?

Also, can you perhaps try either upstream 4.14 Xen (from sources, I
mean) or the packages for a distro different than QubesOS (perhaps
installing such distro, temporarily, in an external HD or whatever).

Note that I by no means am trying to blame Qubes or anything else in
particular... I'm just trying to understand.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-7l6Sh3Yimzwl2y153BMe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl/jXwwACgkQFkJ4iaW4
c+59uBAAqcuU145XNduWZdJcO5KQBcTGl2kZbHMTCns/nK4tUlksavCQk6h0yJz5
xYQstJVNpERSPCJljU45IQWPFhYXLuv4/+icJPsj4u7/UjTuFbeKSP5JUJjfHstJ
9LtOEaQABy5I6PEntwbrmqTMRLLBG7SjfhagALI6JdR1sxq9ZXpKBP/jaLyHgdMb
ts0y1vP4QQ76V2r0DSxfGa2OWQWGKoh1J5g99a24oHV0o8MzaLZdPF2MZOUx5M3I
8iKiERG/FDHY19Bgh8F/1WtC0MYrnCVs0RLh9rphB7z6bhJjNZf/xwlUswZ6MhBO
/MicpekD985eNq5gWyGCRoczdOtrAibc/zWZOwAbHQAGBArEvXF4qXfH71kAjlKl
KY1CrgeeJdaVmmVmrA+XZsuSkX79cA/a0NtrCgxcO7YFBeUgeaQGYxHFYy4SOOqW
sUkV4uzgBJotJrWEv/Xr1d54FPyeZr/HutxR7WXNP5Gi2nR3MX1vG1KCSFn4q1bs
DTSMysbd1zhxiId/oxqa1x2WaglBpMmBVMM8bnX6zzm5gYuv1RAnGaZo1v2MCvch
kyYNAb32YBLKU6HWHL7ScYRbJGfyGhV2WoCxjmvEqBy8bv8lBg4+DwWWYQhkBTbm
tTltKRO68wRyELPaVWB50ecniND5H/Y9buSKPW5obhhVFRQrtOs=
=zBRF
-----END PGP SIGNATURE-----

--=-7l6Sh3Yimzwl2y153BMe--


