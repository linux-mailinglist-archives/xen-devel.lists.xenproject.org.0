Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15184AF881F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 08:39:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032822.1406197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXa4G-0008Bk-Ra; Fri, 04 Jul 2025 06:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032822.1406197; Fri, 04 Jul 2025 06:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXa4G-00089y-Os; Fri, 04 Jul 2025 06:38:40 +0000
Received: by outflank-mailman (input) for mailman id 1032822;
 Fri, 04 Jul 2025 06:38:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q1XF=ZR=intel.com=xiaoyao.li@srs-se1.protection.inumbo.net>)
 id 1uXa4F-00089s-Id
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 06:38:39 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fa0174c-58a1-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 08:38:32 +0200 (CEST)
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 23:38:30 -0700
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1])
 ([10.124.247.1])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 23:38:24 -0700
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
X-Inumbo-ID: 7fa0174c-58a1-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751611112; x=1783147112;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bt+MTwmO3BdtCKtgNnE3EHY/qUg+x29ETWPNNozM6Uk=;
  b=jCrhNsyU4b6D7tnTjr248W06gb3N+rcSNNKk//lXnON1czpHU0ZmUsFA
   kaeQfyTTm9ikGVZYHYgggni3KdSlDfnpmVqf2V2Tj6wi7y+XLFzxT/1Bx
   /Azm1AdfRvcMzYi+5Mzfz2cx1tFnF5J12rMmPmMj/SQboH2q8eIswIobx
   lCHKA4hmb0v6VJ0cmwLXyVsCZQo3OZJahi+V8Bor/DMWLgiW788oe2vjR
   TJYCo3Jxk0itNgElT34B6VGEvcIlOPrTf1L+lX7sdM3HHSQvUCPnLbkAq
   O/TaJX7cHkSeXGPXN1TLuMCKe4ZA5s9Mqd6Tb4ZGOz6ETrC/Y9DF/0Fnk
   A==;
X-CSE-ConnectionGUID: WQXF953bTzSE7AwyUGp/OA==
X-CSE-MsgGUID: 7ySriLvrSFio2cBNR4HpUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53868353"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53868353"
X-CSE-ConnectionGUID: YnxIqBSgSI+gHjnXHTDRRA==
X-CSE-MsgGUID: sJO6J26bS56wxee9BAsRiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="159118769"
Message-ID: <e8d0edca-f79c-4d6c-b1a3-69ad506bf470@intel.com>
Date: Fri, 4 Jul 2025 14:38:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 28/39] accel: Expose and register
 generic_handle_interrupt()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250703173248.44995-1-philmd@linaro.org>
 <20250703173248.44995-29-philmd@linaro.org>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250703173248.44995-29-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/4/2025 1:32 AM, Philippe Mathieu-Daudé wrote:
> In order to dispatch over AccelOpsClass::handle_interrupt(),
> we need it always defined, 

It seems I can only understand it until I see the code to really require 
it to be mandatory.

But anyway, the change itself is correct.

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> not calling a hidden handler under
> the hood. Make AccelOpsClass::handle_interrupt() mandatory.
> Expose generic_handle_interrupt() prototype and register it
> for each accelerator.

