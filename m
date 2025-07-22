Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00CBB0E708
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 01:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053056.1421803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMGk-0007Xv-9S; Tue, 22 Jul 2025 23:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053056.1421803; Tue, 22 Jul 2025 23:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMGk-0007Vn-6B; Tue, 22 Jul 2025 23:19:34 +0000
Received: by outflank-mailman (input) for mailman id 1053056;
 Tue, 22 Jul 2025 23:19:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=an6O=2D=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ueMGi-0007VY-83
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 23:19:32 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 510709cf-6752-11f0-b894-0df219b8e170;
 Wed, 23 Jul 2025 01:19:29 +0200 (CEST)
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
X-Inumbo-ID: 510709cf-6752-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753226368; x=1753485568;
	bh=ufIVCBPNXWBUhm+FcVlPTu+UOUC+FgmgimQrSFg1syM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HZ5Pv0g20x3r4NRwS7telMl58a5ZcLaNX8R/Htz7da1dpLwzJAhj/bKKFbTdm0Zs2
	 3urD6fNuc4f5xWS4nfex/Da6km4MBaSugRVnmt3JPtHBBNsl5MFKgIsJoS4T4eAElY
	 MFZY3UI8nUVnsWaWOaIQcyx1L/J+Nu1suawwWaZh8UAyg1/BMxfi6chBPZdyQFTDbY
	 L5sWHL2b3HbDrHchUc6+bEW7hLRjioIQ2UEFpofXHWQeixzdWzNq2mopofz1mWlS2Q
	 rfHI7cqEPBQLuy8atAo8zGg+iOro2h7wxs7X5sxFmEGcikSt9LIGec9JGAePz85U7M
	 4T97rn0S1nwrA==
Date: Tue, 22 Jul 2025 23:19:24 +0000
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v10 2/3] xen/domain: update create_dom0() messages
Message-ID: <aIAceOe9k/PkHqnW@kraken>
In-Reply-To: <DBE9HJ5W3RUO.2K451XN5JAWG9@amd.com>
References: <20250623182721.194238-1-dmukhin@ford.com> <20250623182721.194238-3-dmukhin@ford.com> <DBE9HJ5W3RUO.2K451XN5JAWG9@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 62b4ac44ceed078ab3d7d995aeafcd3647aa9726
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 12:34:56PM +0200, Alejandro Vallejo wrote:
> On Mon Jun 23, 2025 at 8:28 PM CEST, dmkhn wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Use %pd for domain identification in error/panic messages in create_dom=
0().
> >
> > No functional change.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>=20
> nit below. But with or without that change:
>=20
>   Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Thanks

>=20
> > ---
> > Changes since v9:
> > - new patch
> > ---
> >  xen/arch/arm/domain_build.c | 8 ++++----
> >  xen/arch/x86/setup.c        | 4 ++--
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 9fa5143eb98c..b59b56636920 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2080,17 +2080,17 @@ void __init create_dom0(void)
> >
> >      dom0 =3D domain_create(domid, &dom0_cfg, flags);
> >      if ( IS_ERR(dom0) )
> > -        panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0))=
;
> > +        panic("Error creating d%d (rc =3D %ld)\n", domid, PTR_ERR(dom0=
));
> >
> >      if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
> > -        panic("Error initializing LLC coloring for domain 0 (rc =3D %d=
)\n", rc);
> > +        panic("Error initializing LLC coloring for %pd (rc =3D %d)\n",=
 dom0, rc);
> >
> >      if ( alloc_dom0_vcpu0(dom0) =3D=3D NULL )
> > -        panic("Error creating domain 0 vcpu0\n");
> > +        panic("Error creating %pdv0\n", dom0);
> >
> >      rc =3D construct_dom0(dom0);
> >      if ( rc )
> > -        panic("Could not set up DOM0 guest OS (rc =3D %d)\n", rc);
> > +        panic("Could not set up guest OS for %pd (rc =3D %d)\n", dom0,=
 rc);
>=20
> nit: s/guest OS for %pd/%pd guest OS/

Ack

>=20
> >
> >      set_xs_domain(dom0);
> >  }
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 7adb92d78a18..28bcfd1861d4 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1080,7 +1080,7 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
> >
> >          if ( (strlen(acpi_param) =3D=3D 0) && acpi_disabled )
> >          {
> > -            printk("ACPI is disabled, notifying Domain 0 (acpi=3Doff)\=
n");
> > +            printk("ACPI is disabled, notifying %pd (acpi=3Doff)\n", d=
);
> >              safe_strcpy(acpi_param, "off");
> >          }
> >
> > @@ -1095,7 +1095,7 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
> >
> >      bd->d =3D d;
> >      if ( construct_dom0(bd) !=3D 0 )
> > -        panic("Could not construct domain 0\n");
> > +        panic("Could not construct %pd\n", d);
> >
> >      bd->cmdline =3D NULL;
> >      xfree(cmdline);
>=20


