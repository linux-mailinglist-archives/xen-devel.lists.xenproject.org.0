Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EFB9D30E6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 00:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840858.1256398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDXZA-0005ns-8n; Tue, 19 Nov 2024 23:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840858.1256398; Tue, 19 Nov 2024 23:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDXZA-0005lL-5e; Tue, 19 Nov 2024 23:23:28 +0000
Received: by outflank-mailman (input) for mailman id 840858;
 Tue, 19 Nov 2024 23:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGE8=SO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDXZ8-0005lF-Tm
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 23:23:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 449da44c-a6cd-11ef-a0ca-8be0dac302b0;
 Wed, 20 Nov 2024 00:23:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D2CC5C5924;
 Tue, 19 Nov 2024 23:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3089C4CECF;
 Tue, 19 Nov 2024 23:23:19 +0000 (UTC)
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
X-Inumbo-ID: 449da44c-a6cd-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NjQxOmM1MDA6OjEiLCJoZWxvIjoiZGZ3LnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjQ0OWRhNDRjLWE2Y2QtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDU4NjAzLjQwNjM4OCwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732058601;
	bh=OO6YlgIMzlEdt2qE7NBDYG/UQOC9OMFaQlZbxPuOXQI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LgP1u9YZ+kNUcJh7SI9pYfq0r0F22pQV0o6qjZYQW4BKFPTIoJQNKrcBcaUr3CKtN
	 kLWKiK9pfniwwphG1acvnZ8GZmBhhnRZwFZvZTtC0QaRzBQp8F/yzem0GRt5aCWHy0
	 B58EBqH7fGKIDU8twlFiYoKcf6v119VEBDNpN0yPvwVTu24XcpbtI/Ye0t093s7KQX
	 mtKmdDQdsJ/+9EblsI4tduFiTxv7fG0hWCFxOkpF8sWImIeWvn1cg0OSxHofBj1aeb
	 owBgsVqCEQp3ebysAW+cRfqMBdKo882iY3udX29l633AtrlwPQs9ypf1tUZgKqp8pJ
	 PSGOdrwjfUy+A==
Date: Tue, 19 Nov 2024 15:23:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>, 
    Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [RFC PATCH] xen: add libafl-qemu fuzzer support
In-Reply-To: <875xojmexk.fsf@epam.com>
Message-ID: <alpine.DEB.2.22.394.2411191409140.1160299@ubuntu-linux-20-04-desktop>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com> <alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop> <875xojmexk.fsf@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Nov 2024, Volodymyr Babchuk wrote:
> Hi Stefano,
> 
> Stefano Stabellini <sstabellini@kernel.org> writes:
> 
> > On Thu, 14 Nov 2024, Volodymyr Babchuk wrote:
> 
> [...]
> 
> >> +Building LibAFL-QEMU based fuzzer
> >> +---------------------------------
> >> +
> >> +Fuzzer is written in Rust, so you need Rust toolchain and `cargo` tool
> >> +in your system. Please refer to your distro documentation on how to
> >> +obtain them.
> >> +
> >> +Once Rust is ready, fetch and build the fuzzer::
> >> +
> >> + # git clone
> >> https://github.com/xen-troops/xen-fuzzer-rs
> >> +  # cd xen-fuzzer-rs
> >> +  # cargo build
> >
> > Is this the only way to trigger the fuzzer? Are there other ways (e.g.
> > other languages or scripts)? If this is the only way, do we expect it to
> > grow much over time, or is it just a minimal shim only to invoke the
> > fuzzer (so basically we need an x86 version of it but that's pretty much
> > it in terms of growth)?
> 
> Well, original AFL++ is written in C. And I planned to use it
> initially. I wanted to make plugin for QEMU to do the basically same
> thing that LibAFL does - use QEMU to emulate target platform, create
> snapshot before running a test, restore it afterwards.
> 
> But then I found LibAFL. It is a framework for creating fuzzers, it
> implements the same algorithms as original AFL++ but it is more
> flexible. And it already had QEMU support. Also, it seems it is quite
> easy to reconfigure it for x86 support. I didn't tried tested this yet,
> but looks like I need only to change one option in Cargo.toml.
> 
> This particular fuzzer is based on LibAFL example, but I am going to
> tailor it for Xen Project-specific needs, like CI integration you
> mentioned below.

Is my understanding correct that we only need to invoke LibAFL as you
are doing already, and that's pretty much it? We need a better
configuration specific for Xen, and we need one more way to invoke it to
cover x86 but that's it? So, the expectation is that the code currently
under https://github.com/xen-troops/xen-fuzzer-rs will not grow much?


> As for test harness, I am using Zephyr currently. My first intention was
> to use XTF, but it is x86-only... I am still considering using XTF for
> x86 runs.
> 
> Zephyr was just the easiest and fastest way to trigger hypercalls. At
> first I tried to use Linux kernel, but it was hard to cover all possible
> failure paths. Zephyr is much simpler in this regard. Even better is to
> use MiniOS or XTF. But ARM support in MiniOS is in sorry state and XTF
> does not work on ARM at all.

There is a not-yet-upstream XTF branch that works on ARM here:
https://gitlab.com/xen-project/fusa/xtf/-/tree/xtf-arm?ref_type=heads


> [...]
> 
> >>  void call_psci_cpu_off(void)
> >>  {
> >> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> >> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> >> +#endif
> >
> > I think we should add a wrapper with an empty implementation in the
> > regular case and the call to libafl_qemu_end when the fuzzer is enabled.
> > So that here it becomes just something like:
> >
> >   fuzzer_success();
> 
> I considered this. In the next version I'll add fuzzer.h with inline wrappers.
> 
> 
> [...]
> 
> >> @@ -1452,6 +1456,10 @@ static long do_poll(const struct sched_poll *sched_poll)
> >>      if ( !guest_handle_okay(sched_poll->ports, sched_poll->nr_ports) )
> >>          return -EFAULT;
> >>
> >> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> >> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> >> +#endif
> >
> > I am not sure about this one, why is this a success?
> 
> vCPU get blocked here basically forever. So test harness can't call
> libafl_qemu_end(LIBAFL_QEMU_END_OK) from it's side because it is never
> scheduled after this point.
> 
> > Honestly, aside from these two comments, this looks quite good. I would
> > suggest adding a GitLab CI job to exercise this, if nothing else, to
> > serve as an integration point since multiple components are required for
> > this to work.
> 
> I was considering this as well. Problem is that fuzzing should be
> running for a prolonged periods of time. There is no clear consensus on
> "how long", but most widely accepted time period is 24 hours. So looks
> like it should be something like "nightly build" task. Fuzzer code
> needs to be extended to support some runtime restriction, because right
> now it runs indefinitely, until user stops it.

We can let it run for 48 hours continuously every weekend using the
Gitlab runners


> I am certainly going to implement this, but this is a separate topic,
> because it quires changes in the fuzzer app. Speaking on which... Right
> now both fuzzer and test harness reside in our github repo, as you
> noticed. I believe it is better to host it on xenbits as an official
> part of the Xen Project.

Yes we can create repos under gitlab.com/xen-project for this, maybe a
new subgroup gitlab.com/xen-project/fuzzer

