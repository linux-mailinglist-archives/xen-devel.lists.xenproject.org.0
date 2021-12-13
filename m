Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B247369D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 22:38:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246315.424784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwt1Y-0000D5-6N; Mon, 13 Dec 2021 21:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246315.424784; Mon, 13 Dec 2021 21:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwt1Y-00009m-2h; Mon, 13 Dec 2021 21:38:20 +0000
Received: by outflank-mailman (input) for mailman id 246315;
 Mon, 13 Dec 2021 21:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6XJ=Q6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mwt1X-00009g-0Q
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 21:38:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb2be206-5c5c-11ec-85d3-df6b77346a89;
 Mon, 13 Dec 2021 22:38:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B17A3B815C6;
 Mon, 13 Dec 2021 21:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35315C34600;
 Mon, 13 Dec 2021 21:38:14 +0000 (UTC)
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
X-Inumbo-ID: fb2be206-5c5c-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639431494;
	bh=vbVv8bv33hlXicn8w2PRzVbOWmmZ1tS837zrDbSvNlU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uivK7tmtyhf52O3HplxKIGBWlIOEq9JH9bIF1QAihq+h/icb8T8U8kshDAy/UW3r3
	 03xb/oVHOz4mskz6JrwNBN8zvqLakkjcxiW6m3Xj38/+0zPwWq+e5zIe5c+2PXLHED
	 +utSOm+7zAKS0wZh8elO5zQ6TWWozIVSJhIRohgcqainU6k85xENoDZr6j3gIaIS8Z
	 YWmU/ANyRfXxKhQS6g5Orr6hOx1K6/PLN2LILxG4lwRLMVPkLOCE2AvxF3GmgXL1Rs
	 zMLMklGvtL/U1wPV9PA7ShFO6YX+bY8/acOifWqsO02VXzqkC8VUr28k4pjd6TpLY/
	 WH6SSWVu6zh8Q==
Date: Mon, 13 Dec 2021 13:38:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: increase memory banks number define value
In-Reply-To: <20211213114823.25570-1-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2112131337570.3376@ubuntu-linux-20-04-desktop>
References: <20211213114823.25570-1-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Dec 2021, Luca Fancellu wrote:
> Currently the maximum number of memory banks (NR_MEM_BANKS define)
> is fixed to 128, but on some new platforms that have a large amount
> of memory, this value is not enough and prevents Xen from booting.
> 
> Increase the value to 256.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/asm-arm/setup.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index 95da0b7ab9cd..07daf160dc57 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -6,7 +6,7 @@
>  #define MIN_FDT_ALIGN 8
>  #define MAX_FDT_SIZE SZ_2M
>  
> -#define NR_MEM_BANKS 128
> +#define NR_MEM_BANKS 256
>  
>  #define MAX_MODULES 32 /* Current maximum useful modules */
>  
> -- 
> 2.17.1
> 

