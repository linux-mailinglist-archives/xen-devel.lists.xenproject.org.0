Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B3260206A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 03:27:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424680.672305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okbNy-0005f8-Qs; Tue, 18 Oct 2022 01:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424680.672305; Tue, 18 Oct 2022 01:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okbNy-0005d7-NF; Tue, 18 Oct 2022 01:27:14 +0000
Received: by outflank-mailman (input) for mailman id 424680;
 Tue, 18 Oct 2022 01:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9K0G=2T=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1okbNx-0004pN-9Z
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 01:27:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd96251b-4e83-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 03:27:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 57B93B81BE1;
 Tue, 18 Oct 2022 01:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592C8C433D6;
 Tue, 18 Oct 2022 01:27:09 +0000 (UTC)
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
X-Inumbo-ID: fd96251b-4e83-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666056430;
	bh=d/uyL4nUXrAWbDTy+W/35i9Dy1kXM9XMBqMFwfsxsik=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rIBmP2ZhAsbyxTd/tTY9SjVpt5tYxVDpsnS5VVIc/Qx+T/P4iIvH42DKU7qNNewjq
	 ZJB1F5y20Hm/yM/q9klK3+d9CuY1yhuBm6rvvQHrbJ9+cBYpOFrIFeFBkStnjrCjuR
	 JYjCYIdkyYcfqUF6NnAZbDa+48NmPUnYDiAjCC/fZYLNu/S6v3tSZ3d1yMZCCWetWY
	 EG6q3DERC5ZpSYQCIB2L0zk5Lp0ZsOFC83lffbmkZ2DalpE7Wqy7nW4CTivCjD3m77
	 xBsuVCOkfwMKpkR9q1pTMgOXvxrrzuuoXaTA07NvDEyJijxuBYpVRKXMwCMBHq5O/q
	 1Fy/JtHu86LOg==
Date: Mon, 17 Oct 2022 18:27:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 0/3] Yocto Gitlab CI
In-Reply-To: <7DE7B34C-F6BD-42D9-83A3-AAA3A6A35B62@arm.com>
Message-ID: <alpine.DEB.2.22.394.2210171651250.4587@ubuntu-linux-20-04-desktop>
References: <cover.1665561024.git.bertrand.marquis@arm.com> <alpine.DEB.2.22.394.2210141325240.3690179@ubuntu-linux-20-04-desktop> <7DE7B34C-F6BD-42D9-83A3-AAA3A6A35B62@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Oct 2022, Bertrand Marquis wrote:
> Hi Stefano,
> 
> > On 14 Oct 2022, at 21:27, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Wed, 12 Oct 2022, Bertrand Marquis wrote:
> >> This patch series is a first attempt to check if we could use Yocto in
> >> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
> >> 
> >> The first patch is creating a container with all elements required to
> >> build Yocto, a checkout of the yocto layers required and an helper
> >> script to build and run xen on qemu with yocto.
> >> 
> >> The second patch is creating containers with a first build of yocto done
> >> so that susbsequent build with those containers would only rebuild what
> >> was changed and take the rest from the cache.
> >> 
> >> The third patch is adding a way to easily clean locally created
> >> containers.
> >> 
> >> This is is mainly for discussion and sharing as there are still some
> >> issues/problem to solve:
> >> - building the qemu* containers can take several hours depending on the
> >>  network bandwith and computing power of the machine where those are
> >>  created
> >> - produced containers containing the cache have a size between 8 and
> >>  12GB depending on the architecture. We might need to store the build
> >>  cache somewhere else to reduce the size. If we choose to have one
> >>  single image, the needed size is around 20GB and we need up to 40GB
> >>  during the build, which is why I splitted them.
> >> - during the build and run, we use a bit more then 20GB of disk which is
> >>  over the allowed size in gitlab
> >> 
> >> Once all problems passed, this can be used to build and run dom0 on qemu
> >> with a modified Xen on the 3 archs in less than 10 minutes.
> > 
> > The build still doesn't work for me. I found the reason:
> > 
> >  create archive failed: cpio: write failed - Cannot allocate memory
> > 
> > It is a "silly" out of memory error. I tried to solve the problem by
> > adding:
> > 
> >  export RPM_BUILD_NCPUS=8
> > 
> > at the beginning of build-yocto.sh but it didn't work. I realize that
> > this error might be considered a workstation configuration error at my
> > end but I cannot find a way past it. Any suggestions?
> 
> 
> Can you give me more details on when this is happening ? Ie the full logs.
> 
> Can you try to apply the following:
> --- a/automation/build/yocto/build-yocto.sh
> +++ b/automation/build/yocto/build-yocto.sh
> @@ -107,6 +107,9 @@ IMAGE_INSTALL:append:pn-xen-image-minimal = " ssh-pregen-hostkeys"
>  # Save some disk space
>  INHERIT += "rm_work"
> 
> +# Reduce number of jobs
> +BB_NUMBER_THREADS=2
> +
>  EOF
> 
>      if [ "${do_localsrc}" = "y" ]; then
> 
> This should reduce the number of parallel jobs during Yocto build.

It should be

BB_NUMBER_THREADS="2"

but that worked! Let me a couple of more tests.

