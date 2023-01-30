Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C5681D2F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 22:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487233.754799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMc0f-00013L-5H; Mon, 30 Jan 2023 21:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487233.754799; Mon, 30 Jan 2023 21:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMc0f-00011f-2L; Mon, 30 Jan 2023 21:48:17 +0000
Received: by outflank-mailman (input) for mailman id 487233;
 Mon, 30 Jan 2023 21:48:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fYol=53=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pMc0d-00011X-91
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 21:48:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caeb4caf-a0e7-11ed-b63b-5f92e7d2e73a;
 Mon, 30 Jan 2023 22:48:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6CE361286;
 Mon, 30 Jan 2023 21:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A6CC433EF;
 Mon, 30 Jan 2023 21:48:09 +0000 (UTC)
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
X-Inumbo-ID: caeb4caf-a0e7-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675115291;
	bh=t8SOvwSgVvXIooxQg1/n38aMVlKvyvB3JZYGMkzGf5k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MZn0QT+lbusKMr5aZNSO4AdDQP8n9hTRks2lLKRYynI503jR0zHHbXE6ezfgblokf
	 A5Y8XBnydp0VBoPs4Q8+PxYYAm8KGvJmZVHyKoZzfhuCOa79agVXQsrMFKzo9hNN8y
	 M0FMqoc5XET6qx4ze5fo2kgjTcwH6EuYUxcQ8ODYQiYU6N4VORObbdAhVKVCZQV3FV
	 nSNI3YnXbqUYiwp4KOVGdpKK1D+eDBbo4npN5VnjLAx/FVVtDfAhdJyhVJLf7hm1az
	 w97SH4jMAxu8JRrLUm0Hxg9PxGH034yF7vGk8crpNED1v/cHSjdBS08JTEa5Da8714
	 X+QoVoutqg5Yg==
Date: Mon, 30 Jan 2023 13:48:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Add more rules to docs/misra/rules.rst
In-Reply-To: <2733D8BE-CCA5-4322-BB9B-1D4318378525@arm.com>
Message-ID: <alpine.DEB.2.22.394.2301301339110.132504@ubuntu-linux-20-04-desktop>
References: <20230125205735.2662514-1-sstabellini@kernel.org> <9d536cec-726d-4a39-da36-ecc19d35d420@suse.com> <alpine.DEB.2.22.394.2301260749150.1978264@ubuntu-linux-20-04-desktop> <5a3ef92e-281f-e337-1a3e-aa4c6825d964@suse.com>
 <alpine.DEB.2.22.394.2301261041440.1978264@ubuntu-linux-20-04-desktop> <db97da84-5f23-e7ed-119b-74aed02fb573@suse.com> <alpine.DEB.2.22.394.2301271016360.1978264@ubuntu-linux-20-04-desktop> <03ce9f48-191e-b1b5-a3b2-8b769aa8feeb@suse.com>
 <2733D8BE-CCA5-4322-BB9B-1D4318378525@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jan 2023, Luca Fancellu wrote:
> > On 30 Jan 2023, at 07:33, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 27.01.2023 19:33, Stefano Stabellini wrote:
> >> On Fri, 27 Jan 2023, Jan Beulich wrote:
> >>> On 26.01.2023 19:54, Stefano Stabellini wrote:
> >>> Looking back at the sheet, it says "rule already followed by
> >>> the community in most cases" which I assume was based on there being
> >>> only very few violations that are presently reported. Now we've found
> >>> the frame_table[] issue, I'm inclined to say that the statement was put
> >>> there by mistake (due to that oversight).
> >> 
> >> cppcheck is unable to find violations; we know cppcheck has limitations
> >> and that's OK.
> >> 
> >> Eclair is excellent and finds violations (including the frame_table[]
> >> issue you mentioned), but currently it doesn't read configs from xen.git
> >> and we cannot run a test to see if adding a couple of deviations for 2
> >> macros removes most of the violations. If we want to use Eclair as a
> >> reference (could be a good idea) then I think we need a better
> >> integration. I'll talk to Roberto and see if we can arrange something
> >> better.
> >> 
> >> I am writing this with the assumption that if I could show that, as an
> >> example, adding 2 deviations reduces the Eclair violations down to less
> >> than 10, then we could adopt the rule. Do you think that would be
> >> acceptable in your opinion, as a process?
> > 
> > Hmm, to be quite honest: Not sure. Having noticed the oversight of the
> > frame_table[] issue makes me wonder how much else may be missed in this
> > same area (18.1, 18.2, and 18.3).
> 
> Hi Jan,
> 
> I think I recall the frame_table[] issue but I was looking into the eclair reports to
> understand it better and I was unable to find it, do you recall where the tool was
> complaining for the 18.2 related to the frame_table[]?
> Any notes or link is appreciated, maybe we could speak with Roberto to understand
> It better, because I checked with Coverity and I was unable to link findings of 18.2 with
> the symbol frame_table[] (however I might be a bit lost in all the macros).

Eclair could find the following violation which is related to the
frametable in arch/x86/mm.c:init_frametable_chunk:

   L229: memset(start, 0, end - start);

https://eclairit.com:8443/job/XEN/lastBuild/Target=X86_64,agent=docker1/eclair/type.-1600986843/moduleName.-84949685/packageName.590865259/fileName.1553859513/
https://eclairit.com:3787/fs/var/lib/jenkins/jobs/XEN/configurations/axis-Target/X86_64/axis-agent/docker1/builds/686/archive/ECLAIR/out/PROJECT.ecd;/sources/xen/arch/x86/mm.c.html#R46776_1

Almost all the other 18.2 violations are due to the "guest_mode" macro
and the NEEP_IP/OP HAVE_IO/OP macros in lzo.c.

