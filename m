Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA3560809C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 23:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427988.677672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olzLM-0006si-0m; Fri, 21 Oct 2022 21:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427988.677672; Fri, 21 Oct 2022 21:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olzLL-0006qC-TK; Fri, 21 Oct 2022 21:14:15 +0000
Received: by outflank-mailman (input) for mailman id 427988;
 Fri, 21 Oct 2022 21:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QljK=2W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1olzLJ-0006q6-Nj
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 21:14:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d647046-5185-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 23:14:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6284861F8A;
 Fri, 21 Oct 2022 21:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0FBC433C1;
 Fri, 21 Oct 2022 21:14:05 +0000 (UTC)
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
X-Inumbo-ID: 4d647046-5185-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666386847;
	bh=x8ql3IN6/9IyGm/rSegdtnRtnypTJTXH9eN/KGLgEn4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eNaaQJFfixVCNl6Jw+R4ozoyqk0zb0qkiTF1nXxeEbuTMn2avHwNfhoWFTD7Qdnjk
	 Mn2LqD2Sg8BSQWoY2b5284sijZchTJNoBcqQdyt8lsYt6pY1p+5ME8eAAl3bMmcnXZ
	 tv5XJOc1ZmjmPFk1OAnLnR5gpJ3VKvx5IziVBmroOCW9NF59QveRqNuEdVkeAtpvP7
	 mMPlLu4+9quzaaRnbecy+12Z8Tn7TMMDIHFfxXGhfNRud7RkkvkN3ISFMt34b4NGhN
	 owY4uePZRIdIrm1Q0yW6Z0gqPhxZ0bf50EwNvmiHVLaOPP9EgxkVHbuOu8DEmDrmM2
	 7ZlY47v4rx/oQ==
Date: Fri, 21 Oct 2022 14:14:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Leo Yan <leo.yan@linaro.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen Develop <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Mathieu Poirier <mathieu.poirier@linaro.org>, 
    Kasper Ornstein Mecklenburg <Kasper.OrnsteinMecklenburg@arm.com>, 
    jgross@suse.com, oleksandr_tyshchenko@epam.com, boris.ostrovsky@oracle.com, 
    wei.liu@kernel.org, paul@xen.org
Subject: Re: Issue: Networking performance in Xen VM on Arm64
In-Reply-To: <Y1J39UsPlM8htxFx@leoy-huanghe.lan>
Message-ID: <alpine.DEB.2.22.394.2210211341440.3873@ubuntu-linux-20-04-desktop>
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan> <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop> <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan> <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop> <Y00/SW5Ro+SlhoBU@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210171638080.4587@ubuntu-linux-20-04-desktop> <Y1J39UsPlM8htxFx@leoy-huanghe.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Oct 2022, Leo Yan wrote:
> Hi Stefano and all,
> 
> On Mon, Oct 17, 2022 at 04:50:05PM -0700, Stefano Stabellini wrote:
> 
> [...]
> 
> > > We can see DomU sends notification with timestamp (raw counter) is
> > > 4989078592 and Dom0 receives the interrupt with timestamp 4989092169.
> > > Since Dom0 and DomU use the same time counter and the counter
> > > frequency is 25MHz, so we can get the delta value (in macroseconds):
> > > 
> > >     (4989092169 - 4989078592) / 25000000 * 1000 * 1000
> > >   = 543us
> > > 
> > > Which means it takes 543us to let Dom0 to receive the notification.
> > > You could see DomU runs in CPU3 and Dom0 runs on CPU13, there should
> > > not have contention for CPU resources.  Seems to me, it's likely Xen
> > > hypervisor takes long time to deliver the interrupt, note, it's not
> > > take so long time for every skb transferring, sometimes the time for
> > > response a notification is short (about ~10us).
> > 
> > Good find. I think this is worth investigating further. Do you have
> > vwfi=native in your Xen command line as well?
> > 
> > After that, I would add printk also in Xen with the timestamp. The event
> > channel notification code path is the following:
> > 
> > # domU side
> > xen/arch/arm/vgic-v2.c:vgic_v2_to_sgi
> > xen/arch/arm/vgic.c:vgic_to_sgi
> > xen/arch/arm/vgic.c:vgic_inject_irq
> > xen/arch/arm/vgic.c:vcpu_kick
> > xen/arch/arm/gic-v2.c:gicv2_send_SGI
> > 
> > # dom0 side
> > xen/arch/arm/gic.c:do_sgi
> > xen/arch/arm/traps.c:leave_hypervisor_to_guest
> > 
> > It would be good to understand why sometimes it takes ~10us and some
> > other times it takes ~540us
> 
> Some updates for why it takes several hundreds us for Xen backend driver
> to respond interrupt.  The short answer is the vcpu running Xen backend
> driver needs to switch context, even I have set options "sched=null
> vwfi=native" in Xen command line.
> 
> So please see below detailed logs for how the things happen.
> 
> Let's take the timestamp 3842008681 as the start point, it's the time
> for Xen backend driver sending out notification (xennet_notify_tx_irq);
> at the timestamp 3842008885 the Xen hypervisor injects the interrupt
> (it's about ~8us duration from the start point).
> 
> And then at the timestamp 3842008935 it invokes vcpu_kick() to kick the
> virtual CPU for running Xen forend driver, you could see
> VCPU_PROCESSOR is 11 and VCPU_ID is 9 for dom0, the duration is
> 10.16us from the start point.
> 
> The key point is at this point the vcpu's is_running is 0, this is
> different from the case without long latency which vcpu's is_running
> is 1.  IIUC, Xen hypervisor needs to take time to restore the vcpu's
> context, thus we can see the virtual CPU 9 in Dom0 starts to run at
> the timestamp 3842016505.

is_running should be always 1 with the NULL scheduler and vwfi=native.
That is because VMs are never descheduled. Please double-check.

If you are really running with the NULL scheduler, then I would
investigate why the vCPU has is_running == 0 because it should not
happen.


Now regarding the results, I can see the timestamp 3842008681 for
xennet_notify_tx_irq, 3842008885 for vgic_inject_irq, and 3842008935 for
vcpu_kick. Where is the corresponding TSC for the domain receiving the
notification?

Also for the other case, starting at 3842016505, can you please
highlight the timestamp for vgic_inject_irq, vcpu_kick, and also the one
for the domain receiving the notification?

The most interesting timestamps would be the timestamp for vcpu_kick in
"notification sending domain" [a], the timestamp for receiving the
interrupt in the Xen on pCPU for the "notification receiving domain"
[b], and the timestamp for the "notification receiving domain" getting
the notification [c].

If really context switch is the issue, then the interesting latency
would be between [a] and [b].



> 3842008548              pub-310   [001]    67.352980: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842008548
> 3842008652              pub-310   [001]    67.352984: bprint:               xennet_tx_setup_grant: id=52 ref=820 offset=2 len=1514 TSC: 3842008652
> 3842008681              pub-310   [001]    67.352985: bprint:               xennet_start_xmit: xennet_notify_tx_irq: TSC: 3842008681
> 3842008689 (XEN) leave_hypervisor_to_guest: CPU_ID: 0 TSC: 3842008689
> 3842008766 (XEN) EVTCHNOP_send: CPU_ID: 2 TSC: 3842008766
> 3842008885 (XEN) vgic_inject_irq: CPU_ID: 2 TSC: 3842008885
> 3842008929 (XEN) leave_hypervisor_to_guest: CPU_ID: 14 TSC: 3842008929
> 3842008935 (XEN) vcpu_kick: VCPU_PROCESSOR: 11 VCPU_ID: 9 is_running 0 TSC: 3842008935
> 3842009049 (XEN) leave_hypervisor_to_guest: CPU_ID: 2 TSC: 3842009049
> 3842009322              pub-310   [001]    67.353011: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842009322
> 3842009374              pub-310   [001]    67.353013: bprint:               xennet_tx_setup_grant: id=12 ref=780 offset=2050 len=1514 TSC: 3842009374
> 3842009584              pub-310   [001]    67.353021: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842009584
> 3842009625 (XEN) leave_hypervisor_to_guest: CPU_ID: 15 TSC: 3842009625
> 3842009633              pub-310   [001]    67.353023: bprint:               xennet_tx_setup_grant: id=83 ref=851 offset=2 len=1514 TSC: 3842009633
> 3842009853              pub-310   [001]    67.353032: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842009853
> 3842009899              pub-310   [001]    67.353034: bprint:               xennet_tx_setup_grant: id=5 ref=773 offset=2050 len=1514 TSC: 3842009899
> 3842010080              pub-310   [001]    67.353041: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842010080
> 3842010121              pub-310   [001]    67.353043: bprint:               xennet_tx_setup_grant: id=85 ref=853 offset=2 len=1514 TSC: 3842010121
> 3842010316              pub-310   [001]    67.353050: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842010316
> 3842010359              pub-310   [001]    67.353052: bprint:               xennet_tx_setup_grant: id=9 ref=777 offset=2050 len=1514 TSC: 3842010359
> 3842010553              pub-310   [001]    67.353060: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842010553
> 3842010599              pub-310   [001]    67.353062: bprint:               xennet_tx_setup_grant: id=35 ref=803 offset=2 len=1514 TSC: 3842010599
> 3842010792              pub-310   [001]    67.353069: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842010792
> 3842010838              pub-310   [001]    67.353071: bprint:               xennet_tx_setup_grant: id=17 ref=785 offset=2 len=1514 TSC: 3842010838
> 3842011032              pub-310   [001]    67.353079: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842011032
> 3842011072              pub-310   [001]    67.353081: bprint:               xennet_tx_setup_grant: id=18 ref=786 offset=2 len=1514 TSC: 3842011072
> 3842011124 (XEN) leave_hypervisor_to_guest: CPU_ID: 12 TSC: 3842011124
> 3842011265              pub-310   [001]    67.353088: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842011265
> 3842011309              pub-310   [001]    67.353090: bprint:               xennet_tx_setup_grant: id=86 ref=854 offset=3074 len=606 TSC: 3842011309
> 3842012807 (XEN) leave_hypervisor_to_guest: CPU_ID: 6 TSC: 3842012807
> 3842013038 (XEN) leave_hypervisor_to_guest: CPU_ID: 10 TSC: 3842013038
> 3842013568 (XEN) vgic_inject_irq: CPU_ID: 23 TSC: 3842013568
> 3842013639 (XEN) vcpu_kick: VCPU_PROCESSOR: 23 VCPU_ID: 10 is_running 1 TSC: 3842013639
> 3842013769 (XEN) leave_hypervisor_to_guest: CPU_ID: 4 TSC: 3842013769
> 3842013955 (XEN) leave_hypervisor_to_guest: CPU_ID: 8 TSC: 3842013955
> 3842014327 (XEN) leave_hypervisor_to_guest: CPU_ID: 5 TSC: 3842014327
> 3842014381              pub-310   [001]    67.353213: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842014381
> 3842014433              pub-310   [001]    67.353215: bprint:               xennet_tx_setup_grant: id=89 ref=857 offset=2050 len=1514 TSC: 3842014433
> 3842014621              pub-310   [001]    67.353223: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842014621
> 3842014663              pub-310   [001]    67.353224: bprint:               xennet_tx_setup_grant: id=38 ref=806 offset=2 len=1514 TSC: 3842014663
> 3842014852              pub-310   [001]    67.353232: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842014852
> 3842014909              pub-310   [001]    67.353234: bprint:               xennet_tx_setup_grant: id=4 ref=772 offset=2 len=1422 TSC: 3842014909
> 3842015153 (XEN) leave_hypervisor_to_guest: CPU_ID: 1 TSC: 3842015153
> 3842015345 (XEN) leave_hypervisor_to_guest: CPU_ID: 3 TSC: 3842015345
> 3842015823 (XEN) leave_hypervisor_to_guest: CPU_ID: 13 TSC: 3842015823
> 3842016505           <idle>-0     [009]    95.098859: bprint:               xenvif_tx_interrupt: xenvif_tx_interrupt: TSC: 3842016505
> 3842016635           <idle>-0     [009]    95.098863: bprint:               xenvif_tx_build_gops.constprop.0: id=52 ref=820 offset=2 len=1514 TSC: 3842016635
> 3842016648 (XEN) leave_hypervisor_to_guest: CPU_ID: 9 TSC: 3842016648
> 3842016671           <idle>-0     [009]    95.098865: bprint:               xenvif_tx_build_gops.constprop.0: id=12 ref=780 offset=2050 len=1514 TSC: 3842016671
> 3842016700           <idle>-0     [009]    95.098866: bprint:               xenvif_tx_build_gops.constprop.0: id=83 ref=851 offset=2 len=1514 TSC: 3842016700
> 3842016725           <idle>-0     [009]    95.098867: bprint:               xenvif_tx_build_gops.constprop.0: id=5 ref=773 offset=2050 len=1514 TSC: 3842016725
> 
> I did another two experiments.
> 
> One experiment is I tried to append option "dom0_max_vcpus=16" into Xen
> command line, the purpose is I want to allocate 16 virtual CPUs for dom0
> and 4 virtual CPUs for domU, and my system has 32 physical CPUs, in
> theory the physical CPUs are sufficient for dom0 and domU, but I
> didn't see any performance improvement with option
> "dom0_max_vcpus=16".
>
> Another experiment is to append option "dom0_vcpus_pin" in Xen command
> line, this can allow the virtual CPU pins on physical CPU so can avoid
> context switching.  With this option, I can see the throughput is
> improved from 128.26 Mbits/s to 180.3 Mbits/s.  But this result is far
> from the ideal throughput (800+Mbits/s).

Actually this should not happen: like before, dom0_vcpus_pin does
nothing with the NULL scheduler and only changes things for credit. Are
you really sure you are running the tests with sched=null vwfi=native?


> One thing I need to explore is to measure the duration for copying
> data via grant table (based on the log we can see xennet driver setup
> grant table and then xenvif driver fetches data from grant table).  I
> will compare the duration for two directions (from dom0 to domU and
> from domU to dom0).  This part might impact the performance heavily.


