Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420ECABE830
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 01:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991258.1375147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWan-0006nu-Hl; Tue, 20 May 2025 23:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991258.1375147; Tue, 20 May 2025 23:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWan-0006lb-F7; Tue, 20 May 2025 23:41:53 +0000
Received: by outflank-mailman (input) for mailman id 991258;
 Tue, 20 May 2025 23:41:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHWam-0006lV-6p
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 23:41:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff68b8d8-35d3-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 01:41:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DDDA85C12F1;
 Tue, 20 May 2025 23:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57320C4CEE9;
 Tue, 20 May 2025 23:41:46 +0000 (UTC)
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
X-Inumbo-ID: ff68b8d8-35d3-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747784507;
	bh=MX579Tdf97/V1Pojs7eQnGpeixxWF24nAwDy2zd5RZQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TX6VcSlL1n/u3CcCppaM+vSd2Rr5niJ7jMXMu0Qhn+a69uCkjoSufseWwQdfmQkVu
	 Xmr7ZS3/ZAN9bFSSYD4sDQSfi2VL1jaIP/J645eZfFVoIyNgWTR52M3i6F52z+511Y
	 XLrpQjcy80ZcllTCMfkgYkwYHlxkMIpugzIHFPGUNt4HGmh8WEogzSY/ynHRNA0Xp5
	 FCqa1nwyL2hcrHc5Bt8fPem1mWsu6+y9NAOja7zbVLU+zPbi2ybnO6jQvWMqail7VB
	 pf7D/+QyONzqG4jD5a0BtPYkD+/wyJ7nErb++9RUC/+weMOJbAxOAtQX3t+Y1nGmzC
	 dG/gziooj5FkA==
Date: Tue, 20 May 2025 16:41:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Daniel Smith <dpsmith@apertussolutions.com>, 
    Rich Persaud <persaur@gmail.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: include Argo documentation in the ARGO
 section
In-Reply-To: <20250520233220.868258-1-christopher.w.clark@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505201641250.2019926@ubuntu-linux-20-04-desktop>
References: <20250520233220.868258-1-christopher.w.clark@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 May 2025, Christopher Clark wrote:
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c11b82eca9..e7198363c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -226,6 +226,7 @@ S:	Maintained
>  F:	xen/include/public/argo.h
>  F:	xen/include/xen/argo.h
>  F:	xen/common/argo.c
> +F:	docs/designs/argo.pandoc
>  
>  ARINC653 SCHEDULER
>  M:	Nathan Studer <nathan.studer@dornerworks.com>
> -- 
> 2.25.1
> 

