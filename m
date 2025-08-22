Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8412B30AF4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 03:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089441.1447020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upGs2-0007eP-B3; Fri, 22 Aug 2025 01:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089441.1447020; Fri, 22 Aug 2025 01:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upGs2-0007cR-7l; Fri, 22 Aug 2025 01:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1089441;
 Fri, 22 Aug 2025 01:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l7VN=3C=intel.com=xiaoyao.li@srs-se1.protection.inumbo.net>)
 id 1upGs0-0007cL-JY
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 01:47:08 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4ca0861-7ef9-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 03:47:01 +0200 (CEST)
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 18:46:59 -0700
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.238.14])
 ([10.124.238.14])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 18:46:51 -0700
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
X-Inumbo-ID: e4ca0861-7ef9-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755827221; x=1787363221;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dlNqS8GuyaD0jRtHmWGKX6D3RkxY5DYdizCYX+dXy5s=;
  b=VbfN1LETeItv2KlzF6kuX3Dl1CORmhA3BEWxOX4P4cWbhSdSMcHRvJf+
   Kgu4H+a5sZyapIaNzSBwcPtEQjWk0QoBGlGwIRkuzlej7xxjwhYvZNRxu
   FiysVlB4GUzCMvI4wpx8gEUuabNotwPY9fTYjH0T03gavDqiJhi6JqR4B
   QQdHevPtahCHcSqWWBp+BBW6exgoM23+SmeC1AG+y+LGv9dCt87m0bOJG
   Mt0+QGL3lp/nMlnxYXlPoLn66StCVSExglcRvrqE17h1/gH3Rx1VBNGDP
   gNIv/4KQBv/QtmB9fV2qffqWSLxlBplh2AktUcGJDKRvgoQzp7Nb9o6MO
   g==;
X-CSE-ConnectionGUID: LNuXx2NuTHeAxLebtQG40g==
X-CSE-MsgGUID: Kwqm8b8ITE6gTLn+PZstfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58199905"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58199905"
X-CSE-ConnectionGUID: AZFJ9i6pRCaPCV9OGTd+yQ==
X-CSE-MsgGUID: COxnV628RZWhh4q30kM6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="173843816"
Message-ID: <03ac8bac-c8d1-4a3b-a07f-2bbf04e726b6@intel.com>
Date: Fri, 22 Aug 2025 09:46:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] x86/cpu/intel: Bound the non-architectural
 constant_tsc model checks
To: Sohil Mehta <sohil.mehta@intel.com>, David Woodhouse
 <dwmw2@infradead.org>, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Tony Luck <tony.luck@intel.com>,
 =?UTF-8?Q?J=C3=BCrgen_Gross?= <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Zhang Rui <rui.zhang@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, kvm@vger.kernel.org, Xin Li <xin@zytor.com>
References: <20250219184133.816753-1-sohil.mehta@intel.com>
 <20250219184133.816753-14-sohil.mehta@intel.com>
 <6f05a6849fb7b22db35216dcf12bf537f8a43a92.camel@infradead.org>
 <968a179f-3da7-4c69-b798-357ea8d759eb@intel.com>
 <5f5f1230-f373-469c-b0d9-abc80199886e@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <5f5f1230-f373-469c-b0d9-abc80199886e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/2025 3:43 AM, Sohil Mehta wrote:
> On 8/21/2025 12:34 PM, Sohil Mehta wrote:
>> On 8/21/2025 6:15 AM, David Woodhouse wrote:
>>
>>> Hm. My test host is INTEL_HASWELL_X (0x63f). For reasons which are
>>> unclear to me, QEMU doesn't set bit 8 of 0x80000007 EDX unless I
>>> explicitly append ',+invtsc' to the existing '-cpu host' on its command
>>> line. So now my guest doesn't think it has X86_FEATURE_CONSTANT_TSC.
>>>
>>
>> Haswell should have X86_FEATURE_CONSTANT_TSC, so I would have expected
>> the guest bit to be set. Until now, X86_FEATURE_CONSTANT_TSC was set
>> based on the Family-model instead of the CPUID enumeration which may
>> have hid the issue.
>>
> 
> Correction:
> s/instead/as well as
> 
>>  From my initial look at the QEMU implementation, this seems intentional.
>>
>> QEMU considers Invariant TSC as un-migratable which prevents it from
>> being exposed to migratable guests (default).
>> target/i386/cpu.c:
>> [FEAT_8000_0007_EDX]
>>           .unmigratable_flags = CPUID_APM_INVTSC,
>>
>> Can you please try '-cpu host,migratable=off'?
> 
> This is mainly to verify. If confirmed, I am not sure what the long term
> solution should be.

yeah. It's the intentional behavior of QEMU.

Invariant TSC is ummigratable unless users explicitly configures the TSC 
frequency, e.g., "-cpu host,tsc-frequency=xxx". Because the TSC 
frequency is by default the host's frequency if no "tsc-frequency" 
specified, and it will change when the VM is migrated to a host with a 
different TSC frequency.

It's the specific behavior/rule of QEMU. We just need to keep it in 
mind. If we want to expose invariant TSC to the guest with QEMU's "-cpu 
host", we can either:
1) explicitly configure the "tsc-frequency", or
2) explicitly turn off "migratable"

