Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C23AF87CC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 08:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032780.1406177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXZjL-0004kr-T5; Fri, 04 Jul 2025 06:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032780.1406177; Fri, 04 Jul 2025 06:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXZjL-0004iY-QJ; Fri, 04 Jul 2025 06:17:03 +0000
Received: by outflank-mailman (input) for mailman id 1032780;
 Fri, 04 Jul 2025 06:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q1XF=ZR=intel.com=xiaoyao.li@srs-se1.protection.inumbo.net>)
 id 1uXZjJ-0004iS-Tl
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 06:17:02 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aee0e36-589e-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 08:16:55 +0200 (CEST)
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 23:16:53 -0700
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1])
 ([10.124.247.1])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 23:16:49 -0700
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
X-Inumbo-ID: 7aee0e36-589e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751609816; x=1783145816;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mVgXI6icJ90KFIj7OIpkJwZH1XV8ZS47Po97WDq7RNw=;
  b=eCt+DGcUV23pUMqFEOGEozM2p8h6DIjszeZ2+Py32gYxmbof53TtoXC6
   N/Ji2zBse0y87v+tqIPcXpVJmg0fAmItaJW6WGaA4C4tRxcWFAlj38R5A
   sjRXRYVxU2BkFoTaYw/qbzohAFmeHumJsvN3SV8fRQLyvDI3KjRbCXbSR
   GsNPqDQHSTpjJaTpvza4ctpxVLDfjyRtvIl2U8d0WsAOxOuez3OpADHwY
   s6KyfXioYXmp14JbW/+eoMrzERFixCtD7joTjFqGtl/fIxcwV4p1IA3br
   RhJfcqNZS4LMJ9FyWmO0nHht4uxykr5FfjOh1dm8KqOxI5vRMppux0VtS
   w==;
X-CSE-ConnectionGUID: +u9j2M9FSia6NE6H6HKj0A==
X-CSE-MsgGUID: DuRUNKnaQ8eS4nxnTsP0KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57716454"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="57716454"
X-CSE-ConnectionGUID: sHQ7N81RQ1aH/p1rrnZxkw==
X-CSE-MsgGUID: KNNtt0yvTieUd3Dt726i2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="160245769"
Message-ID: <961e70c9-cd6b-47b0-b262-5b56f1ab01e9@intel.com>
Date: Fri, 4 Jul 2025 14:16:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 26/39] accel/dummy: Extract 'dummy-cpus.h' header from
 'system/cpus.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20250703173248.44995-1-philmd@linaro.org>
 <20250703173248.44995-27-philmd@linaro.org>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250703173248.44995-27-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/4/2025 1:32 AM, Philippe Mathieu-Daudé wrote:
> 'dummy' helpers are specific to accelerator implementations,
> no need to expose them via "system/cpus.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

