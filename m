Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3B5A9A2D4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 09:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965848.1356269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7qds-0004GW-Jr; Thu, 24 Apr 2025 07:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965848.1356269; Thu, 24 Apr 2025 07:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7qds-0004DH-GI; Thu, 24 Apr 2025 07:05:04 +0000
Received: by outflank-mailman (input) for mailman id 965848;
 Thu, 24 Apr 2025 06:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkPj=XK=linux.intel.com=dapeng1.mi@srs-se1.protection.inumbo.net>)
 id 1u7q9i-00077i-Vu
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 06:33:54 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1637a5ae-20d6-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 08:33:53 +0200 (CEST)
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 23:33:51 -0700
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.128])
 ([10.124.245.128])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 23:33:39 -0700
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
X-Inumbo-ID: 1637a5ae-20d6-11f0-9eb1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745476433; x=1777012433;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dcxOn/nuTpss+vf24oXBlr34cv3+AgMg/89LV6ad5rM=;
  b=EH1WaUTRi4TPiWTo1+4t3y7E2rhtAQPBJEDqKD8EYnZ0imw3keFRFE0+
   XUF5BQxQ1TnpzbyDbLVBr0K/prfP7PjDoUt1BsF6cKf1Fxci9G2MvN83z
   acShBqE5rU5QsTnT4To3Njk9VR3JSRfDz4Fol9dtQnWFQBeQVHx3v46to
   zW6iwoqBpMDPCnLa+qh4mLttip6V8X9SpYg9j4C3A0epCsWoqaCP4TYas
   Q0bl7FnSnt6Wjj8Ya0O+wxQuvsDRRq5nr8nWFy4fAu1hvBHeam1bXGun7
   xe/gKzAM0Em97s8P9RFvU85ZrY2NQEe14RAxm1w1PgySLXUUVLcv2v2QP
   Q==;
X-CSE-ConnectionGUID: UJeruhciTail4A4VRAPXCw==
X-CSE-MsgGUID: ZOCZyqQFT4a3q1XHS1OsaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47226707"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="47226707"
X-CSE-ConnectionGUID: l3lwgHW4RvWGJqWYsXT+Ow==
X-CSE-MsgGUID: x4fuAgz/TQeaZNeRxG6fQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="163563116"
Message-ID: <7c44da88-72bb-4d1f-9f38-bf0e7e79b7a0@linux.intel.com>
Date: Thu, 24 Apr 2025 14:33:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/34] x86/msr: Remove pmu_msr_{read,write}()
To: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
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
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250422082216.1954310-13-xin@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/22/2025 4:21 PM, Xin Li (Intel) wrote:
> As pmu_msr_{read,write}() are now wrappers of pmu_msr_chk_emulated(),
> remove them and use pmu_msr_chk_emulated() directly.
>
> While at it, convert the data type of MSR index to u32 in functions
> called in pmu_msr_chk_emulated().
>
> Suggested-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>  arch/x86/xen/enlighten_pv.c | 17 ++++++++++-------
>  arch/x86/xen/pmu.c          | 24 ++++--------------------
>  arch/x86/xen/xen-ops.h      |  3 +--
>  3 files changed, 15 insertions(+), 29 deletions(-)
>
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 1418758b57ff..b5a8bceb5f56 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -1089,8 +1089,9 @@ static void xen_write_cr4(unsigned long cr4)
>  static u64 xen_do_read_msr(unsigned int msr, int *err)
>  {
>  	u64 val = 0;	/* Avoid uninitialized value for safe variant. */
> +	bool emulated;
>  
> -	if (pmu_msr_read(msr, &val, err))
> +	if (pmu_msr_chk_emulated(msr, &val, true, &emulated) && emulated)

ah, here it is.

Could we merge this patch and previous patch into a single patch? It's
unnecessary to just modify the pmu_msr_read()/pmu_msr_write() in previous
patch and delete them immediately. It just wastes the effort.


>  		return val;
>  
>  	if (err)
> @@ -1133,6 +1134,7 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
>  			     unsigned int high, int *err)
>  {
>  	u64 val;
> +	bool emulated;
>  
>  	switch (msr) {
>  	case MSR_FS_BASE:
> @@ -1162,12 +1164,13 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
>  	default:
>  		val = (u64)high << 32 | low;
>  
> -		if (!pmu_msr_write(msr, val)) {
> -			if (err)
> -				*err = native_write_msr_safe(msr, low, high);
> -			else
> -				native_write_msr(msr, low, high);
> -		}
> +		if (pmu_msr_chk_emulated(msr, &val, false, &emulated) && emulated)
> +			return;
> +
> +		if (err)
> +			*err = native_write_msr_safe(msr, low, high);
> +		else
> +			native_write_msr(msr, low, high);
>  	}
>  }
>  
> diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
> index 95caae97a394..afb02f43ee3f 100644
> --- a/arch/x86/xen/pmu.c
> +++ b/arch/x86/xen/pmu.c
> @@ -128,7 +128,7 @@ static inline uint32_t get_fam15h_addr(u32 addr)
>  	return addr;
>  }
>  
> -static inline bool is_amd_pmu_msr(unsigned int msr)
> +static bool is_amd_pmu_msr(u32 msr)
>  {
>  	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
>  	    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
> @@ -194,8 +194,7 @@ static bool is_intel_pmu_msr(u32 msr_index, int *type, int *index)
>  	}
>  }
>  
> -static bool xen_intel_pmu_emulate(unsigned int msr, u64 *val, int type,
> -				  int index, bool is_read)
> +static bool xen_intel_pmu_emulate(u32 msr, u64 *val, int type, int index, bool is_read)
>  {
>  	uint64_t *reg = NULL;
>  	struct xen_pmu_intel_ctxt *ctxt;
> @@ -257,7 +256,7 @@ static bool xen_intel_pmu_emulate(unsigned int msr, u64 *val, int type,
>  	return false;
>  }
>  
> -static bool xen_amd_pmu_emulate(unsigned int msr, u64 *val, bool is_read)
> +static bool xen_amd_pmu_emulate(u32 msr, u64 *val, bool is_read)
>  {
>  	uint64_t *reg = NULL;
>  	int i, off = 0;
> @@ -298,8 +297,7 @@ static bool xen_amd_pmu_emulate(unsigned int msr, u64 *val, bool is_read)
>  	return false;
>  }
>  
> -static bool pmu_msr_chk_emulated(unsigned int msr, uint64_t *val, bool is_read,
> -				 bool *emul)
> +bool pmu_msr_chk_emulated(u32 msr, u64 *val, bool is_read, bool *emul)
>  {
>  	int type, index = 0;
>  
> @@ -313,20 +311,6 @@ static bool pmu_msr_chk_emulated(unsigned int msr, uint64_t *val, bool is_read,
>  	return true;
>  }
>  
> -bool pmu_msr_read(u32 msr, u64 *val)
> -{
> -	bool emulated;
> -
> -	return pmu_msr_chk_emulated(msr, val, true, &emulated) && emulated;
> -}
> -
> -bool pmu_msr_write(u32 msr, u64 val)
> -{
> -	bool emulated;
> -
> -	return pmu_msr_chk_emulated(msr, &val, false, &emulated) && emulated;
> -}
> -
>  static u64 xen_amd_read_pmc(int counter)
>  {
>  	struct xen_pmu_amd_ctxt *ctxt;
> diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
> index a1875e10be31..fde9f9d7415f 100644
> --- a/arch/x86/xen/xen-ops.h
> +++ b/arch/x86/xen/xen-ops.h
> @@ -271,8 +271,7 @@ void xen_pmu_finish(int cpu);
>  static inline void xen_pmu_init(int cpu) {}
>  static inline void xen_pmu_finish(int cpu) {}
>  #endif
> -bool pmu_msr_read(u32 msr, u64 *val);
> -bool pmu_msr_write(u32 msr, u64 val);
> +bool pmu_msr_chk_emulated(u32 msr, u64 *val, bool is_read, bool *emul);
>  int pmu_apic_update(uint32_t reg);
>  u64 xen_read_pmc(int counter);
>  

