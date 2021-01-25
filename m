Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168ED302782
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 17:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74185.133294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l44SU-0008Mj-Gf; Mon, 25 Jan 2021 16:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74185.133294; Mon, 25 Jan 2021 16:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l44SU-0008MK-Dj; Mon, 25 Jan 2021 16:11:18 +0000
Received: by outflank-mailman (input) for mailman id 74185;
 Mon, 25 Jan 2021 16:11:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pamT=G4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l44SS-0008MF-FJ
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 16:11:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12d718ae-7716-4881-a38b-90ea0e9e9df0;
 Mon, 25 Jan 2021 16:11:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4B30ADD6;
 Mon, 25 Jan 2021 16:11:13 +0000 (UTC)
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
X-Inumbo-ID: 12d718ae-7716-4881-a38b-90ea0e9e9df0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611591074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YeI3WrI1MxUyDgAp5xzN5wRbVxSgZe6k/sWMR8hlgv4=;
	b=rc1zVoCnal6ap5OEx0R5gjOLSO2t6Ai4pUwoR356XUSyFg6Dl5UVSyIcsqYY7NYIykiGox
	JV5D8gHGkkwosZRFdCixsi+xXyLDfFtOFu1qGVyQys7S3K8RSI+Ql6mGb0FZprqFJR2fxW
	MjfVXVSnvH0Y0jb8VrtwDL5W9KeBhgo=
Message-ID: <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
Subject: Re: Null scheduler and vwfi native problem
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien@xen.org>, Anders =?ISO-8859-1?Q?T=F6rnqvist?=
	 <anders.tornqvist@codiax.se>, xen-devel@lists.xenproject.org, Stefano
	Stabellini <sstabellini@kernel.org>
Date: Mon, 25 Jan 2021 17:11:12 +0100
In-Reply-To: <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
	 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
	 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
	 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
	 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
	 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-AGSsqWDvMFt7mIVfEbUS"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-AGSsqWDvMFt7mIVfEbUS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-22 at 14:26 +0000, Julien Grall wrote:
> Hi Anders,
>=20
> On 22/01/2021 08:06, Anders T=C3=B6rnqvist wrote:
> > On 1/22/21 12:35 AM, Dario Faggioli wrote:
> > > On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
> > - booting with "sched=3Dnull vwfi=3Dnative" but not doing the IRQ=20
> > passthrough that you mentioned above
> > "xl destroy" gives
> > (XEN) End of domain_destroy function
> >=20
> > Then a "xl create" says nothing but the domain has not started
> > correct.=20
> > "xl list" look like this for the domain:
> > mydomu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=
=C2=A0 512=C2=A0=C2=A0=C2=A0=C2=A0 1 ------=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> > 0.0
>=20
> This is odd. I would have expected ``xl create`` to fail if something
> went wrong with the domain creation.
>
So, Anders, would it be possible to issue a:

# xl debug-keys r
# xl dmesg

And send it to us ?

Ideally, you'd do it:
 - with Julien's patch (the one he sent the other day, and that you=C2=A0
   have already given a try to) applied
 - while you are in the state above, i.e., after having tried to=C2=A0
   destroy a domain and failing
 - and maybe again after having tried to start a new domain

> One possibility is the NULL scheduler doesn't release the pCPUs until
> the domain is fully destroyed. So if there is no pCPU free, it
> wouldn't=20
> be able to schedule the new domain.
>=20
> However, I would have expected the NULL scheduler to refuse the
> domain=20
> to create if there is no pCPU available.
>=20
Yeah but, unfortunately, the scheduler does not have it easy to fail
domain creation at this stage (i.e., when we realize there are no
available pCPUs). That's the reason why the NULL scheduler has a
waitqueue, where vCPUs that cannot be put on any pCPU are put.

Of course, this is a configuration error (or a bug, like maybe in this
case :-/), and we print warnings when it happens.

> @Dario, @Stefano, do you know when the NULL scheduler decides to=20
> allocate the pCPU?
>=20
On which pCPU to allocate a vCPU is decided in null_unit_insert(),
called from sched_alloc_unit() and sched_init_vcpu().

On the other hand, a vCPU is properly removed from its pCPU, hence
making the pCPU free for being assigned to some other vCPU, in
unit_deassign(), called from null_unit_remove(), which in turn is
called from sched_destroy_vcpu() Which is indeed called from
complete_domain_destroy().

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-AGSsqWDvMFt7mIVfEbUS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAO7aAACgkQFkJ4iaW4
c+7UphAAj12367kpLWIKGNZH5na2LjBsIU4D0OXqdnQ1VYJb2iy22ZjdLVUNw9AX
/WO2kWq6Nt30nTVIQPt+/spuEM0Q+8sNyG5x66shoKBekkjxBfsBRM3LOLgrWVC1
KR6FXDxCsB5RoNR0kHGoQ8u9Wh+4+DT8nxH4bb0PnaGAPOhmFqt/nPNq74hFihsQ
FAXTKEdwowlT8TIttmGOB3GCcU5RDQ0AisxMoUQH4YGBZjZTnAnnXvAqvHQO1v1s
+IH+CIrw/K1uZiAGhi4wkFTKteK72TqnBxQaMrygz51IE+BUhRc1/rtFilLLeAam
nx12dQDhwA1RUArjttXkTv7S0/2PQPeopJkh54/CCgLAIPfq9lWgpc8E7OmIgWMO
0ZT3Wq5Nz7iouIrp7o+EEIEK0jV8uXvVW17J9h3yQNdyMdbA5U95mjwk/vdvvTds
5FMgajiX0pXYnMDrmpB7wMWLS1tmn8CnWS7+MnhB4DydUMIxc7od/u0aTH1IrEqj
pkBTTE58NqTtaI34grNZj1NUQAnQ06YFokrpU+i2o56nmFY40tLb5LtkVEEIMkBM
RhhtKjCq4usFqDpOiNoTWwzLEYwyLn0sagyN49bQ3HCUynAyCbnvhOXXgFBXxXqT
lr98e0H/lR2wuB4HSeWav5Ph84etS5q0mnyOHGMEOU1qpshvhpA=
=PHKU
-----END PGP SIGNATURE-----

--=-AGSsqWDvMFt7mIVfEbUS--


