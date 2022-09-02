Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278BD5ABB25
	for <lists+xen-devel@lfdr.de>; Sat,  3 Sep 2022 01:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397981.638724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUG89-000787-Nq; Fri, 02 Sep 2022 23:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397981.638724; Fri, 02 Sep 2022 23:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUG89-000750-Ka; Fri, 02 Sep 2022 23:31:21 +0000
Received: by outflank-mailman (input) for mailman id 397981;
 Fri, 02 Sep 2022 23:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oUG88-00074s-Cy
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 23:31:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 582835ca-2b17-11ed-82f2-63bd783d45fa;
 Sat, 03 Sep 2022 01:31:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B45B161FCD;
 Fri,  2 Sep 2022 23:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2443CC433C1;
 Fri,  2 Sep 2022 23:31:16 +0000 (UTC)
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
X-Inumbo-ID: 582835ca-2b17-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662161476;
	bh=aGPtGfrss2v0h96EQ2/TiDm3KtRUOUN2TO3kyqHElxM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NwHOokM6VBGAOrzF0Ybkm71KCf7kSNoU+VfcK2OXMHvJfMqJHum/UdzW0GEBZowVb
	 ipESM7LFM5MXNxyqJ+sxllAfqD8E/7rIU6eQTfn62Wi/02PbpI0Y6teChwLo+s6ggx
	 UMOBYlBNiTSQWThExirxrIoc09aEMvEsVZhxYqNFbkbdnUIX3oBi4Xg/IihLb2l1Ph
	 Hk06PIAKk1HYPUBq4y7yQMu7dCn6EPhlFGPLcihW3MOJIWp9vMFdpK6FpkqyET29RO
	 1doPY6jIHqnGW3jSmb76OGMsEiRn/4rnbvFAnFsd1rQXGqKhtSVcuktxA5BPLDOZ3w
	 X06lkZ/QpxAmQ==
Date: Fri, 2 Sep 2022 16:31:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 00/10] xen/arm: smmuv3: Merge Linux fixes to Xen
In-Reply-To: <cover.1662123432.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209021630220.3931@ubuntu-linux-20-04-desktop>
References: <cover.1662123432.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I checked all the patches against the originals.

I had comments on patches 3,4,5.

You can add:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

to all the others (1,2,6,7,8,9,10).


On Fri, 2 Sep 2022, Rahul Singh wrote:
> This patch series merge the applicable Linux fixes to Xen.
> 
> Bixuan Cui (1):
>   xen/arm: smmuv3: Change *array into *const array
> 
> Christophe JAILLET (1):
>   xen/arm: smmuv3: Avoid open coded arithmetic in memory allocation
> 
> Gustavo A. R. Silva (1):
>   xen/arm: smmuv3: Fix fall-through warning for Clang
> 
> Jean-Philippe Brucker (2):
>   xen/arm: smmuv3: Fix endianness annotations
>   xen/arm: smmuv3: Move definitions to a header
> 
> Robin Murphy (1):
>   xen/arm: smmuv3: Remove the page 1 fixup
> 
> Zenghui Yu (2):
>   xen/arm: smmuv3: Fix l1 stream table size in the error message
>   xen/arm: smmuv3: Remove the unused fields for PREFETCH_CONFIG command
> 
> Zhen Lei (1):
>   xen/arm: smmuv3: Remove unnecessary oom message
> 
> Zhou Wang (1):
>   xen/arm: smmuv3: Ensure queue is read after updating prod pointer
> 
>  xen/arch/arm/include/asm/system.h     |   1 +
>  xen/drivers/passthrough/arm/smmu-v3.c | 742 ++------------------------
>  xen/drivers/passthrough/arm/smmu-v3.h | 672 +++++++++++++++++++++++
>  3 files changed, 708 insertions(+), 707 deletions(-)
>  create mode 100644 xen/drivers/passthrough/arm/smmu-v3.h
> 
> -- 
> 2.25.1
> 

