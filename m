Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E595FE600
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 01:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422423.668429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj85w-0002ap-MJ; Thu, 13 Oct 2022 23:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422423.668429; Thu, 13 Oct 2022 23:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj85w-0002Xw-Ja; Thu, 13 Oct 2022 23:58:32 +0000
Received: by outflank-mailman (input) for mailman id 422423;
 Thu, 13 Oct 2022 23:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8Z/=2O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oj85u-0002Xk-AI
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 23:58:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee89d6bb-4b52-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 01:58:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AE1661988;
 Thu, 13 Oct 2022 23:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F99C43470;
 Thu, 13 Oct 2022 23:58:25 +0000 (UTC)
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
X-Inumbo-ID: ee89d6bb-4b52-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665705506;
	bh=X+5mTGaWSkKspZ2p1yeZgonBVH4jAhn1p5y/6rzvMwI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SyEZOdyZfrBeot/kQ5eK4zADFZME2aw5B/s6s2zycdEv0flvPla7Sq3/W1he7qTU3
	 7rE9yY/GTa5YrYZ4VuCLNpjhFvY7gFwDdA915NOmbWuZ5lhGWrpViRRYjGHodceCkX
	 oMUVTuF9TAltN3QnJ6qqHTj+FDa0UyciQxF089qyr8fdJO2VBhqOL4dooeMu3jdYsX
	 QoLtlr8x/qdio+MdM2I5Vzc0AMv7lz8GiRAeni1pEZpje/3VFTk7uYJbuGWpEXFlv8
	 1gIiawDteMoWY+D1dGXaRtSw3/dPy4SE/WPKp2D+im1wt9JBFuKYjHYq3KdSqBTMWh
	 Ug2KQq3n4yZ6Q==
Date: Thu, 13 Oct 2022 16:58:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.17 1/2] docs: Document the minimal requirement of
 static heap
In-Reply-To: <20221013025722.48802-2-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2210131658150.3690179@ubuntu-linux-20-04-desktop>
References: <20221013025722.48802-1-Henry.Wang@arm.com> <20221013025722.48802-2-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Oct 2022, Henry Wang wrote:
> The static heap feature requires user to know the minimal size of
> heap to make sure the system can work. Since the heap controlled
> by Xen is intended to provide memory for the whole system, not only
> the boot time memory allocation should be covered by the static
> heap region, but also the runtime allocation should be covered.
> 
> The main source of runtime allocation is the memory for the P2M.
> Currently, from XSA-409, the P2M memory is bounded by the P2M pool.
> So make this part as the minimal requirement of static heap. The
> amount of memory allocated after all the guests have been created
> should be quite limited and mostly predictable.
> 
> This commit adds documentation that explains how a user can size the
> static heap region.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
>  docs/misc/arm/device-tree/booting.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 87eaa3e254..046f28ce31 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -531,6 +531,13 @@ Below is an example on how to specify the static heap in device tree:
>  RAM starting from the host physical address 0x30000000 of 1GB size will
>  be reserved as static heap.
>  
> +Users should be mindful that the static heap should at least satisfy the
> +allocation of the P2M maps for all guests. Currently, the minimal requirement
> +of per-domain P2M pages pool is in-sync with function
> +libxl__get_required_paging_memory() (for xl-created domUs) and
> +domain_p2m_pages() (for dom0less domUs), that is, 1MB per vCPU, plus 4KiB per
> +MiB of RAM for the P2M map, and plus 512KiB to cover extended regions.
> +
>  Static Shared Memory
>  ====================
>  
> -- 
> 2.17.1
> 

