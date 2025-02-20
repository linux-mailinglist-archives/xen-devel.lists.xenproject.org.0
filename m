Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4D8A3CF6B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 03:36:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893515.1302393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkwQ0-0000hn-4S; Thu, 20 Feb 2025 02:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893515.1302393; Thu, 20 Feb 2025 02:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkwQ0-0000fA-1c; Thu, 20 Feb 2025 02:36:04 +0000
Received: by outflank-mailman (input) for mailman id 893515;
 Thu, 20 Feb 2025 02:36:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1Y=VL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkwPy-00009J-EI
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 02:36:02 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b9b98b4-ef33-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 03:36:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D8C1361188;
 Thu, 20 Feb 2025 02:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA320C4CED1;
 Thu, 20 Feb 2025 02:35:57 +0000 (UTC)
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
X-Inumbo-ID: 6b9b98b4-ef33-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740018959;
	bh=SbdckdtBaY7sQw0fKLiRRYUV7d0n/yW4ACz8pU4Weo0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WdTb3wwtkwDt3q84+wUJEhJIuizf4YoLWDszC2HP/PTdIIY68zT9/Te+YJRlDQR68
	 sC7BfWAWk0z0MFXHFbrR7PzeBPB21E1mDnImolUYwh+Xf9kBEfUxtgyjalGnQnf67u
	 ix+kxbURig3HN5LUauL0gPDPTovN74M9iiTdcg8U43ZagVJRWtCRRKyTnFvGif+B+R
	 Lo7UUPsQRBqhoPRH6OEaCO8CqylPJpvM4K77+FouVE6q3eNH2zaLzDRKGmBt5xmltI
	 i+Fw95vFWGZnlFnJzQY2F6pWGdenSqyAF2NjXV47EEtiTfuLi8dkTHU4/fquQcPNL6
	 Sz7TEEBdJGNoA==
Date: Wed, 19 Feb 2025 18:35:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 5/5] docs: add basic CI documentation
In-Reply-To: <f5fd85826a24bb6d7048d2db1c9c8417bf13c026.1739933790.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2502191835010.1791669@ubuntu-linux-20-04-desktop>
References: <cover.0fd3c8fb7cf6db337edfd5c5d6ea18bcc44bdef3.1739933790.git-series.marmarek@invisiblethingslab.com> <f5fd85826a24bb6d7048d2db1c9c8417bf13c026.1739933790.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-926116134-1740018958=:1791669"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-926116134-1740018958=:1791669
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 19 Feb 2025, Marek Marczykowski-Górecki wrote:
> Include info how to get access/enable hardware runners and how to select
> individual jobs.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> new in v3
> Definitely there can be more content here, but lets start somewhere.
> ---
>  docs/index.rst   |  1 +
>  docs/misc/ci.rst | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 docs/misc/ci.rst
> 
> diff --git a/docs/index.rst b/docs/index.rst
> index 1bb8d02ea357..bd87d736b9c3 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -51,6 +51,7 @@ kind of development environment.
>     :maxdepth: 2
>  
>     hypervisor-guide/index
> +   misc/ci
>  
>  
>  Unsorted documents
> diff --git a/docs/misc/ci.rst b/docs/misc/ci.rst
> new file mode 100644
> index 000000000000..2803574fa2c0
> --- /dev/null
> +++ b/docs/misc/ci.rst
> @@ -0,0 +1,35 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Continuous Integration
> +======================
> +
> +Xen Project uses Gitlab-CI for automated testing. Test pipelines for official
> +staging branches are at
> +`<https://gitlab.com/xen-project/hardware/xen/-/pipelines>`_. Developers can
> +schedule test pipelines in their repositories under
> +`<https://gitlab.com/xen-project/people/>`_.
> +
> +Hardware runners
> +****************
> +
> +Some of the tests are using dedicated hardware runners. Those are not available freely, but the access is granted to individual developers. To get access to them, ask on the ``#XenDevel:matrix.org`` Matrix channel.
> +After getting access to relevant runners, few extra changes are necessary in settings of the relevant "xen" gitlab project (under your `<https://gitlab.com/xen-project/people/>`_ namespace):
> +
> +1. Go to Settings -> CI/CD, expand the "Runners" section and enable relevant runners for your project.
> +2. Expand "Variables" section and add ``QUBES_JOBS=true`` variable for Qubes runners, and ``XILINX_JOBS=true`` for Xilinx runners.

Let's not mention XILINX_JOBS=true as Xilinx runners are not generally
available. I can fix on commit.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> +3. Go to Settings -> Repository, expand "Branch rules" section and add a rule for protected branches - only those branches will get tests on the hardware runners. It's okay to use a pattern for branch name, and it's okay to allow force push.
> +
> +Selecting individual tests
> +**************************
> +
> +Normally, all build and test jobs are scheduled in a pipeline. When working on a specific patches, it is sometimes useful to run only jobs relevant for the current work - both to save time and to save CI resources. This can be done by seeting ``SELECTED_JOBS_ONLY`` variable when starting the pipeline. The variable holds a regular expression, enclosed with ``/`` that matches jobs to be included. The variable can be set via the gitlab.com web UI or directly when pushing changes to gitlab::
> +
> +   git push -o ci.variable=SELECTED_JOBS_ONLY="/job1|job2/"
> +
> +Note if a test job requires some build job, both need to be included in the regex. For example, ``adl-smoke-x86-64-gcc-debug`` requires ``alpine-3.18-gcc-debug``, so to run just this test the command will look like this::
> +
> +   git push -o ci.variable=SELECTED_JOBS_ONLY="/adl-smoke-x86-64-gcc-debug|alpine-3.18-gcc-debug/"
> +
> +More details at `<https://docs.gitlab.co.jp/ee/user/project/push_options.html>`_.
> +
> +Alternatively, irrelevant jobs can be removed from respective yaml files in ``automation/gitlab-ci`` by adding temporary commit on top of the branch.
> -- 
> git-series 0.9.1
> 
--8323329-926116134-1740018958=:1791669--

