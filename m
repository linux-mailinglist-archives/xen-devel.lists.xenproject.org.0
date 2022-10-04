Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CA95F3A93
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 02:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415100.659591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofVkb-0003bR-Al; Tue, 04 Oct 2022 00:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415100.659591; Tue, 04 Oct 2022 00:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofVkb-0003Yc-7e; Tue, 04 Oct 2022 00:25:33 +0000
Received: by outflank-mailman (input) for mailman id 415100;
 Tue, 04 Oct 2022 00:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+z6g=2F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ofVka-0003YW-5e
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 00:25:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0caef3c7-437b-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 02:25:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E83F61211;
 Tue,  4 Oct 2022 00:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E35DC433C1;
 Tue,  4 Oct 2022 00:25:26 +0000 (UTC)
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
X-Inumbo-ID: 0caef3c7-437b-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664843128;
	bh=DEbMt8IN9I+S0o6tUQvtHz8KO39e8we/0IMehRfC8uA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hsqd9sCjtpcvaRyRuBYxPZo8FyqLsFjAJKV75w1Ay1Ap6uJVNKhMvNX5skWuTuXLR
	 g2oaALH7xZE+zaBGMCs3HiGuDx69V5BbyNSdazx83dKRUBnFC4ZvR7vGY5kWVmxZkG
	 NWBLefzM9rHXdZnUuar+9AlAU0R90b5qFvYEjpEw96ngML6UUfT1/u5z6tL62bzbWp
	 RHRWgPsVJKFNrcwTdXui+54iPcM84IZZ+NlEr5uX3zbACRrZgiMQwcuRR3lwm5hNBQ
	 tHThvoc9sZn4AR17jw3wMFJnEM/03TE0pjGF+YBKCBytyqAZlnUFUnkIFyFp1RQSYO
	 qr7WD3zvXDLLA==
Date: Mon, 3 Oct 2022 17:25:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <amc96@srcf.net>, 
    osstest service owner <osstest-admin@xenproject.org>, 
    xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [xen-unstable-smoke test] 173362: regressions - FAIL
In-Reply-To: <cd7b7622-273e-5662-8dc4-826ff9c4c331@suse.com>
Message-ID: <alpine.DEB.2.22.394.2210031719530.3073309@ubuntu-linux-20-04-desktop>
References: <osstest-173362-mainreport@xen.org> <200b2ad7-8cf9-4ca5-cb54-6e72ced7d7d9@srcf.net> <b3242791-3d30-ce72-010c-c31db05b175e@suse.com> <YzbDWSAiRBhnqKOF@perard.uk.xensource.com> <cd7b7622-273e-5662-8dc4-826ff9c4c331@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-160457610-1664843128=:3073309"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-160457610-1664843128=:3073309
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 30 Sep 2022, Jan Beulich wrote:
> On 30.09.2022 12:22, Anthony PERARD wrote:
> > On Fri, Sep 30, 2022 at 08:31:20AM +0200, Jan Beulich wrote:
> >> On 29.09.2022 18:25, Andrew Cooper wrote:
> >>> On 29/09/2022 17:22, osstest service owner wrote:
> >>>> flight 173362 xen-unstable-smoke real [real]
> >>>> http://logs.test-lab.xenproject.org/osstest/logs/173362/
> >>>>
> >>>> Regressions :-(
> >>>>
> >>>> Tests which did not succeed and are blocking,
> >>>> including tests which could not be run:
> >>>>  build-arm64-xsm               6 xen-build                fail REGR. vs. 173347
> >>>
> >>> arch/arm/gic-v3-its.c: In function 'gicv3_its_deny_access':
> >>> arch/arm/gic-v3-its.c:905:32: error: passing argument 1 of
> >>> 'iomem_deny_access' discards 'const' qualifier from pointer target type
> >>> [-Werror=discarded-qualifiers]
> >>>          rc = iomem_deny_access(d, mfn, mfn + nr);
> >>>                                 ^
> >>> In file included from arch/arm/gic-v3-its.c:24:
> >>> ./include/xen/iocap.h:32:52: note: expected 'struct domain *' but
> >>> argument is of type 'const struct domain *'
> >>>  static inline int iomem_deny_access(struct domain *d, unsigned long s,
> >>>                                      ~~~~~~~~~~~~~~~^
> >>> cc1: all warnings being treated as errors
> >>
> >> I've sent a patch, but this raises another question: Why does the smoke
> >> test (try to) build an unsupported configuration? HAS_ITS (which is
> >> necessary to be set for the issue to surface) has its prompt depend on
> >> UNSUPPORTED, and (implicitly) defaults to N.
> > 
> > According to osstest sources:
> >     # ITS driver is required to boot the Hardware Domain
> >     # on Xen. For now (Xen 4.10/4.11 at at least),
> >     # will be not built by default and gated by expert mode
> >     echo >>xen/.config CONFIG_HAS_ITS=y
> 
> Hmm, that's been quite a number of revisions back, without things having
> changed. Arm maintainers - what's the plan here? What use is it to test
> an unsupported configuration (for years)?

This issue is non-trivial. On my side, I still don't have easy access to
hardware with ITS in it. This will change in the future, but we are not
there yet. So as of now I couldn't "support" ITS.


> But there's a more general aspect here: EXPERT is forced to Y here as
> well, which is fine by itself. But it implies UNSUPPORTED also getting
> enabled. That latter aspect is what I consider wrong for smoke flights
> at least. Yet (as said) HAS_ITS depends on it (and its setting to Y by
> the script would have no effect if UNSUPPORTED was off).

I agree with you, but I don't have a solution to offer due to the above.
--8323329-160457610-1664843128=:3073309--

