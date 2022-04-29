Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F151515C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 19:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317556.536940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkU58-0000Vc-Ra; Fri, 29 Apr 2022 17:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317556.536940; Fri, 29 Apr 2022 17:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkU58-0000Tp-Oa; Fri, 29 Apr 2022 17:07:02 +0000
Received: by outflank-mailman (input) for mailman id 317556;
 Fri, 29 Apr 2022 17:07:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a2mH=VH=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nkU56-0000Tj-PM
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 17:07:00 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c53f0d3a-c7de-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 19:06:58 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6916F5C01AA;
 Fri, 29 Apr 2022 13:06:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 29 Apr 2022 13:06:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 13:06:53 -0400 (EDT)
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
X-Inumbo-ID: c53f0d3a-c7de-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651252014; x=
	1651338414; bh=hoPTvo6B+AouZhrb2AIwb48FaEgvVx1kJ0prQGY283w=; b=N
	nRGLfFiXKKL5KSTX32rl+ZivpSRu3shaAwkqXvoOEZBKxDNyDwLAL+wI1i09v+YM
	pq5vdMUqe/RgIdr83BLFLo+MdqdZ5ZJ4bFHRJO1rpkbKqZNI1MCOFpL/iYIndxpa
	iPyWWCNEyCuNaGtNbffepaoZpV8QEqQmdbXF2VAhdSd8FT1DHviseDNL83jnqRgH
	pP16bkagfhrb4ghdTCWhOE6rFzmgvMBHkBg2TqzpEfAZ4e0OZz2nQf+XpDowjZWo
	neq9nteVUEb6EPyMwjuHxmMGYbO+gtJARtLI40tV0M0Q15BNv2flrF2ldS9fmuJk
	pdSdb5WdS1/VC/4rvFkbQ==
X-ME-Sender: <xms:LRtsYsj9D5xtmOmo1LW5PLMjXy0oTcXoeplxuVD6UkJsqzPOXLQepw>
    <xme:LRtsYlDaJn3AG_YBszi7OMsN0w53asTNUGH-udz62z44r63b-OUVwGCD1pYiOv0Ch
    FNa_layXQwsDWo>
X-ME-Received: <xmr:LRtsYkEsz8qCg9VW5xcBSgoRgyotuzYApUD4kFiZJCzsaJuNbKBx_EcKun6J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:LRtsYtSpx-rB6nXM_v9RzxxM9hAJjhDQL5F1O9s1LwCh2-M2ZF0SUQ>
    <xmx:LRtsYpyLS_23q5--j25k1Ne85HpiNOPoXwigg4anJ0_FJImEggfSiw>
    <xmx:LRtsYr41TzVzzEOnM_8Ev01bgcF1u6RKxvHoKRKCn7ILwzlJzEvkRA>
    <xmx:LhtsYsoyK6oR6sgdCi1NYbLD3cv8YwEOd2c8Gl3f2zQCW4GvkJ6aBQ>
Date: Fri, 29 Apr 2022 13:06:42 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT
Message-ID: <YmwbKwJh1Fft2F1H@itl-email>
References: <Yl7aC2a+TtOaFtqZ@itl-email>
 <3591eec7-1299-8783-26ad-ffe27bb9fdcd@suse.com>
 <YmmUtiBkhEYvXHUB@itl-email>
 <901c11d6-92f0-89b9-8500-4947bbdcd504@suse.com>
 <YmsbD9ktQqB4U33o@itl-email>
 <c9a57c65-05f4-b566-10cb-92ce9ffe9e0d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cuhxi4/sgGauzhkg"
Content-Disposition: inline
In-Reply-To: <c9a57c65-05f4-b566-10cb-92ce9ffe9e0d@suse.com>


--Cuhxi4/sgGauzhkg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Apr 2022 13:06:42 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT

On Fri, Apr 29, 2022 at 10:40:42AM +0200, Jan Beulich wrote:
> On 29.04.2022 00:54, Demi Marie Obenour wrote:
> > On Thu, Apr 28, 2022 at 08:47:49AM +0200, Jan Beulich wrote:
> >> On 27.04.2022 21:08, Demi Marie Obenour wrote:
> >>> On Wed, Apr 27, 2022 at 10:56:34AM +0200, Jan Beulich wrote:
> >>>> On 19.04.2022 17:49, Demi Marie Obenour wrote:
> >>>>> This hypercall can be used to get the ESRT from the hypervisor.  It
> >>>>> returning successfully also indicates that Xen has reserved the ESR=
T and
> >>>>> it can safely be parsed by dom0.
> >>>>
> >>>> I'm not convinced of the need, and I view such an addition as incons=
istent
> >>>> with the original intentions. The pointer comes from the config tabl=
e,
> >>>> which Dom0 already has access to. All a Dom0 kernel may need to know=
 in
> >>>> addition is whether the range was properly reserved. This could be a=
chieved
> >>>> by splitting the EFI memory map entry in patch 2, instead of only sp=
litting
> >>>> the E820 derivation, as then XEN_FW_EFI_MEM_INFO can be used to find=
 out
> >>>> the range's type. Another way to find out would be for Dom0 to attem=
pt to
> >>>> map this area as MMIO, after first checking that no part of the rang=
e is in
> >>>> its own memory allocation. This 2nd approach may, however, not reall=
y be
> >>>> suitable for PVH Dom0, I think.
> >>>
> >>> On further thought, I think the hypercall approach is actually better
> >>> than reserving the ESRT.  I really do not want XEN_FW_EFI_MEM_INFO to
> >>> return anything other than the actual firmware-provided memory
> >>> information, and the current approach seems to require more and more
> >>> special-casing of the ESRT, not to mention potentially wasting memory
> >>> and splitting a potentially large memory region into two smaller ones.
> >>> By copying the entire ESRT into memory owned by Xen, the logic becomes
> >>> significantly simpler on both the Xen and dom0 sides.
> >>
> >> I actually did consider the option of making a private copy when you d=
id
> >> send the initial version of this, but I'm not convinced this simplifies
> >> things from a kernel perspective: They'd now need to discover the table
> >> by some entirely different means. In Linux at least such divergence
> >> "just for Xen" hasn't been liked in the past.
> >>
> >> There's also the question of how to propagate the information across
> >> kexec. But I guess that question exists even outside of Xen, with the
> >> area living in memory which the OS is expected to recycle.
> >=20
> > Indeed it does.  A simple rule might be, =E2=80=9COnly trust the ESRT i=
f it is
> > in memory of type EfiRuntimeServicesData.=E2=80=9D  That is easy to ach=
ieve by
> > monkeypatching the config table as you suggested below.
> >=20
> > I *am* worried that the config table might be mapped read-only on some
> > systems, in which case the overwrite would cause a fatal page fault.  Is
> > there a way for Xen to check for this?
>=20
> While in boot mode, aiui page tables aren't supposed to be enforcing
> access restrictions. Recall that on other architectures EFI even runs
> with paging disabled; this simply is not possible for x86-64.

Yikes!  No wonder firmware has nonexistent exploit mitigations.  They
really ought to start porting UEFI to Rust, with ASLR, NX, stack
canaries, a hardened allocator, and support for de-priviliged services
that run in user mode.

That reminds me: Can Xen itself run from ROM?  Xen is being ported to
POWER for use in Qubes OS, and one approach under consideration is to
have Xen and a mini-dom0 be part of the firmware.  Personally, I really
like this approach, as it makes untrusted storage domains much simpler.
If this should be a separate email thread, let me know.

> So
> portable firmware shouldn't map anything r/o. In principle the pointer
> could still be in ROM; I consider this unlikely, but we could check
> for that (just like we could do a page table walk to figure out
> whether a r/o mapping would prevent us from updating the field).

Is there a utility function that could be used for this?

> >  It could also be undefined behavior to modify it.
>=20
> That's the bigger worry I have.

Turns out that it is *not* undefined behavior, so long as
ExitBootServices() has not been called.  This is becaues EFI drivers
will modify the config table, so firmware cannot assume it to be
read-only.

> >>> Is using ebmalloc() to allocate a copy of the ESRT a reasonable optio=
n?
> >>
> >> I'd suggest to try hard to avoid ebmalloc(). It ought to be possible to
> >> make the copy before ExitBootServices(), via normal EFI allocation. If
> >> replacing a pointer in the config table was okay(ish), this could even
> >> be utilized to overcome the kexec problem.
> >=20
> > What type should I use for the allocation?  EfiLoaderData looks like the
> > most consistent choice, but I am not sure if memory so allocated remains
> > valid when Xen hands off to the OS, so EfiRuntimeServicesData might be a
> > better choice.
>=20
> It definitely is. We do recycle EfiLoaderData ourselves.

I wonder why the ESRT was not in EfiRuntimeServicesData to begin with.

> >  To avoid memory leaks from repeated kexec(), this could
> > be made conditional on the ESRT not being in memory of type
> > EfiRuntimeServicesData to begin with.
>=20
> Of course - there's no point relocating the blob when it already is
> immune to recycling.

Yup.  Is it reasonable for dom0 to check that the ESRT is in
EfiRuntimeServicesData when under Xen?

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Cuhxi4/sgGauzhkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJsGysACgkQsoi1X/+c
IsHpiQ/9GcBfC/ZkYxkylp/rUR3BTDUMY8rF79DbBwa99MbZIkL2ztsRdSzq4hlc
jWsFsxNc06iBXoTDc/kTR82/LwYlJ8S6NtpV4nA13Ied60UqSk/TNa0LKe3r/F5j
BFgqIGHz4cdJ+ypE8WErONX/PniIFKEoctQzcOdxu8hL30fGNTWpIpl0RoxCeC14
hJVtlfNcSYUxSTs7innKFbY01osBWTzOa8F2N9EN95aGznSyahAbNWeCKF83NPto
XDlhVlYSMwMkgC9piYj92uMs/XZEL8A9g2ttGNqqXFK8UGM+Jz/7pnkii3y+8XlL
PI8O8zwAE7eyVaUqyu1GrjlQi3NKXsXMHQMwWmor2b5IENhVU2cVrPdWTpqmbTwX
JX/7TvPHg6jT++i8jakfmk2G2IIuw9cFZOihQIVQDJXXYqXDDWgvat6xSSt9qZXz
OeaQ0YtbxRFlgoU4qzUDAkohofUW0KpJcETJgtP8Yi3q5R6KJZ9vzez5sJFDZq08
obA+AWRQKQoEq0vRjZ8aOvewrSRH6vNm6KXS+gBSz7p5Yf7fR1CPrx21Hu5Xurx2
YzcMoeSs7WXzpo37+YVD5yDRXPYeWx/mGYdaAYQeJgBf+9oqx5yGbHVb/IBntUAQ
bKKOu8eyOQ3J0gvvBbJQy8/byiyKlzM8iXaxMywQmxjzLnIpl7U=
=m+lH
-----END PGP SIGNATURE-----

--Cuhxi4/sgGauzhkg--

