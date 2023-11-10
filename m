Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED1F7E764F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 02:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629881.982426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Fx2-0008P3-H1; Fri, 10 Nov 2023 01:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629881.982426; Fri, 10 Nov 2023 01:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Fx2-0008Mb-ER; Fri, 10 Nov 2023 01:04:48 +0000
Received: by outflank-mailman (input) for mailman id 629881;
 Fri, 10 Nov 2023 01:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1Fx0-0008K0-Cu
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 01:04:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2338654f-7f65-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 02:04:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E8A47B82123;
 Fri, 10 Nov 2023 01:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786B8C433C7;
 Fri, 10 Nov 2023 01:04:42 +0000 (UTC)
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
X-Inumbo-ID: 2338654f-7f65-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699578283;
	bh=35czjr1yTBqe66A9M/YH9AI2OsyExF6fa3yKsuqHN8E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W+KIH7CqgL2dBfMTJzn4p9LdPIoySa8HvwmD9mwkdPMcjZDsI5zO7+uke2MeRG5/K
	 2oyzmpJOuSXRlX89V2kCYCJiULeOiHo+XlyQQiT1cp1vI2g4HZuk5PfqZbXvS1DpHW
	 qeGsJEQkxfqQ0goowhsxxwPfWY6JIYK/r6QoXwJ9XleBY1D76zaOXW7oShmwoQNENH
	 MybEo+45j3Gm7I4vBbIMHjfA89ln9yK+uOswZwA0F2wtxEvFDYneQMMeMvLJ3rP6H+
	 l6QVJotc3VRuG7nGIecWo4RQUu6of4mhamZen7XcT27/u8x+hR0vm606tuqcbrRIPA
	 t6ZhmierhEJ4w==
Date: Thu, 9 Nov 2023 17:04:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, simone.ballarin@bugseng.com, 
    consulting@bugseng.com, xen-devel@lists.xenproject.org, 
    andrew.cooper3@citrix.com
Subject: Re: Failing eclair-ARM64 job
In-Reply-To: <4be3de5cecb06a9fdd09fc530d3926f0@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311091702530.3478774@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2310311443460.1795129@ubuntu-linux-20-04-desktop> <cedcc2c2dad9b0a75220d676ff6b646a@bugseng.com> <4be3de5cecb06a9fdd09fc530d3926f0@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Nov 2023, Nicola Vetrini wrote:
> On 2023-11-08 09:17, Nicola Vetrini wrote:
> > Hi Stefano,
> > 
> > sorry for the late reply; see my response below.
> > 
> > On 2023-10-31 22:47, Stefano Stabellini wrote:
> > > Hi Simone,
> > > 
> > > As you might have noticed, all the eclair-ARM64 jobs have been failing
> > > recently for the upstream Xen "staging" branch:
> > > 
> > > https://gitlab.com/xen-project/xen/-/pipelines/1056527466
> > > https://gitlab.com/xen-project/xen/-/pipelines/1056520898
> > > 
> > > Although eclair-ARM64 is "allow_failure: true" still is the only job
> > > currently failing and it would be nice to get it fixed, especially as we
> > > are about to make gitlab-ci pipelines gating.
> > > 
> > > Cheers,
> > > 
> > > Stefano
> > 
> > A patch that is meant to address the issue related to D4.11, which makes the
> > Arm job always
> > fail with a report on a clean guideline, has been submitted on the ML:
> > 
> > https://lore.kernel.org/xen-devel/3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com/
> > 
> 
> This is about the semi-random failures mentioned to Roberto in yesterday's
> MISRA C meeting.
> Neither me nor Simone has seem a mail sent from Andrew about such semi-random
> failures.

So you are saying there is  no problem with the ECLAIR arm64 job, it is
just that it is failing on a false-positive violation and we already
have a tentative fix for that currently under discussion [1]. Once we
commit the fix, everything will pass?

[1]
https://lore.kernel.org/xen-devel/3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com/

