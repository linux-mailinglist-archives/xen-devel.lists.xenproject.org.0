Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83759955CE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 19:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813402.1226330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syE90-00070q-OA; Tue, 08 Oct 2024 17:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813402.1226330; Tue, 08 Oct 2024 17:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syE90-0006yY-L2; Tue, 08 Oct 2024 17:37:10 +0000
Received: by outflank-mailman (input) for mailman id 813402;
 Tue, 08 Oct 2024 17:37:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GrDf=RE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1syE8y-0006uQ-WA
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 17:37:09 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efcafd3a-859b-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 19:37:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E15F6A41D8F;
 Tue,  8 Oct 2024 17:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E12C4CEC7;
 Tue,  8 Oct 2024 17:37:04 +0000 (UTC)
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
X-Inumbo-ID: efcafd3a-859b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728409025;
	bh=1vCQ8JYnJpIoFENosyH4UFUYPbmXrBn+CDGEJ8u6qiI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pE7GRP7Kw6W5djOIYssEgkqbe5TcaPlb3mQzDf4zERRB7iPdFqZhhtWPKYJcpoTJ4
	 wnDPCuIC97mWpogAl/bnImnbT0bq2kBUy9bxS+358/csOGj1KfnYlhGvW+/0ZNVUYb
	 uLVPuE29uPGOLquk1JcUQzO6nlDaSGg2jB2PWTSywrty/Af543tD5VwKp+BeW5bj2t
	 oM0wy4YzGjJWPP7BbISHY5mCecoAQqbPytXJGxBpA5czM3Xx/WMvEuJVLAfC1BJm/1
	 ObAPr8cR/f1gl/0tXn/O7S9VS0Z9VdpBZhs186Kv72wMWruLXlBEd1vMlSS5wuLDVz
	 bDDdiAWP9L1pg==
Date: Tue, 8 Oct 2024 10:37:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, volodymyr_babchuk@epam.com
Subject: Re: [PATCH] MAINTAINERS: add myself as maintainer for arm tee
In-Reply-To: <e853549e25d26264e1a470336a98c48d22b799eb.1728395637.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2410081036320.12382@ubuntu-linux-20-04-desktop>
References: <e853549e25d26264e1a470336a98c48d22b799eb.1728395637.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+ Volodymyr


On Tue, 8 Oct 2024, Bertrand Marquis wrote:
> With Tee mediators now containing Optee and FF-A implementations, add
> myself as maintainers to have someone handling the FF-A side.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb0ebf093965..2450b0f9ff9e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -516,6 +516,7 @@ F:	stubdom/
>  
>  TEE MEDIATORS
>  M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> +M:	Bertrand Marquis <bertrand.marquis@arm.com>
>  S:	Supported
>  F:	xen/arch/arm/include/asm/tee
>  F:	xen/arch/arm/tee/
> -- 
> 2.47.0
> 

