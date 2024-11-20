Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3574F9D43C6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 23:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841209.1256718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDsrb-0006sI-S1; Wed, 20 Nov 2024 22:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841209.1256718; Wed, 20 Nov 2024 22:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDsrb-0006qm-P2; Wed, 20 Nov 2024 22:07:55 +0000
Received: by outflank-mailman (input) for mailman id 841209;
 Wed, 20 Nov 2024 22:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf15=SP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDsra-0006qe-QG
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 22:07:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e21013e9-a78b-11ef-a0cc-8be0dac302b0;
 Wed, 20 Nov 2024 23:07:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3861E5C5EA4;
 Wed, 20 Nov 2024 22:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D812C4CECD;
 Wed, 20 Nov 2024 22:07:48 +0000 (UTC)
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
X-Inumbo-ID: e21013e9-a78b-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6ImUyMTAxM2U5LWE3OGItMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTQwNDcxLjk3ODk2Nywic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732140469;
	bh=fU/vacAEi1m2S92rWJM9qMHiFtrIXNfDJtfD7Oh13+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kAvSwFMWXuUjeUs6fPEhKBm38lgTz5h5CA4nH9OOEJKMxOc+z38WWHdCNwobaStUT
	 PMejl/uunGsafmqVb8lPGQ8xbvigUFlCEudF3p42TCWPriEXJZzhPKnVfJfVWuA5um
	 2vQdANpXTt+wdiNws63+gh3MLHvaM4EOZAeGZ+XkLMUiGJwPKB/G4W37wBlhpbMSpf
	 ETMmYVJMEFByPW1Z/XkmD1h5giijwPhvNPLFEOZUe9sCWLpP5mGUt9DE6hTk0M7yhB
	 fi2nFM9mfxyD+npGdI/7w/MDYjYp6WYMkH/wQ7NFqzyu2+9KwzmId4vCVRLBD+UXAO
	 HfunD/tgjKcdg==
Date: Wed, 20 Nov 2024 14:07:47 -0800 (PST)
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
In-Reply-To: <87iksilod0.fsf@epam.com>
Message-ID: <alpine.DEB.2.22.394.2411201406060.3516911@ubuntu-linux-20-04-desktop>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com> <alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop> <875xojmexk.fsf@epam.com> <alpine.DEB.2.22.394.2411191409140.1160299@ubuntu-linux-20-04-desktop>
 <87iksilod0.fsf@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Nov 2024, Volodymyr Babchuk wrote:
> Hi Stefano,
> 
> (sorry, hit wrong Reply-To option, re-sending for wider audience)
> 
> Stefano Stabellini <sstabellini@kernel.org> writes:
> 
> > On Tue, 19 Nov 2024, Volodymyr Babchuk wrote:
> >> Hi Stefano,
> >>
> >> Stefano Stabellini <sstabellini@kernel.org> writes:
> >>
> >> > On Thu, 14 Nov 2024, Volodymyr Babchuk wrote:
> >>
> >> [...]
> >>
> >> >> +Building LibAFL-QEMU based fuzzer
> >> >> +---------------------------------
> >> >> +
> >> >> +Fuzzer is written in Rust, so you need Rust toolchain and `cargo` tool
> >> >> +in your system. Please refer to your distro documentation on how to
> >> >> +obtain them.
> >> >> +
> >> >> +Once Rust is ready, fetch and build the fuzzer::
> >> >> +
> >> >> + # git clone
> >> >> https://github.com/xen-troops/xen-fuzzer-rs
> >> >> +  # cd xen-fuzzer-rs
> >> >> +  # cargo build
> >> >
> >> > Is this the only way to trigger the fuzzer? Are there other ways (e.g.
> >> > other languages or scripts)? If this is the only way, do we expect it to
> >> > grow much over time, or is it just a minimal shim only to invoke the
> >> > fuzzer (so basically we need an x86 version of it but that's pretty much
> >> > it in terms of growth)?
> >>
> >> Well, original AFL++ is written in C. And I planned to use it
> >> initially. I wanted to make plugin for QEMU to do the basically same
> >> thing that LibAFL does - use QEMU to emulate target platform, create
> >> snapshot before running a test, restore it afterwards.
> >>
> >> But then I found LibAFL. It is a framework for creating fuzzers, it
> >> implements the same algorithms as original AFL++ but it is more
> >> flexible. And it already had QEMU support. Also, it seems it is quite
> >> easy to reconfigure it for x86 support. I didn't tried tested this yet,
> >> but looks like I need only to change one option in Cargo.toml.
> >>
> >> This particular fuzzer is based on LibAFL example, but I am going to
> >> tailor it for Xen Project-specific needs, like CI integration you
> >> mentioned below.
> >
> > Is my understanding correct that we only need to invoke LibAFL as you
> > are doing already, and that's pretty much it? We need a better
> > configuration specific for Xen, and we need one more way to invoke it to
> > cover x86 but that's it? So, the expectation is that the code currently
> > under
> > https://github.com/xen-troops/xen-fuzzer-rs
> > will not grow much?
> >
> 
> Yes, it basically configures different bits of LibAFL and integrates
> them together. So yes, it will not grow much. I am planning to add some
> QoL things like ability to re-run specific input so it will be easier to
> debug discovered issues. Or maybe tune some fuzzing algorithms
> settings... But nothing big.
 
OK then
 

> >> As for test harness, I am using Zephyr currently. My first intention was
> >> to use XTF, but it is x86-only... I am still considering using XTF for
> >> x86 runs.
> >>
> >> Zephyr was just the easiest and fastest way to trigger hypercalls. At
> >> first I tried to use Linux kernel, but it was hard to cover all possible
> >> failure paths. Zephyr is much simpler in this regard. Even better is to
> >> use MiniOS or XTF. But ARM support in MiniOS is in sorry state and XTF
> >> does not work on ARM at all.
> >
> > There is a not-yet-upstream XTF branch that works on ARM here:
> > https://gitlab.com/xen-project/fusa/xtf/-/tree/xtf-arm?ref_type=heads
> 
> Ah, thanks. I'll try to use it as a harness.
> 
> [...]
> 
> >
> >>
> >> I was considering this as well. Problem is that fuzzing should be
> >> running for a prolonged periods of time. There is no clear consensus on
> >> "how long", but most widely accepted time period is 24 hours. So looks
> >> like it should be something like "nightly build" task. Fuzzer code
> >> needs to be extended to support some runtime restriction, because right
> >> now it runs indefinitely, until user stops it.
> >
> > We can let it run for 48 hours continuously every weekend using the
> > Gitlab runners
> 
> Great idea. Anyways, I need to add option to limit runtime to the fuzzer
> and invent some method for reporting discovered crashes to the CI first.
> 
> >
> >> I am certainly going to implement this, but this is a separate topic,
> >> because it quires changes in the fuzzer app. Speaking on which... Right
> >> now both fuzzer and test harness reside in our github repo, as you
> >> noticed. I believe it is better to host it on xenbits as an official
> >> part of the Xen Project.
> >
> > Yes we can create repos under gitlab.com/xen-project for this, maybe a
> > new subgroup gitlab.com/xen-project/fuzzer
> 
> Good. Whom should I ask to do this?

I created gitlab.com/xen-project/fuzzer as an empty group. What
repositories do you need under it?

