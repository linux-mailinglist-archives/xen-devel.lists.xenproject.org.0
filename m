Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCD750E459
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 17:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313078.530537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj0aW-00073q-VS; Mon, 25 Apr 2022 15:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313078.530537; Mon, 25 Apr 2022 15:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj0aW-00070l-R6; Mon, 25 Apr 2022 15:25:20 +0000
Received: by outflank-mailman (input) for mailman id 313078;
 Mon, 25 Apr 2022 15:25:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rnYW=VD=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nj0aU-00070f-Q5
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 15:25:19 +0000
Received: from MTA-08-3.privateemail.com (mta-08-3.privateemail.com
 [198.54.127.61]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e838cae8-c4ab-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 17:25:17 +0200 (CEST)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
 by mta-08.privateemail.com (Postfix) with ESMTP id 1C5FF18000A1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 11:25:15 -0400 (EDT)
Received: from mail-oi1-f174.google.com (unknown [10.20.151.185])
 by mta-08.privateemail.com (Postfix) with ESMTPA id E942918000A7
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 11:25:14 -0400 (EDT)
Received: by mail-oi1-f174.google.com with SMTP id r8so17482698oib.5
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 08:25:14 -0700 (PDT)
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
X-Inumbo-ID: e838cae8-c4ab-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1650900315;
	bh=MkKuORuPDUh2uPnmqS+0+j8y+u89+kSTWJQyAa1QNdw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NBWuN64bZuCIwq1ygJrbVz2ZB4XlNfMPx15qjFTB3sjd0PaUHELfP//tP3MCUo3lW
	 RXAA2Umr/8cQdz0+Io26EsitOv1W+FSrbteRRRH7dSzTDkNumFMGzAr1OUrXOANDK0
	 8Z5/Mtc6u3dmwzkuGH7Re1lWZGwS081iKD+QY+oiDr0HOQBFC/IUSNpxg2rX9TMZvS
	 y0sPLhuZjuF5GpAcbQiCBKbwDJkQNAQmjt4VNqcOv6yJRdR9MGTE2JBQWUMppCwSYk
	 hpeoZq6+XiskalDlCcsz0LMoZO/ol9JnPqY7QrNxlV1a+vpqFo3/R87ck9GTAy1/wS
	 LIKh10TgI22eA==
X-Gm-Message-State: AOAM532hTGQD7SlcPtY3xLTg2QOUxxHIWzZttEmhTj0uGZOEzVlcWrKE
	CXphMGqANYdD8chCzqwvpuXXlcCNeYWoI+MOsaA=
X-Google-Smtp-Source: ABdhPJwZQqS53HRrr1UxQRHGTEtnkw0mHieWfMIGDZz1yIdlGHtNoDsuLa7TevocsMF3ajeKxQeZ67/dfczcofQMpnc=
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id
 ay43-20020a056808302b00b002f9eeef0f03mr13049180oib.128.1650900314214; Mon, 25
 Apr 2022 08:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <YmasHAT0YkeJVMbv@Air-de-Roger>
In-Reply-To: <YmasHAT0YkeJVMbv@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 25 Apr 2022 11:24:37 -0400
X-Gmail-Original-Message-ID: <CABfawhn=6KVVPZD6AVRH2=NJFd5ZwtPpxDn__LdEFJQx6bhCXA@mail.gmail.com>
Message-ID: <CABfawhn=6KVVPZD6AVRH2=NJFd5ZwtPpxDn__LdEFJQx6bhCXA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86/mem_sharing: make fork_reset more configurable
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Apr 25, 2022 at 10:12 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
>
> On Wed, Apr 13, 2022 at 09:41:51AM -0400, Tamas K Lengyel wrote:
> > Allow specify distinct parts of the fork VM to be reset. This is useful=
 when a
> > fuzzing operation involves mapping in only a handful of pages that are =
known
> > ahead of time. Throwing these pages away just to be re-copied immediate=
ly is
> > expensive, thus allowing to specify partial resets can speed things up.
> >
> > Also allow resetting to be initiated from vm_event responses as an
> > optiomization.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thank you!

> > ---
> > v4: No change
> > v3: Rebase on simpler approach after dropping empty_p2m feature
> > v2: address review comments and add more sanity checking
> > ---
> >  tools/include/xenctrl.h                |  3 ++-
> >  tools/libs/ctrl/xc_memshr.c            |  7 ++++++-
> >  xen/arch/x86/include/asm/mem_sharing.h |  9 +++++++++
> >  xen/arch/x86/mm/mem_sharing.c          | 24 +++++++++++++++++++-----
> >  xen/common/vm_event.c                  | 15 +++++++++++++++
> >  xen/include/public/memory.h            |  4 +++-
> >  xen/include/public/vm_event.h          |  8 ++++++++
> >  7 files changed, 62 insertions(+), 8 deletions(-)
> >
> > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > index 95bd5eca67..1b089a2c02 100644
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -2290,7 +2290,8 @@ int xc_memshr_fork(xc_interface *xch,
> >   *
> >   * With VMs that have a lot of memory this call may block for a long t=
ime.
> >   */
> > -int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain);
> > +int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain,
> > +                         bool reset_state, bool reset_memory);
> >
> >  /* Debug calls: return the number of pages referencing the shared fram=
e backing
> >   * the input argument. Should be one or greater.
> > diff --git a/tools/libs/ctrl/xc_memshr.c b/tools/libs/ctrl/xc_memshr.c
> > index a6cfd7dccf..a0d0b894e2 100644
> > --- a/tools/libs/ctrl/xc_memshr.c
> > +++ b/tools/libs/ctrl/xc_memshr.c
> > @@ -257,12 +257,17 @@ int xc_memshr_fork(xc_interface *xch, uint32_t pd=
omid, uint32_t domid,
> >      return xc_memshr_memop(xch, domid, &mso);
> >  }
> >
> > -int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid)
> > +int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid, bool reset=
_state,
> > +                         bool reset_memory)
> >  {
> >      xen_mem_sharing_op_t mso;
> >
> >      memset(&mso, 0, sizeof(mso));
> >      mso.op =3D XENMEM_sharing_op_fork_reset;
> > +    if ( reset_state )
> > +        mso.u.fork.flags |=3D XENMEM_FORK_RESET_STATE;
> > +    if ( reset_memory )
> > +        mso.u.fork.flags |=3D XENMEM_FORK_RESET_MEMORY;
>
> IMO would be clearer to init mso fields at definition.

Not sure what you mean exactly, mso =3D { ... }; ? I think the logic is
pretty clear as-is and I don't have any preference for one style vs
the other.

>
> > diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> > index 84cf52636b..d26a6699fc 100644
> > --- a/xen/common/vm_event.c
> > +++ b/xen/common/vm_event.c
> > @@ -28,6 +28,11 @@
> >  #include <asm/p2m.h>
> >  #include <asm/monitor.h>
> >  #include <asm/vm_event.h>
> > +
> > +#ifdef CONFIG_MEM_SHARING
> > +#include <asm/mem_sharing.h>
> > +#endif
> > +
> >  #include <xsm/xsm.h>
> >  #include <public/hvm/params.h>
> >
> > @@ -394,6 +399,16 @@ static int vm_event_resume(struct domain *d, struc=
t vm_event_domain *ved)
> >              if ( rsp.reason =3D=3D VM_EVENT_REASON_MEM_PAGING )
> >                  p2m_mem_paging_resume(d, &rsp);
> >  #endif
> > +#ifdef CONFIG_MEM_SHARING
> > +            if ( mem_sharing_is_fork(d) )
> > +            {
> > +                bool reset_state =3D rsp.flags & VM_EVENT_FLAG_RESET_F=
ORK_STATE;
> > +                bool reset_mem =3D rsp.flags & VM_EVENT_FLAG_RESET_FOR=
K_MEMORY;
> > +
> > +                if ( reset_state || reset_mem )
> > +                    ASSERT(!mem_sharing_fork_reset(d, reset_state, res=
et_mem));
>
> Might be appropriate to destroy the domain in case fork reset fails?
> ASSERT will only help in debug builds.

No, I would prefer not destroying the domain here. If it ever becomes
necessary the right way would be to introduce a new monitor event to
signal an error and let the listener decide what to do. At the moment
I don't see that being necessary as there are no known scenarios where
we would be able to setup a fork but fail to reset is.

>
> > +            }
> > +#endif
> >
> >              /*
> >               * Check emulation flags in the arch-specific handler only=
, as it
> > diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> > index a1a0f0233a..f8d26fb77d 100644
> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
> >                  uint32_t gref;     /* IN: gref to debug         */
> >              } u;
> >          } debug;
> > -        struct mem_sharing_op_fork {      /* OP_FORK */
> > +        struct mem_sharing_op_fork {      /* OP_FORK{,_RESET} */
> >              domid_t parent_domain;        /* IN: parent's domain id */
> >  /* Only makes sense for short-lived forks */
> >  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
> >  /* Only makes sense for short-lived forks */
> >  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
>
> Should you add:
>
> /* Only for OP_FORK_RESET. */
>
> > +#define XENMEM_FORK_RESET_STATE        (1u << 2)
> > +#define XENMEM_FORK_RESET_MEMORY       (1u << 3)

I think the flag names are really descriptive already that these apply
to the FORK_RESET case but I would have no objection to that comment
being added at commit.

Thanks again,
Tamas

