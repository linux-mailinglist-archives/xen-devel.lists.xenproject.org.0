Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76E772E86
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 21:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578890.906629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5bL-0006ff-Oc; Mon, 07 Aug 2023 19:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578890.906629; Mon, 07 Aug 2023 19:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5bL-0006dB-LV; Mon, 07 Aug 2023 19:09:11 +0000
Received: by outflank-mailman (input) for mailman id 578890;
 Mon, 07 Aug 2023 19:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aC6Z=DY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qT5bJ-0006d5-Te
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 19:09:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1ff387e-3555-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 21:09:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFEE562158;
 Mon,  7 Aug 2023 19:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8C6C433C8;
 Mon,  7 Aug 2023 19:09:05 +0000 (UTC)
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
X-Inumbo-ID: e1ff387e-3555-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691435346;
	bh=OONUMkr4pVyrRDkANbDJUrnv0+TbQpEMBqD0Z2FV+QE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n14AHqm9p1twSr0CYxqj+WcYmP8534oKOR7SiwtESg7WNqZy5+JZfkwyf35wSsOdM
	 8yY/a9eJiW9mOakR/FWOw4ZS9QLP8SUMFWkJBRdLOJHfGPP+m1Ok8EVEEsKOMKzUNJ
	 OR7hqo7pUF0vPiNRQk8DbF5ItR4DmCVqBvyD0/fZf2NIeh/Ckzs0cOMdFOMBkNsTaN
	 4UQyJTqoK5PiOxsQAbsrC1le0ORsR8KeCo49VSHhtlD92RQqscR25pFrSY2KRnDz4j
	 RR4H53FIZo+40INvXVk06ekskUFM6dsGiotkJilCm6Ls8l7KWUlgPVHZyMU5oJa6nw
	 //FC+VezkdRYQ==
Date: Mon, 7 Aug 2023 12:09:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Simone Ballarin <simone.ballarin@bugseng.com>
Subject: Re: [PATCH] automation: Advertise that ECLAIR jobs do not need
 prerequisites
In-Reply-To: <20230807134122.10878-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2308071208550.2127516@ubuntu-linux-20-04-desktop>
References: <20230807134122.10878-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Aug 2023, Michal Orzel wrote:
> While not required today (ECLAIR jobs come first), add "needs: []" for
> future-proofing and consistency with other jobs in the pipeline.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/analyze.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 3325ef9d9a44..4aa4abe2ee18 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -18,6 +18,7 @@
>        - '*.log'
>      reports:
>        codequality: gl-code-quality-report.json
> +  needs: []
>  
>  eclair-x86_64:
>    extends: .eclair-analysis
> -- 
> 2.25.1
> 

