Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGeqFFAfC2q8DgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:16:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9991256E8A9
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311925.1582049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOylg-0004D0-5v; Mon, 18 May 2026 14:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311925.1582049; Mon, 18 May 2026 14:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOylg-0004Af-2n; Mon, 18 May 2026 14:16:28 +0000
Received: by outflank-mailman (input) for mailman id 1311925;
 Mon, 18 May 2026 14:16:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOyle-0004AZ-Fk
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 14:16:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOyld-00EkGj-Rv
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:16:25 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b1f35-2eae-0a2a0a5409dd-0a2a450197ba-16
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:16:25 +0200
Received: from [209.85.208.176] (helo=mail-lj1-f176.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b1f39-c1f2-0a2a45010019-d155d0b0b96b-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:16:25 +0200
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-39378db197aso26733781fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 07:16:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779113785; cv=none;
        d=google.com; s=arc-20240605;
        b=OYl2LXrRvPw7AOGZuHsz2ITjCFjMguDA16aA7aIDhrsP6JATBG15fXMs71d1VWzfP2
         lLfoTfjEni3nU7TdvlH73+Fnl2cofY0y92XJTR6uaDgEpX5af2DTwTKy/KU7+9jIEnr7
         KlJHh26OSgn7OLpUunP+PV1C7WE7pLFz1gKeVsVe29xLs3njt7p7MOgeCFpMsnrxFn1N
         ctbqzTjX5DeSTfQ+onij3T+DThfSJnYKxyaTuoHELASXhpm0J2po+DcHNDS6fAQrmbZL
         tG034BxinCWlGZzq7KhGs//RdGg/ia3s7dZLHhyuy0SYdJ+v9iMSUymuUlXkqJkL0hGv
         Co0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s0yCPUXIuHTODuAprKwHErEP5y4282fQnqGh7U63b4Q=;
        fh=mPTADBdpL2mlVELGLTcBdYf/jtmQhhkSKKIES9IQyb8=;
        b=jR8jjfabaDYVQShsAdtSQ1+hyLbRYT4+YP/LHX5NYwYVY5VkftiyPhs2+wappDSXQG
         vw9BGbRCjyQgUbO95WL+tH20XR66TwkqSKMsdX74+0y4KzIggPapJfEPvZc7JqxFaUmm
         GsKENL0vL2G7KCEvQBsPVNRY8IgXqKD3FUvvjfK8fl0dMpTYTRHP1LiJ2F8DbAHa7aAz
         FYfLZb4hQ19a9X8YZFvxdmpl/JFJwkNfGPpILrmP+c3O+OHc4wu5DHyXHlYJtkuoEQGs
         tZrBTMe3SshKmbUxQOGY3BtW3nP4tSxtoTiCrw+YnT38KMv7ZqS4usJDlZoobb3S/8eW
         04DQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779113785; x=1779718585; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0yCPUXIuHTODuAprKwHErEP5y4282fQnqGh7U63b4Q=;
        b=qddjtAmupfTw14dlvMgFTvBlCc9la3uZKZzF7c+nVzZKNFI0In67L4me1Aubk0U4ch
         rPvilOhwztWVgdd49UZcu6Pe1i0ZXqdNaNfn5tr8HJvOiAq1Qyga87DsPPkCQFelgmOp
         8pIyXEsMnbZ9kWXTVsxKxYSDAYxyfjOLFZ1Kj5Qo6j+3YFsCtI1Tv5Plk0ITJ3vrLo1x
         qxo+yPL8FYU1PG1EbCKaJ/hJa12dzsjCyAoGDNrz/jx4U12ewrZAbWT8CsXa73sRyMM5
         erdjMeirhHhb7BrX1QK4P9z9D0zSfMuBxNXkccp/QmF/FYz7flmGORHVkv8lxaXDPGdk
         aeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113785; x=1779718585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0yCPUXIuHTODuAprKwHErEP5y4282fQnqGh7U63b4Q=;
        b=AW2m6H53glvrWj45s6pugzt/MUbUEb11sdsd0LS/ug7XPDqZStlFFsxtaYQ5zMMaGT
         1wyQNXtZNADHfwrVcK0VKpVOfbvuxYwwBNqL6MGAAtbOgZV1a0RBsP3bqzm4WNQc+asv
         QayVFmndPyGdFRqj7Uif6ebPY5l1Rxyc8NNF5UiktkHC0zPYUR0ySlz5gtaICNVy3fXN
         X6gETLWEuPLxgbda2l7U0PE5kC8CuHSgSHgJTmwd/3+vGS43s46FdM8oSEvrklVLiu7f
         29Bj7xNeZaN4seYWCG+KOSK+3vjYWiWB4dvNkx/j1/MGGW3pL66VdKZqSWzVuB7tyOGy
         VMfw==
X-Gm-Message-State: AOJu0Yzkf/dr0cnA1N1I8msAcbcnESMWP2SSisbRH57F3jEX5RuzVuzo
	2Lfe8F82zmitowCWRQBmbV5v1DYxhx9ar8z0Hg0PTgYH/ajY9fqVJsGLnTY2PJevPSKr5hpJ+n+
	75xaJnaCx0IoRmdU2zNH7bWg2H9wVhzY=
X-Gm-Gg: Acq92OHlopzSvUgGwuM/Esf/ERGbd7+VUX5I0lMOG0rSsvTu8pmpo4f+NzCxTqiw4b7
	q7Z5HYiTBimxfwvgrLX+T9W8Fmf7VRkknoYpbqXMkvfKvQoBOs3MxBJlzyxeNtJfC680V4ctMir
	NweLvCNtQhzVK9Nyaj6Nctyn/WWapsMDK90eOu0hyXWYgyp+wX2hqPcOtrIASYTC2eKbGedPAkv
	z+qVA9JKDWnOWZne+zZ4Lb/++CF7yoMEkl9wBw4HOTlml/uL3NrMYZeucUdBBVBhL2IKaJs9VzY
	w7E1
X-Received: by 2002:a05:651c:1449:b0:393:d6dd:e8a1 with SMTP id
 38308e7fff4ca-39561c07c23mr46088241fa.2.1779113784503; Mon, 18 May 2026
 07:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <06448a30ef6694a55ac85d4c8c78ca2d71342430.1778605274.git.mykola_kvach@epam.com>
 <c8d0e466-d5e3-4791-9dfe-6221ba219abb@gmail.com>
In-Reply-To: <c8d0e466-d5e3-4791-9dfe-6221ba219abb@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 17:16:13 +0300
X-Gm-Features: AVHnY4JaraBJcBj3bPe4VM9QdrQguSh8l0rXdLUhU9mPY2RnZ62qAwrt5-duwdo
Message-ID: <CAGeoDV9BjVRQFOnujOLS+trQfnC7kH8K+HLvp3=61hoV2+jE-w@mail.gmail.com>
Subject: Re: [PATCH v9 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Rahul Singh <rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1779113785-B4B4EFF4-2FB592D6/0/0
X-purgate-type: clean
X-purgate-size: 19916
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:olekstysh@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9991256E8A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oleksandr,

Thank you for the review.

On Sun, May 17, 2026 at 5:37=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
>
>
> On 5/12/26 20:07, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
>
>
> Hello Mykola
>
> >
> > Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
> > capability for platforms where the hardware domain can be parked with
> > SHUTDOWN_suspend without calling hwdom_shutdown().
> >
> > Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
> > non-control domains, including the hardware domain when it is not actin=
g as a
> > control domain, the call is handled as a guest/domain suspend request a=
nd
> > parks the domain in SHUTDOWN_suspend.
> >
> > Control domains need additional sequencing because their SYSTEM_SUSPEND
> > request is used to coordinate host-wide suspend. A non-last awake contr=
ol
> > domain may be parked in SHUTDOWN_suspend without requiring the host sus=
pend
> > path to be available. The last awake control domain is treated as the p=
oint
> > where the request becomes a host-suspend request, and it may only proce=
ed
> > when all non-control domains are already in SHUTDOWN_suspend and the ho=
st
> > suspend path is available.
> >
> > Keep the control-domain sequencing and domain-readiness checks out of
> > PSCI_FEATURES. They are per-attempt runtime conditions rather than stab=
le PSCI
> > function availability. Advertise SYSTEM_SUSPEND as implemented by vPSCI=
 and
> > enforce the sequencing policy in the call handler.
> >
> > Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEN=
D so
> > that SHUTDOWN_suspend from the hardware domain can be treated as a doma=
in
> > suspend state rather than as a hardware-domain initiated host shutdown.=
 This
> > does not by itself imply that host-wide suspend is available.
> >
> > Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPE=
ND
> > capability with runtime blockers reported by Xen-owned subsystems. Add
> > runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ p=
aths
> > lacking suspend/resume support. These blockers are runtime based, so th=
ey
> > only apply to drivers or paths that Xen actually uses on the platform. =
For
> > SMMUv3, the blocker applies only when Xen actually uses the MSI IRQ pat=
h,
> > since resume does not restore the SMMU *_IRQ_CFGn MSI registers yet.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
> Apart from Jan's and Luca's findings, patch looks good to me. Just a few
> questions to clarify, apologies if these have already been discussed
> elsewhere.
>
> > ---
> >   xen/arch/arm/Kconfig                  |   1 +
> >   xen/arch/arm/gic.c                    |   6 ++
> >   xen/arch/arm/include/asm/psci.h       |   3 +
> >   xen/arch/arm/include/asm/suspend.h    |  10 ++-
> >   xen/arch/arm/psci.c                   |   7 ++
> >   xen/arch/arm/suspend.c                |  40 +++++++++
> >   xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++++--=
-
> >   xen/common/Kconfig                    |   3 +
> >   xen/common/domain.c                   |   7 +-
> >   xen/drivers/char/serial.c             |  12 +++
> >   xen/drivers/passthrough/arm/iommu.c   |   4 +
> >   xen/drivers/passthrough/arm/smmu-v3.c |   4 +
> >   xen/include/xen/serial.h              |   1 +
> >   xen/include/xen/suspend.h             |   2 +
> >   14 files changed, 201 insertions(+), 13 deletions(-)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index 79622b46a1..54a5bfb9ae 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -19,6 +19,7 @@ config ARM
> >       select HAS_ALTERNATIVE if HAS_VMAP
> >       select HAS_DEVICE_TREE_DISCOVERY
> >       select HAS_DOM0LESS
> > +     select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
> >       select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
> >       select HAS_STACK_PROTECTOR
> >       select HAS_UBSAN
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index 7727ffed5a..a5efcaeb4c 100644
> > --- a/xen/arch/arm/gic.c
> > +++ b/xen/arch/arm/gic.c
> > @@ -26,6 +26,7 @@
> >   #include <asm/device.h>
> >   #include <asm/io.h>
> >   #include <asm/gic.h>
> > +#include <asm/suspend.h>
> >   #include <asm/vgic.h>
> >   #include <asm/acpi.h>
> >
> > @@ -44,6 +45,11 @@ static void __init __maybe_unused build_assertions(v=
oid)
> >   void register_gic_ops(const struct gic_hw_operations *ops)
> >   {
> >       gic_hw_ops =3D ops;
> > +
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    if ( !ops->suspend || !ops->resume )
> > +        host_system_suspend_disable("GIC driver lacks suspend/resume s=
upport");
> > +#endif
> >   }
> >
> >   static void clear_cpu_lr_mask(void)
> > diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm=
/psci.h
> > index bb3c73496e..142fa1bfe5 100644
> > --- a/xen/arch/arm/include/asm/psci.h
> > +++ b/xen/arch/arm/include/asm/psci.h
> > @@ -24,6 +24,9 @@ void call_psci_cpu_off(void);
> >   void call_psci_system_off(void);
> >   void call_psci_system_reset(void);
> >   int call_psci_system_suspend(void);
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +bool psci_system_suspend_allowed(void);
> > +#endif
> >
> >   /* Range of allocated PSCI function numbers */
> >   #define     PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/=
asm/suspend.h
> > index 2d9fc331fc..87db12eac3 100644
> > --- a/xen/arch/arm/include/asm/suspend.h
> > +++ b/xen/arch/arm/include/asm/suspend.h
> > @@ -38,7 +38,15 @@ extern struct resume_cpu_context resume_cpu_context;
> >
> >   int prepare_resume_ctx(void);
> >   void hyp_resume(void);
> > -#endif /* CONFIG_SYSTEM_SUSPEND */
> > +bool host_system_suspend_allowed(void);
> > +void host_system_suspend_disable(const char *reason);
> > +
> > +#else /* !CONFIG_SYSTEM_SUSPEND */
> > +
> > +static inline bool host_system_suspend_allowed(void) { return false; }
> > +static inline void host_system_suspend_disable(const char *reason) {}
> > +
> > +#endif
> >
> >   #endif /* ARM_SUSPEND_H */
> >
> > diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> > index e05dae1133..e9d78668fd 100644
> > --- a/xen/arch/arm/psci.c
> > +++ b/xen/arch/arm/psci.c
> > @@ -41,6 +41,13 @@ static bool __ro_after_init has_psci_system_suspend;
> >
> >   #define PSCI_RET(res)   ((int32_t)(res).a0)
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +bool psci_system_suspend_allowed(void)
> > +{
> > +    return has_psci_system_suspend;
> > +}
> > +#endif
> > +
> >   int call_psci_cpu_on(int cpu)
> >   {
> >       struct arm_smccc_res res;
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > index 6ea4a0f9cc..a571035d2c 100644
> > --- a/xen/arch/arm/suspend.c
> > +++ b/xen/arch/arm/suspend.c
> > @@ -1,9 +1,49 @@
> >   /* SPDX-License-Identifier: GPL-2.0-only */
> >
> > +#include <asm/psci.h>
> >   #include <asm/suspend.h>
> >
> > +#include <xen/lib.h>
> > +#include <xen/serial.h>
> > +
> >   struct resume_cpu_context resume_cpu_context;
> >
> > +/*
> > + * Non-PSCI infrastructure can make host suspend impossible even when =
the PSCI
> > + * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has=
 no valid
> > + * suspend/resume path.
> > + *
> > + * This gate is checked only when the last awake control domain attemp=
ts to
> > + * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
> > + */
> > +static bool host_system_suspend_runtime_allowed =3D true;
> > +
> > +static bool host_serial_suspend_allowed(void)
> > +{
> > +    if ( serial_suspend_supported() )
> > +        return true;
> > +
> > +    printk_once(XENLOG_INFO
> > +                "Host SYSTEM_SUSPEND blocked: serial driver lacks susp=
end/resume support\n");
> > +
> > +    return false;
> > +}
> > +
> > +bool host_system_suspend_allowed(void)
> > +{
> > +    return psci_system_suspend_allowed() &&
> > +           host_serial_suspend_allowed() &&
> > +           host_system_suspend_runtime_allowed;
> > +}
> > +
> > +void host_system_suspend_disable(const char *reason)
> > +{
> > +    host_system_suspend_runtime_allowed =3D false;
> > +
> > +    printk(XENLOG_INFO "Host SYSTEM_SUSPEND blocked: %s\n",
> > +           reason ? reason : "unsupported suspend/resume path");
> > +}
> > +
> >   /*
> >    * Local variables:
> >    * mode: C
> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> > index ac6af6118f..48a963ae3e 100644
> > --- a/xen/arch/arm/vpsci.c
> > +++ b/xen/arch/arm/vpsci.c
> > @@ -5,6 +5,7 @@
> >
> >   #include <asm/current.h>
> >   #include <asm/domain.h>
> > +#include <asm/suspend.h>
> >   #include <asm/vgic.h>
> >   #include <asm/vpsci.h>
> >   #include <asm/event.h>
> > @@ -219,6 +220,89 @@ static void do_psci_0_2_system_reset(void)
> >       domain_shutdown(d,SHUTDOWN_reboot);
> >   }
> >
> > +/*
> > + * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend t=
ransition,
> > + * so multiple control domains cannot all observe each other as still =
awake.
> > + */
> > +static DEFINE_SPINLOCK(vpsci_system_suspend_lock);
> > +
> > +static bool domain_in_suspend_state(struct domain *d)
> > +{
> > +    bool suspended;
> > +
> > +    spin_lock(&d->shutdown_lock);
> > +    suspended =3D d->is_shut_down && d->shutdown_code =3D=3D SHUTDOWN_=
suspend;
> > +    spin_unlock(&d->shutdown_lock);
> > +
> > +    return suspended;
> > +}
> > +
> > +static int32_t domain_psci_system_suspend_policy(struct domain *d)
> > +{
> > +    struct domain *other;
> > +    bool last_awake_control_domain =3D true;
> > +    bool awake_non_control_domain =3D false;
> > +
> > +    /* Only control domains participate in sequencing policy. */
> > +    if ( !is_control_domain(d) )
> > +        return 0;
> > +
> > +    rcu_read_lock(&domlist_read_lock);
> > +
> > +    for_each_domain ( other )
> > +    {
> > +        bool suspended;
> > +
> > +        if ( other =3D=3D d )
> > +            continue;
> > +
> > +        suspended =3D domain_in_suspend_state(other);
> > +        if ( suspended )
> > +            continue;
> > +
> > +        if ( is_control_domain(other) )
> > +        {
> > +            last_awake_control_domain =3D false;
> > +            break;
> > +        }
> > +
> > +        awake_non_control_domain =3D true;
> > +    }
> > +
> > +    rcu_read_unlock(&domlist_read_lock);
> > +
> > +    /*
> > +     * Another control domain is still awake. This request is only the=
 first
> > +     * phase of the sequencing: park this control domain and leave the=
 host
> > +     * running. Host-wide suspend gates must not block this intermedia=
te state.
> > +     */
> > +    if ( !last_awake_control_domain )
> > +        return 0;
> > +
> > +    /*
> > +     * This is the last awake control domain. It must not be parked un=
less the
> > +     * request can proceed as a host-suspend request; otherwise Xen wo=
uld lose
> > +     * the last domain that can coordinate the system suspend.
> > +     */
> > +    if ( awake_non_control_domain )
> > +    {
> > +        printk(XENLOG_DEBUG
> > +               "SYSTEM_SUSPEND denied: last awake control domain dom%u=
 requested host suspend while non-control domains are still awake\n",
> > +               d->domain_id);
> > +        return PSCI_DENIED;
> > +    }
> > +
> > +    /*
> > +     * Host-wide gates are relevant only for the last-control-domain c=
ase. They
> > +     * must not block parking of a non-last control domain, but they m=
ust reject
> > +     * the last control domain when host suspend is not available.
> > +     */
> > +    if ( !host_system_suspend_allowed() )
> > +        return PSCI_NOT_SUPPORTED;
>
> In do_psci_1_0_features(), the guest is told that SYSTEM_SUSPEND is
> implemented:
>
> case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>      return 0;  /* "This function IS implemented" */
>
> However, when the guest actually calls SYSTEM_SUSPEND, the policy check
> above can reject it by return PSCI_NOT_SUPPORTED; /* "This function is
> NOT implemented" */
>
> These two responses are contradictory. The guest probes via
> PSCI_FEATURES, is told suspend is available, and then gets
> PSCI_NOT_SUPPORTED when it attempts to use it (if let's say the SMMUv3
> driver has blocked suspend).
>
>  From Arm Power State Coordination Interface (DEN0022F.b):
>
> 5.3.2 Implementation responsibilities
> ... Any function that is not implemented must return NOT_SUPPORTED in
> accordance with the SMC Calling Conventions [4]. In addition,
> PSCI_FEATURES must also return NOT_SUPPORTED for any non-implemented
> function...
>
> My questing is should do_psci_1_0_features() consult the same policy so
> that the feature is only advertised when it can actually be used?
>
> Or am I missing something here?

For the PSCI_FEATURES part, I agree there is a problem with returning
PSCI_NOT_SUPPORTED after advertising SYSTEM_SUSPEND as implemented.

I would still prefer not to make PSCI_FEATURES depend on the full
domain_psci_system_suspend_policy(), because that policy depends on
runtime state: whether this is the last awake control domain and whether
other non-control domains are still awake. Reporting the feature as
available or unavailable based on that state would make PSCI_FEATURES
unstable between attempts.

However, once vPSCI advertises SYSTEM_SUSPEND as implemented, the call
handler should not return PSCI_NOT_SUPPORTED for an attempt-time policy
failure. I think PSCI_DENIED is a better fit for the last-control-domain
case when the request cannot proceed as host suspend because Xen currently
cannot support the host-wide suspend path. I will rework that part.

>
> > +
> > +    return 0;
> > +}
> > +
> >   static int32_t do_psci_1_0_system_suspend(register_t epoint, register=
_t cid)
> >   {
> >       int32_t rc;
> > @@ -232,10 +316,6 @@ static int32_t do_psci_1_0_system_suspend(register=
_t epoint, register_t cid)
> >       if ( is_64bit_domain(d) && is_thumb )
> >           return PSCI_INVALID_ADDRESS;
> >
> > -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> > -    if ( is_hardware_domain(d) )
> > -        return PSCI_NOT_SUPPORTED;
> > -
> >       /* Ensure that all CPUs other than the calling one are offline */
> >       domain_lock(d);
> >       for_each_vcpu ( d, v )
> > @@ -252,16 +332,29 @@ static int32_t do_psci_1_0_system_suspend(registe=
r_t epoint, register_t cid)
> >       if ( rc )
> >           return PSCI_DENIED;
> >
> > -    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> > +    spin_lock(&vpsci_system_suspend_lock);
> > +
> > +    rc =3D domain_psci_system_suspend_policy(d);
> > +    if ( !rc )
> > +    {
> > +        rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> > +        if ( rc )
> > +            rc =3D PSCI_DENIED;
> > +        else
> > +        {
> > +            rctx->ctxt =3D ctxt;
> > +            rctx->wake_cpu =3D current;
> > +        }
> > +    }
> > +
> > +    spin_unlock(&vpsci_system_suspend_lock);
> > +
> >       if ( rc )
> >       {
> >           free_vcpu_guest_context(ctxt);
> > -        return PSCI_DENIED;
> > +        return rc;
> >       }
> >
> > -    rctx->ctxt =3D ctxt;
> > -    rctx->wake_cpu =3D current;
> > -
> >       gprintk(XENLOG_DEBUG,
> >               "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=
=3D%#"PRIregister"\n",
> >               epoint, cid);
> > @@ -287,10 +380,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_=
func_id)
> >       case PSCI_0_2_FN32_SYSTEM_RESET:
> >       case PSCI_1_0_FN32_PSCI_FEATURES:
> >       case ARM_SMCCC_VERSION_FID:
> > -        return 0;
> >       case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >       case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> > -        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTE=
D : 0;
> > +        return 0;
> >       default:
> >           return PSCI_NOT_SUPPORTED;
> >       }
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index 5ff71480ee..816a1a4ecb 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -140,6 +140,9 @@ config HAS_EX_TABLE
> >   config HAS_FAST_MULTIPLY
> >       bool
> >
> > +config HAS_HWDOM_SYSTEM_SUSPEND
> > +     bool
> > +
> >   config HAS_IOPORTS
> >       bool
> >
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index bb9e210c28..d3edfb2a13 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1375,6 +1375,11 @@ void __domain_crash(struct domain *d)
> >       domain_shutdown(d, SHUTDOWN_crash);
> >   }
> >
> > +static inline bool want_hwdom_shutdown(uint8_t reason)
> > +{
> > +    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
> > +           reason !=3D SHUTDOWN_suspend;
> > +}
> >
> >   int domain_shutdown(struct domain *d, u8 reason)
> >   {
> > @@ -1391,7 +1396,7 @@ int domain_shutdown(struct domain *d, u8 reason)
> >           d->shutdown_code =3D reason;
> >       reason =3D d->shutdown_code;
> >
> > -    if ( is_hardware_domain(d) )
> > +    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
> >           hwdom_shutdown(reason);
> >
> >       if ( d->is_shutting_down )
> > diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
> > index adb312d796..cc2b5b5dee 100644
> > --- a/xen/drivers/char/serial.c
> > +++ b/xen/drivers/char/serial.c
> > @@ -497,6 +497,8 @@ const struct vuart_info *serial_vuart_info(int idx)
> >
> >   #ifdef CONFIG_SYSTEM_SUSPEND
> >
> > +static bool __read_mostly serial_suspend_available =3D true;
> > +
> >   void serial_suspend(void)
> >   {
> >       int i;
> > @@ -513,6 +515,11 @@ void serial_resume(void)
> >               com[i].driver->resume(&com[i]);
> >   }
> >
> > +bool serial_suspend_supported(void)
> > +{
> > +    return serial_suspend_available;
> > +}
> > +
> >   #endif /* CONFIG_SYSTEM_SUSPEND */
> >
> >   void __init serial_register_uart(int idx, struct uart_driver *driver,
> > @@ -521,6 +528,11 @@ void __init serial_register_uart(int idx, struct u=
art_driver *driver,
> >       /* Store UART-specific info. */
> >       com[idx].driver =3D driver;
> >       com[idx].uart   =3D uart;
> > +
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    if ( !driver->suspend || !driver->resume )
> > +        serial_suspend_available =3D false;
>
>
> I wonder why different suspend-blocker API are used for serial vs other
> subsystems (GIC, IOMMU). Why serial_register_uart() could not simply
> call host_system_suspend_disable() like every other subsystem?
>
> This would avoid adding three unnecessary symbols
> (serial_suspend_available, serial_suspend_supported(),
> host_serial_suspend_allowed()).
>
> Or am I missing something here?

For the serial case, the split was intentional. The other callers are in
Arm-specific code, while serial.c is common code. I wanted to avoid making
the common serial layer call an Arm host-suspend policy helper directly,
or requiring arch-specific stub(s) only for this case.

So the current shape keeps serial.c exposing only whether the registered
UART drivers have suspend/resume callbacks, while the Arm host suspend
policy decides whether that blocks host SYSTEM_SUSPEND.

That said, if the preferred direction is to make host_system_suspend_disabl=
e()
a generic suspend helper with no-op stub(s) for architectures that do not u=
se
it, I can rework serial_register_uart() to call it directly and drop the
extra serial_suspend_supported() path.

Best regards,
Mykola

