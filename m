Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F5F82974D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 11:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665368.1035564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNVi0-0003aS-VG; Wed, 10 Jan 2024 10:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665368.1035564; Wed, 10 Jan 2024 10:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNVi0-0003YQ-Rm; Wed, 10 Jan 2024 10:21:16 +0000
Received: by outflank-mailman (input) for mailman id 665368;
 Wed, 10 Jan 2024 10:21:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZsbY=IU=gmail.com=morel.dav@srs-se1.protection.inumbo.net>)
 id 1rNVhz-0003YK-Go
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 10:21:15 +0000
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb581298-afa1-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 11:21:13 +0100 (CET)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3376f71fcbbso2308379f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 02:21:13 -0800 (PST)
Received: from raton (lfbn-idf1-1-1403-15.w90-79.abo.wanadoo.fr. [90.79.94.15])
 by smtp.gmail.com with ESMTPSA id
 s13-20020adff80d000000b003365fc41bcasm4525034wrp.51.2024.01.10.02.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 02:21:12 -0800 (PST)
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
X-Inumbo-ID: fb581298-afa1-11ee-98f0-6d05b1d4d9a1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704882073; x=1705486873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7w3augA3ckRPjd0e2yLAGmRwiyIEM+qyF93sj3I01A=;
        b=lppBdXKW2iAuLvu+xMl8WnCVzHYjRZdvK+G7ujg0iKvMxgUw6m5CD79WyZ3d3kn900
         Oplzclm3SHDv69IETxcGB0gY/gjrQd9Ibv5ybXCkeY1AZ/80u44PFjDL13VrNd+/BQK3
         xodIt/niAfGkqm/dPWIe264oPjMH+01hxjaXNkV3JVpzrBx1deY1JXW2KJgJQzvVJOar
         Aced6ljHXhd96GiaKHnpOpxXoUPQtk1wYUnA6mSEXQDwxQlYqfcPxGqIWfez5lkjrWu8
         H2t1ucq57W85xAyvauE6vG10UlXYu9kl5R3RIMoOtQaHuMk+tgdBhb15tQf0iA1m43KL
         KvCQ==
X-Gm-Message-State: AOJu0YzpVVbpIECCVvFlf1SM72Y5fHD3fgf8axIoHP7EciwN4KlJHfr4
	ybdx9evPmjTm/EDUsscBv8c=
X-Google-Smtp-Source: AGHT+IH9CMKWMU/0UJIIUnGi0NR+l5q1B4BDlYPDaInNLBQySrc9QoL2T/DxqNXECJbRvH5Q0BKVQw==
X-Received: by 2002:a5d:4ccb:0:b0:336:c52b:e282 with SMTP id c11-20020a5d4ccb000000b00336c52be282mr333180wrt.203.1704882072933;
        Wed, 10 Jan 2024 02:21:12 -0800 (PST)
Date: Wed, 10 Jan 2024 11:21:06 +0100
From: David Morel <david.morel@vates.tech>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, xenia.ragiadakou@amd.com,
	andrew.cooper3@citrix.com, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: AMD EPYC VM to VM performance investigation
Message-ID: <ZZ5vkr0Qx0h_iO5D@raton>
References: <ZZbSIH_pGjaQr5x-@raton>
 <alpine.DEB.2.22.394.2401041624500.1322202@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2401041624500.1322202@ubuntu-linux-20-04-desktop>

On Thu, Jan 04, 2024 at 16:39:46PM, Stefano Stabellini wrote:
> On Thu, 4 Jan 2024, David Morel wrote:
> > Hello,
> > 
> > We have a customer and multiple users on our forum having performances that
> > seems quite low related to the general performance of the machines on AMD EPYC
> > Zen hosts when doing VM to VM networking.
> 
> By "VM to VM networking" I take you mean VM-to-VM on the same host using
> PV network?
> 
> 
> > Below you'll find a write up about what we had a look at and what's in the
> > TODO on our side, but in the meantime we would like to ask here for some
> > feedback, suggestions and possible leads.
> > 
> > To sum up, the VM to VM performance on Zen generation server CPUs seems quite
> > low, and only minimally scaling when adding threads. They are outperformed by
> > 10 year old AMD desktop cpu and pretty low frequency XEON bronze from 2014.
> > CPU usage does not seem to be the limiting factor as neither the VM threads or
> > the kthreads on host seems to go to a 100% cpu usage.
> > 
> > As we're Vates, I'm talking about XCP-ng here, so Xen 4.13.5 and a dom0 kernel
> > 4.19. I did try a Xen 4.18-rc2 and kernel 6.1.56 on a Zen4 epyc, but as it was
> > borrowed from a colleague I was unsure of the setup, so although it was
> > actually worse than on my other test setups, I would not consider that a
> > complete validation the issues is also present on recent Xen versions.
> 
> I think it might be difficult to triage this if you are working on a
> Xen/Linux version that is so different from upstream
I ran some tests on a Xen 4.13.5 with a dom0 in 6.6.10, and on an XCP-ng on
the same machine, the performances are similar, a few percent better on
the recent Xen, but still pretty low for such a machine and similar to
other EPYC we looked at.

> 
> > 1. Has anybody else noticed a similar behavior?
> > 2. Has anybody done any kind of investigation about it beside us?
> > 3. Any insight and suggestions of other points to look at would be welcome :)
> > 
> > And now the lengthy part about what we tested, I tried to make it shorter and
> > more legible than a full report…
> > 
> > Investigated
> > ------------
> > 
> > - Bench various cpu with iperf2 (iperf3 is not actually multithreaded):
> >   - amd fx8320e, xeon 3106: not impacted.
> >   - epyc 7451, 7443, 7302p, 7313p, 9124: impacted, but the zen4 one scales a
> >     bit more than zen1, 2 and 3.
> >   - ryzen 5950x, ryzen 7600: performances should likely be better than
> >     observed results, but still way better than epycs, and scaling nicely with
> >     more threads.
> > - Bench with tinymembench[1]: performances were as expected and didn't show
> >   issues with rep movsb as discussed in this article[2] and issue[3]. Which
> >   makes sense as it looks like this issues is related to ERMS support which is
> >   not present on Zen1 and 2 where the issue has been raised.
> > - Bench skb allocation with a small kernel module measuring cycles: actually
> >   same or lower on epyc than on the xeon with higher frequency so can be
> >   considered faster and likely not related to our issue.
> > - mitigations: we tried disabling what can be disabled through boot
> >   parameters, both for xen, dom0 and guests, but this made no differences.
> > - disabling AVX; Zen cpus before zen4 are know to limit boost and cpu scaling
> >   when doing heavy AVX load on one core, there was no reason to think this was
> >   related, but it was a quick test and as expected had no effect.
> > - localhost iperf bench on dom0 and guests: we noticed that on other machines
> >   host/guest with 1 threads are almost 1:1, with 4 threads guests are about
> >   generally not scaling as well in guests. On epyc machines, host tests were
> >   significantly slower than guests both with 1 and 4 threads, first
> >   investigation of profiling didn't help finding a cause yet. More in the
> >   profiling and TODO.
> 
> Wait, are you saying that the localhost iperf benchmark is faster in a
> VM compared to host ("host" I take means baremetal Linux without a
> hypervisor) ?   Maybe you meant the other way around?
> 
> 
> > - cpu load: top/htop/xentop all seem to indicate that machines are not under
> >   full load, queue allocations on dom0 for VIF are by default (1 per vcpu) and
> >   seem to be all used when traffic is running but at a percentage below 100%
> >   per core/thread.
> > - pinning: manually pinning dom0 and guests to the same node and avoiding
> >   sharing cpu "threads" between host and guests gives a minimal increase of a
> >   few percents, but nothing drastic. Note, we do not know about the
> >   ccd/ccx/node mapping on these cpus, so we are not sure all memory access are
> >   "local".
> > - sched weight: playing with sched weight to prioritize dom0 did not make a
> >   difference either, which makes sense as the system are not under full load.
> > - cpu scaling: it is unlikely the core of the issue, but indeed the cpu
> >   scaling does not take advantage of the boost, never going above the base
> >   clock of these cpus. Also it also seems that less cores that the number of
> >   working kthreads/vcpus are going to base clock, may be normal in regard to
> >   the system not being fully loaded, to be defined.
> >   - QUESTION: is the powernow support in xen cpufreq implementation sufficient
> >     for zen cpus? Recent kernels/distributions use acpi_cpufreq and can use
> >     amd_pstate or even amd_pstate_epp. More concerning than the turbo boost
> >     could be the handling of package power limitation used in Zen CPUs that
> >     could prevent even all cores to base clock, to be checked…
> > 
> > Profiling
> > ---------
> > 
> > We profiled iperf on dom0 and guests on epyc, older amd desktop, and xeon
> > machines and gathered profiling traces, but analysis are still ongoing.
> > 
> > - localhost:
> > Client and server were profiled both on dom0 and guests runs for a xeon, an
> > old FX and a zen platform, to analyze the discrepancy shown by the localhost
> > tests earlier. It shows we spend a larger chunk of time in the copyout() or
> > copyin() functions on epyc and fx. This is likely related to the use of
> > copy_user_generic_string() on epyc (zen1) and old FX, whereas xeon uses
> > copy_user_enhanced_fast_string(), as it has ERMS support.  But on the same
> > machine, guests are going way faster, and the implementation of
> > copy_user_generic_string() is the same between the dom0 and guests, so this is
> > likely related to other changes in kernel and userland, and not only to these
> > function. Therefore it likely isn't directly linked to the issue.
> > 
> > - vm to vm: server, client & dom0 -> profiling traces to be analysed.
> > 
> > TODO
> > ----
> > 
> > - More Analysis of profiling traces in VM to VM case
> > - X2APIC (not enabled on the machines and setup we are using)
> > - Profiling at xen level / hypercalls
> > - Tests on a clean install of a newer Xen version
> > - Dig some more on cpu scaling, likely not the root of the problem but could
> >   be some gain to make.
> > 
> > [1] https://github.com/ssvb/tinymembench
> > [2] https://xuanwo.io/2023/04-rust-std-fs-slower-than-python/
> > [3] https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/2030515
> > 
> > -- 
> > David Morel

