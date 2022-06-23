Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC32558853
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 21:05:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355179.582696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4S95-0005RZ-S3; Thu, 23 Jun 2022 19:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355179.582696; Thu, 23 Jun 2022 19:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4S95-0005PY-Ot; Thu, 23 Jun 2022 19:05:39 +0000
Received: by outflank-mailman (input) for mailman id 355179;
 Thu, 23 Jun 2022 19:05:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VLWc=W6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o4S94-0005PS-EV
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 19:05:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75a43b5e-f327-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 21:05:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11D5760DE4;
 Thu, 23 Jun 2022 19:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B7EC341C6;
 Thu, 23 Jun 2022 19:05:32 +0000 (UTC)
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
X-Inumbo-ID: 75a43b5e-f327-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656011133;
	bh=DlaG4hikWmV5GgEEhFKLTExjiONKayjhelSAZ9OX0mg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MeGFBC/IDQs/gYGFQsyiAGqtObMQqYr659vAvp7nny88g0w7tOHjkssgIytGXPc+C
	 xk6osWSsynJdCPNVUy3c8sd7YAyJvimq3VMu7tS1Xj03W2wLYi6jVds/QFyMUbToL1
	 jn1MHFro7tUU6qPXZgvsp6G+DEQGbDW9Pns/DN9RGeghRpK1mqajA/Izr9aLVrZMyA
	 bWITtmWyjKB2/6ZtvSB67uae4qBwgd87RPSQFE/31njvIvzH8kgGrlP/xuZnTtYpTC
	 CKOkpnK0zDQC2CmKsMNnQTIP7qBnTvvu/+Ou3PCI4rVxCXVed0ukDnnKnuE4Qik8aI
	 4/IYy8dsocBSA==
Date: Thu, 23 Jun 2022 12:05:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] xen: Add MISRA support to cppcheck make rule
In-Reply-To: <99E7CA0A-B87F-40D3-BE15-AA344AFB9855@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206231204400.2410338@ubuntu-linux-20-04-desktop>
References: <82a29dff7a0da97cc6ad9d247a97372bcf71f17c.1654850751.git.bertrand.marquis@arm.com> <alpine.DEB.2.22.394.2206211658480.788376@ubuntu-linux-20-04-desktop> <FE2CD795-09AC-4AD0-8F08-8320FE7122C5@arm.com> <alpine.DEB.2.22.394.2206221445520.2352613@ubuntu-linux-20-04-desktop>
 <99E7CA0A-B87F-40D3-BE15-AA344AFB9855@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Jun 2022, Bertrand Marquis wrote:
> > On 22 Jun 2022, at 22:52, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Wed, 22 Jun 2022, Bertrand Marquis wrote:
> >> Hi Stefano,
> >> 
> >>> On 22 Jun 2022, at 01:00, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>> 
> >>> On Fri, 10 Jun 2022, Bertrand Marquis wrote:
> >>>> cppcheck MISRA addon can be used to check for non compliance to some of
> >>>> the MISRA standard rules.
> >>>> 
> >>>> Add a CPPCHECK_MISRA variable that can be set to "y" using make command
> >>>> line to generate a cppcheck report including cppcheck misra checks.
> >>>> 
> >>>> When MISRA checking is enabled, a file with a text description suitable
> >>>> for cppcheck misra addon is generated out of Xen documentation file
> >>>> which lists the rules followed by Xen (docs/misra/rules.rst).
> >>>> 
> >>>> By default MISRA checking is turned off.
> >>>> 
> >>>> While adding cppcheck-misra files to gitignore, also fix the missing /
> >>>> for htmlreport gitignore
> >>>> 
> >>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>> 
> >>> Hi Bertrand,
> >>> 
> >>> I tried this patch and I am a bit confused by the output
> >>> cppcheck-misra.txt file that I get (appended.)
> >>> 
> >>> I can see that there are all the rules from docs/misra/rules.rst as it
> >>> should be together with the one line summary, but there are also a bunch
> >>> of additional rules not present in docs/misra/rules.rst. Starting from
> >>> Rule 1.1 all the way to Rule 21.21. Is the expected?
> >> 
> >> To make cppcheck happy I need to give a text for all rules so the python script is generating a dummy sentence for not declared Misra rules to prevent cppcheck warnings. To make it simpler I just did it for 1 to 22 for main and sub numbers.
> >> 
> >> So yes this is expected.
> > 
> > No problem about the dummy text sentence. My question was why are all
> > those additional rules listed?
> > 
> > If you see below, the first few rules from 2.1 to 20.14 are coming from
> > docs/misra/rules.rst. Why are the other rules afterward from 1.1 to
> > 21.21 listed and where are they coming from?
> 
> Those are dummy entries generated by the python script.
> 
> > 
> > Is it because all rules need to be listed? And the ones that are enabled
> > are marked as "Required"?
> 
> If a rule is not listed in the file, cppcheck will give a warning.
> 
> > 
> > I take we couldn't just avoid listing the other rules (the ones not in
> > docs/misra/rules.rst)?
> 
> I can but each cppcheck command will output a warning for each rule which has no description in the generated file.

No, that makes sense. It is to silence a warning. Maybe explain this in
the commit message and add my

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

