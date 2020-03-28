Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D519640B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 07:56:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI5K1-000298-Bh; Sat, 28 Mar 2020 06:51:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJGS=5N=gmail.com=singhalsimran0@srs-us1.protection.inumbo.net>)
 id 1jI4B9-0004RL-BX
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 05:38:43 +0000
X-Inumbo-ID: 61dff196-70b6-11ea-b34e-bc764e2007e4
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61dff196-70b6-11ea-b34e-bc764e2007e4;
 Sat, 28 Mar 2020 05:38:42 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q3so5616289pff.13
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2020 22:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=/UeiftpvQoX+4fJojqc3nlG6/MxVw6VxR48gqTbzVM4=;
 b=c1ma9oi5keC6NYjRwtsWi7+FF74M8s3L+LFedKPSmz15bPeHb3pOmbcR496gfCE5JP
 yWuBXOtwInBbb9WV6H0Qf5gBrosZe71UHm5zT3FfJTBY1kX1bhds7MaO5BrRk3vsL704
 mOiBOCYepR9Uan+xT4RX3AzDYOxx8UIV4BIa49bP9pmIBJT87r6XAb8h4fvWvSLcCH4G
 zdEwHPUCPojUin7H+IxNt+kf7sjY+W2++h+KlRh57agJdyw27NjBd+g4/NJB+uYX+pbG
 i89JVDmglRcOQH1tgkS3RavfeTGpf6nn7O3xlfdkmYot15gqGHEQfswIOULGSyQ9qd+2
 kF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=/UeiftpvQoX+4fJojqc3nlG6/MxVw6VxR48gqTbzVM4=;
 b=N7KY/T34W6ZHUt7VaT/V7KTpq6q0MFXmKM6xj9APnz/PtSsTqpy3UDYgt/2/w1jdqk
 6TUFtfKZ3dSA+E5Pl7y4jnaC5RwQUtTbhfrZMtkpisDNuGG6LSaar9DT9O86/val8wIU
 YTRvile2lBJzOOUGl4cLAtDlMGgs1WBJGo2WLsl64JIL/Oxs42R7dUBiycBTvsGZCCaF
 1iMeMnk1njR4iTOvD1ugE5jHsC3x0t+bdM5Oi5f8OXFzgJuEXlIp55+eqNdTC6/ABQZl
 GBxTa2w7BZ+fS5Qijl6otQ3Na8+0gY4Wdp72lKgtPWxaqEm+btXNBtL4GJDnSVXd/fip
 hRkA==
X-Gm-Message-State: ANhLgQ0/sX/DlCoWl/6sXGq+pYoo0xGKf6QttnXONNMbZoZ+GJZm/pS8
 KM4YgCoE7z3pMeir3A9T+Qg=
X-Google-Smtp-Source: ADFU+vsCztYh2nduvVwbGqLP1qwlRr8D96S+4UlYG8cDqLpTwXBnlOjg9678MaFjjDfWjIEklbaDUQ==
X-Received: by 2002:a63:fc56:: with SMTP id r22mr2875679pgk.147.1585373921082; 
 Fri, 27 Mar 2020 22:38:41 -0700 (PDT)
Received: from simran-Inspiron-5558 ([2409:4052:2ea9:879:78b1:eff3:22d:a980])
 by smtp.gmail.com with ESMTPSA id
 gi2sm419792pjb.30.2020.03.27.22.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 22:38:40 -0700 (PDT)
Date: Sat, 28 Mar 2020 11:08:35 +0530
From: Simran Singhal <singhalsimran0@gmail.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20200328053834.GA12753@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 28 Mar 2020 06:51:56 +0000
Subject: [Xen-devel] [PATCH] xen/x86: Remove unnecessary cast on void pointer
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Assignment to a typed pointer is sufficient in C.
No cast is needed.

Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
---
 xen/arch/x86/acpi/cpufreq/powernow.c | 2 +-
 xen/arch/x86/cpu/vpmu.c              | 2 +-
 xen/arch/x86/hpet.c                  | 2 +-
 xen/arch/x86/hvm/save.c              | 2 +-
 xen/arch/x86/hvm/vmx/vvmx.c          | 4 ++--
 xen/arch/x86/mm/p2m-pt.c             | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 3cf9c6cd05..f620bebc7e 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -58,7 +58,7 @@ static void transition_pstate(void *pstate)
 
 static void update_cpb(void *data)
 {
-    struct cpufreq_policy *policy = (struct cpufreq_policy *)data;
+    struct cpufreq_policy *policy = data;
 
     if (policy->turbo != CPUFREQ_TURBO_UNSUPPORTED) {
         uint64_t msr_content;
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index e50d478d23..1ed39ef03f 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -337,7 +337,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
 
 static void vpmu_save_force(void *arg)
 {
-    struct vcpu *v = (struct vcpu *)arg;
+    struct vcpu *v = arg;
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
 
     if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 86929b9ba1..c46e7cf4ee 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -215,7 +215,7 @@ again:
 static void hpet_interrupt_handler(int irq, void *data,
         struct cpu_user_regs *regs)
 {
-    struct hpet_event_channel *ch = (struct hpet_event_channel *)data;
+    struct hpet_event_channel *ch = data;
 
     this_cpu(irq_count)--;
 
diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index 0fc59d3487..a2c56fbc1e 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -417,7 +417,7 @@ void _hvm_read_entry(struct hvm_domain_context *h, void *dest,
     memcpy(dest, &h->data[h->cur], d->length);
 
     if ( d->length < dest_len )
-        memset((char *)dest + d->length, 0, dest_len - d->length);
+        memset(dest + d->length, 0, dest_len - d->length);
 
     h->cur += d->length;
 }
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index f049920196..a53d3ca2a4 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -256,7 +256,7 @@ static int vvmcs_offset(u32 width, u32 type, u32 index)
 u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)
 {
     union vmcs_encoding enc;
-    u64 *content = (u64 *) vvmcs;
+    u64 *content = vvmcs;
     int offset;
     u64 res;
 
@@ -310,7 +310,7 @@ enum vmx_insn_errno get_vvmcs_real_safe(const struct vcpu *v, u32 encoding,
 void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)
 {
     union vmcs_encoding enc;
-    u64 *content = (u64 *) vvmcs;
+    u64 *content = vvmcs;
     int offset;
     u64 res;
 
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index eb66077496..058b9b8adf 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -127,7 +127,7 @@ p2m_find_entry(void *table, unsigned long *gfn_remainder,
         return NULL;
     }
     *gfn_remainder &= (1 << shift) - 1;
-    return (l1_pgentry_t *)table + index;
+    return table + index;
 }
 
 /* Free intermediate tables from a p2m sub-tree */
-- 
2.17.1


