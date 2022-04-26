Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69715107B6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 20:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314108.532027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njQKb-0002Dp-NZ; Tue, 26 Apr 2022 18:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314108.532027; Tue, 26 Apr 2022 18:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njQKb-0002BS-K9; Tue, 26 Apr 2022 18:54:37 +0000
Received: by outflank-mailman (input) for mailman id 314108;
 Tue, 26 Apr 2022 18:54:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SWQ=VE=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1njQKa-0002BM-PK
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 18:54:37 +0000
Received: from MTA-05-3.privateemail.com (mta-05-3.privateemail.com
 [68.65.122.15]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f278be4-c592-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 20:54:34 +0200 (CEST)
Received: from mta-05.privateemail.com (localhost [127.0.0.1])
 by mta-05.privateemail.com (Postfix) with ESMTP id 00FD718000A6
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 14:54:32 -0400 (EDT)
Received: from mail-oi1-f182.google.com (unknown [10.20.151.196])
 by mta-05.privateemail.com (Postfix) with ESMTPA id D0CC118000A3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 14:54:31 -0400 (EDT)
Received: by mail-oi1-f182.google.com with SMTP id l203so10859026oif.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 11:54:31 -0700 (PDT)
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
X-Inumbo-ID: 4f278be4-c592-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1650999271;
	bh=CnnrZw9uJI8shnn+j2DekIUDtB6mwGNt/vYlFhVvNQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GCPpruVD7AxgpyIDivEJim6d0e9jXG5qpUOxARuzL/06arHlJ5DmYqjuDiqZec0Go
	 ORt7jbwR2CR5WOOrQxuyW/K7hW2dWBVHYSTBgnBMENnf59l4MR9tewZz8c99dqpyVN
	 MnLp4bdMTTPzQcfHjAjsFxzq20eJ+Wzy4A+OJGaVdHiZWkA0YPy7ulbvjXszaIhBZf
	 eTh3UoQm1ym124FJSdovi2lseVoUSFAZf71FM2GLimWFLaHCMwIqKZ4uVn96qKACe8
	 5B9WXravhICbmO+jrnCraQMylIKgwYaW7VidHaUTyTINtzWSh4ArtLQ8WsT+az2CGu
	 e4zDpKeCTeQiA==
X-Gm-Message-State: AOAM533a+j7TCkE2zKKVfxDiuTxDM2eqv67OWQaGbcmC8FiX2rZgFRso
	vJXSQqNsP/H3848uTHuq6aWqxWtdk8iVh2i7pLI=
X-Google-Smtp-Source: ABdhPJyv7kIrcm8hh0lA36fEL4EFv0nNvAy3Y12YdQz2U6WgP+QvTqjh6ycodRMAnT1QhsrfCAVviuW7c+Z7gtXDUnU=
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id
 ay43-20020a056808302b00b002f9eeef0f03mr16070669oib.128.1650999270942; Tue, 26
 Apr 2022 11:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <4b456c15829c11914b698654937c28e313d2d522.1649857162.git.tamas.lengyel@intel.com>
 <YmazAdHL4LWOdDDv@Air-de-Roger> <CABfawh=Z1_88p14ivkqrBAUKbfw39f-frXN9uNsdVt9BDp+4bA@mail.gmail.com>
 <YmeyDRYcwfgg7mwC@Air-de-Roger>
In-Reply-To: <YmeyDRYcwfgg7mwC@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 26 Apr 2022 14:53:54 -0400
X-Gmail-Original-Message-ID: <CABfawh=gb0_oyjqq9DwioaVZfnrkbbFLJi14oyN4o5njrK9xgg@mail.gmail.com>
Message-ID: <CABfawh=gb0_oyjqq9DwioaVZfnrkbbFLJi14oyN4o5njrK9xgg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] x86/monitor: Add new monitor event to catch all vmexits
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Apr 26, 2022 at 4:50 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Mon, Apr 25, 2022 at 11:40:11AM -0400, Tamas K Lengyel wrote:
> > On Mon, Apr 25, 2022 at 10:41 AM Roger Pau Monn=C3=A9 <roger.pau@citrix=
.com> wrote:
> > >
> > > On Wed, Apr 13, 2022 at 09:41:52AM -0400, Tamas K Lengyel wrote:
> > > > Add monitor event that hooks the vmexit handler allowing for both s=
ync and
> > > > async monitoring of events. With async monitoring an event is place=
d on the
> > > > monitor ring for each exit and the rest of the vmexit handler resum=
es normally.
> > > > If there are additional monitor events configured those will also p=
lace their
> > > > respective events on the monitor ring.
> > > >
> > > > With the sync version an event is placed on the monitor ring but th=
e handler
> > > > does not get resumed, thus the sync version is only useful when the=
 VM is not
> > > > expected to resume normally after the vmexit. Our use-case is prima=
rily with
> > > > the sync version with VM forks where the fork gets reset after sync=
 vmexit
> > > > event, thus the rest of the vmexit handler can be safely skipped. T=
his is
> > > > very useful when we want to avoid Xen crashing the VM under any cir=
cumstance,
> > > > for example during fuzzing. Collecting all vmexit information regar=
dless of
> > > > the root cause makes it easier to reason about the state of the VM =
on the
> > > > monitor side, hence we opt to receive all events, even for external=
 interrupt
> > > > and NMI exits and let the monitor agent decide how to proceed.
> > > >
> > > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > > > ---
> > > > v4: Minor tweaks and more verbose patch description.
> > > >
> > > > Note: making the sync version resume-friendly is specifically out-o=
f-scope as
> > > > it would require significant rearrangement of the vmexit handler. A=
s this
> > > > feature is not required for our use-case we opt for the version tha=
t minimizes
> > > > impact on the existing code.
> > > > ---
> > > >  tools/include/xenctrl.h                |  2 ++
> > > >  tools/libs/ctrl/xc_monitor.c           | 15 +++++++++++++++
> > > >  xen/arch/x86/hvm/monitor.c             | 18 ++++++++++++++++++
> > > >  xen/arch/x86/hvm/vmx/vmx.c             | 12 ++++++++++++
> > > >  xen/arch/x86/include/asm/domain.h      |  2 ++
> > > >  xen/arch/x86/include/asm/hvm/monitor.h |  2 ++
> > > >  xen/arch/x86/include/asm/monitor.h     |  3 ++-
> > > >  xen/arch/x86/monitor.c                 | 14 ++++++++++++++
> > > >  xen/include/public/domctl.h            |  6 ++++++
> > > >  xen/include/public/vm_event.h          |  8 ++++++++
> > > >  10 files changed, 81 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > > > index 1b089a2c02..159eaac050 100644
> > > > --- a/tools/include/xenctrl.h
> > > > +++ b/tools/include/xenctrl.h
> > > > @@ -2096,6 +2096,8 @@ int xc_monitor_privileged_call(xc_interface *=
xch, uint32_t domain_id,
> > > >                                 bool enable);
> > > >  int xc_monitor_emul_unimplemented(xc_interface *xch, uint32_t doma=
in_id,
> > > >                                    bool enable);
> > > > +int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool =
enable,
> > > > +                      bool sync);
> > > >  /**
> > > >   * This function enables / disables emulation for each REP for a
> > > >   * REP-compatible instruction.
> > > > diff --git a/tools/libs/ctrl/xc_monitor.c b/tools/libs/ctrl/xc_moni=
tor.c
> > > > index 4ac823e775..c5fa62ff30 100644
> > > > --- a/tools/libs/ctrl/xc_monitor.c
> > > > +++ b/tools/libs/ctrl/xc_monitor.c
> > > > @@ -246,6 +246,21 @@ int xc_monitor_emul_unimplemented(xc_interface=
 *xch, uint32_t domain_id,
> > > >      return do_domctl(xch, &domctl);
> > > >  }
> > > >
> > > > +int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool =
enable,
> > > > +                      bool sync)
> > > > +{
> > > > +    DECLARE_DOMCTL;
> > > > +
> > > > +    domctl.cmd =3D XEN_DOMCTL_monitor_op;
> > > > +    domctl.domain =3D domain_id;
> > > > +    domctl.u.monitor_op.op =3D enable ? XEN_DOMCTL_MONITOR_OP_ENAB=
LE
> > > > +                                    : XEN_DOMCTL_MONITOR_OP_DISABL=
E;
> > > > +    domctl.u.monitor_op.event =3D XEN_DOMCTL_MONITOR_EVENT_VMEXIT;
> > > > +    domctl.u.monitor_op.u.vmexit.sync =3D sync;
> > > > +
> > > > +    return do_domctl(xch, &domctl);
> > > > +}
> > > > +
> > > >  /*
> > > >   * Local variables:
> > > >   * mode: C
> > > > diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.=
c
> > > > index b44a1e1dfe..64a38e8fa7 100644
> > > > --- a/xen/arch/x86/hvm/monitor.c
> > > > +++ b/xen/arch/x86/hvm/monitor.c
> > > > @@ -328,6 +328,24 @@ bool hvm_monitor_check_p2m(unsigned long gla, =
gfn_t gfn, uint32_t pfec,
> > > >      return monitor_traps(curr, true, &req) >=3D 0;
> > > >  }
> > > >
> > > > +int hvm_monitor_vmexit(unsigned long exit_reason,
> > > > +                       unsigned long exit_qualification)
> > >
> > > Should this maybe live in vmx code or have 'vmx' in the name
> > > somewhere, so that if an svm counterpart is added this doesn't need t=
o
> > > be renamed?
> >
> > I don't follow. Why would this need to be renamed? I would presume the
> > same function would be used on both if it comes to that, perhaps with
> > a unified input structure if the two are not compatible as-is. In any
> > case, there is no vm_event/monitor support for AMD at all (not just
> > for this particular event type) and no plans on adding it any time
> > soon so IMHO we should cross that bridge when and if that becomes
> > necessary.
>
> SVM has at least 3 fields related to vmexit information AFAICT:
> exitcode, exitinfo1 and exitinfo2.
>
> Instead of having an union in hvm_monitor_vmexit to cover all possible
> vendor formats it might be easier to just have vmx_ and svm_ specific
> functions, so it's contained in vendor specific code.
>
> Or maybe that would be worse because you would have to expose a lot of
> vm_event logic to vendor specific code in order to put the request on
> the ring?

I would say it would be worse, I rather not have this code be littered
all over the place unless it must be.

>
> > >
> > > > +{
> > > > +    struct vcpu *curr =3D current;
> > > > +    struct arch_domain *ad =3D &curr->domain->arch;
> > > > +    vm_event_request_t req =3D {};
> > > > +
> > > > +    ASSERT(ad->monitor.vmexit_enabled);
> > > > +
> > > > +    req.reason =3D VM_EVENT_REASON_VMEXIT;
> > > > +    req.u.vmexit.reason =3D exit_reason;
> > > > +    req.u.vmexit.qualification =3D exit_qualification;
> > >
> > > You could set those fields at definition.
> >
> > Sure, but this is the established style throughout the file.
> >
> > > > +
> > > > +    set_npt_base(curr, &req);
> > > > +
> > > > +    return monitor_traps(curr, ad->monitor.vmexit_sync, &req);
> > > > +}
> > > > +
> > > >  /*
> > > >   * Local variables:
> > > >   * mode: C
> > > > diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.=
c
> > > > index c075370f64..2794db46f9 100644
> > > > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > > > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > > > @@ -4008,6 +4008,18 @@ void vmx_vmexit_handler(struct cpu_user_regs=
 *regs)
> > > >          }
> > > >      }
> > > >
> > > > +    if ( unlikely(currd->arch.monitor.vmexit_enabled) )
> > > > +    {
> > > > +        int rc;
> > > > +
> > > > +        __vmread(EXIT_QUALIFICATION, &exit_qualification);
> > > > +        rc =3D hvm_monitor_vmexit(exit_reason, exit_qualification)=
;
> > > > +        if ( rc < 0 )
> > > > +            goto exit_and_crash;
> > > > +        if ( rc )
> > > > +            return;
> > > > +    }
> > >
> > > Just for my understanding, is there any reason to not do this before
> > > updating the altp2m?  AFAICT the update of the active EPTP won't
> > > affect the call to hvm_monitor_vmexit.
> >
> > The currently active altp2m information is included in the vm_event
> > that will be sent out, so it is good to have the correct info for it.
> > I don't currently plan on using altp2m with this particular even type
> > but we should make sure it doesn't send out stale info in case someone
> > wants to use it differently. Certainly no point in sending the event
> > before it as the exit condition in the altp2m update blob is really
> > just dead code and can't actually be reached.
>
> Ack, thanks for the explanation.
>
> > >
> > > > +
> > > >      /* XXX: This looks ugly, but we need a mechanism to ensure
> > > >       * any pending vmresume has really happened
> > > >       */
> > > > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/inclu=
de/asm/domain.h
> > > > index e62e109598..855db352c0 100644
> > > > --- a/xen/arch/x86/include/asm/domain.h
> > > > +++ b/xen/arch/x86/include/asm/domain.h
> > > > @@ -430,6 +430,8 @@ struct arch_domain
> > > >           */
> > > >          unsigned int inguest_pagefault_disabled                   =
         : 1;
> > > >          unsigned int control_register_values                      =
         : 1;
> > > > +        unsigned int vmexit_enabled                               =
         : 1;
> > > > +        unsigned int vmexit_sync                                  =
         : 1;
> > > >          struct monitor_msr_bitmap *msr_bitmap;
> > > >          uint64_t write_ctrlreg_mask[4];
> > > >      } monitor;
> > > > diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/=
include/asm/hvm/monitor.h
> > > > index a75cd8545c..639f6dfa37 100644
> > > > --- a/xen/arch/x86/include/asm/hvm/monitor.h
> > > > +++ b/xen/arch/x86/include/asm/hvm/monitor.h
> > > > @@ -51,6 +51,8 @@ bool hvm_monitor_emul_unimplemented(void);
> > > >
> > > >  bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t =
pfec,
> > > >                             uint16_t kind);
> > > > +int hvm_monitor_vmexit(unsigned long exit_reason,
> > > > +                       unsigned long exit_qualification);
> > > >
> > > >  #endif /* __ASM_X86_HVM_MONITOR_H__ */
> > > >
> > > > diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/incl=
ude/asm/monitor.h
> > > > index 01c6d63bb9..d8d54c5f23 100644
> > > > --- a/xen/arch/x86/include/asm/monitor.h
> > > > +++ b/xen/arch/x86/include/asm/monitor.h
> > > > @@ -89,7 +89,8 @@ static inline uint32_t arch_monitor_get_capabilit=
ies(struct domain *d)
> > > >                      (1U << XEN_DOMCTL_MONITOR_EVENT_DEBUG_EXCEPTIO=
N) |
> > > >                      (1U << XEN_DOMCTL_MONITOR_EVENT_WRITE_CTRLREG)=
 |
> > > >                      (1U << XEN_DOMCTL_MONITOR_EVENT_EMUL_UNIMPLEME=
NTED) |
> > > > -                    (1U << XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFA=
ULT));
> > > > +                    (1U << XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFA=
ULT) |
> > > > +                    (1U << XEN_DOMCTL_MONITOR_EVENT_VMEXIT));
> > > >
> > > >      if ( hvm_is_singlestep_supported() )
> > > >          capabilities |=3D (1U << XEN_DOMCTL_MONITOR_EVENT_SINGLEST=
EP);
> > > > diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
> > > > index 3079726a8b..30ca71432c 100644
> > > > --- a/xen/arch/x86/monitor.c
> > > > +++ b/xen/arch/x86/monitor.c
> > > > @@ -332,6 +332,20 @@ int arch_monitor_domctl_event(struct domain *d=
,
> > > >          break;
> > > >      }
> > > >
> > > > +    case XEN_DOMCTL_MONITOR_EVENT_VMEXIT:
> > > > +    {
> > > > +        bool old_status =3D ad->monitor.vmexit_enabled;
> > > > +
> > > > +        if ( unlikely(old_status =3D=3D requested_status) )
> > > > +            return -EEXIST;
> > >
> > > What about if the requested status is the same as the current one, bu=
t
> > > vmexit sync is not?
> >
> > You need to clear the currently registered event first, then register
> > the new one.
> >
> > > IOW, I'm not sure this check is helpful, and you could likely avoid
> > > the old_status local variable.
> >
> > It is helpful on the callee side. Usually the callee needs to keep
> > track of the state of what events are enabled so that it can clean up
> > after itself and if it ever runs into trying to set the event to
> > something it's already set to then that indicates its state being
> > out-of-sync.
>
> Hm, right.  I wonder if you should also check that the ring is empty
> before changing the status?  So that the callee doesn't change the
> status while requests are still pending on the ring from the previous
> type?

No, that becomes tricky because really the only way to ensure the ring
remains empty from the userspace is to pause the domain, which is very
heavy handed. There is nothing wrong with asking Xen not to produce
more of a certain type of request while still being able to handle the
ones that are already on the ring. For setups where the two should
happen at the same time is where the toolstack first pauses the
domain, clears the ring, then disables the event. Both are valid
approaches.

>
> > >
> > > > +
> > > > +        domain_pause(d);
> > > > +        ad->monitor.vmexit_enabled =3D requested_status;
> > > > +        ad->monitor.vmexit_sync =3D mop->u.vmexit.sync;
> > > > +        domain_unpause(d);
> > > > +        break;
> > > > +    }
> > > > +
> > > >      default:
> > > >          /*
> > > >           * Should not be reached unless arch_monitor_get_capabilit=
ies() is
> > > > diff --git a/xen/include/public/domctl.h b/xen/include/public/domct=
l.h
> > > > index b85e6170b0..4803ed7afc 100644
> > > > --- a/xen/include/public/domctl.h
> > > > +++ b/xen/include/public/domctl.h
> > > > @@ -1057,6 +1057,7 @@ struct xen_domctl_psr_cmt_op {
> > > >  #define XEN_DOMCTL_MONITOR_EVENT_EMUL_UNIMPLEMENTED    10
> > > >  /* Enabled by default */
> > > >  #define XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT     11
> > > > +#define XEN_DOMCTL_MONITOR_EVENT_VMEXIT                12
> > > >
> > > >  struct xen_domctl_monitor_op {
> > > >      uint32_t op; /* XEN_DOMCTL_MONITOR_OP_* */
> > > > @@ -1107,6 +1108,11 @@ struct xen_domctl_monitor_op {
> > > >              /* Pause vCPU until response */
> > > >              uint8_t sync;
> > > >          } debug_exception;
> > > > +
> > > > +        struct {
> > > > +            /* Send event and don't process vmexit */
> > > > +            uint8_t sync;
> > > > +        } vmexit;
> > > >      } u;
> > > >  };
> > > >
> > > > diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_=
event.h
> > > > index 81c2ee28cc..07f106f811 100644
> > > > --- a/xen/include/public/vm_event.h
> > > > +++ b/xen/include/public/vm_event.h
> > > > @@ -175,6 +175,8 @@
> > > >  #define VM_EVENT_REASON_DESCRIPTOR_ACCESS       13
> > > >  /* Current instruction is not implemented by the emulator */
> > > >  #define VM_EVENT_REASON_EMUL_UNIMPLEMENTED      14
> > > > +/* VMEXIT */
> > > > +#define VM_EVENT_REASON_VMEXIT                  15
> > > >
> > > >  /* Supported values for the vm_event_write_ctrlreg index. */
> > > >  #define VM_EVENT_X86_CR0    0
> > > > @@ -394,6 +396,11 @@ struct vm_event_emul_insn_data {
> > > >      uint8_t data[16]; /* Has to be completely filled */
> > > >  };
> > > >
> > > > +struct vm_event_vmexit {
> > > > +    uint64_t reason;
> > > > +    uint64_t qualification;
> > > > +};
> > >
> > > You are exposing an Intel specific interface publicly here.  Might be
> > > worth adding a note, and/or adding 'intel' or 'vmx' in the structure
> > > name: vm_event_vmx_exit, so that a vm_event_svm_exit could also be
> > > added in the future.
> >
> > All vm_event monitor events are for vmx only right now. We can
> > certainly do that abstraction if and when someone decides to add svm
> > support, the ABI is versioned and no structure here is set in stone.
> > No guarantees are even implied for the structures to remain the same
> > in any way between one version of the ABI to the next. So with that I
> > don't see the need for complicating the structures at this time.
>
> Well, it's just altering the name slightly, but the structure layout
> would be the same.  Just so that someone wanting to add SVM support
> doesn't have to go and rename the VMX specific structures.  I think it
> also makes it easier to identify what's vendor specific and what
> should be shared between vendors.
>
> I don't think it adds any complications to the code you are adding,
> but would make it easier for someone wanting to add a new vendor
> support in the future.

I really don't think it's necessary at this point but oh well, I'm not
going to get hung up on that.

Tamas

