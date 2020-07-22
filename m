Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CE2229B7E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 17:33:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyGk0-0005vj-NJ; Wed, 22 Jul 2020 15:33:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xSrN=BB=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jyGjz-0005ve-Ek
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 15:33:07 +0000
X-Inumbo-ID: a36e6d93-cc30-11ea-867b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a36e6d93-cc30-11ea-867b-bc764e2007e4;
 Wed, 22 Jul 2020 15:33:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36D89AEBB;
 Wed, 22 Jul 2020 15:33:13 +0000 (UTC)
Message-ID: <d08102ed75c078fa189c6cd0067429026eb489ab.camel@suse.com>
Subject: Re: [PATCH v2 0/7] xen: credit2: limit the number of CPUs per runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Date: Wed, 22 Jul 2020 17:33:04 +0200
In-Reply-To: <fe24d520-7ef8-7dd7-6aa8-64df3a55b0bb@suse.com>
References: <159070133878.12060.13318432301910522647.stgit@Palanthas>
 <fe24d520-7ef8-7dd7-6aa8-64df3a55b0bb@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-lsm84saEy5QEvbtzOkhP"
User-Agent: Evolution 3.36.3 (by Flathub.org) 
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-lsm84saEy5QEvbtzOkhP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-07-21 at 14:08 +0200, Jan Beulich wrote:
> On 28.05.2020 23:29, Dario Faggioli wrote:
> > Dario Faggioli (7):
> >       xen: credit2: factor cpu to runqueue matching in a function
> >       xen: credit2: factor runqueue initialization in its own
> > function.
> >       xen: cpupool: add a back-pointer from a scheduler to its pool
> >       xen: credit2: limit the max number of CPUs in a runqueue
> >       xen: credit2: compute cpus per-runqueue more dynamically.
> >       cpupool: create an the 'cpupool sync' infrastructure
> >       xen: credit2: rebalance the number of CPUs in the scheduler
> > runqueues
>=20
> I still have the last three patches here as well as "xen: credit2:
> document that min_rqd is valid and ok to use" in my "waiting for
> sufficient acks" folder.=20
>
Ok.

> Would you mind indicating if they should
> stay there (and you will take care of pinging or whatever is
> needed), or whether I may drop them (and you'll eventually re-
> submit)?
>=20
So, the last 3 patches of this series, despite their status is indeed
"waiting for sufficient acks", in the sense that they've not been
looked at due to code freeze being imminent back then, but it still
would be ok for people to look at them, I'm happy for you to drop this
from your queue.

I will take care of resending just them in a new series and everything.
And thanks.

For the min_rqd one... That should be quite easy, in theory, so let me
ping the thread right now. Especially considering that I just looked
back at it, and noticed that I forgot to Cc George in the first place!
:-O

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-lsm84saEy5QEvbtzOkhP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl8YXDAACgkQFkJ4iaW4
c+4L6hAAjahFMb3/gHlWZaqqv2pshngpdpRgbI0i9LQOJKHvnxaTb4zeajxnMYs/
A1OJyAJQpKtYSHOVLc+t9slHpkBRjbw4JsmIkXbxwBA0CXH0aq2pmlWtOR4GrIY7
MHqgPrf/kKOA3ks1kHcY5PGplTDg0E0ai3l1AMdnlXon1+6xvEpo3EUSYAmqf737
YgTphdQCI3dqT+61+clwSb9/kmjac7UYR/z1C97ESEMDsNkJsHJivlmKKkf2HJDN
4LaVHsg/7qBeUYF+DOFIRuqaXGaeXfaEUFDJFuXWXl/uYYd6DFVYcVDHQ7GNj+yF
ylnsmZQT/jGiPlwx5u3k1+CR82DpGNtXx8ji4h6MsdBBRQecTUn0F1xkcJpYCbT7
mPmU9pPJi5EotVqGixeLBjo53Kdt8PNDxirSMJprl4k2l2bGf9WrzkfG9XN9bCxd
7yP4V1rk52T9A/MwhK12666+Dv7Un3VlpL+6MbaKJxnFhdk8NF54yr9O7hRY/FaV
ya3495Sbk8ipiTjFXyR4BTePjHuXDrUcZkAf8OFvD2dobUSDPnxiEKtrKkwWgSQk
Qx7+fC89/KmxaZOxQS2XT54fiCuZBF2gykG6nuvgmSbAiSPp739EM1ApWYfxn3iY
AMP5vI3jU6s1xAx7lvWiw+oU2nDmn+anUl1rO/3kDtS6clUeSjA=
=h63m
-----END PGP SIGNATURE-----

--=-lsm84saEy5QEvbtzOkhP--


