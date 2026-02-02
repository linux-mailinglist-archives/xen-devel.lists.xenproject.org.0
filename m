Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLEFAMO8gGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:03:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DA5CDCF7
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218682.1527528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmvSO-0002Db-B8; Mon, 02 Feb 2026 15:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218682.1527528; Mon, 02 Feb 2026 15:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmvSO-0002Bq-85; Mon, 02 Feb 2026 15:03:16 +0000
Received: by outflank-mailman (input) for mailman id 1218682;
 Mon, 02 Feb 2026 15:03:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gzza=AG=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1vmvSM-0002Bh-J6
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 15:03:14 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 478f50c8-0048-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 16:03:08 +0100 (CET)
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 07:03:06 -0800
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 02 Feb 2026 07:03:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vmvS4-00000000ffw-49bj;
 Mon, 02 Feb 2026 15:02:56 +0000
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
X-Inumbo-ID: 478f50c8-0048-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770044588; x=1801580588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f4jiSWaAUMy80OsaVE6o84JI4KEEK5M17ot8dH2cPts=;
  b=amKUcJQGy4d7dAO4Cv+CRx7Bb39fi4/YwXfTLqhIpC43OWDztsqd8r6B
   gfVShaBOXIVMdvnvLE9pENMQknkr4XjGyXAETZyyL7U0prLjF4qABj0yV
   YE0rOyudXRv80TLpmnAlQZR1jYr0zkvU3TdwgS21JEkWuoRCf5luqk/Fq
   jB90Lr3iHxjFuZrrNwJp2ggK1oukeR/O19p8Iy6Kb2T6OIkmm5yxGr1WL
   Tk88iL2gDAlL4oYfmAxhB5xCSCwexP/UGIE1cUH8Y2LhM713isaJy80+s
   jwqN0LxI0+jFNkFcnUklOVWt7X8LLhYvPyssuH1lMQSpiWKS97qhC5nkw
   A==;
X-CSE-ConnectionGUID: Je93ZHC0Tz+CO4NY0upsJg==
X-CSE-MsgGUID: dCccp1sDQWmH697FmaTPpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71099594"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71099594"
X-CSE-ConnectionGUID: 1Sm55USrTViCYi6oLwwXlg==
X-CSE-MsgGUID: ZhozEz8UQCq9wlrljDbqsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="209698373"
Date: Mon, 2 Feb 2026 23:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Shashank Balaji <shashank.mahadasyam@sony.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suresh Siddha <suresh.b.siddha@intel.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, Rahul Bukte <rahul.bukte@sony.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>
Subject: Re: [PATCH 1/3] x86/x2apic: disable x2apic on resume if the kernel
 expects so
Message-ID: <202602022242.iSdFHMDI-lkp@intel.com>
References: <20260202-x2apic-fix-v1-1-71c8f488a88b@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-x2apic-fix-v1-1-71c8f488a88b@sony.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lkp@intel.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shashank.mahadasyam@sony.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:suresh.b.siddha@intel.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:jan.kiszka@siemens.com,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:jailhouse-dev@googlegroups.com,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:rahul.bukte@sony.com,m:daniel.palmer@sony.com,m:tim.bird@sony.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 55DA5CDCF7
X-Rspamd-Action: no action

Hi Shashank,

kernel test robot noticed the following build errors:

[auto build test ERROR on 18f7fcd5e69a04df57b563360b88be72471d6b62]

url:    https://github.com/intel-lab-lkp/linux/commits/Shashank-Balaji/x86-x2apic-disable-x2apic-on-resume-if-the-kernel-expects-so/20260202-181147
base:   18f7fcd5e69a04df57b563360b88be72471d6b62
patch link:    https://lore.kernel.org/r/20260202-x2apic-fix-v1-1-71c8f488a88b%40sony.com
patch subject: [PATCH 1/3] x86/x2apic: disable x2apic on resume if the kernel expects so
config: x86_64-buildonly-randconfig-001-20260202 (https://download.01.org/0day-ci/archive/20260202/202602022242.iSdFHMDI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602022242.iSdFHMDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602022242.iSdFHMDI-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/apic/apic.c: In function 'lapic_resume':
>> arch/x86/kernel/apic/apic.c:2463:17: error: implicit declaration of function '__x2apic_disable'; did you mean '__x2apic_enable'? [-Wimplicit-function-declaration]
    2463 |                 __x2apic_disable();
         |                 ^~~~~~~~~~~~~~~~
         |                 __x2apic_enable


vim +2463 arch/x86/kernel/apic/apic.c

  2435	
  2436	static void lapic_resume(void *data)
  2437	{
  2438		unsigned int l, h;
  2439		unsigned long flags;
  2440		int maxlvt;
  2441	
  2442		if (!apic_pm_state.active)
  2443			return;
  2444	
  2445		local_irq_save(flags);
  2446	
  2447		/*
  2448		 * IO-APIC and PIC have their own resume routines.
  2449		 * We just mask them here to make sure the interrupt
  2450		 * subsystem is completely quiet while we enable x2apic
  2451		 * and interrupt-remapping.
  2452		 */
  2453		mask_ioapic_entries();
  2454		legacy_pic->mask_all();
  2455	
  2456		if (x2apic_mode) {
  2457			__x2apic_enable();
  2458		} else {
  2459			/*
  2460			 * x2apic may have been re-enabled by the
  2461			 * firmware on resuming from s2ram
  2462			 */
> 2463			__x2apic_disable();
  2464	
  2465			/*
  2466			 * Make sure the APICBASE points to the right address
  2467			 *
  2468			 * FIXME! This will be wrong if we ever support suspend on
  2469			 * SMP! We'll need to do this as part of the CPU restore!
  2470			 */
  2471			if (boot_cpu_data.x86 >= 6) {
  2472				rdmsr(MSR_IA32_APICBASE, l, h);
  2473				l &= ~MSR_IA32_APICBASE_BASE;
  2474				l |= MSR_IA32_APICBASE_ENABLE | mp_lapic_addr;
  2475				wrmsr(MSR_IA32_APICBASE, l, h);
  2476			}
  2477		}
  2478	
  2479		maxlvt = lapic_get_maxlvt();
  2480		apic_write(APIC_LVTERR, ERROR_APIC_VECTOR | APIC_LVT_MASKED);
  2481		apic_write(APIC_ID, apic_pm_state.apic_id);
  2482		apic_write(APIC_DFR, apic_pm_state.apic_dfr);
  2483		apic_write(APIC_LDR, apic_pm_state.apic_ldr);
  2484		apic_write(APIC_TASKPRI, apic_pm_state.apic_taskpri);
  2485		apic_write(APIC_SPIV, apic_pm_state.apic_spiv);
  2486		apic_write(APIC_LVT0, apic_pm_state.apic_lvt0);
  2487		apic_write(APIC_LVT1, apic_pm_state.apic_lvt1);
  2488	#ifdef CONFIG_X86_THERMAL_VECTOR
  2489		if (maxlvt >= 5)
  2490			apic_write(APIC_LVTTHMR, apic_pm_state.apic_thmr);
  2491	#endif
  2492	#ifdef CONFIG_X86_MCE_INTEL
  2493		if (maxlvt >= 6)
  2494			apic_write(APIC_LVTCMCI, apic_pm_state.apic_cmci);
  2495	#endif
  2496		if (maxlvt >= 4)
  2497			apic_write(APIC_LVTPC, apic_pm_state.apic_lvtpc);
  2498		apic_write(APIC_LVTT, apic_pm_state.apic_lvtt);
  2499		apic_write(APIC_TDCR, apic_pm_state.apic_tdcr);
  2500		apic_write(APIC_TMICT, apic_pm_state.apic_tmict);
  2501		apic_write(APIC_ESR, 0);
  2502		apic_read(APIC_ESR);
  2503		apic_write(APIC_LVTERR, apic_pm_state.apic_lvterr);
  2504		apic_write(APIC_ESR, 0);
  2505		apic_read(APIC_ESR);
  2506	
  2507		irq_remapping_reenable(x2apic_mode);
  2508	
  2509		local_irq_restore(flags);
  2510	}
  2511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

