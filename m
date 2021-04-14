Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4904E35FD97
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 00:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110841.211764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWnjW-0004fO-Dk; Wed, 14 Apr 2021 22:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110841.211764; Wed, 14 Apr 2021 22:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWnjW-0004f1-AL; Wed, 14 Apr 2021 22:11:38 +0000
Received: by outflank-mailman (input) for mailman id 110841;
 Wed, 14 Apr 2021 22:11:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2F6e=JL=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lWnjU-0004ew-9n
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 22:11:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eff6be59-3930-45dd-a9fc-a11bb7dd3917;
 Wed, 14 Apr 2021 22:11:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3E5FAE86;
 Wed, 14 Apr 2021 22:11:33 +0000 (UTC)
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
X-Inumbo-ID: eff6be59-3930-45dd-a9fc-a11bb7dd3917
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618438294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ototsKWpm+5BByan6tp1rzhs5QnNDRMdNYZyyUEgVLY=;
	b=TVYZJgG8NalbpeoJA4Lf22cFi/ZaQH+YhSrsXoE5KLsysST+Ua8S1LMQCSsh2psVDp4PWR
	BKieVOCQFZcPe4lsLvHVzBUgZtErSq1XtsYxnGrxreCxToZUts3av18D0+ilEovPhQoGK2
	NN8NJtFg510JdNcoePV3MZzj6REIVpM=
Message-ID: <28ac9c046cc521cbaef9c2ff56911cd7b3100ac4.camel@suse.com>
Subject: Re: A KernelShark plugin for Xen traces analysis
From: Dario Faggioli <dfaggioli@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>, Giuseppe Eletto
	 <giuseppe.eletto@edu.unito.it>
Cc: linux-trace-devel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Enrico Bini <enrico.bini@unito.it>
Date: Thu, 15 Apr 2021 00:11:32 +0200
In-Reply-To: <20210413114614.4971caff@gandalf.local.home>
References: 
	<CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
	 <20210413114614.4971caff@gandalf.local.home>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-SWdq9RPSIFU4w0o8/S2+"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0


--=-SWdq9RPSIFU4w0o8/S2+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-04-13 at 11:46 -0400, Steven Rostedt wrote:
> On Tue, 13 Apr 2021 16:28:36 +0200
> Giuseppe Eletto <giuseppe.eletto@edu.unito.it> wrote:
> >=20
> > In fact, KernelShark is a well known tool for graphical
> > visualization
> > Linux kernel traces, obtained via "ftrace" and "trace-cmd". Anyway
> > thanks
> > to its modular architecture, it is now possible to implement
> > plugins which
> > open and display traces with arbitrary format, for example, as in
> > in
> > this case, traces of the Xen hypervisor.
>=20
> I'm guessing you have trace events coming from Xen itself?
>=20
Yes, basically, we can say that a Xen system has "its own trace-cmd".
It's called `xentrace`, you run it from Dom0 and you get a (binary)
file which contains a bunch of events.

Not that differently from a trace-cmd's "trace.dat" file, but the
events in there comes from tracepoints within the hypervisor (which, of
course, use a different tracing mechanism than ftrace).

>=20
> > A screenshot of the plugin in action is available here:
> > https://github.com/giuseppe998e/kernelshark-xentrace-plugin/raw/master/=
.github/img/ks-xentrace.png
> >=20
> > I'm happy to receive whatever feedback you may have about it,
> > and to answer any question.
> >=20
>=20
> Thanks for doing this. What would be nice is to have the xen traces
> along
> side the linux tracing.=C2=A0
>
Indeed! :-P

> Perhaps we can update trace-cmd agent to work with
> Xen as well. Does xen implement vsock or some other way to
> communicate
> between the guests and the Dom0 kernel?=C2=A0
>
Not vsock, AFAIK. But we probably can use something else/come up with
something new.

> =C2=A01. On each guest, run as root: trace-cmd agent --xen
> =C2=A02. On Dom0 run: trace-cmd record -e (events on Dom0) \
> =C2=A0=C2=A0=C2=A0=C2=A0 --xen (commands to do tracing in Xen HV) \
> =C2=A0=C2=A0=C2=A0=C2=A0 -A <guest-name1> -e (events on guest)
>=20
> And then you would get a trace.dat file for Dom0 and the guest, and
> also
> have a trace file for Xen (however that is done).=C2=A0
>
Yep, and the implementation of the `--xen (commands to do tracing in
Xen HV)` part, can just "call-in" to xentrace (somehow), and we'll get
the trace.xen file that then can be interpreted with this plugin.

> And then on KernelShark,
> we have a KVM plugin in development that does this. But you can do
> the same
> with Xen.
>=20
I think that one of the trickiest aspects would be synchronizing the
timestamps in the 3 traces.

*I guess* that the dom0 trace and the guest traces could at least use
the PTP algorithm that is currently implemented in the trace-cmd
patches (but not KVM specific one). For synch'ing the Xen trace with
them, well, I don't really know... We'd have to think about it. :-P

> Perhaps we can do something like that with Xen as well.=C2=A0
>
Would be awesome, IMO. :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-SWdq9RPSIFU4w0o8/S2+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmB3aJQACgkQFkJ4iaW4
c+7RXA//QDd+3f6YkvAVoxHude8NxrB9QD/AlooIBOyWGuCWMeZUe7nXa79qMYDr
bmG0y/n4LLpDl+vTyShf781I1LLfckZMMEQmhH/J1JElYsUs33bqb+lvYZH99ZAe
1/PMZneaq8SpH8OsiOGtJ+5aSj+vfpJ8wm5reMIfJDbb2K3wQRIIF12ts5AQyaBU
/ptNHtBDSRFsmAYmo8V39yev1F9qKgSDfRDCUlWniCOxxEeccb6+rGwGw+rBYO5P
qfjCRKeLD+zFsF/kLRFmcrsxGQeTJf+1SzAq5t/KwPH8lQqDNfYXM/IXn4RjoQcK
J+CLgtNEiH9E2Lxl42yXDEI2YBJ5sZ674V/BFKCOUf0tZCESswExXX6bLWCKhGNo
d7SSpoDn1GKsNUXkRUbefPKmq7Gyz/tYGNZ56tRDJf5hkRKJQu0CLC9L3y5nmIPj
hGvNKcAWe+xiMqvuKcctjkcQId/RcVTIeUSiA469CdM1TRaYwtRdC9xw/i0M0Rml
MunZvDkUOeFXnfviWM9kE8rdN18eKVjkEifvBos5l16GAq08l8e1OOKgFupAFYtG
S7FCMh4zkdMxOvMzPykXtXEZxjIzj4ktPmBndvuUmlK0OmKXmSdNd8NpndauHNM+
BJfNDDmYR9pH1JsPEpRDRjwaploAPYXkO/9sojOZAlawKsAqFVs=
=Z0r0
-----END PGP SIGNATURE-----

--=-SWdq9RPSIFU4w0o8/S2+--


