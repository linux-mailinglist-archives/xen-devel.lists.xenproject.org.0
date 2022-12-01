Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94B763F990
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 22:11:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451183.708816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0qpU-0004PA-LU; Thu, 01 Dec 2022 21:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451183.708816; Thu, 01 Dec 2022 21:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0qpU-0004ML-Il; Thu, 01 Dec 2022 21:10:48 +0000
Received: by outflank-mailman (input) for mailman id 451183;
 Thu, 01 Dec 2022 21:10:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DAsL=37=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p0qpT-0004Lw-Eo
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 21:10:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f2496e5-71bc-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 22:10:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50C3362121;
 Thu,  1 Dec 2022 21:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09495C433C1;
 Thu,  1 Dec 2022 21:10:43 +0000 (UTC)
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
X-Inumbo-ID: 9f2496e5-71bc-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669929044;
	bh=FF+O9d5Fs7QyG/1MHiZ7t8X5YeoZcrPN86XbZS7Qc1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pdhyA4vdK+LZ+WmrrC8ETBWnHxgmSBci/DX93h8LeD0jB/jOg5KLxszYAKIx3r+7u
	 pymn8XlBr/XiOTrVjgWNl4/IN+EgvvYvFYVw58pO1UtV1B/fiCrg8HsAnC2BUgazfS
	 48jO8LdDOc7WOkOMwas4xxW6KkTmeA5O0oIyM7GuxCy2ABHW9NytsPJqhnXPOLoGIm
	 fW53GDEm/rWcMEpfPvde9CGw6m6oLdHBTIJf5ESGLPRXW1y4ryy9BYdTgkn+CPoKer
	 d6CBAuhy1at8xu96ceuJI2zSU6W+hBBoX0mdbhO0mDPyVVtDmCquoNDos0chZmx18X
	 HvF5BNTs5Cycw==
Date: Thu, 1 Dec 2022 13:10:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 2/3] automation: Add a clean rule for containers
In-Reply-To: <b802d2523af791acfdb68b6f8603ff2f0f8573d6.1669904508.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2212011310350.4039@ubuntu-linux-20-04-desktop>
References: <cover.1669904508.git.bertrand.marquis@arm.com> <b802d2523af791acfdb68b6f8603ff2f0f8573d6.1669904508.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Dec 2022, Bertrand Marquis wrote:
> Add make clean support to remove the containers from the local docker
> registry.
> make clean-<image_name> must be called to remove an image:
> make clean-yocto/kirkstone-qemuarm: remove yocto kirkstone for qemuarm
> image
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v6:
> - Rework clean rule to prevent calling docker during make parsing
> Changes in v5:
> - remove cleaning of all images using make clean
> Changes in v4:
> - also generate clean rule for CONTAINERS_EXTRA
> Changes in v3:
> - none
> Changes in v2:
> - none
> Changes in v1:
> - patch added
> ---
>  automation/build/Makefile | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/automation/build/Makefile b/automation/build/Makefile
> index c4aaa747ffdf..f1d56ce532a1 100644
> --- a/automation/build/Makefile
> +++ b/automation/build/Makefile
> @@ -28,3 +28,13 @@ all: $(CONTAINERS)
>  clean:
>  	rm -f yocto/*.dockerfile
>  
> +define CLEAN_RULE
> +.PHONY: clean-$(1)
> +clean-$(1):
> +	if [ -n "$$$$(docker image ls -q $(REGISTRY)/$(subst /,:,$(1)))" ]; then \
> +		docker image rm $(REGISTRY)/$(subst /,:,$(1)); \
> +	fi
> +
> +endef
> +
> +$(eval $(foreach img,$(CONTAINERS) $(CONTAINERS_EXTRA),$(call CLEAN_RULE,$(img))))
> -- 
> 2.25.1
> 

