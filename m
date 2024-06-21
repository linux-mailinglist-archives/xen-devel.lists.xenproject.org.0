Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF7191305E
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 00:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745664.1152815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKmq2-00027W-S6; Fri, 21 Jun 2024 22:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745664.1152815; Fri, 21 Jun 2024 22:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKmq2-000261-PI; Fri, 21 Jun 2024 22:34:34 +0000
Received: by outflank-mailman (input) for mailman id 745664;
 Fri, 21 Jun 2024 22:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKmq0-00025v-RT
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 22:34:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cff87a4-301e-11ef-90a3-e314d9c70b13;
 Sat, 22 Jun 2024 00:34:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D2D3862420;
 Fri, 21 Jun 2024 22:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B96C2BBFC;
 Fri, 21 Jun 2024 22:34:26 +0000 (UTC)
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
X-Inumbo-ID: 6cff87a4-301e-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719009268;
	bh=TyZBPDMQXih2WNT7cUG5PFw78FxIHahxXePUGgoWvkM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k6DmblBniO7VJiWHndC/1RNZWzERIKtJ6XqnTiZYqtOIwdCBcQNOr6cFIhsjNeFg5
	 +B+K+Wq35CBsKmNxz+pCkdv9LbgkcH5vNwmQFdyh4X2a9WxhtL5afR2I6WuDr1WC4/
	 apKKqW1aTViEh0l3kiNBxrWOcOkBTAv7qI0Wd1Zj/cTKCFJb53jimvS6jZpXffiEEA
	 1RcLWEmbeXoGXj99hX2/Dpxd+ko6V5XZ8CU3+umOZHhIG/WlH2QPDecZKZgLk63YL7
	 7DjlKx2UPt6vzYKGNx3C0Yi58aiwkNpyTsgUkacl5PjnESHznj0EbIIoOlDTAlWtIK
	 Qs7JImCNpXbNw==
Date: Fri, 21 Jun 2024 15:34:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v2] xen: add explicit comment to identify notifier
 patterns
In-Reply-To: <bce5eae2-973d-4d69-bee1-09f9f09dd011@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406211529130.2572888@ubuntu-linux-20-04-desktop>
References: <d814434bf73e341f5d35836fa7063a728f7b7de4.1718788908.git.federico.serafini@bugseng.com> <f7d46c15-ff85-4a6f-afd7-df18649726c8@xen.org> <2072bf59-f125-4789-be77-40ed3641aec4@bugseng.com> <alpine.DEB.2.22.394.2406201811200.2572888@ubuntu-linux-20-04-desktop>
 <bce5eae2-973d-4d69-bee1-09f9f09dd011@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1880117008-1719009152=:2572888"
Content-ID: <alpine.DEB.2.22.394.2406211532370.2572888@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1880117008-1719009152=:2572888
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2406211532371.2572888@ubuntu-linux-20-04-desktop>

On Fri, 21 Jun 2024, Federico Serafini wrote:
> On 21/06/24 03:13, Stefano Stabellini wrote:
> > On Thu, 20 Jun 2024, Federico Serafini wrote:
> > > On 19/06/24 13:17, Julien Grall wrote:
> > > > Hi Federico,
> > > > 
> > > > On 19/06/2024 10:29, Federico Serafini wrote:
> > > > > MISRA C Rule 16.4 states that every `switch' statement shall have a
> > > > > `default' label" and a statement or a comment prior to the
> > > > > terminating break statement.
> > > > > 
> > > > > This patch addresses some violations of the rule related to the
> > > > > "notifier pattern": a frequently-used pattern whereby only a few
> > > > > values
> > > > > are handled by the switch statement and nothing should be done for
> > > > > others (nothing to do in the default case).
> > > > > 
> > > > > Note that for function mwait_idle_cpu_init() in
> > > > > xen/arch/x86/cpu/mwait-idle.c the /* Notifier pattern. */ comment is
> > > > > not added: differently from the other functions covered in this patch,
> > > > > the default label has a return statement that does not violates Rule
> > > > > 16.4.
> > > > > 
> > > > > No functional change.
> > > > > 
> > > > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > > > > ---
> > > > > Changes in v2:
> > > > > as Jan pointed out, in the v1 some patterns were not explicitly
> > > > > identified
> > > > > (https://lore.kernel.org/xen-devel/cad05a5c-e2d8-4e5d-af05-30ae6f959184@bugseng.com/).
> > > > > 
> > > > > This version adds the /* Notifier pattern. */ to all the pattern
> > > > > present
> > > > > in
> > > > > the Xen codebase except for mwait_idle_cpu_init().
> > > > > ---
> > > > >    xen/arch/arm/cpuerrata.c                     | 1 +
> > > > >    xen/arch/arm/gic-v3-lpi.c                    | 4 ++++
> > > > >    xen/arch/arm/gic.c                           | 1 +
> > > > >    xen/arch/arm/irq.c                           | 4 ++++
> > > > >    xen/arch/arm/mmu/p2m.c                       | 1 +
> > > > >    xen/arch/arm/percpu.c                        | 1 +
> > > > >    xen/arch/arm/smpboot.c                       | 1 +
> > > > >    xen/arch/arm/time.c                          | 1 +
> > > > >    xen/arch/arm/vgic-v3-its.c                   | 2 ++
> > > > >    xen/arch/x86/acpi/cpu_idle.c                 | 4 ++++
> > > > >    xen/arch/x86/cpu/mcheck/mce.c                | 4 ++++
> > > > >    xen/arch/x86/cpu/mcheck/mce_intel.c          | 4 ++++
> > > > >    xen/arch/x86/genapic/x2apic.c                | 3 +++
> > > > >    xen/arch/x86/hvm/hvm.c                       | 1 +
> > > > >    xen/arch/x86/nmi.c                           | 1 +
> > > > >    xen/arch/x86/percpu.c                        | 3 +++
> > > > >    xen/arch/x86/psr.c                           | 3 +++
> > > > >    xen/arch/x86/smpboot.c                       | 3 +++
> > > > >    xen/common/kexec.c                           | 1 +
> > > > >    xen/common/rcupdate.c                        | 1 +
> > > > >    xen/common/sched/core.c                      | 1 +
> > > > >    xen/common/sched/cpupool.c                   | 1 +
> > > > >    xen/common/spinlock.c                        | 1 +
> > > > >    xen/common/tasklet.c                         | 1 +
> > > > >    xen/common/timer.c                           | 1 +
> > > > >    xen/drivers/cpufreq/cpufreq.c                | 1 +
> > > > >    xen/drivers/cpufreq/cpufreq_misc_governors.c | 3 +++
> > > > >    xen/drivers/passthrough/x86/hvm.c            | 3 +++
> > > > >    xen/drivers/passthrough/x86/iommu.c          | 3 +++
> > > > >    29 files changed, 59 insertions(+)
> > > > > 
> > > > > diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> > > > > index 2b7101ea25..69c30aecd8 100644
> > > > > --- a/xen/arch/arm/cpuerrata.c
> > > > > +++ b/xen/arch/arm/cpuerrata.c
> > > > > @@ -730,6 +730,7 @@ static int cpu_errata_callback(struct
> > > > > notifier_block
> > > > > *nfb,
> > > > >            rc = enable_nonboot_cpu_caps(arm_errata);
> > > > >            break;
> > > > >        default:
> > > > > +        /* Notifier pattern. */
> > > > Without looking at the commit message (which may not be trivial when
> > > > committed), it is not clear to me what this is supposed to mean. Will
> > > > there
> > > > be a longer explanation in the MISRA doc? Should this be a SAF-*
> > > > comment?
> > > > 
> > > > >            break;
> > > > >        }
> > > > > diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> > > > > index eb0a5535e4..4c2bd35403 100644
> > > > > --- a/xen/arch/arm/gic-v3-lpi.c
> > > > > +++ b/xen/arch/arm/gic-v3-lpi.c
> > > > > @@ -389,6 +389,10 @@ static int cpu_callback(struct notifier_block
> > > > > *nfb,
> > > > > unsigned long action,
> > > > >                printk(XENLOG_ERR "Unable to allocate the pendtable for
> > > > > CPU%lu\n",
> > > > >                       cpu);
> > > > >            break;
> > > > > +
> > > > > +    default:
> > > > > +        /* Notifier pattern. */
> > > > > +        break;
> > > > 
> > > > Skimming through v1, it was pointed out that gic-v3-lpi may miss some
> > > > cases.
> > > > 
> > > > Let me start with that I understand this patch is technically not
> > > > changing
> > > > anything. However, it gives us an opportunity to check the notifier
> > > > pattern.
> > > > 
> > > > Has anyone done any proper investigation? If so, what was the outcome?
> > > > If
> > > > not, have we identified someone to do it?
> > > > 
> > > > The same question will apply for place where you add "default".
> > > 
> > > Yes, I also think this could be an opportunity to check the pattern
> > > but no one has yet been identified to do this.
> > 
> > I don't think I understand Julien's question and/or your answer.
> > 
> > Is the question whether someone has done an analysis to make sure this
> > patch covers all notifier patters in the xen codebase?
> 
> I think Jan and Julien's concerns are about the fact that my patch
> takes for granted that all the switch statements are doing the right
> thing: someone should investigate the notifier patterns to confirm that
> their are handling the different cases correctly.

That's really difficult to do, even for the maintainers of the code in
question.

And by not taking this patch we are exposing ourselves to more safety
risks because we cannot make R16.4 blocking.


> > If so, I expect that you have done an analysis simply by basing this
> > patch on the 16.4 violations reported by ECLAIR?
> 
> The previous version of the patch was based only on the reports of
> ECLAIR but Jan said "you left out some patterns, why?".
> 
> So, this version of the patch adds the comment for all the notifier
> patterns I found using git grep "struct notifier_block \*"
> (a superset of the ones reported by ECLAIR because some of them are in
> files excluded from the analysis or deviated).

I think this patch is a step in the right direction. It doesn't prevent
anyone in the community from making expert evaluations on whether the
pattern is implemented correctly.

Honestly, I don't see another way to make progress on this, except for
maybe deviating project-wide "struct notifier_block". But that's
conceptually the same thing as this patch.


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1880117008-1719009152=:2572888--

