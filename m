Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C1A36781
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 22:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889102.1298323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj3Dm-0007dG-A7; Fri, 14 Feb 2025 21:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889102.1298323; Fri, 14 Feb 2025 21:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj3Dm-0007aG-6F; Fri, 14 Feb 2025 21:27:38 +0000
Received: by outflank-mailman (input) for mailman id 889102;
 Fri, 14 Feb 2025 21:27:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tj3Dk-0007aA-Rq
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 21:27:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80e42fa5-eb1a-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 22:27:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4D62D5C49B4;
 Fri, 14 Feb 2025 21:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98BBC4CED1;
 Fri, 14 Feb 2025 21:27:31 +0000 (UTC)
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
X-Inumbo-ID: 80e42fa5-eb1a-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739568452;
	bh=aSH/Y7F0zhoeWvjrjvFpyUXd+OVCl4ombIGfwQZ9TOc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BmXmy8PCIzCPn/O3YScwYTXl3nJ1dghD8PRLtQ2HXq5M5J7YXYHwuzs15/T4UJcYt
	 UmI4/avbunrGe2uRXKfdfAtASyvc11HhzIjTNcRcwN5gxdhdnJOM+YundfRuyQGLkK
	 jEcUOxh40pkx+kpvo77DSRHTt2x9kWFWe/sYX+KDUXjSzXN+wonMASwcY5gL+yFd+q
	 BVCyYksO2QNbKF/yqvdrHCN0fvMoiyfr+SOPFSG7IGtB4tcgJy55qc1BoIJEKPqnvD
	 8KAfupI47fitCIN8b71T0vsXjLNKZHUfWMSLQp8zQ/Bjp3ycWOgST/H5VdqcLMFJKf
	 Gt1wsNvx49fqw==
Date: Fri, 14 Feb 2025 13:27:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 3/3] automation: allow selecting individual jobs via
 CI variables
In-Reply-To: <Z66rSEWUZT2OXWBU@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2502141325030.3858257@ubuntu-linux-20-04-desktop>
References: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com> <90a256242870d1772bade171a7171d4e889f4e02.1739409822.git-series.marmarek@invisiblethingslab.com> <alpine.DEB.2.22.394.2502131727580.619090@ubuntu-linux-20-04-desktop>
 <Z66rSEWUZT2OXWBU@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1873846416-1739568452=:3858257"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1873846416-1739568452=:3858257
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 14 Feb 2025, Marek Marczykowski-Górecki wrote:
> On Thu, Feb 13, 2025 at 05:36:47PM -0800, Stefano Stabellini wrote:
> > On Thu, 13 Feb 2025, Marek Marczykowski-Górecki wrote:
> > > Debugging sometimes involves running specific jobs on different
> > > versions. It's useful to easily avoid running all of the not interesting
> > > ones (for given case) to save both time and CI resources. Doing so used
> > > to require changing the yaml files, usually in several places.
> > > Ease this step by adding SELECTED_JOBS_ONLY variable that takes a regex.
> > > Note that one needs to satisfy job dependencies on their own (for
> > > example if a test job needs a build job, that specific build job
> > > needs to be included too).
> > > 
> > > The variable can be specified via Gitlab web UI when scheduling a
> > > pipeline, but it can be also set when doing git push directly:
> > > 
> > >     git push -o ci.variable=SELECTED_JOBS_ONLY="/job1|job2/"
> > > 
> > > More details at https://docs.gitlab.co.jp/ee/user/project/push_options.html
> > > 
> > > The variable needs to include regex for selecting jobs, including
> > > enclosing slashes.
> > > A coma/space separated list of jobs to select would be friendlier UX,
> > > but unfortunately that is not supported:
> > > https://gitlab.com/gitlab-org/gitlab/-/issues/209904 (note the proposed
> > > workaround doesn't work for job-level CI_JOB_NAME).
> > > On the other hand, the regex is more flexible (one can select for
> > > example all arm32 jobs).
> > 
> > I was trying to find workarounds so that we could also support the
> > simple list of comma-separated jobs you mentioned, but I couldn't find
> > an easy way to do that.
> > 
> > However, one thing we can do is to support writing SELECTED_JOBS_ONLY in
> > .gitlab-ci.yml as a commit in xen.git, for people that don't know or
> > don't remember how to set ci.variable using the git command line.
> 
> You can always do it, in `variables` setting AFAIR.
> 
> > Given that this is for testing, I think it would be no problem to adding
> > a special commit on top of your tree. We are just trying to make it
> > easier compared to having to manually delete the list of jobs we don't
> > need.
> 
> Yes, manually delete was awful. In practice I usually added always-false
> rules, but still.
> 
> > But even with the special commit, I couldn't think of an easy way to
> > achieve the nicer comma-separated list of jobs...
> > 
> > 
> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > ---
> > > This probably wants documenting beyond this commit message. I don't
> > > think we have any CI-related docs anywhere, do we? Some new file in
> > > docs/misc?
> > 
> > Yes please :-)
> > 
> > It would be also worth documenting how to create a simple pipeline by
> > removing everything that you don't need for a single test
> 
> You mean how to find what jobs you need?
> 
> > > And also, it's possible to extend web ui for starting pipelines to
> > > include pre-defined variables. I use it in qubes here if you want to
> > > see:
> > > https://gitlab.com/QubesOS/qubes-continuous-integration/-/pipelines/new
> > 
> > I don't have access to this
> 
> Oh, sorry. Screenshot attached.
> 
> And its definition looks like this:
> https://gitlab.com/QubesOS/qubes-continuous-integration/-/blob/main/.gitlab-ci.yml?ref_type=heads#L15-26

Actually this gave me an idea. What if we flip the default? Normally we
want to run all the jobs.

When doing development, we typically want to run one specific job
attached to the work we are currently doing. This patch introduces a
blacklist, but it looks like we want a whitelist instead?

Wouldn't it be easier to say: "delete everything except for
adl-smoke-x86-64-dom0pvh-hvm-gcc-debug"

Then we can arrange it so adl-smoke-x86-64-dom0pvh-hvm-gcc-debug and its
dependencies are left enabled. Everything else is disabled?
--8323329-1873846416-1739568452=:3858257--

