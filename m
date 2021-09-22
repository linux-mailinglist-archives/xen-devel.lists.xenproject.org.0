Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49304413E51
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 02:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191983.342176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpli-0000sY-Py; Wed, 22 Sep 2021 00:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191983.342176; Wed, 22 Sep 2021 00:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpli-0000pz-MC; Wed, 22 Sep 2021 00:05:46 +0000
Received: by outflank-mailman (input) for mailman id 191983;
 Wed, 22 Sep 2021 00:05:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOxS=OM=flex--seanjc.bounces.google.com=3V3NKYQYKCXgoaWjfYckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@srs-us1.protection.inumbo.net>)
 id 1mSplg-0000pt-V5
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 00:05:44 +0000
Received: from mail-qt1-x849.google.com (unknown [2607:f8b0:4864:20::849])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55ff4fc9-b676-48ad-ba93-f8cff336c5d7;
 Wed, 22 Sep 2021 00:05:43 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id
 o9-20020ac80249000000b002a0c9fd54d5so5595651qtg.4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 17:05:43 -0700 (PDT)
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
X-Inumbo-ID: 55ff4fc9-b676-48ad-ba93-f8cff336c5d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:message-id:mime-version:subject:from:to:cc;
        bh=phOg6sfjUxaw2dev9sQjUWZF+Yytb7b5OFt6ForYj/8=;
        b=iUirf8Xy9HBHz1WXV3sP98cQFZc4uLbiWcks09YKieGNfFGG+gs0k72fDMm3HygsTL
         bTb1E9YXxvDETi2LPUmOcN81qVU8N8EHMfwEIhym5xr1GL4nuPP5VSQWu2ilOytZoTGS
         29N5LX0Q1nAT/Yc19LBLlvpkIdDWZ9R0T+ikDFK/YvQdlOVrTR3jtpdXiFmTcxfOUu8s
         Y4Gz2V9KUWdc0VylyfjHYjfz7ZmN9V9G49FIJvjgEkSVzn9mYiMA4K/jF7NhytdmJ3F/
         hUx1PUAps9mDw+Jed5eSqhmcHrheKl00VcwQxkkBJMKDmZCGnvuYJgWoF05Eip0DYKf0
         Y9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
         :from:to:cc;
        bh=phOg6sfjUxaw2dev9sQjUWZF+Yytb7b5OFt6ForYj/8=;
        b=WLJT9RBeekTGPH89aDygZ3wk5FsNyIauRG33rm+tF/mB+1XaEzPu5v9agaGyk8sqD4
         C3+qGsLJFBynSbKmAQVDkwh9YTnRZldL1daYPN0pnw+W3mMJzs1ZgjcSCGhlArQx/OgW
         q6g1slE4V5ItxGT5r9XYtZP94zHml3ra7fWLfvxyLggIFQb2TGWSMtWQMqNMBPtNhEJD
         ZC7qD3tMd12ndf1ZuqLfg7U6FkTui+DAsqdcmrw/1DJmrDelxe6eVRAX6AyU9Z/GmHGd
         GCIVQ394PekJkWax33I/GyVnacNT7siYby/GyJEfX+XNwrzXIHuXWWLGFHN94iBBYnct
         MXOQ==
X-Gm-Message-State: AOAM530A8gJsskLDZncKvgGP4gLvFKUk9yGnOeaiteaYmrq2+d8TBf0J
	XqOqy160v0gSxY71EhzTCAfBuxAZ6T0=
X-Google-Smtp-Source: ABdhPJwRFbj6xeEYgNbL67Zce9IIY/R6nA0AUChux2cSB+iV33dupsb1zwE380RUBsEvPw8un2YtVWvkUMY=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:b022:92d6:d37b:686c])
 (user=seanjc job=sendgmr) by 2002:a25:598b:: with SMTP id n133mr40023097ybb.290.1632269143022;
 Tue, 21 Sep 2021 17:05:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 Sep 2021 17:05:17 -0700
Message-Id: <20210922000533.713300-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v3 00/16] perf: KVM: Fix, optimize, and clean up callbacks
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

Peter, I left the Intel PT mess as-is.  Having to pass a NULL pointer
from KVM arm64 seemed to be a lesser evil than more exports and multiple
registration paths.

This is a combination of ~2 series to fix bugs in the perf+KVM callbacks,
optimize the callbacks by employing static_call, and do a variety of
cleanup in both perf and KVM.

Patch 1 fixes a mostly-theoretical bug where perf can deref a NULL
pointer if KVM unregisters its callbacks while they're being accessed.
In practice, compilers tend to avoid problematic reloads of the pointer
and the PMI handler doesn't lose the race against module unloading,
i.e doesn't hit a use-after-free.

Patches 2 and 3 fix an Intel PT handling bug where KVM incorrectly
eats PT interrupts when PT is supposed to be owned entirely by the host.

Patches 4-9 clean up perf's callback infrastructure and switch to
static_call for arm64 and x86 (the only survivors).

Patches 10-16 clean up related KVM code and unify the arm64/x86 callbacks.

Based on "git://git.kernel.org/pub/scm/virt/kvm/kvm.git queue", commit
680c7e3be6a3 ("KVM: x86: Exit to userspace ...").

v3:
  - Add wrappers for guest callbacks to that stubs can be provided when
    GUEST_PERF_EVENTS=n.
  - s/HAVE_GUEST_PERF_EVENTS/GUEST_PERF_EVENTS and select it from KVM
    and XEN_PV instead of from top-level arm64/x86. [Paolo]
  - Drop an unnecessary synchronize_rcu() when registering callbacks. [Peter]
  - Retain a WARN_ON_ONCE() when unregistering callbacks if the caller
    didn't provide the correct pointer. [Peter]
  - Rework the static_call patch to move it all to common perf.
  - Add a patch to drop the (un)register stubs, made possible after
    having KVM+XEN_PV select GUEST_PERF_EVENTS.
  - Split dropping guest callback "support" for arm, csky, etc... to a
    separate patch, to make introducing GUEST_PERF_EVENTS cleaner.
  
v2 (relative to static_call v10):
  - Split the patch into the semantic change (multiplexed ->state) and
    introduction of static_call.
  - Don't use '0' for "not a guest RIP".
  - Handle unregister path.
  - Drop changes for architectures that can be culled entirely.

v2 (relative to v1):
  - https://lkml.kernel.org/r/20210828003558.713983-6-seanjc@google.com
  - Drop per-cpu approach. [Peter]
  - Fix mostly-theoretical reload and use-after-free with READ_ONCE(),
    WRITE_ONCE(), and synchronize_rcu(). [Peter]
  - Avoid new exports like the plague. [Peter]

v1:
  - https://lkml.kernel.org/r/20210827005718.585190-1-seanjc@google.com

v10 static_call:
  - https://lkml.kernel.org/r/20210806133802.3528-2-lingshan.zhu@intel.com


Like Xu (1):
  perf/core: Rework guest callbacks to prepare for static_call support

Sean Christopherson (15):
  perf: Ensure perf_guest_cbs aren't reloaded between !NULL check and
    deref
  KVM: x86: Register perf callbacks after calling vendor's
    hardware_setup()
  KVM: x86: Register Processor Trace interrupt hook iff PT enabled in
    guest
  perf: Stop pretending that perf can handle multiple guest callbacks
  perf: Drop dead and useless guest "support" from arm, csky, nds32 and
    riscv
  perf: Add wrappers for invoking guest callbacks
  perf: Force architectures to opt-in to guest callbacks
  perf/core: Use static_call to optimize perf_guest_info_callbacks
  KVM: x86: Drop current_vcpu for kvm_running_vcpu + kvm_arch_vcpu
    variable
  KVM: x86: More precisely identify NMI from guest when handling PMI
  KVM: Move x86's perf guest info callbacks to generic KVM
  KVM: x86: Move Intel Processor Trace interrupt handler to vmx.c
  KVM: arm64: Convert to the generic perf callbacks
  KVM: arm64: Drop perf.c and fold its tiny bits of code into arm.c /
    pmu.c
  perf: Drop guest callback (un)register stubs

 arch/arm/kernel/perf_callchain.c   | 28 ++------------
 arch/arm64/include/asm/kvm_host.h  |  9 ++++-
 arch/arm64/kernel/perf_callchain.c | 13 ++++---
 arch/arm64/kvm/Kconfig             |  1 +
 arch/arm64/kvm/Makefile            |  2 +-
 arch/arm64/kvm/arm.c               | 11 +++++-
 arch/arm64/kvm/perf.c              | 62 ------------------------------
 arch/arm64/kvm/pmu.c               |  8 ++++
 arch/csky/kernel/perf_callchain.c  | 10 -----
 arch/nds32/kernel/perf_event_cpu.c | 29 ++------------
 arch/riscv/kernel/perf_callchain.c | 10 -----
 arch/x86/events/core.c             | 13 ++++---
 arch/x86/events/intel/core.c       |  5 +--
 arch/x86/include/asm/kvm_host.h    |  7 +++-
 arch/x86/kvm/Kconfig               |  1 +
 arch/x86/kvm/pmu.c                 |  2 +-
 arch/x86/kvm/svm/svm.c             |  2 +-
 arch/x86/kvm/vmx/vmx.c             | 25 +++++++++++-
 arch/x86/kvm/x86.c                 | 58 +++++-----------------------
 arch/x86/kvm/x86.h                 | 17 ++++++--
 arch/x86/xen/Kconfig               |  1 +
 arch/x86/xen/pmu.c                 | 32 +++++++--------
 include/kvm/arm_pmu.h              |  1 +
 include/linux/kvm_host.h           | 10 +++++
 include/linux/perf_event.h         | 41 ++++++++++++++------
 init/Kconfig                       |  4 ++
 kernel/events/core.c               | 39 +++++++++++++------
 virt/kvm/kvm_main.c                | 44 +++++++++++++++++++++
 28 files changed, 235 insertions(+), 250 deletions(-)
 delete mode 100644 arch/arm64/kvm/perf.c

-- 
2.33.0.464.g1972c5931b-goog


