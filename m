Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E36B26E266
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 19:31:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIxjj-0005hg-Kr; Thu, 17 Sep 2020 17:30:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yDaX=C2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kIxji-0005hW-I9
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 17:30:22 +0000
X-Inumbo-ID: e50fc59f-b27d-4ab8-bc7d-ceb35de2635b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e50fc59f-b27d-4ab8-bc7d-ceb35de2635b;
 Thu, 17 Sep 2020 17:30:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600363820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fnM33ZLrKtwh8sDfEcn6WSjYCw+lcrqOpjWmwHI/Dlk=;
 b=l59dB7mlHkL93v02r7FavB4KRhTpWnaE2u+HDKH7vmS09V0hVfaBHY69CEJoEUOv64ylaI
 unR2Xj3GKFGHbUZcpK2Q5smxTro5O06qcCZ7/Kagjw6iL+AYM6VtWb36eDPJ9WuvdU0ucr
 Az2TIxzsyzb4Jvi+N6ntXob5fjiuYH8fwMMMw6jYNo5K3Che1NhYcH+CUYF7BoP20ddUM9
 X8EALkd6t2LBEm3VPoQAm9esl2hs70T9Nr7Ke05FOmuGvX2fDhbrTQx4clfpwh1uWTqkAu
 cndkF6gAmjRwp+QWMY9lGEMug4MCPLHu/s9F00BkkZeKY9kXrUg8lRISjENjBw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B926EAFBB;
 Thu, 17 Sep 2020 17:30:53 +0000 (UTC)
Message-ID: <960f5e3b5a27326cd18ecb44a96f22bcf94f2498.camel@suse.com>
Subject: Re: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
From: Dario Faggioli <dfaggioli@suse.com>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, 
 =?ISO-8859-1?Q?J=FCrgen_Gro=DF?=
 <jgross@suse.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: xen-devel <xen-devel@dornerworks.com>, Josh Whitehead
 <Josh.Whitehead@dornerworks.com>, George Dunlap <george.dunlap@citrix.com>
Date: Thu, 17 Sep 2020 19:30:18 +0200
In-Reply-To: <CY1P110MB0551518BC91E77341A9A37718C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <d2973002-86b5-17b7-cbfa-ba235af75ba3@suse.com>
 <CY1P110MB055125447405A5DA2202BF028C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <5b758105ee47638c36ef19eb3804b76ee19020a8.camel@suse.com>
 <CY1P110MB0551518BC91E77341A9A37718C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-x1RlERqPyqDkvseKBFFt"
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


--=-x1RlERqPyqDkvseKBFFt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-17 at 15:59 +0000, Stewart Hildebrand wrote:
> On Thursday, September 17, 2020 11:20 AM, Dario Faggioli wrote:
> > On Thu, 2020-09-17 at 15:10 +0000, Stewart Hildebrand wrote:
> > > > It might be worth to consider using just the core scheduling
> > > > framework
> > > > in order to achive this. Using a sched_granularity with the
> > > > number
> > > > of
> > > > cpus in the cpupool running ARINC653 scheduler should already
> > > > do
> > > > the
> > > > trick. There should be no further midification of ARINC653
> > > > scheduler
> > > > required.
> > > >=20
> > >=20
> > > This CAST-32A multicore patch series allows you to have a
> > > different
> > > number of vCPUs (UNITs, I guess) assigned to domUs.
> > >=20
> > And if you have domain A with 1 vCPU and domain B with 2 vCPUs,
> > with
> > sched-gran=3Dcore:
> > - when the vCPU of domain A is scheduled on a pCPU of a core, no
> > vCPU
> >  from domain B can be scheduled on the same core;
> > - when one of the vCPUs of domain B is scheduled on a pCPU of a
> > core,
> >  no other vCPUs, except the other vCPU of domain B can run on the
> >  same core.
>=20
> Fascinating. Very cool, thanks for the insight. My understanding is
> that core scheduling is not currently enabled on arm. This series
> allows us to have multicore ARINC 653 on arm today without chasing
> down potential issues with core scheduling on arm...
>=20
Yeah, but at the cost of quite a bit of churn, and of a lot more code
in arinc653.c, basically duplicating the functionality.

I appreciate how crude and inaccurate this is, but arinc653.c is
currently 740 LOCs, and this patch is adding 601 and removing 204.

Add to this the fact that the architecture specific part of core-
scheduling should be limited to the handling of the context switches
(and that it may even work already, as what we weren't able to do was
proper testing).

If I can cite an anecdote, back in the days where core-scheduling was
being developed, I sent my own series implementing, for both credit1
and credit2. It had its issues, of course, but I think it had some
merits, even if compared with the current implementation we have
upstream (e.g., more flexibility, as core-scheduling could have been
enabled on a per-domain basis).

At least for me, a very big plus of the other approach that Juergen
suggested and then also implemented, was the fact that we would get the
feature for all the schedulers at once. And this (i.e., the fact that
it probably can be used for this purpose as well, without major changes
necessary inside ARINC653) seems to me to be a further confirmation
that it was the good way forward.

And don't think only to the need of writing the code (as you kind of
have it already), but also to testing. As in, the vast majority of the
core-scheduling logic and code is scheduler independent, and hence has
been stressed and tested already, even by people using schedulers
different than ARINC.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-x1RlERqPyqDkvseKBFFt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl9jnSoACgkQFkJ4iaW4
c+69BxAAuS2TMKI67+ozzaeVxO46l4GFECM5BByL94msJGvMRWChYU8aHbOFUGuw
wrU9Bynr1t0PTgGNpWW2zzwMxf80f/cMzohvTBRQVGPW+a+9jxrbAo5hElM7p+tN
w0B4QUWtcQzpJPZ6IJVFDNdKicy1HOWuqwU1Zd6+jNDDCzjpdWw7A80CHm3XOIUs
goQXhW7aegHAQk0mqgl8s86OOu64DzxD3sIN/xckZ98C+2ccfMQRd8uctgxBGo9b
rrgSvZRyO31SU3OxXrXPYPNBXjmID7nKOBLxyx8d8gXxpipZ5HiC/DIA/DOVCNt7
50zRSZa/47S/r5700T/LQSiMQghnyFBlX+Vn+FHDKNE9n9wetwLdWS5TYH2X9M8A
o1Rh9Ms3BaA2vzIbxAQywTAoTWQu7gq4qB2GnxAFwBoteR+rWNXTZ+J7QuG0wjrT
JIX9uvD2FIg74TuRa3eY2/3JrqSxE9U4LznxwV3/6eY1v0ZYiVNdHfLTZ/MDijmX
FsZjmVSxBQ139YEK2gefr3YbVEweMTKQBQ9sTrzunlO8avXErnooi5OLNNLTpX43
l3OABISR/3KQUc491sRl7fNZskYTxwl1BzO9Svc90ODNARNmaRkIWvX9D2NHK17x
2oaiOay5k5oHY85DmlALMgTzlHqWr4FPj7MggMJE1y6SvQ9S4SE=
=eG/P
-----END PGP SIGNATURE-----

--=-x1RlERqPyqDkvseKBFFt--


