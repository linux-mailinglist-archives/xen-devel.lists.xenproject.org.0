Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39C3B06284
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 17:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044492.1414580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubhK8-0001XV-4X; Tue, 15 Jul 2025 15:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044492.1414580; Tue, 15 Jul 2025 15:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubhK8-0001VG-1K; Tue, 15 Jul 2025 15:12:04 +0000
Received: by outflank-mailman (input) for mailman id 1044492;
 Tue, 15 Jul 2025 15:12:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pf57=Z4=intel.com=dave.jiang@srs-se1.protection.inumbo.net>)
 id 1ubhK6-0001VA-Td
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 15:12:03 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ac6717d-618e-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 17:11:56 +0200 (CEST)
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:09:24 -0700
Received: from tcingleb-desk1.amr.corp.intel.com (HELO [10.125.111.148])
 ([10.125.111.148])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:09:19 -0700
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
X-Inumbo-ID: 0ac6717d-618e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752592317; x=1784128317;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GT9YCMpmO/oGbAXwtofhY5F7e46WJk2TBT21YGNxioQ=;
  b=OFNUlwT+r0s0jbRga+7/ZrNFTrwJ19YGy/MGn8rqb7/slyVDwIlu9tfi
   qUYvFYJdVmx+v0t2sy/WaVUayIyH36/M9tpFWLFhXPbwmskjI4ws7IPXh
   5h9v7JPtpMnXkX7Zix9jgrKO7mbAOqKCkOwKZeOuwMttxy7KBx4JT73Gp
   d58ict3CGxL259+s6DWNW68fPolALzohr1V/i/XGSy2oqUlOSrLYdrsdZ
   iF5sfTsbA3JeAI/7nwvlNVJoFMo39RWbj5lIE4cVpBiTZunY2/P3bwHQ7
   GhfClBpj8B/XLMP0lL+07fssO/18OYif36Cijobs1kc1uJlwIWNhxrSFh
   g==;
X-CSE-ConnectionGUID: /DlR8bXXRe+ezYoHpeJjQA==
X-CSE-MsgGUID: m6Zt778fSHimpoTRJNxPuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54907819"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54907819"
X-CSE-ConnectionGUID: kRlxMx3/SPu8BGSVLj+Ezg==
X-CSE-MsgGUID: VgyJUB25RxeWdk6pmX7cWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157354678"
Message-ID: <841e6d14-e3cc-4c23-9256-96f0c4e2d761@intel.com>
Date: Tue, 15 Jul 2025 08:09:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] cxl: mce: Fix typo "notifer"
To: WangYuli <wangyuli@uniontech.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, alison.schofield@intel.com,
 andrew+netdev@lunn.ch, andriy.shevchenko@linux.intel.com,
 arend.vanspriel@broadcom.com, bp@alien8.de,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 colin.i.king@gmail.com, cvam0000@gmail.com, dan.j.williams@intel.com,
 dave.hansen@linux.intel.com, dave@stgolabs.net, davem@davemloft.net,
 dri-devel@lists.freedesktop.org, edumazet@google.com,
 gregkh@linuxfoundation.org, guanwentao@uniontech.com, hpa@zytor.com,
 ilpo.jarvinen@linux.intel.com, intel-xe@lists.freedesktop.org,
 ira.weiny@intel.com, j@jannau.net, jeff.johnson@oss.qualcomm.com,
 jgross@suse.com, jirislaby@kernel.org, johannes.berg@intel.com,
 jonathan.cameron@huawei.com, kuba@kernel.org, kvalo@kernel.org,
 kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@treblig.org, lucas.demarchi@intel.com,
 marcin.s.wojtas@gmail.com, ming.li@zohomail.com, mingo@kernel.org,
 mingo@redhat.com, netdev@vger.kernel.org, niecheng1@uniontech.com,
 oleksandr_tyshchenko@epam.com, pabeni@redhat.com, pbonzini@redhat.com,
 quic_ramess@quicinc.com, ragazenta@gmail.com, rodrigo.vivi@intel.com,
 seanjc@google.com, shenlichuan@vivo.com, simona@ffwll.ch,
 sstabellini@kernel.org, tglx@linutronix.de,
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com, x86@kernel.org,
 xen-devel@lists.xenproject.org, yujiaoliang@vivo.com, zhanjun@uniontech.com
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <65FC7B96ECBDB052+20250715134407.540483-2-wangyuli@uniontech.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <65FC7B96ECBDB052+20250715134407.540483-2-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/15/25 6:44 AM, WangYuli wrote:
> According to the context, "mce_notifer" should be "mce_notifier".
> 
> Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
> Fixes: 516e5bd0b6bf ("cxl: Add mce notifier to emit aliased address for extended linear cache")
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  drivers/cxl/core/mce.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cxl/core/mce.h b/drivers/cxl/core/mce.h
> index ace73424eeb6..ca272e8db6c7 100644
> --- a/drivers/cxl/core/mce.h
> +++ b/drivers/cxl/core/mce.h
> @@ -7,7 +7,7 @@
>  
>  #ifdef CONFIG_CXL_MCE
>  int devm_cxl_register_mce_notifier(struct device *dev,
> -				   struct notifier_block *mce_notifer);
> +				   struct notifier_block *mce_notifier);
>  #else
>  static inline int
>  devm_cxl_register_mce_notifier(struct device *dev,


