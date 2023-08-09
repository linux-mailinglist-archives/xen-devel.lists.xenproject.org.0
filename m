Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33852776C7A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 00:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581477.910203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTs4C-00081X-Ev; Wed, 09 Aug 2023 22:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581477.910203; Wed, 09 Aug 2023 22:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTs4C-0007zM-CD; Wed, 09 Aug 2023 22:54:12 +0000
Received: by outflank-mailman (input) for mailman id 581477;
 Wed, 09 Aug 2023 22:54:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTs4A-0007zC-6G
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 22:54:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5304ee7-3707-11ee-b282-6b7b168915f2;
 Thu, 10 Aug 2023 00:54:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B29AF64BB1;
 Wed,  9 Aug 2023 22:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE78C433C8;
 Wed,  9 Aug 2023 22:54:04 +0000 (UTC)
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
X-Inumbo-ID: a5304ee7-3707-11ee-b282-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691621646;
	bh=I9zQGnkPlhmcGiS0698COlr9BJ6IJc8ygi0fkqyS16I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n3X3R5/d2NUcCQGOsJEfyVbxGAFoWgAEciFk1tOkK91JJn1YQ4M5ZmR8zFtpPV8fS
	 ew+hk2AWJhyVWiT3sfbJy4xu6S/pd3+2kKGg3oN0Nz/+E28rSeGc+CUHhE06Xgq2Uz
	 9oPY38gk2z0WtdaY53fxegyCE0X+LViU0CdIKkqg/4Ru3LBfUCFbx1zjMHp0CB1XIv
	 Cuji+TBz/MXARf35PbhX7onjVvkWAAK6o7v/3au8M974Hgj1K2klKzThVFFCFLDu4/
	 yvWR3BdR6N0YwvPUJGTrDi3vWevZsCrxcx7ZHql4cuNODzmHDUKwV2WfnaIkmU4ZFl
	 9Su7vKZPT/rqQ==
Date: Wed, 9 Aug 2023 15:54:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <Henry.Wang@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "community.manager@xenproject.org" <community.manager@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    simone.ballarin@bugseng.com
Subject: Re: Xen 4.18 release: Reminder about last posting date
In-Reply-To: <c84814f3-93bc-a4a1-e609-cb35092f00d1@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2308091546200.2127516@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com> <ec8e75da-743b-50dc-4665-854c446c974e@citrix.com> <alpine.DEB.2.22.394.2308091437200.2127516@ubuntu-linux-20-04-desktop> <1ac14ed0-d489-0efe-0b0c-200792a50fde@citrix.com>
 <alpine.DEB.2.22.394.2308091526060.2127516@ubuntu-linux-20-04-desktop> <c84814f3-93bc-a4a1-e609-cb35092f00d1@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1874569854-1691621349=:2127516"
Content-ID: <alpine.DEB.2.22.394.2308091549170.2127516@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1874569854-1691621349=:2127516
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2308091549171.2127516@ubuntu-linux-20-04-desktop>

On Wed, 9 Aug 2023, Andrew Cooper wrote:
> On 09/08/2023 11:34 pm, Stefano Stabellini wrote:
> > On Wed, 9 Aug 2023, Andrew Cooper wrote:
> >> On 09/08/2023 10:43 pm, Stefano Stabellini wrote:
> >>> On Wed, 9 Aug 2023, Andrew Cooper wrote:
> >>>> On 07/08/2023 2:24 am, Henry Wang wrote:
> >>>>> Hi everyone,
> >>>>>
> >>>>> Following the release schedule discussion in in April, I am sending this email
> >>>>> to remind that according to the release schedule [1], August 11 (this Friday)
> >>>>> will be the last posting date, when patches adding new features are expected
> >>>>> to be posted to the mailing list by this date.
> >>>>>
> >>>>> Also, note that we currently have 1 release blocker [2] which might need
> >>>>> some attention.
> >>>>>
> >>>>> [1] https://lore.kernel.org/xen-devel/AS8PR08MB79919F9CE0B2BF80E7103FB592609@AS8PR08MB7991.eurprd08.prod.outlook.com/
> >>>>> [2] https://gitlab.com/xen-project/xen/-/issues/114
> >>>> Off the top of my head.
> >>>>
> >>>> There are still unaddressed Gitlab bugs from the Eclair integration
> >>> The bug you managed to find it is now fixed (commit e55146071de9). I am
> >>> all for fixing Gitlab bugs so let me know if you find anything else! I
> >>> am not aware of any other issue with Eclair at the moment.
> >> I meant the one where Eclair is still running on `smoke` and twiddling
> >> its thumbs for 1h doing so each time OSSTest says yes to a push.  It
> >> will be a missing 'exclude' somewhere, but I haven't hand enough time to
> >> look.
> > Ah, yes, got it. I would call it "Eclair lagging behind". I am happy for
> > this to be a blocker.
> 
> Something else for the list is to see about trimming down the testing
> we're doing.
> 
> I had to cancel 7 pipelines (mostly patchew) in order to get a gitlab
> run on a late-breaking tweak on the security content yesterday.
> 
> Take
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/959800176
> as an example.  Nearly 2h to run, and queued for 2h before that waiting
> to start.  This is not a rare occurrence right now.

Yeah...

So, an easy fix that would solve the problem for the rest of the tests
but not Eclair would be to reduce the number of tests. It is easy
because we can make them conditional on a CI/CD variable and *not*
define the variable in patchew. That way patchew gets a reduced set of
tests. I think that would be fine.

Another option we can also pursue in parallel is to throw more hardware
at the problem. I am not sure where we are on reusing Colo hardware for
this.

Eclair is a different issue because we cannot increase the hardware and
I don't think we want to reduce the set of rules to be scanned. So the
only idea I can come up with is to limit the number of Eclair jobs in
patchew to 1-2 per day. However it would be pretty random which ones are
getting executed. Or find a wat to prioritize non-patchew jobs? If you
or anyone else has better idea feel free to suggest.


> >>>> and other Gitlab bugs (use of unstable containers) which I'd unwilling
> >>>> to let 4.18 be released with, given the pain we've had on the stable
> >>>> trees trying to keep CI working.
> >>> That is fair enough. To make this more concrete and easier to track, the
> >>> following would need to be changed to using stable containers:
> >>>
> >>> - .qemu-arm64
> >>> - .qemu-arm32
> >>> (I am not counting .qemu-riscv64)
> >>>
> >>> Andrew, is that what you meant? Am I missing anything?
> >> Every debian unstable container, and the other containers (OpenSUSE)
> >> which are using an non-specific upstream version.  Upstreams which
> >> really are rolling distros (Arch, Tumbleweed) need to be made non-fatal.
> > I was more asking whether for 4.18 you want to fix only test.yaml or
> > also build.yaml. (Typically it is test.yaml that causes most issues
> > with rolling containers.)
> 
> Everything.  Because both bite equally hard in stable trees.
> 
> It's not hard to do - just needs some time.
 
OK
--8323329-1874569854-1691621349=:2127516--

