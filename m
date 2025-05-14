Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC31AB6221
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 07:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983742.1369934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF4Ow-0000eN-TZ; Wed, 14 May 2025 05:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983742.1369934; Wed, 14 May 2025 05:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF4Ow-0000bQ-QJ; Wed, 14 May 2025 05:11:30 +0000
Received: by outflank-mailman (input) for mailman id 983742;
 Wed, 14 May 2025 05:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4At=X6=intel.com=xiaoyao.li@srs-se1.protection.inumbo.net>)
 id 1uF4Ov-0000bK-0x
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 05:11:29 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e13a3623-3081-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 07:11:25 +0200 (CEST)
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:11:23 -0700
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1])
 ([10.124.247.1])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:11:20 -0700
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
X-Inumbo-ID: e13a3623-3081-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747199485; x=1778735485;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UNNz5FIvJ/cXIxaiZEfi5bWCBZhv2ZCY4UIp4PhuOTU=;
  b=P0DPscn/PNCS3PSA7ljNjYDlXnQbQKfkhWi3b7kdc1swEMWoFI/wVpkw
   J8oGDqgDp6e8E6x0uZ/apsEFHhBLmP9gOr4OkglierICBdMV56KZJbvC/
   raCz6KTmt+FZjibJzJ0g9UOr/reC+ZElqw/kEML7f+YMlAajuo7JmQYGH
   wASgj0RjA91Euwfw0YFdE9689QkDQyLbxED9Rf4EAyEqyQyndO8C08q3y
   A4vCy0DlJxJI0Z+Y9Xdn5yxpgiEbY/pgJhaZq7kXbq5BmSOjwUsxX69oM
   frDbjAyAonXANfd6Scc4Zx+fbSpnAziTsOtqApLgezJZDC7wRSFguopcN
   g==;
X-CSE-ConnectionGUID: ujqEeHr4Rc+qECGRqw7eZQ==
X-CSE-MsgGUID: E6wUJWGsTN2g3v2Mm6O21A==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="74477111"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="74477111"
X-CSE-ConnectionGUID: JIMf2Mp5SKqc1Xeo6bCBcw==
X-CSE-MsgGUID: oRVSeXRaSpWBlNMRE3ptkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="161221528"
Message-ID: <ae482293-80a0-4b94-9c34-4a8d5ce18b49@intel.com>
Date: Wed, 14 May 2025 13:11:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen/arch_hvm: Unify x86 and ARM variants
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250513171737.74386-1-philmd@linaro.org>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250513171737.74386-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/14/2025 1:17 AM, Philippe Mathieu-Daudé wrote:
> As each target declares the same prototypes, we can
> use a single header, removing the TARGET_XXX uses.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
...
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 4b26bcff7a5..1a9eeb01c8e 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -10,7 +10,6 @@
>   #include "hw/boards.h"
>   #include "system/system.h"
>   #include "hw/xen/xen-pvh-common.h"
> -#include "hw/xen/arch_hvm.h"
>   
>   #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>   

This chunk seems unrelated.

