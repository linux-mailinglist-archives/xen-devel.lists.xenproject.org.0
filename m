Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BA2AC98AB
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001740.1381865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAMS-0006O4-Q5; Sat, 31 May 2025 00:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001740.1381865; Sat, 31 May 2025 00:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAMS-0006ME-N8; Sat, 31 May 2025 00:46:08 +0000
Received: by outflank-mailman (input) for mailman id 1001740;
 Sat, 31 May 2025 00:46:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLAMR-0006M8-Fy
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:46:07 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a252af35-3db8-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 02:46:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D747249DED;
 Sat, 31 May 2025 00:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F063C4CEE9;
 Sat, 31 May 2025 00:46:03 +0000 (UTC)
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
X-Inumbo-ID: a252af35-3db8-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748652364;
	bh=TbgV/uLEazFwiiFQt4Y22FwHCaX7WaJCc8bDWGiJsiA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p0HkwV9d7mMWafZsR6loRuPOpv4bssRdJJaRwM6C6AVNTqxBAZ23NPgdvg3tkp7Mt
	 wssywcQhGU00gHUEmUaX4lL36AIjMPrVySUqYcC7/v8hu51RjOgQ/r7sOUvP602Cce
	 Ts1LnS0SnQ0i25c+SJzhJpRQP4dgcrE7nmuPG/R+74Iu90h4U6YUGoU61gVAFuE6jP
	 x7JOZYijA0NiQDrfDjjhKVGTGWPW3EKExhvBRCFc59B2EQgE2f5oaHAybuLESydcl7
	 avvDqDMW4XEz86ZjF+5P/Mmy9qT2zBgLALaArSZcJCUQgV/HTtfq4KKSKYtTDhvdif
	 GPtPc/tz8dTMw==
Date: Fri, 30 May 2025 17:46:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 04/19] xen: Add missing forward declaration to 
 btcpupools_get_domain_pool_id
In-Reply-To: <20250530120242.39398-5-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301744040.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-5-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> And remove the ifdef guard, as it's inconsequential.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/include/xen/sched.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 559d201e0c..b5a6a22c7f 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1291,15 +1291,15 @@ static inline unsigned int btcpupools_get_cpupool_id(unsigned int cpu)
>  {
>      return 0;
>  }
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +
> +struct dt_device_node;
> +
>  static inline int
>  btcpupools_get_domain_pool_id(const struct dt_device_node *node)
>  {
>      return 0;
>  }
> -#endif
> -
> -#endif
> +#endif /* !CONFIG_BOOT_TIME_CPUPOOLS */

Usually the commend would just be /* CONFIG_BOOT_TIME_CPUPOOLS */
without the !

Other than that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  #endif /* __SCHED_H__ */
>  
> -- 
> 2.43.0
> 

