Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 186E0413E62
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 02:07:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192015.342265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpmw-0005aT-Ko; Wed, 22 Sep 2021 00:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192015.342265; Wed, 22 Sep 2021 00:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpmw-0005W6-GP; Wed, 22 Sep 2021 00:07:02 +0000
Received: by outflank-mailman (input) for mailman id 192015;
 Wed, 22 Sep 2021 00:07:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sx30=OM=flex--seanjc.bounces.google.com=3aXNKYQYKCYo6so1xqu22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@srs-us1.protection.inumbo.net>)
 id 1mSpmZ-0000pt-Qt
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 00:06:39 +0000
Received: from mail-qk1-x749.google.com (unknown [2607:f8b0:4864:20::749])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf15b4d9-f8b2-4814-84fa-bd9e3ba78229;
 Wed, 22 Sep 2021 00:06:01 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id
 u22-20020a05620a455600b004333191e844so5516211qkp.14
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 17:06:01 -0700 (PDT)
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
X-Inumbo-ID: bf15b4d9-f8b2-4814-84fa-bd9e3ba78229
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=hxRuLxBMmtgulqNWBhVm63T2q6otFpWhzuzOzQjwuz0=;
        b=AEH25mNfVOzaOi5d6c3BruylgDezaEPCOtesGovpuwBViHkaZN0oJqqsI3ayCNTU47
         g0/dG78HVaz39C6dylQWgabX8vR0or8V+qWDB8Hco6j0Zy1BH84lLC4DdigOee9qRXx5
         Z0GBtiUbse1uPHuGSgRHXOGN+MswC1H/vEN/9eWkP/kvKiaoxNiLyYnf9+trtkLu2SB3
         N3xMQRLYQClaWUgxFLgSR/Ws7M+M5HGzh33BkasWfYaCdmeGEgaOiZCARYtsiDGcOzZZ
         QmwqXobkE3+q1ncVsZzvdLP7llxDj6xtQ34TQ5DGMtVmRDULQ5ytAScISNgwHfdTAtDC
         Jt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=hxRuLxBMmtgulqNWBhVm63T2q6otFpWhzuzOzQjwuz0=;
        b=DCjlIhZq05rHEBV73WqMCCmTd3kECjMalkAPA+txIbwHnM9fdErNvGtHJLnbz1pvGy
         LPppPqJkcelDjUm9w+nR5Ar635mgfAwyx68NG6nmG9BVaGQ9vHNZrQzo+0PiyRr114tl
         YBr2ERAHT1WD8Pmh6wqhj0bxyrog9CNWvQ6paS6BfH4hIDVThfwcG7kfcJr6M74iyoq+
         WIhDr9TZk5gpr1/aC7Y40yMvsF3f6AiaKNBvk5WhCQ+/TS8VRurvuh4lR97GDA/kgLwA
         q50s2GonJDTZP69anjVVUed/vOMr+YrlZ6GZqPwGerdzt6x99k0jG+puxysFgYaaXJVY
         Gx9g==
X-Gm-Message-State: AOAM5314yL2SmDEUOO/6X2WgeqpINadXPOze4WJ4WhYoSDyUQEmr50nh
	kTB4586qc/rhvc9sfB/LuIh03zTchYE=
X-Google-Smtp-Source: ABdhPJzZXZc/uBJgDh9/jjk115DCwSnPOWZBsVnqx8QA2MhIXqiGwOq328gHdkdfukulUyubJVoFUxWXEpY=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:b022:92d6:d37b:686c])
 (user=seanjc job=sendgmr) by 2002:a05:6214:6aa:: with SMTP id
 s10mr33034215qvz.56.1632269161091; Tue, 21 Sep 2021 17:06:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 Sep 2021 17:05:25 -0700
In-Reply-To: <20210922000533.713300-1-seanjc@google.com>
Message-Id: <20210922000533.713300-9-seanjc@google.com>
Mime-Version: 1.0
References: <20210922000533.713300-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v3 08/16] perf: Force architectures to opt-in to guest callbacks
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, 
	Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Artem Kashkanov <artem.kashkanov@intel.com>, Like Xu <like.xu.linux@gmail.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Introduce GUEST_PERF_EVENTS and require architectures to select it to
allow registering and using guest callbacks in perf.  This will hopefully
make it more difficult for new architectures to add useless "support" for
guest callbacks, e.g. via copy+paste.

Stubbing out the helpers has the happy bonus of avoiding a load of
perf_guest_cbs when GUEST_PERF_EVENTS=n on arm64/x86.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/Kconfig     | 1 +
 arch/x86/kvm/Kconfig       | 1 +
 arch/x86/xen/Kconfig       | 1 +
 include/linux/perf_event.h | 6 ++++++
 init/Kconfig               | 4 ++++
 kernel/events/core.c       | 2 ++
 6 files changed, 15 insertions(+)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index a4eba0908bfa..f2121404c7c6 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -37,6 +37,7 @@ menuconfig KVM
 	select HAVE_KVM_IRQ_BYPASS
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
+	select GUEST_PERF_EVENTS if PERF_EVENTS
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index ac69894eab88..699bf786fbce 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -36,6 +36,7 @@ config KVM
 	select KVM_MMIO
 	select SCHED_INFO
 	select PERF_EVENTS
+	select GUEST_PERF_EVENTS
 	select HAVE_KVM_MSI
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select HAVE_KVM_NO_POLL
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index afc1da68b06d..d07595a9552d 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -23,6 +23,7 @@ config XEN_PV
 	select PARAVIRT_XXL
 	select XEN_HAVE_PVMMU
 	select XEN_HAVE_VPMU
+	select GUEST_PERF_EVENTS
 	help
 	  Support running as a Xen PV guest.
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index c0a6eaf55fb1..eefa197d5354 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1238,6 +1238,7 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 				 enum perf_bpf_event_type type,
 				 u16 flags);
 
+#ifdef CONFIG_GUEST_PERF_EVENTS
 extern struct perf_guest_info_callbacks *perf_guest_cbs;
 static inline struct perf_guest_info_callbacks *perf_get_guest_cbs(void)
 {
@@ -1273,6 +1274,11 @@ static inline unsigned int perf_guest_handle_intel_pt_intr(void)
 }
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
+#else
+static inline unsigned int perf_guest_state(void)		 { return 0; }
+static inline unsigned long perf_guest_get_ip(void)		 { return 0; }
+static inline unsigned int perf_guest_handle_intel_pt_intr(void) { return 0; }
+#endif /* CONFIG_GUEST_PERF_EVENTS */
 
 extern void perf_event_exec(void);
 extern void perf_event_comm(struct task_struct *tsk, bool exec);
diff --git a/init/Kconfig b/init/Kconfig
index 55f9f7738ebb..acc7e8ba4563 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1776,6 +1776,10 @@ config HAVE_PERF_EVENTS
 	help
 	  See tools/perf/design.txt for details.
 
+config GUEST_PERF_EVENTS
+	bool
+	depends on HAVE_PERF_EVENTS
+
 config PERF_USE_VMALLOC
 	bool
 	help
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2e3dc9fbd5d9..c6ec05809f54 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6482,6 +6482,7 @@ static void perf_pending_event(struct irq_work *entry)
 		perf_swevent_put_recursion_context(rctx);
 }
 
+#ifdef CONFIG_GUEST_PERF_EVENTS
 struct perf_guest_info_callbacks *perf_guest_cbs;
 
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
@@ -6502,6 +6503,7 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 	synchronize_rcu();
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
+#endif
 
 static void
 perf_output_sample_regs(struct perf_output_handle *handle,
-- 
2.33.0.464.g1972c5931b-goog


