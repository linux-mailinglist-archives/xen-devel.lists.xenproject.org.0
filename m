Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81465A34F45
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 21:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888030.1297446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiffI-0003n7-6g; Thu, 13 Feb 2025 20:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888030.1297446; Thu, 13 Feb 2025 20:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiffI-0003kB-3B; Thu, 13 Feb 2025 20:18:28 +0000
Received: by outflank-mailman (input) for mailman id 888030;
 Thu, 13 Feb 2025 20:18:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiffH-0003ju-4P
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 20:18:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad81e1bb-ea47-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 21:18:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D2B7E5C53A2;
 Thu, 13 Feb 2025 20:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF44C4CED1;
 Thu, 13 Feb 2025 20:18:23 +0000 (UTC)
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
X-Inumbo-ID: ad81e1bb-ea47-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739477904;
	bh=DyUMjiM+cpNdCTML5Fh3a8zSFIKq7tyD8I9cBjNwyZA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LJs1Jc3ym4S/yJuiXpisaDktxHBIvkJLuBureKAQYxDmjQnG4O953/xgWD+bFU0cH
	 YOOsSHTiAWBxIoANkSL4kgL9GyG8jQibq+N22fiThJp07MYLHIKcapO29SoWXyf/f/
	 7bmvIfCiv2nZ8mQe/BotDzmBegVkD4XIi4JO+nFJ7Jwc0MZZPSDQPsU1jnNMDS//Lh
	 dYf/DQ6mpRE66m2BIbZjfFwrN95X1LU5GuleypjFrjIySt6tSmTLt22VU0GPKcMSQ1
	 0/oVgwQIWOQZubIuVCua0QLVc34v9zBxLRWoldHLwAdZhOQJmdZze5TR1d1YrHkY8w
	 7XiDDaVMdlGNg==
Date: Thu, 13 Feb 2025 12:18:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    VictorM.Lira@amd.com, michal.orzel@amd.com
Subject: Re: xen | Failed pipeline for staging | b5b2f987
In-Reply-To: <35e47b81-7a87-4e8e-b8de-ec37a5ea984a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502131215140.619090@ubuntu-linux-20-04-desktop>
References: <67adff3bd57c7_2ec97344998c@gitlab-sidekiq-catchall-v2-74bbd94c4d-5p8wh.mail> <35e47b81-7a87-4e8e-b8de-ec37a5ea984a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Feb 2025, Jan Beulich wrote:
> On 13.02.2025 15:18, GitLab wrote:
> > 
> > 
> > Pipeline #1669696445 has failed!
> > 
> > Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> > Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> > 
> > Commit: b5b2f987 ( https://gitlab.com/xen-project/hardware/xen/-/commit/b5b2f9877a8777af6b78944407527e0a450389a2 )
> > Commit Message: x86/HVM: use XVFREE() in hvmemul_cache_destroy(...
> > Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
> > 
> > 
> > Pipeline #1669696445 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1669696445 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> > had 1 failed job.
> > 
> > Job #9129817480 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/9129817480/raw )
> > 
> > Stage: test
> > Name: xilinx-smoke-dom0less-arm64-gcc-debug-gem-passthrough
> 
> >From the log I can't spot what it is that failed. Stefano, given it's a
> Xilinx test, any idea or hint?

Hi Jan,

Thank you for bringing this to our attention. Michal also mentioned it
to us this morning.  

As far as we can tell, it appears to be a transient networking
issue. Specifically, U-Boot on the board was unable to successfully
complete the TFTP transfer from the TFTP server. We are not sure why
this happened, but everything is functioning properly again.  

I have been considering whether switching to a TCP-based protocol might
be a better approach. In any case, we are still investigating the root
cause, but for now, everything is working again.

