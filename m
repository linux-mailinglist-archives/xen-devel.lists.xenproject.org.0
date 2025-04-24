Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3550DA9A47A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 09:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965937.1356314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7rFv-0005ly-41; Thu, 24 Apr 2025 07:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965937.1356314; Thu, 24 Apr 2025 07:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7rFv-0005jd-1Q; Thu, 24 Apr 2025 07:44:23 +0000
Received: by outflank-mailman (input) for mailman id 965937;
 Thu, 24 Apr 2025 07:44:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkPj=XK=linux.intel.com=dapeng1.mi@srs-se1.protection.inumbo.net>)
 id 1u7rFt-0005jW-3d
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 07:44:21 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eccb3249-20df-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 09:44:18 +0200 (CEST)
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:44:16 -0700
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.128])
 ([10.124.245.128])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:43:59 -0700
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
X-Inumbo-ID: eccb3249-20df-11f0-9eb1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745480659; x=1777016659;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VnZ0ZKETltelPggcEVrc3mWHY8TQu/tmfh9OEL4vmMI=;
  b=mdShgoTrla7KC8hEZsGlbhj8X/nFY7gUsqh8qDcmvDFVhJxVxefTZdbk
   GDX4OPjRNjb3MNsNzYIZgh80ed4mPXW8gJ3ZKiGKvW1pU7jEOh0/6qUIR
   0BQUg6xaZ7DzuEhm2xC1l3OrOSbHDMTb6pmoTmDLdQii65/kyoZs9kjKh
   VcYjikmKOmRFPxnd5zQprjobghxKFgJ1vozcN8TXSzwd8SGZ9MpA3Neh1
   HxMqrM8v90KV307ETIM6dRYQh7wjU+jnrp4UZbqp+7mFR0tMvWfwSXxdO
   To5a58XC6o/GP6R/e74r3iI2LIM2QoluS4hpGoxZfDGjL8Az+sXZpazx5
   A==;
X-CSE-ConnectionGUID: 2QuWcQJjSxmuny76cvpgyg==
X-CSE-MsgGUID: XXix71nJTT+DXb42lUmjJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57741529"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="57741529"
X-CSE-ConnectionGUID: MELztBFPQQ2RK/E68kIfoA==
X-CSE-MsgGUID: h1WZ0YKEQFuFYSt/MxBHnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132274496"
Message-ID: <02689dad-a10a-41a8-ad7e-e92d0a8d7e76@linux.intel.com>
Date: Thu, 24 Apr 2025 15:43:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/34] x86/msr: Remove pmu_msr_{read,write}()
To: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-edac@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org,
 jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com, wei.liu@kernel.org,
 ajay.kaher@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
 seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
 kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-13-xin@zytor.com>
 <7c44da88-72bb-4d1f-9f38-bf0e7e79b7a0@linux.intel.com>
 <45f95d01-4b98-457c-8272-c396a52b3844@zytor.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <45f95d01-4b98-457c-8272-c396a52b3844@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/24/2025 3:21 PM, Xin Li wrote:
> On 4/23/2025 11:33 PM, Mi, Dapeng wrote:
>> Could we merge this patch and previous patch into a single patch? It's
>> unnecessary to just modify the pmu_msr_read()/pmu_msr_write() in previous
>> patch and delete them immediately. It just wastes the effort.
> No, it's not wasting effort, it's for easier review.
>
> Look at this patch, you can easily tell that pmu_msr_read() and
> pmu_msr_write() are nothing more than pmu_msr_chk_emulated(), and
> then removing them makes a lot of sense.

These 2 patches are not complicated, it won't be difficult to review if
merging them into one as long as the commit message mentions it clearly.
Anyway I'm fine if you hope to keep them into two patches.



