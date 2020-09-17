Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E18726DE75
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 16:40:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIv5X-0005xI-34; Thu, 17 Sep 2020 14:40:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yDaX=C2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kIv5V-0005x9-7y
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 14:40:41 +0000
X-Inumbo-ID: 820bcf2c-7bd0-4f2e-8119-23273cb9a0dc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 820bcf2c-7bd0-4f2e-8119-23273cb9a0dc;
 Thu, 17 Sep 2020 14:40:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600353639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tdPrJTgLzU3+7xbi+PQwuPIddOJROvm+BGdi1EKOmVg=;
 b=lkzFl++pr3VuawUmkCZ9+bbmUPOGqd6p5Hx7U8Xo2wNp0E+6DTMiXN9vob87Td42bogyGE
 HrzsooVyWFPm85KMIvBacJiDl2PbPn2KUNhYDa8Uo1kehTjBQv31SOPfs28042U9p5JcqC
 4dzY+DpwLcxAmheqoeX31yzU7heScbbBGfl+ywBDz44MJ73TC6rv73BLW/R4g+0dkNkUu2
 v3Oe2wl7GUmpBn2RydZZC7EDGoToKyBuTduoz5kkhRqkjhjgg1sJMrX/jpJH8GkfdLPQIr
 Bqe1zmmmhUlQ6wdaL0iUjjf/ygR0FcfWnniKn06SyhHq7iseB+WFPoFxEk/6Uw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1EEFDAF9A;
 Thu, 17 Sep 2020 14:41:13 +0000 (UTC)
Message-ID: <e62053a9494cce5b0385f63e73683b90d7638bf8.camel@suse.com>
Subject: Re: [PATCH 3/5] sched/arinc653: Clean up function definitions
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Jeff Kubascik
 <jeff.kubascik@dornerworks.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com, Josh
 Whitehead <josh.whitehead@dornerworks.com>, Stewart Hildebrand
 <stewart.hildebrand@dornerworks.com>, George Dunlap
 <george.dunlap@citrix.com>
Date: Thu, 17 Sep 2020 16:40:37 +0200
In-Reply-To: <c3f11088-cf5f-c3c1-d487-f0c719147c17@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-4-jeff.kubascik@dornerworks.com>
 <c3f11088-cf5f-c3c1-d487-f0c719147c17@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-3FsJhQvY5NVa056gFxRH"
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


--=-3FsJhQvY5NVa056gFxRH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-17 at 10:09 +0200, Jan Beulich wrote:
> On 16.09.2020 20:18, Jeff Kubascik wrote:
> > --- a/xen/common/sched/arinc653.c
> > +++ b/xen/common/sched/arinc653.c
> > @@ -119,10 +119,9 @@ static int dom_handle_cmp(const
> > xen_domain_handle_t h1,
> >      return memcmp(h1, h2, sizeof(xen_domain_handle_t));
> >  }
> > =20
> > -static struct sched_unit *find_unit(
> > -    const struct scheduler *ops,
> > -    xen_domain_handle_t handle,
> > -    int unit_id)
> > +static struct sched_unit *find_unit(const struct scheduler *ops,
> > +                                    xen_domain_handle_t handle,
> > +                                    int unit_id)
> >  {
>=20
> Just fyi, afaict we consider both variants legitimate style as far
> as Xen as a whole is concerned; I'm unaware of scheduler code
> specific restrictions (but I'll be happy to be corrected if I'm
> wrong with this).
>=20
No, you're right, there aren't any additional restrictions. And, as
many other subsystems, scheduling code is not always 100% consistent.
There's quite a mix of style. E.g., there are both examples of the
style that this hunk above is changing and of the one that the patch is
changing it to.

So I also see limited need for doing it. But of course it's Josh's and
Stweart's call, I guess.

> Instead what I'm wondering by merely seeing this piece of code is
> whether unit_id really can go negative. If not (as would be the
> common case with IDs), it would want converting to unsigned int,
> which may be more important than the purely typographical
> adjustment done here.
>=20
Yep, it's defined as `unsigned int` in `struct sched_unit`.

So this indeed would be valuable. And while you're there, this probably
applies here as well:

/**
 * The sched_entry_t structure holds a single entry of the
 * ARINC 653 schedule.
 */
typedef struct sched_entry_s
{
    /* dom_handle holds the handle ("UUID") for the domain that this
     * schedule entry refers to. */
    xen_domain_handle_t dom_handle;
    /* unit_id holds the UNIT number for the UNIT that this schedule
     * entry refers to. */
    int                 unit_id;
    ...
}

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-3FsJhQvY5NVa056gFxRH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl9jdWYACgkQFkJ4iaW4
c+7PIhAAt+BQyKW6us6DlDNDyppKQCbMPAW6TlrEmQ9u3IF1IBrKEZWR6xzH0XBr
YW4st9rp5Ogbti98hKwSjHlCfdHIfSQieRMggPncYAzm7pIxh9rCkypB5mpGJmOj
8guPiy25ow3HnfsKGz95IRYwrMbvTQJ57bu0LJUOn8VY/3OSNoAaojAyzuvzWtcL
qOnDZLqETQwJyR+McwTWxYHKckB2Wwisw76Q4QQPUqcodhg9yKfSyUYpKuoKX5+8
ggdBjh80oxoGSCSc0Qyy2Dvy+QeozJYb9k0hn62d3w/kWn6f4f/M0UCJpbfOc2zH
A0iO2UhmbyxrVjk8OdWoJDENR3inSyhl6MLKYcuhRmU1SIXvqYaznDVyLzA/L/EN
2zl15h1eyt+q37HjR32rHmEM9Oryeq03jZyVEhIydZuXVq+9C3nbyfNk4go9NjUr
Yhl8PDdYG3CyFaxE/M/sQZUjTc7uDg52Lc/Me0H3EQX7T6YeQA5zNyFkHW8WAvhH
T0zjm9f9SgWkT4+YY91z8CSyZMOUWDHP4AmoxJzc96t2nh7tH4h39botRYlLipl8
SKR4PfBt9mZ/ZYd+TEpISrb+UMWMU+Cad1Xjw8Tz2LiFSMLwoHGpYubQNuho9wSo
p8Ph/ZAMinJWZfzipQJE3CJDoopaXwy958HYGrLHp+L80RZAGN4=
=Ipps
-----END PGP SIGNATURE-----

--=-3FsJhQvY5NVa056gFxRH--


