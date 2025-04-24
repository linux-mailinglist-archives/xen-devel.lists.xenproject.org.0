Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1FFA9A2D3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 09:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965845.1356264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7qds-0004D7-DX; Thu, 24 Apr 2025 07:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965845.1356264; Thu, 24 Apr 2025 07:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7qds-0004Aq-AX; Thu, 24 Apr 2025 07:05:04 +0000
Received: by outflank-mailman (input) for mailman id 965845;
 Thu, 24 Apr 2025 06:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkPj=XK=linux.intel.com=dapeng1.mi@srs-se1.protection.inumbo.net>)
 id 1u7q2E-0005Yc-NM
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 06:26:11 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 009ef05b-20d5-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 08:26:07 +0200 (CEST)
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 23:26:05 -0700
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.128])
 ([10.124.245.128])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 23:25:52 -0700
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
X-Inumbo-ID: 009ef05b-20d5-11f0-9eb1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745475968; x=1777011968;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=r9pnF53EyyaRucMwNVgQLeGE6Ab0R4f4MEaSIMBKOXs=;
  b=LXyiEpY3vzyPtYdMbKNQu0wnkQUVVcJFDKetIt6hQwFC8tK+on4cvPz4
   tPA8liJUKOav+Hhy5CrX6er3dWq+SDWjuyGrikbxP6BVcX/v4uGAZi+EG
   PFjpx1xLNTArkkBks89llFk9wWmN/i7mdy/kovw8hOW3pruPwQkK4/CQi
   mkhXHv5aGacvQwSdkl0RrJDg0Z4YvE5vAjEkTuYHZRtpz/u3CHXcvQgQh
   KDtBNKjphApxHWoK+Ef0QRPn0BkZp0PP+y4tu5W+h5fN/yJS4ZbybYHzz
   sIWfDYVzDdvrtIlP0j4wxQqyAcTI9uPQVI5KJY/osO436mML9LCcikUXO
   Q==;
X-CSE-ConnectionGUID: wXz1jbBIRGijFWCGpG9fzw==
X-CSE-MsgGUID: Pl7RfLThTTWLi4AK/9KgAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47187616"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="47187616"
X-CSE-ConnectionGUID: Ejvh0aUHTACVpOK/Jqvr7Q==
X-CSE-MsgGUID: i3jvGnxIQpSi7EjKCit1UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132432771"
Message-ID: <20471e53-c228-4cf6-83e6-3ab49f32f19f@linux.intel.com>
Date: Thu, 24 Apr 2025 14:25:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 11/34] x86/msr: Remove calling
 native_{read,write}_msr{,_safe}() in pmu_msr_{read,write}()
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
 <20250422082216.1954310-12-xin@zytor.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250422082216.1954310-12-xin@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/22/2025 4:21 PM, Xin Li (Intel) wrote:
> hpa found that pmu_msr_write() is actually a completely pointless
> function [1]: all it does is shuffle some arguments, then calls
> pmu_msr_chk_emulated() and if it returns true AND the emulated flag
> is clear then does *exactly the same thing* that the calling code
> would have done if pmu_msr_write() itself had returned true.  And
> pmu_msr_read() does the equivalent stupidity.
>
> Remove the calls to native_{read,write}_msr{,_safe}() within
> pmu_msr_{read,write}().  Instead reuse the existing calling code
> that decides whether to call native_{read,write}_msr{,_safe}() based
> on the return value from pmu_msr_{read,write}().  Consequently,
> eliminate the need to pass an error pointer to pmu_msr_{read,write}().
>
> While at it, refactor pmu_msr_write() to take the MSR value as a u64
> argument, replacing the current dual u32 arguments, because the dual
> u32 arguments were only used to call native_write_msr{,_safe}(), which
> has now been removed.
>
> [1]: https://lore.kernel.org/lkml/0ec48b84-d158-47c6-b14c-3563fd14bcc4@zytor.com/
>
> Suggested-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> Sign-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>  arch/x86/xen/enlighten_pv.c |  6 +++++-
>  arch/x86/xen/pmu.c          | 27 ++++-----------------------
>  arch/x86/xen/xen-ops.h      |  4 ++--
>  3 files changed, 11 insertions(+), 26 deletions(-)
>
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 9fbe187aff00..1418758b57ff 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -1132,6 +1132,8 @@ static void set_seg(unsigned int which, unsigned int low, unsigned int high,
>  static void xen_do_write_msr(unsigned int msr, unsigned int low,
>  			     unsigned int high, int *err)
>  {
> +	u64 val;
> +
>  	switch (msr) {
>  	case MSR_FS_BASE:
>  		set_seg(SEGBASE_FS, low, high, err);
> @@ -1158,7 +1160,9 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
>  		break;
>  
>  	default:
> -		if (!pmu_msr_write(msr, low, high, err)) {
> +		val = (u64)high << 32 | low;
> +
> +		if (!pmu_msr_write(msr, val)) {
>  			if (err)
>  				*err = native_write_msr_safe(msr, low, high);
>  			else
> diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
> index 9c1682af620a..95caae97a394 100644
> --- a/arch/x86/xen/pmu.c
> +++ b/arch/x86/xen/pmu.c
> @@ -313,37 +313,18 @@ static bool pmu_msr_chk_emulated(unsigned int msr, uint64_t *val, bool is_read,
>  	return true;
>  }
>  
> -bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err)
> +bool pmu_msr_read(u32 msr, u64 *val)

The function name is some kind of misleading right now. With the change,
this function only read PMU MSR's value if it's emulated, otherwise it
won't really read PMU MSR. How about changing the name to
"pmu_emulated_msr_read" or something similar?


>  {
>  	bool emulated;
>  
> -	if (!pmu_msr_chk_emulated(msr, val, true, &emulated))
> -		return false;
> -
> -	if (!emulated) {
> -		*val = err ? native_read_msr_safe(msr, err)
> -			   : native_read_msr(msr);
> -	}
> -
> -	return true;
> +	return pmu_msr_chk_emulated(msr, val, true, &emulated) && emulated;
>  }
>  
> -bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err)
> +bool pmu_msr_write(u32 msr, u64 val)

ditto.


>  {
> -	uint64_t val = ((uint64_t)high << 32) | low;
>  	bool emulated;
>  
> -	if (!pmu_msr_chk_emulated(msr, &val, false, &emulated))
> -		return false;
> -
> -	if (!emulated) {
> -		if (err)
> -			*err = native_write_msr_safe(msr, low, high);
> -		else
> -			native_write_msr(msr, low, high);
> -	}
> -
> -	return true;
> +	return pmu_msr_chk_emulated(msr, &val, false, &emulated) && emulated;
>  }
>  
>  static u64 xen_amd_read_pmc(int counter)
> diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
> index dc886c3cc24d..a1875e10be31 100644
> --- a/arch/x86/xen/xen-ops.h
> +++ b/arch/x86/xen/xen-ops.h
> @@ -271,8 +271,8 @@ void xen_pmu_finish(int cpu);
>  static inline void xen_pmu_init(int cpu) {}
>  static inline void xen_pmu_finish(int cpu) {}
>  #endif
> -bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err);
> -bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err);
> +bool pmu_msr_read(u32 msr, u64 *val);

The prototype of pmu_msr_read() has been changed, but why there is no
corresponding change in its caller (xen_do_read_msr())?


> +bool pmu_msr_write(u32 msr, u64 val);
>  int pmu_apic_update(uint32_t reg);
>  u64 xen_read_pmc(int counter);
>  

