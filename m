Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F585931B2F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 21:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759245.1168880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTRaL-0003MU-W0; Mon, 15 Jul 2024 19:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759245.1168880; Mon, 15 Jul 2024 19:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTRaL-0003KT-Sq; Mon, 15 Jul 2024 19:42:09 +0000
Received: by outflank-mailman (input) for mailman id 759245;
 Mon, 15 Jul 2024 19:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ba80=OP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sTRaJ-0003KN-Hg
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 19:42:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fd4a680-42e2-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 21:42:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F1746124F;
 Mon, 15 Jul 2024 19:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34ADAC32782;
 Mon, 15 Jul 2024 19:42:02 +0000 (UTC)
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
X-Inumbo-ID: 4fd4a680-42e2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721072523;
	bh=9bL5aZ57i9PT8NneMLQUACh3VMswOuq80P3MfepiOi0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fkXUGyKlvE/ts/p6DL63Nx7YMQMb0zMelfRihZz59wSfl0uAakqaA1C7dVr1tK2ck
	 eDrth6TT9ZAVpiu9bO8yq0fLeiW+nzdgIT+5QpK2q8jNAb95NXs/r7OMKFb/AckzLq
	 uEU0nw+91uG+yJicC5zjl6CCuvvjbltJ018LMGEcKCPZwmi/nW0iyf3DygLsCG1CVn
	 QvO0pmr0Ulq5yVxHWxqbcDgjoHZd0W9xkpBO3b7MCIUfBA7Qh7ZRKdjMbhF+Ht4C1J
	 hzGxRlrKI5b/b3zlMu5BG448vKDMNdD2C01o2Ru0ftHuX9Dy5Bogo/bzfT+iYUOcJ3
	 rew6nLOGqQoKw==
Date: Mon, 15 Jul 2024 12:42:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.20] MAINTAINERS: Add me and Bertrand as device tree
 maintainers
In-Reply-To: <20240715093251.35371-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2407151241520.3635@ubuntu-linux-20-04-desktop>
References: <20240715093251.35371-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Jul 2024, Michal Orzel wrote:
> With Arm port being the major recipient of dt related patches and the
> future need of incorporating dt support into other ports, we'd like to
> keep an eye on these changes.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b0c8945270e..f47bdb33d510 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -293,6 +293,8 @@ F:	xen/common/sched/*cpupool.c
>  DEVICE TREE
>  M:	Stefano Stabellini <sstabellini@kernel.org>
>  M:	Julien Grall <julien@xen.org>
> +M:	Bertrand Marquis <bertrand.marquis@arm.com>
> +M:	Michal Orzel <michal.orzel@amd.com>
>  S:	Supported
>  F:	xen/common/libfdt/
>  F:	xen/common/device_tree.c
> -- 
> 2.25.1
> 

