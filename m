Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F96D9D56C6
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 01:38:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841707.1257206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEHfk-0007CY-Bb; Fri, 22 Nov 2024 00:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841707.1257206; Fri, 22 Nov 2024 00:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEHfk-0007As-7l; Fri, 22 Nov 2024 00:37:20 +0000
Received: by outflank-mailman (input) for mailman id 841707;
 Fri, 22 Nov 2024 00:37:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ip/=SR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tEHfj-0007Am-Hy
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 00:37:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaee56b3-a869-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 01:37:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 63CED5C5760;
 Fri, 22 Nov 2024 00:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930BEC4CECC;
 Fri, 22 Nov 2024 00:37:11 +0000 (UTC)
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
X-Inumbo-ID: eaee56b3-a869-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6ImVhZWU1NmIzLWE4NjktMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjM1ODM1LjQ0NDEwMywic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732235832;
	bh=WrbaMMR8M+Xuh2tTtQnAsa5FVX7rmPLphpJOMDqroBs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KXRssVsCB6uh5sC6M67y+6h/62RNKNCUmPa5lv3OuB9gAMQFiQpf4gg54sngbZRsl
	 WmReZBf67o0tTf7UWgrxNOwhk9V2QE3sSgHxdPAm5rabJ5VBZyY6yr0MPPZEw0+wNk
	 TePvj+rp0CcSe6j4lw7ORgHWVwh0rzazLhvYisNfteRBP0522aDgmsHyhG6u2Npmdb
	 Jb2HZNvA5Tct2z3kR+m+NiNw8KJ94smBRSmoJ6psZhhkz1ek7mkxwU62xna+hGWojx
	 yb2EzatEUZd5vbgtxRDJ9zCrtbXJdI/Z74M+vEAC3yRAMG0BEwsm3bzEFFyBIhKipK
	 aqaGoLmpkMokw==
Date: Thu, 21 Nov 2024 16:37:10 -0800 (PST)
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
In-Reply-To: <871pz4kwle.fsf@epam.com>
Message-ID: <alpine.DEB.2.22.394.2411211637060.3516911@ubuntu-linux-20-04-desktop>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com> <alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop> <875xojmexk.fsf@epam.com> <alpine.DEB.2.22.394.2411191409140.1160299@ubuntu-linux-20-04-desktop> <87iksilod0.fsf@epam.com>
 <alpine.DEB.2.22.394.2411201406060.3516911@ubuntu-linux-20-04-desktop> <871pz4kwle.fsf@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Nov 2024, Volodymyr Babchuk wrote:
> Hi Stefano,
> 
> Stefano Stabellini <sstabellini@kernel.org> writes:
> 
> > On Wed, 20 Nov 2024, Volodymyr Babchuk wrote:
> >> Hi Stefano,
> >> 
> >> (sorry, hit wrong Reply-To option, re-sending for wider audience)
> >> 
> >> Stefano Stabellini <sstabellini@kernel.org> writes:
> >> 
> >> > On Tue, 19 Nov 2024, Volodymyr Babchuk wrote:
> >> >> Hi Stefano,
> >> >>
> >> >> Stefano Stabellini <sstabellini@kernel.org> writes:
> >> >>
> 
> [...]
> 
> >> >>
> >> >> I was considering this as well. Problem is that fuzzing should be
> >> >> running for a prolonged periods of time. There is no clear consensus on
> >> >> "how long", but most widely accepted time period is 24 hours. So looks
> >> >> like it should be something like "nightly build" task. Fuzzer code
> >> >> needs to be extended to support some runtime restriction, because right
> >> >> now it runs indefinitely, until user stops it.
> >> >
> >> > We can let it run for 48 hours continuously every weekend using the
> >> > Gitlab runners
> >> 
> >> Great idea. Anyways, I need to add option to limit runtime to the fuzzer
> >> and invent some method for reporting discovered crashes to the CI first.
> >> 
> >> >
> >> >> I am certainly going to implement this, but this is a separate topic,
> >> >> because it quires changes in the fuzzer app. Speaking on which... Right
> >> >> now both fuzzer and test harness reside in our github repo, as you
> >> >> noticed. I believe it is better to host it on xenbits as an official
> >> >> part of the Xen Project.
> >> >
> >> > Yes we can create repos under gitlab.com/xen-project for this, maybe a
> >> > new subgroup gitlab.com/xen-project/fuzzer
> >> 
> >> Good. Whom should I ask to do this?
> >
> > I created gitlab.com/xen-project/fuzzer as an empty group. What
> > repositories do you need under it?
> 
> Right now it is only the fuzzer itself
> (https://github.com/xen-troops/xen-fuzzer-rs). If we are going to use
> XTF then we don't need additional repo for the the harness.

Please see:
https://gitlab.com/xen-project/fuzzer/xen-fuzzer

Before pushing the master of https://github.com/xen-troops/xen-fuzzer-rs
to https://gitlab.com/xen-project/fuzzer/xen-fuzzer, we need to make
sure that an appropriate Open Source license is clearly specified for
the project either with a top level COPYING file, or with an SPDX tag on
top of each source file, or both. MIT is a good candidate as LibAFL is
dual licensed as MIT.

