Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F05760233
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 00:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569250.889610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO3wS-0008ST-Jr; Mon, 24 Jul 2023 22:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569250.889610; Mon, 24 Jul 2023 22:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO3wS-0008Pt-H2; Mon, 24 Jul 2023 22:22:12 +0000
Received: by outflank-mailman (input) for mailman id 569250;
 Mon, 24 Jul 2023 22:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJiQ=DK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qO3wQ-0008Pn-D2
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 22:22:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 861d92c1-2a70-11ee-8612-37d641c3527e;
 Tue, 25 Jul 2023 00:22:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 608E7613C5;
 Mon, 24 Jul 2023 22:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA059C433C7;
 Mon, 24 Jul 2023 22:22:03 +0000 (UTC)
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
X-Inumbo-ID: 861d92c1-2a70-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690237325;
	bh=2zSe2c6mZbuMMjAXJUZWo9zGelSBJohgIrq4LtFzB5k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XksA0wxe3MC4LqgaZULqJr0B//8FYZPHv+7ZHvgIJxct+XPJR04csWHJKvymicL2k
	 zTXwM3IYe31eUcloovpifw6YODx5rHNv8pOSiPegcj07K9OIoVSjqthj/RsLFmhHNo
	 dEBew2stsWZgA7upQThHmecjhy0uzCAujD73DXce40Va3Trx/N74YXClEhuhmCaLnM
	 yvf1LT5GbECPGcIAv5OGRa57IFT8gsTpHimPfhDRa/tKH5H1AOy/faYCK22PDRgjbU
	 L/NL8BJDR2rvRC+ifBDHL99HVrGR29jfsI3jQfQXQ7pQQYD6D365lv/VTbQGjv68G3
	 gPR2HWGuyvANA==
Date: Mon, 24 Jul 2023 15:22:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/sched: mechanical renaming to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <8d31545a-dcc9-ef9e-8597-da8435872936@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307241519380.3118466@ubuntu-linux-20-04-desktop>
References: <9945fd23b0bb88f3e0c6054a7f992cfa642d3f9f.1689953420.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2307211601230.3118466@ubuntu-linux-20-04-desktop> <8d31545a-dcc9-ef9e-8597-da8435872936@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Jul 2023, Nicola Vetrini wrote:
> On 22/07/23 01:06, Stefano Stabellini wrote:
> > On Fri, 21 Jul 2023, Nicola Vetrini wrote:
> > > Rule 5.3 has the following headline:
> > > "An identifier declared in an inner scope shall not hide an
> > > identifier declared in an outer scope"
> > > 
> > > The renaming s/sched_id/scheduler_id of the function defined in
> > > 'xen/common/sched/core.c' prevents any hiding of that function
> > > by the many instances of omonymous function parameters.
> > > 
> > > Similarly, the renames
> > > - s/ops/operations
> > > - s/do_softirq/exec_softirq
> > > - s/loop/it
> > > are introduced for parameter names, to avoid any conflict
> > > with the homonymous variable or function defined in an enclosing
> > > scope.
> > > 
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > ---
> > >   xen/common/sched/core.c    | 18 +++++++++---------
> > >   xen/common/sched/credit2.c |  4 ++--
> > >   xen/common/sysctl.c        |  2 +-
> > >   xen/include/xen/sched.h    |  2 +-
> > >   4 files changed, 13 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> > > index 022f548652..e74b1208bd 100644
> > > --- a/xen/common/sched/core.c
> > > +++ b/xen/common/sched/core.c
> > > @@ -99,13 +99,13 @@ static void sched_set_affinity(
> > >       struct sched_unit *unit, const cpumask_t *hard, const cpumask_t
> > > *soft);
> > >     static struct sched_resource *cf_check
> > > -sched_idle_res_pick(const struct scheduler *ops, const struct sched_unit
> > > *unit)
> > > +sched_idle_res_pick(const struct scheduler *operations, const struct
> > > sched_unit *unit)
> > 
> > nit: code style, now the line is over 80 chars, could be fixed on commit
> > 
> 
> Ok
> 
> 
> > > -/* sched_id - fetch ID of current scheduler */
> > > -int sched_id(void)
> > > +/* scheduler_id - fetch ID of current scheduler */
> > > +int scheduler_id(void)
> > >   {
> > >       return ops.sched_id;
> > >   }
> > > @@ -2579,7 +2579,7 @@ static void cf_check sched_slave(void)
> > >       struct sched_unit    *prev = vprev->sched_unit, *next;
> > >       s_time_t              now;
> > >       spinlock_t           *lock;
> > > -    bool                  do_softirq = false;
> > > +    bool                  exec_softirq = false;
> > 
> > We don't typically use "exec" especially in the context of softirqs.
> > I would just change it to "softirq".
> > 
> 
> Ok
> 
> > 
> > >       unsigned int          cpu = smp_processor_id();
> > >         ASSERT_NOT_IN_ATOMIC();
> > > @@ -2604,7 +2604,7 @@ static void cf_check sched_slave(void)
> > >               return;
> > >           }
> > >   -        do_softirq = true;
> > > +        exec_softirq = true;
> > >       }
> > >         if ( !prev->rendezvous_in_cnt )
> > > @@ -2614,7 +2614,7 @@ static void cf_check sched_slave(void)
> > >           rcu_read_unlock(&sched_res_rculock);
> > >             /* Check for failed forced context switch. */
> > > -        if ( do_softirq )
> > > +        if ( exec_softirq )
> > >               raise_softirq(SCHEDULE_SOFTIRQ);
> > >             return;
> > > diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> > > index 87a1e31ee9..aba51a7963 100644
> > > --- a/xen/common/sched/credit2.c
> > > +++ b/xen/common/sched/credit2.c
> > > @@ -3884,7 +3884,7 @@ csched2_dump(const struct scheduler *ops)
> > >       list_for_each_entry ( rqd, &prv->rql, rql )
> > >       {
> > >           struct list_head *iter, *runq = &rqd->runq;
> > > -        int loop = 0;
> > > +        int it = 0;
> > 
> > Nice catch! This is almost a bug fix.
> > 
> > 
> > >           /* We need the lock to scan the runqueue. */
> > >           spin_lock(&rqd->lock);
> > > @@ -3901,7 +3901,7 @@ csched2_dump(const struct scheduler *ops)
> > >                 if ( svc )
> > >               {
> > > -                printk("\t%3d: ", loop++);
> > > +                printk("\t%3d: ", it++);
> > >                   csched2_dump_unit(prv, svc);
> > >               }
> > >           }
> > > diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> > > index 0cbfe8bd44..7cabfb0230 100644
> > > --- a/xen/common/sysctl.c
> > > +++ b/xen/common/sysctl.c
> > > @@ -71,7 +71,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t)
> > > u_sysctl)
> > >           break;
> > >         case XEN_SYSCTL_sched_id:
> > > -        op->u.sched_id.sched_id = sched_id();
> > > +        op->u.sched_id.sched_id = scheduler_id();
> > 
> > I am confused about this one. There is no global variable or no other
> > global function named "sched_id". Why do we need to rename sched_id to
> > scheduler_id?
> > 
> 
> sched_id is also a common parameter name used by functions declared where the
> declaration of function 'sched_id' is also visible, so it's entirely
> equivalent whether to change parameter names or the function identifier, but
> since there's just one usage of the function (in 'xen/common/sysctl.c') I
> preferred to make the minimal change in the patch. If you prefer this done the
> other way around, no problem.

I searched through the code and there aren't that many parameters or
local variables called "sched_id" maybe only 5-6. Still, thinking about
it, I think it is better to rename the function to scheduler_id() as you
did in this patch.

Cheers,

Stefano

