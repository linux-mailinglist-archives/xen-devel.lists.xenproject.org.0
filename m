Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287A7270722
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 22:35:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJN5A-0002uS-7V; Fri, 18 Sep 2020 20:34:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6/9W=C3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kJN58-0002uN-LL
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 20:34:10 +0000
X-Inumbo-ID: 0958cf0d-8e7a-4404-8c7a-4b62e7685470
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0958cf0d-8e7a-4404-8c7a-4b62e7685470;
 Fri, 18 Sep 2020 20:34:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600461248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0hJWzqLQ6JHbmn/gEkrZMzOwvp4UvzQiAAn0SpOIXSE=;
 b=UuhAKULzCZxsnmLUO0Dkt98I4p6CvETh1Q+a/Ui938TynDWHSDAspuay5Iyu3ygoPMq2jn
 dHaGunwn4eJ4SFkTzqZ1PlPuz4NixzseMehdZ+RN3KyXmqFsPZdSPXRCtm5X57cAU7hjSp
 GWlF1Zzw4PhyCIQC955l7UV9qPa/mI0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF7C7B112;
 Fri, 18 Sep 2020 20:34:42 +0000 (UTC)
Message-ID: <321b3c85d2ea4c73fae992df3fd0541c7d36c81b.camel@suse.com>
Subject: Re: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
From: Dario Faggioli <dfaggioli@suse.com>
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>, Stewart Hildebrand
 <Stewart.Hildebrand@dornerworks.com>, =?ISO-8859-1?Q?J=FCrgen_Gro=DF?=
 <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Cc: xen-devel <xen-devel@dornerworks.com>, Josh Whitehead
 <Josh.Whitehead@dornerworks.com>, George Dunlap <george.dunlap@citrix.com>
Date: Fri, 18 Sep 2020 22:34:06 +0200
In-Reply-To: <16401afe-9dfc-48d6-1fd5-bcfb519417ad@dornerworks.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <d2973002-86b5-17b7-cbfa-ba235af75ba3@suse.com>
 <CY1P110MB055125447405A5DA2202BF028C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <5b758105ee47638c36ef19eb3804b76ee19020a8.camel@suse.com>
 <CY1P110MB0551518BC91E77341A9A37718C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <960f5e3b5a27326cd18ecb44a96f22bcf94f2498.camel@suse.com>
 <16401afe-9dfc-48d6-1fd5-bcfb519417ad@dornerworks.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-A2v8DLnCWAkF5vOTy1sC"
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


--=-A2v8DLnCWAkF5vOTy1sC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-09-18 at 16:03 -0400, Jeff Kubascik wrote:
> On 9/17/2020 1:30 PM, Dario Faggioli wrote:
> > On Thu, 2020-09-17 at 15:59 +0000, Stewart Hildebrand wrote:
> > >=20
> > And don't think only to the need of writing the code (as you kind
> > of
> > have it already), but also to testing. As in, the vast majority of
> > the
> > core-scheduling logic and code is scheduler independent, and hence
> > has
> > been stressed and tested already, even by people using schedulers
> > different than ARINC.
>=20
> When is core scheduling expected to be available for ARM platforms?
> My
> understanding is that this only works for Intel.
>=20
As soon as "someone" actually tests it, and tell us how _well_ it works
*already*.  :-) :-P :-)

IIRC, there should be no (or really really few) code changes necesssary
for doing that.

> With core scheduling, is the pinning of vCPUs to pCPUs configurable?
> Or can the
> scheduler change it at will? One advantage of this patch is that you
> can
> explicitly pin a vCPU to a pCPU. This is a desirable feature for
> systems where
> you are looking for determinism.
>=20
It certainly is. Now, as I think you know very well, some of the logic
for honoring the requested pinning is implemented inside each scheduler
(i.e., credit.c, credit2.c, etc).

Therefore, you *may* need to do the same in arinc653, probably
similarly to what you were doing in this patch (so there may indeed be
parts of this patch that are still necessary, but I still expect it to
become rather smaller and less intrusive).

But yeah, all the generic stuff is there already, and core-scheduling
does not prevent it to be used.

> There are a few changes in this patch that I think should be pulled
> out if we go
> the path of core scheduling.=20
>
Sure, I totally agree.

> For instance, it removes a large structure from
> being placed on the stack. It also adds the concept of an epoch so
> that the
> scheduler doesn't drift (important for ARINC653) and can recover if a
> frame is
> somehow missed (I commonly saw this when using a debugger). I also
> observed the
> occasional kernel panic when using xl commands which was fixed by
> improving the
> locking scheme.
>=20
Exactly, all these things looked legit and good to me. And they can be
pulled out in one or more other patches. Plus, you probably also need a
patch with the pinning bits.

But you should be able to get rid of all the parts that tries to make
sure that only one domain is scheduled at any given time.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-A2v8DLnCWAkF5vOTy1sC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl9lGb4ACgkQFkJ4iaW4
c+4LVxAArZW6X1lUstnFZk8naM7LhZ8v0k3e4rpgeXMthlK4P9nILROO9tNZc79p
Av37TH9jbdtC3D6Wb1hHXPtGBWreWcjq+E1+IgiQ76DnKlCJckH+dfCDQziS2d8Q
I6ENTDLeyubsFcH5dGlRQ1Wevz2OsMmSnzUMZzxWHKHs6WiDHYCLnTVvxCfH0sAS
qxvoWfmdqxIMQoUMG/8nCW3/hOZVzdPfdTpz0vDLLpHjDkrcE6eY3Zqq8inUBEYe
vt71oXtkLOsjPsHbyJj+wPtF7D3BSjlnh91qH0pqmrdUIO7cziyKK08e3TX5qPX3
Wa2Ur+w4A6bzJj1FmJUOGR83vNZFxgAyXnOCTL1Koco7R7rlSyA2a56MQqzP/073
vc2GQiUX1+7t/u4KEH0TSeB1AzGCCGtCkk4rj/EgzMwwsF7ntQta5XPZSGPFXKmr
IhS+IKVhXpetLlqP55cLbAVumtBztS29NRyHGPbIb15nOP1RT3J40mpCEdVILEyz
HO4IVd9MqDGdyM2qPq3GEQTXpXEamTip/AGi0rwk/CNaIGmSxW4zDdsQ9jY5HNpH
lmwp0UReGd/9jr1Gxu4yvb3vrjnikFEClUOffz8VWp1rJFDikbouzVwMwDh5vLWf
C6YSpd2t3yT8+3Um9+z0lyyJ+A9/8tbxDfDK6qKpgbFxWNcRTRI=
=WMVH
-----END PGP SIGNATURE-----

--=-A2v8DLnCWAkF5vOTy1sC--


