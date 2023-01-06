Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C648E65FF04
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 11:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472421.732630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDk5O-0004o5-4i; Fri, 06 Jan 2023 10:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472421.732630; Fri, 06 Jan 2023 10:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDk5O-0004kt-1s; Fri, 06 Jan 2023 10:36:30 +0000
Received: by outflank-mailman (input) for mailman id 472421;
 Fri, 06 Jan 2023 10:36:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pdurrant@amazon.com>) id 1pDk5N-0004kn-53
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 10:36:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pdurrant@amazon.com>)
 id 1pDk5E-0003mV-2t; Fri, 06 Jan 2023 10:36:20 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=debian.cbg12.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pdurrant@amazon.com>)
 id 1pDk5D-0001wX-Ni; Fri, 06 Jan 2023 10:36:19 +0000
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
From: Paul Durrant <pdurrant@amazon.com>
To: x86@kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Borislav Petkov <bp@alien8.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v7 0/2] KVM: x86/xen: update Xen CPUID Leaf 4
Date: Fri,  6 Jan 2023 10:35:58 +0000
Message-Id: <20230106103600.528-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch #2 was the original patch. It has been expended to a series in v6.

Paul Durrant (2):
  KVM: x86/cpuid: generalize kvm_update_kvm_cpuid_base() and also
    capture limit
  KVM: x86/xen: update Xen CPUID Leaf 4 (tsc info) sub-leaves, if
    present

 arch/x86/include/asm/kvm_host.h       |  8 +++++++-
 arch/x86/include/asm/xen/hypervisor.h |  4 +++-
 arch/x86/kvm/cpuid.c                  | 26 +++++++++++++++-----------
 arch/x86/kvm/x86.c                    |  1 +
 arch/x86/kvm/xen.c                    | 26 ++++++++++++++++++++++++++
 arch/x86/kvm/xen.h                    |  7 +++++++
 6 files changed, 59 insertions(+), 13 deletions(-)
---
Cc: Borislav Petkov <bp@alien8.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
-- 
2.20.1


