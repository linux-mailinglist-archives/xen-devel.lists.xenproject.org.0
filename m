Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BDC35FEF6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 02:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110872.211828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWq4w-0002K2-A2; Thu, 15 Apr 2021 00:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110872.211828; Thu, 15 Apr 2021 00:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWq4w-0002Jd-6t; Thu, 15 Apr 2021 00:41:54 +0000
Received: by outflank-mailman (input) for mailman id 110872;
 Thu, 15 Apr 2021 00:41:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wfo=JM=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lWq4v-0002JX-5k
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 00:41:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ae5926f-5ee0-460c-be3f-5de70f87f92d;
 Thu, 15 Apr 2021 00:41:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52938B0B8;
 Thu, 15 Apr 2021 00:41:51 +0000 (UTC)
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
X-Inumbo-ID: 6ae5926f-5ee0-460c-be3f-5de70f87f92d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618447311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u/7DWqK+KH2xCdJetKy2G8NR7twfetAs1zlOuqKquYk=;
	b=gcww7yqzF1KdJV+NjrAq7ro8n7W8HiEQJ6CcXoi9s7IKSwLmci25S36xUW2nOXa6PcnO3M
	7vYZQF2awBnpc1olvOyEOo+ge8iKdYOsYj/Gref3fvCg8PUZaEMefc30XB3SIoOd2P7ScX
	WodlTmgOBY8dbt/IqJDg+C6Ye2YKLic=
Message-ID: <6176e02b5b82e9be10351ea386ba2cb8573d7f5b.camel@suse.com>
Subject: Re: A KernelShark plugin for Xen traces analysis
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Giuseppe Eletto <giuseppe.eletto@edu.unito.it>, 
 linux-trace-devel@vger.kernel.org, xen-devel@lists.xenproject.org, Enrico
 Bini <enrico.bini@unito.it>
Date: Thu, 15 Apr 2021 02:41:49 +0200
In-Reply-To: <f44f994d-32da-0610-57d8-e3a30bbb278c@citrix.com>
References: 
	<CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
	 <20210413114614.4971caff@gandalf.local.home>
	 <094c4b3f-3988-c51f-3a69-cfbc8d6a45bf@citrix.com>
	 <20210414094300.7fbd6887@gandalf.local.home>
	 <f44f994d-32da-0610-57d8-e3a30bbb278c@citrix.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-42X2G7kQJlH4RwMaJMhn"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0


--=-42X2G7kQJlH4RwMaJMhn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-04-14 at 21:05 +0100, Andrew Cooper wrote:
> On 14/04/2021 14:43, Steven Rostedt wrote:
> >=20
> > What I would envision how this would work, is that you would
> > produce a
> > set of tracing files. One for each guest (including Dom0), and one
> > for the
> > Xen hypervisor itself. The trick is to have a way to synchronize
> > the time
> > stamps. What we just did with KVM is to have all the tracing record
> > the
> > CPUs TSC, including the shift and multiplier that the CPU might
> > change for
> > the guests. Then we have a way to convert the TSC to nanoseconds.
> > This way
> > all tracing data has the same clock. It's somewhat complicated to
> > get
> > right, and requires access to how the guests clocks are modified by
> > the CPU.
>=20
> Xen certainly has enough information to describe what TSC rate/epoch
> each guest is seeing, but I doubt any of this is coherently exposed
> at
> the moment.
>=20
Yeah. In KVM its in, e.g.:

/sys/kernel/debug/kvm/85276-13/vcpu0/tsc-offset

Where 85276-13 is a combination of the PID of the main QEMU process and
one of the KVM file descriptors.

> > The Xen plugin would then need to read the how the threads in
> > xen.dat map
> > to the virtual CPUs of each of the guest files. Which would give
> > you the
> > layering.
>=20
> Looks good.=C2=A0 I suspect we might need to do a little work on Xen's
> trace
> data to make this mesh together nicely.=C2=A0 In particular, Xen doesn't
> have
> a terribly good scheme on unique IDs for "a VM".
>=20
True. However, Linux recycles PIDs too, doesn't it?

I mean, if PID 1234 is running when I start tracing and it dies and,
after a while, another task with PID 1234 is started KernelShark will
probably treat and display them as if they were the same task? Or
wouldn't it?

Currently, the Xen plugin combines the domain ID and the vCPU ID to
come up with a PID, that then will be used for assigning a color to
each vCPU.

This is pretty much arbitrary and can be changed, but it of course has
to be something that we can extract from from the trace event records
or, at least, from the trace file (e.g., as Andrew said, we do have
per-VM UUIDs, but they're currently not there).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-42X2G7kQJlH4RwMaJMhn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmB3i80ACgkQFkJ4iaW4
c+5oSg//b6TIvtCT4ZzBV+RfogiF9rSsbjCz8gJdaRjw+qA2M9VHQBOt77FX64/3
7q2MA8N1sxnYWiOX7vesF0xqOmMfleiee0THrLNmLQPuZQanfVUHjrPDdb9GTZC4
czUHFQnn1jtoj2GY+Xmfbl+7K47EmRJEnGSOV2JXNjPd/tuuDcFCozwdkCqrIIyb
1kuUK+cnEHQTxUAqndpd0WNpwfwX1CfnKS5YNDkvkOmC3sRX790MtcJ8Mvloqk1r
A/+VIYwGiRBJf2ewHmWsmBpx2u7L+0WjSvZYQbSiNbXhbQMS+ml8UVK9u7dFKQ2k
Idcv0Z/BN7PWGrmhag60MelWc4YHFro5J6NLULtE8KmY0s85n4Hkph2UVGnefoWB
WCXPG4cGoTgLbiDxcL9A50JxOA7v6v/7lxkZCZWde1F86umKEU7Niphad5ikh4Pz
4dZzVhXIlfm+LtbS0DUnq1RiqXEFjATaBWImqvidSHHFPe2jl2apezQ7C+o3Tcdz
HsMCadTHSb3RX6MJ6d/kv46/e38CA5bYTj7C0hyaVyKHxet4xAGMCCbEDIVYRgzy
MtWlKu6swyoNLYfjH/Av02xMp+0areZm3xhY67HE7BD+N8/3JzkLbZQPlv70Y2aj
HZvxukeiED5862MPwVGk9IytB6sTaMD3mLK61AUyPIvpIsfjhbU=
=grG+
-----END PGP SIGNATURE-----

--=-42X2G7kQJlH4RwMaJMhn--


