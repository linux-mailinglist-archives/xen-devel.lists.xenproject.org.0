Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 040366AA086
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 21:19:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506192.779283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYBrf-0004Bi-7X; Fri, 03 Mar 2023 20:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506192.779283; Fri, 03 Mar 2023 20:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYBrf-00049M-4Y; Fri, 03 Mar 2023 20:18:51 +0000
Received: by outflank-mailman (input) for mailman id 506192;
 Fri, 03 Mar 2023 20:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVKH=63=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pYBre-00049G-2o
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 20:18:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 997911d6-ba00-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 21:18:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31E17618C4;
 Fri,  3 Mar 2023 20:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F7CC433EF;
 Fri,  3 Mar 2023 20:18:43 +0000 (UTC)
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
X-Inumbo-ID: 997911d6-ba00-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677874724;
	bh=JFrgL91Y1mzcieOtFGb67hWIYblIWfe8TovZ4Z0GdeQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ktv4k9uYvuXsRqQMotFR8b78Lvrm+2HLtR9sY5KEtCbZs+YXCYnAWcmWR93Z8MkUT
	 0JcPi3H2DLAGJo6cWjBIpd/HL9nhXQSyjjhH1QNhd5yD3LJlpB6ziuhJ+4VNzLwJxy
	 tTkrW1BJHbsXMcyP1cKLKDTTDfDuOFT+duZMZzr4bryym5ZIkBNWAmMkZejridk106
	 B1AejRdNtOeqkE/Jt5SHCVnZXCL/tf8qTUKomlDdR23izxebmqhsMU6ZyHbqdTP2DN
	 YRgwzvNuI3ft7SxTg7VWkDBor3PITUpToflWCqtr94GNL+dDXY9FRbNeGGM9UZmmiZ
	 FgKSZV1k6LU1g==
Date: Fri, 3 Mar 2023 12:18:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] automation: Drop sles11sp4 dockerfile
In-Reply-To: <20230303125346.20620-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2303031218350.863724@ubuntu-linux-20-04-desktop>
References: <20230303125346.20620-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Mar 2023, Michal Orzel wrote:
> It has reached EOL and there are no jobs using it on any branch.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> We can also safely remove sles containers from registry.
> ---
>  automation/build/suse/sles11sp4.dockerfile | 20 --------------------
>  1 file changed, 20 deletions(-)
>  delete mode 100644 automation/build/suse/sles11sp4.dockerfile
> 
> diff --git a/automation/build/suse/sles11sp4.dockerfile b/automation/build/suse/sles11sp4.dockerfile
> deleted file mode 100644
> index ff69a99afc71..000000000000
> --- a/automation/build/suse/sles11sp4.dockerfile
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -FROM registry.gitlab.com/xen-project/xen/suse:sles11sp4-base
> -LABEL maintainer.name="The Xen Project" \
> -      maintainer.email="xen-devel@lists.xenproject.org"
> -
> -ENV USER root
> -
> -RUN mkdir /build
> -WORKDIR /build
> -
> -# Nothing else is needed -- base image already contain everything.
> -
> -# Note:
> -#
> -# SLES11 SP4 runs pre-2.13 glibc, which requires vsyscall support.  Most
> -# distros nowadays disable vsyscall. To run this container, the host needs to
> -# have vsyscall=emulate in its kernel command line.
> -#
> -# Due to various issues in SLES11 SP4, you might want to disable building
> -# certain components. Known *not bulding* components include OVMF, SEABIOS
> -# and upstream QEMU.
> -- 
> 2.25.1
> 

