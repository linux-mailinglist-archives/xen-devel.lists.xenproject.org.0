Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3E413E4F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 02:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191985.342198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpls-0001Ub-F6; Wed, 22 Sep 2021 00:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191985.342198; Wed, 22 Sep 2021 00:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpls-0001Ro-Aj; Wed, 22 Sep 2021 00:05:56 +0000
Received: by outflank-mailman (input) for mailman id 191985;
 Wed, 22 Sep 2021 00:05:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJCr=OM=flex--seanjc.bounces.google.com=3W3NKYQYKCXwxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@srs-us1.protection.inumbo.net>)
 id 1mSplq-0000pt-PT
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 00:05:54 +0000
Received: from mail-qt1-x84a.google.com (unknown [2607:f8b0:4864:20::84a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c089ab9d-313d-4207-ba2f-42954b798da3;
 Wed, 22 Sep 2021 00:05:48 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id
 c21-20020a05622a025500b002a6965decfdso5077498qtx.14
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 17:05:48 -0700 (PDT)
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
X-Inumbo-ID: c089ab9d-313d-4207-ba2f-42954b798da3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=/Rel7IDBHL/DlNbV9YDximOR/ceEVZKr5BpHO0J3wYE=;
        b=k3BkoiZwNDQSgL3tEWZpjE6EfQkaXg/m6u3CKlmQTge7gDNDRP920npuJicDQOLGIW
         yoGIN4Z0aY9QErf1e66xqyhlAmsb29Adxkyap6pNmw+FigDAF/HwZpyD4SwfyDNjxEBI
         L3Hj7QeZ2mK2YQzpAxgJzXhidgJBh66gysCSfbdAzAVCNl0/PpYOOwZCkG0XgqdYqcPi
         DepD/Zz5nhXyEE26CXt5pzDL9NIQrBteg/3FetFaX3qIqSta7kwW9lSwibR7Yi7ZIN64
         bGtcOit8MazFfctrkSYZbjCCAGX937gmiMhEPPsCUfa343jN+qkq71vPPMrbXWva4s8x
         1MRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=/Rel7IDBHL/DlNbV9YDximOR/ceEVZKr5BpHO0J3wYE=;
        b=f0/MbFXimdBHm7YKckkKUwDa0ncy09vLJzZ9wto+MH8hTX2KGd1tMlt2r3whXYK3FY
         Cf/q79dlCRpidjrhjR/JRzQq6zWcitYiE9RyosAzxbN5I0MLdzPp5tFRP2DuF5/cdQpE
         8Q8HbLO29/bww7kHoXa0ZWBnTz/jhK5Hp/gnnel5WGQYvmumdmco8YmtfBjuM3dz6oso
         EYRNhd1nUTzeVmyPqNRAoFYcanS/7VzsWxvpmvZL5OLY+fwRX6jN9uvooR6TKUn6/hBN
         DVFn22k/fzHUM76lNeAs0x83KxoXVeskw/ZRhOZBORcXqPRDIKS6hT6/FJ0fSupBwGnT
         vFhw==
X-Gm-Message-State: AOAM531DwRGKpHKJq9gXaVvOaZSIo5E+YgjQO4G57JJQVm7P6TZdj+9R
	9RfpLda2bCnNicgn4yogAE4D2PRDyos=
X-Google-Smtp-Source: ABdhPJxOQ2RWktf9fE+8nT6XGH9bJ2bTXzkYzGz9TY7O9+ijr2BzXnZvbY3O/xwZK7tibJDN6XsSYEuLjw4=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:b022:92d6:d37b:686c])
 (user=seanjc job=sendgmr) by 2002:a05:6214:12af:: with SMTP id
 w15mr24363579qvu.66.1632269147772; Tue, 21 Sep 2021 17:05:47 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 Sep 2021 17:05:19 -0700
In-Reply-To: <20210922000533.713300-1-seanjc@google.com>
Message-Id: <20210922000533.713300-3-seanjc@google.com>
Mime-Version: 1.0
References: <20210922000533.713300-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v3 02/16] KVM: x86: Register perf callbacks after calling
 vendor's hardware_setup()
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

Wait to register perf callbacks until after doing vendor hardaware setup.
VMX's hardware_setup() configures Intel Processor Trace (PT) mode, and a
future fix to register the Intel PT guest interrupt hook if and only if
Intel PT is exposed to the guest will consume the configured PT mode.

Delaying registration to hardware setup is effectively a nop as KVM's perf
hooks all pivot on the per-CPU current_vcpu, which is non-NULL only when
KVM is handling an IRQ/NMI in a VM-Exit path.  I.e. current_vcpu will be
NULL throughout both kvm_arch_init() and kvm_arch_hardware_setup().

Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Artem Kashkanov <artem.kashkanov@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 86539c1686fa..fb6015f97f9e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8426,8 +8426,6 @@ int kvm_arch_init(void *opaque)
 
 	kvm_timer_init();
 
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
-
 	if (boot_cpu_has(X86_FEATURE_XSAVE)) {
 		host_xcr0 = xgetbv(XCR_XFEATURE_ENABLED_MASK);
 		supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
@@ -8461,7 +8459,6 @@ void kvm_arch_exit(void)
 		clear_hv_tscchange_cb();
 #endif
 	kvm_lapic_exit();
-	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
 
 	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
 		cpufreq_unregister_notifier(&kvmclock_cpufreq_notifier_block,
@@ -11064,6 +11061,8 @@ int kvm_arch_hardware_setup(void *opaque)
 	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
 	kvm_ops_static_call_update();
 
+	perf_register_guest_info_callbacks(&kvm_guest_cbs);
+
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
 
@@ -11091,6 +11090,8 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
+	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+
 	static_call(kvm_x86_hardware_unsetup)();
 }
 
-- 
2.33.0.464.g1972c5931b-goog


