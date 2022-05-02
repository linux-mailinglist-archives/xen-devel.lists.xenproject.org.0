Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9266516B24
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 09:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318669.538546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlQEL-00040T-7L; Mon, 02 May 2022 07:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318669.538546; Mon, 02 May 2022 07:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlQEL-0003y8-4G; Mon, 02 May 2022 07:12:25 +0000
Received: by outflank-mailman (input) for mailman id 318669;
 Mon, 02 May 2022 07:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5GY=VK=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nlQEJ-0003y2-3k
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 07:12:23 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33200a80-c9e7-11ec-a405-831a346695d4;
 Mon, 02 May 2022 09:12:20 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A4C75C0081;
 Mon,  2 May 2022 03:12:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 02 May 2022 03:12:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 May 2022 03:12:16 -0400 (EDT)
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
X-Inumbo-ID: 33200a80-c9e7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651475537; x=
	1651561937; bh=33kj1yz/7azvZAf+9mpwSINfwefGQvvGDl74Mhrx8J4=; b=N
	On/+KjOeyubXyroc79W8qMAR6Zj7xTkaENf5LVvb9QMyF19FVWtImMyroI7m7n8W
	HX8LYC44yxWtgFW33rYDJb/axmb4LZpUhL+SataBU1REH2wlwfyB8qg8zDCiE2tO
	WcE/nF+fefSXWKA3WeHe884zC7GBjXQ7HPi7HHuEl+HQdshIzXKlGXk2dzBpReK6
	oDWKOK9m3Tb3z0o4JaTRuQCWp2QE23/7BpzNVV5VIYWk9P4pkGm8S3plVST6OFnQ
	z1kQjaPQrYOzhXEzO5D/1wlBsQ8G57wn59b2ykVY8wD6vfn8u8XxK06sV6lpVEet
	xS42rgMSjK/CgGTqgMKzw==
X-ME-Sender: <xms:UIRvYntxDI05nZNxVnefaITiYXUiMprJ3LcGdGRI6Oh3dSn95RwZVw>
    <xme:UIRvYofvmstX6_KiUsBXRZA9yiyghBofJK52KjB-Dw80ooohcuRhEzCCjeb7Y1HZU
    qSepcl6eeh9_KU>
X-ME-Received: <xmr:UIRvYqye_72iDbvYHOg1-Mq8cqGo7OEywbUWnZV-2YyomlTKgAK-Dx2p6ifd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeggdduudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:UIRvYmOD2EHL5oCRgHO6vDBIH829FSz73oWu5Tbxyh68y8wI_s9d2g>
    <xmx:UIRvYn-nwsTR210lI5WPKjrfXf5ECzg09TyiOR5NS3J01W6XnDR2UQ>
    <xmx:UIRvYmUHWLXv48AyO17s3JZ6s9Po4cvZ3H5APZbbwTRl08NCusmRsw>
    <xmx:UYRvYikHceSSQpf-ttFy993YxyQJUgxAgGj_3qouLE9k5rvYYjjk0w>
Date: Mon, 2 May 2022 03:11:47 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT
Message-ID: <Ym+ETr34j8JC55hK@itl-email>
References: <Yl7aC2a+TtOaFtqZ@itl-email>
 <3591eec7-1299-8783-26ad-ffe27bb9fdcd@suse.com>
 <YmmUtiBkhEYvXHUB@itl-email>
 <901c11d6-92f0-89b9-8500-4947bbdcd504@suse.com>
 <YmsbD9ktQqB4U33o@itl-email>
 <c9a57c65-05f4-b566-10cb-92ce9ffe9e0d@suse.com>
 <YmwbKwJh1Fft2F1H@itl-email>
 <7ad22939-1096-3d81-f998-4eaf1d9a1d8e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+Mf4dSxtIGCKe9It"
Content-Disposition: inline
In-Reply-To: <7ad22939-1096-3d81-f998-4eaf1d9a1d8e@suse.com>


--+Mf4dSxtIGCKe9It
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 May 2022 03:11:47 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT

On Mon, May 02, 2022 at 08:24:30AM +0200, Jan Beulich wrote:
> On 29.04.2022 19:06, Demi Marie Obenour wrote:
> > On Fri, Apr 29, 2022 at 10:40:42AM +0200, Jan Beulich wrote:
> >> On 29.04.2022 00:54, Demi Marie Obenour wrote:
> >>> On Thu, Apr 28, 2022 at 08:47:49AM +0200, Jan Beulich wrote:
> >>>> On 27.04.2022 21:08, Demi Marie Obenour wrote:
> >>>>> On further thought, I think the hypercall approach is actually bett=
er
> >>>>> than reserving the ESRT.  I really do not want XEN_FW_EFI_MEM_INFO =
to
> >>>>> return anything other than the actual firmware-provided memory
> >>>>> information, and the current approach seems to require more and more
> >>>>> special-casing of the ESRT, not to mention potentially wasting memo=
ry
> >>>>> and splitting a potentially large memory region into two smaller on=
es.
> >>>>> By copying the entire ESRT into memory owned by Xen, the logic beco=
mes
> >>>>> significantly simpler on both the Xen and dom0 sides.
> >>>>
> >>>> I actually did consider the option of making a private copy when you=
 did
> >>>> send the initial version of this, but I'm not convinced this simplif=
ies
> >>>> things from a kernel perspective: They'd now need to discover the ta=
ble
> >>>> by some entirely different means. In Linux at least such divergence
> >>>> "just for Xen" hasn't been liked in the past.
> >>>>
> >>>> There's also the question of how to propagate the information across
> >>>> kexec. But I guess that question exists even outside of Xen, with the
> >>>> area living in memory which the OS is expected to recycle.
> >>>
> >>> Indeed it does.  A simple rule might be, =E2=80=9COnly trust the ESRT=
 if it is
> >>> in memory of type EfiRuntimeServicesData.=E2=80=9D  That is easy to a=
chieve by
> >>> monkeypatching the config table as you suggested below.
> >>>
> >>> I *am* worried that the config table might be mapped read-only on some
> >>> systems, in which case the overwrite would cause a fatal page fault. =
 Is
> >>> there a way for Xen to check for this?
> >>
> >> While in boot mode, aiui page tables aren't supposed to be enforcing
> >> access restrictions. Recall that on other architectures EFI even runs
> >> with paging disabled; this simply is not possible for x86-64.
> >=20
> > Yikes!  No wonder firmware has nonexistent exploit mitigations.  They
> > really ought to start porting UEFI to Rust, with ASLR, NX, stack
> > canaries, a hardened allocator, and support for de-priviliged services
> > that run in user mode.
> >=20
> > That reminds me: Can Xen itself run from ROM?
>=20
> I guess that could be possible in principle, but would certainly require
> some work.
>=20
> >  Xen is being ported to
> > POWER for use in Qubes OS, and one approach under consideration is to
> > have Xen and a mini-dom0 be part of the firmware.  Personally, I really
> > like this approach, as it makes untrusted storage domains much simpler.
> > If this should be a separate email thread, let me know.
>=20
> It probably should be.

I will make one at some point.

> >> So
> >> portable firmware shouldn't map anything r/o. In principle the pointer
> >> could still be in ROM; I consider this unlikely, but we could check
> >> for that (just like we could do a page table walk to figure out
> >> whether a r/o mapping would prevent us from updating the field).
> >=20
> > Is there a utility function that could be used for this?
>=20
> I don't think there is.

Then it is good that none is necessary :)

Also, should the various bug checks I added be replaced by ASSERT()?

> >>>  It could also be undefined behavior to modify it.
> >>
> >> That's the bigger worry I have.
> >=20
> > Turns out that it is *not* undefined behavior, so long as
> > ExitBootServices() has not been called.  This is becaues EFI drivers
> > will modify the config table, so firmware cannot assume it to be
> > read-only.
>=20
> Ah, right - we could even use InstallConfigurationTable() ourselves
> to make the adjustment.

That is even simpler than I thought!  I was worried that
InstallConfigurationTable() would assume that memory for the table was
allocated a certain way and cause invalid free errors, but at least
TianoCore does not do that.

> >>>>> Is using ebmalloc() to allocate a copy of the ESRT a reasonable opt=
ion?
> >>>>
> >>>> I'd suggest to try hard to avoid ebmalloc(). It ought to be possible=
 to
> >>>> make the copy before ExitBootServices(), via normal EFI allocation. =
If
> >>>> replacing a pointer in the config table was okay(ish), this could ev=
en
> >>>> be utilized to overcome the kexec problem.
> >>>
> >>> What type should I use for the allocation?  EfiLoaderData looks like =
the
> >>> most consistent choice, but I am not sure if memory so allocated rema=
ins
> >>> valid when Xen hands off to the OS, so EfiRuntimeServicesData might b=
e a
> >>> better choice.
> >>
> >> It definitely is. We do recycle EfiLoaderData ourselves.
> >=20
> > I wonder why the ESRT was not in EfiRuntimeServicesData to begin with.
>=20
> So do I.

I suspect the assumption was that the ESRT would be parsed by the OS
before ExitBootServices(), and that the OS would have no need for the
ESRT after that.

> >>>  To avoid memory leaks from repeated kexec(), this could
> >>> be made conditional on the ESRT not being in memory of type
> >>> EfiRuntimeServicesData to begin with.
> >>
> >> Of course - there's no point relocating the blob when it already is
> >> immune to recycling.
> >=20
> > Yup.  Is it reasonable for dom0 to check that the ESRT is in
> > EfiRuntimeServicesData when under Xen?
>=20
> I think it is, but kernel folks may not like Xen specific code in this
> (or about any) area.
>=20
> Jan

There is PVops et al already :)

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--+Mf4dSxtIGCKe9It
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJvhE4ACgkQsoi1X/+c
IsGZ4g/+I8z97HEpZDgZIFYF6223IL8bc4xLxtq+5ULmvzWrgPSGU3P/pXoU/q0x
aEOKJnJxSrxAvQ14sdaeaq+VGrRTPXmcCys9hRkJ9q9njGvQsmHxsGae/RgfobaX
jpodeN8cCdlfIvmiKp3YbDpUvH0YUqcd8qhlitzd9NgxefNO/7q8wS0FvXhIA3HW
SLe83KzkPYMfkSyNwqsONkOPkVJP2he6jks1FXvwwOU9ltL1NAif7gHmCJOInJOd
Q/7RNT0QiSk7mjwpAiIW/gqNN8TOz6R0hy/G6oru2HsWm7b8SLaIqW1s3Xvyy6Xi
IPcn4H819nfl3lDQMRvALvfMVTSZItN7vA1RY7C195n6TooEFl7jdnH2TT8KP0HT
4MhzNQoLbiIjFMvXPgjq2MF35y22hk+yuyB8lsMlZNcG1Z0fAWCYUO1H+MjIz3Jy
9g9/JlqabcgxT9wVC28rvS2BD6W+3XR5iF0d1VRPj+CF+XUs3xWHmb9SxQLNHKDN
RKhz/5ZaE7v39dl9rayNyf4Csfko3RSDv7jpBUca03r5Xj8K61x+Iak8PLAhLq+c
atsdqYWkGSawtSsH3JTTSyWXgEcoNAyFM6RF/7+sfUY91QGaawI35EFMOLIApb7J
DVKk5Vg4edAh/nkObFT5vExrCevGO3rq4devw1HxVlXlVMbn+jE=
=mCXO
-----END PGP SIGNATURE-----

--+Mf4dSxtIGCKe9It--

