Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2660A4E52D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 17:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901277.1309245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpUra-0006Wy-J5; Tue, 04 Mar 2025 16:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901277.1309245; Tue, 04 Mar 2025 16:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpUra-0006Uz-GF; Tue, 04 Mar 2025 16:11:22 +0000
Received: by outflank-mailman (input) for mailman id 901277;
 Tue, 04 Mar 2025 16:11:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwvO=VX=cc.itu.edu.tr=root@srs-se1.protection.inumbo.net>)
 id 1tpUrZ-0006Ut-6c
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 16:11:21 +0000
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4da3f806-f913-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 17:11:18 +0100 (CET)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 8B8EA40CECB1
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 19:11:16 +0300 (+03)
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gbv36wpzG2Pr
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 19:09:15 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 0156942746; Tue,  4 Mar 2025 19:08:55 +0300 (+03)
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id B691441BE8
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 17:16:29 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
 by fgw2.itu.edu.tr (Postfix) with SMTP id 6A1602DCE0
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 17:16:29 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD7501655C2
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0B4213E94;
 Mon,  3 Mar 2025 14:16:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A458BEE;
 Mon,  3 Mar 2025 14:15:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDB7D113E;
 Mon,  3 Mar 2025 06:16:10 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 807673F66E;
 Mon,  3 Mar 2025 06:15:54 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4da3f806-f913-11ef-9898-31a8f345e629
X-Envelope-From: <root@cc.itu.edu.tr>
X-Envelope-From: <linux-kernel+bounces-541891-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741011360; cv=none; b=PDBsqgSo6NEFjyniblmfiDcwtMp3acwbV99QcLR70l7xfEzqgtxct+MUnmsm7m+uYa6dFW44W4Syq17ywL5yxVLp1bHSlamPshjlXYuyIAC4kxeuojouy+1nibofQPMpBKJfQGp8VZa9mQEDvD6VXMfb3xTSmH60bZzj4MPQI84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741011360; c=relaxed/simple;
	bh=noQaqyESrFXPlVuJvXsqVgB6g2QUq9O0Y8RZo1VBRPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkus79t/uzRWjKh9MBXNgKIgf/OwfMPNuy+v55/Ba3D4yvJ4AEJHDBrxsqsnM37AV555ZNlPNazeTpFAH9m+QGVkMX+psLDEWkaVtSkwJ03NWaPPRcYLgB4iDBRtYxb70wW3oQ0pg2wbgKpA8Vb8w0Oh2UQxxfE37YzCP4/J38Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-mm@kvack.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 1/5] mm: Fix lazy mmu docs and usage
Date: Mon,  3 Mar 2025 14:15:35 +0000
Message-ID: <20250303141542.3371656-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303141542.3371656-1-ryan.roberts@arm.com>
References: <20250303141542.3371656-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6gbv36wpzG2Pr
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741709362.20553@Z1RTQJFOE41v7lGEBvs15g
X-ITU-MailScanner-SpamCheck: not spam

The docs, implementations and use of arch_[enter|leave]_lazy_mmu_mode()
is a bit of a mess (to put it politely). There are a number of issues
related to nesting of lazy mmu regions and confusion over whether the
task, when in a lazy mmu region, is preemptible or not. Fix all the
issues relating to the core-mm. Follow up commits will fix the
arch-specific implementations. 3 arches implement lazy mmu; powerpc,
sparc and x86.

When arch_[enter|leave]_lazy_mmu_mode() was first introduced by commit
6606c3e0da53 ("[PATCH] paravirt: lazy mmu mode hooks.patch"), it was
expected that lazy mmu regions would never nest and that the appropriate
page table lock(s) would be held while in the region, thus ensuring the
region is non-preemptible. Additionally lazy mmu regions were only used
during manipulation of user mappings.

Commit 38e0edb15bd0 ("mm/apply_to_range: call pte function with lazy
updates") started invoking the lazy mmu mode in apply_to_pte_range(),
which is used for both user and kernel mappings. For kernel mappings the
region is no longer protected by any lock so there is no longer any
guarantee about non-preemptibility. Additionally, for RT configs, the
holding the PTL only implies no CPU migration, it doesn't prevent
preemption.

Commit bcc6cc832573 ("mm: add default definition of set_ptes()") added
arch_[enter|leave]_lazy_mmu_mode() to the default implementation of
set_ptes(), used by x86. So after this commit, lazy mmu regions can be
nested. Additionally commit 1a10a44dfc1d ("sparc64: implement the new
page table range API") and commit 9fee28baa601 ("powerpc: implement the
new page table range API") did the same for the sparc and powerpc
set_ptes() overrides.

powerpc couldn't deal with preemption so avoids it in commit
b9ef323ea168 ("powerpc/64s: Disable preemption in hash lazy mmu mode"),
which explicitly disables preemption for the whole region in its
implementation. x86 can support preemption (or at least it could until
it tried to add support nesting; more on this below). Sparc looks to be
totally broken in the face of preemption, as far as I can tell.

powerpc can't deal with nesting, so avoids it in commit 47b8def9358c
("powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes"),
which removes the lazy mmu calls from its implementation of set_ptes().
x86 attempted to support nesting in commit 49147beb0ccb ("x86/xen: allow
nesting of same lazy mode") but as far as I can tell, this breaks its
support for preemption.

In short, it's all a mess; the semantics for
arch_[enter|leave]_lazy_mmu_mode() are not clearly defined and as a
result the implementations all have different expectations, sticking
plasters and bugs.

arm64 is aiming to start using these hooks, so let's clean everything up
before adding an arm64 implementation. Update the documentation to state
that lazy mmu regions can never be nested, must not be called in
interrupt context and preemption may or may not be enabled for the
duration of the region. And fix the generic implementation of set_ptes()
to avoid nesting.

arch-specific fixes to conform to the new spec will proceed this one.

These issues were spotted by code review and I have no evidence of
issues being reported in the wild.

Cc: <stable@vger.kernel.org>
Fixes: bcc6cc832573 ("mm: add default definition of set_ptes()")
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/pgtable.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 94d267d02372..787c632ee2c9 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -222,10 +222,14 @@ static inline int pmd_dirty(pmd_t pmd)
  * hazard could result in the direct mode hypervisor case, since the act=
ual
  * write to the page tables may not yet have taken place, so reads thoug=
h
  * a raw PTE pointer after it has been modified are not guaranteed to be
- * up to date.  This mode can only be entered and left under the protect=
ion of
- * the page table locks for all page tables which may be modified.  In t=
he UP
- * case, this is required so that preemption is disabled, and in the SMP=
 case,
- * it must synchronize the delayed page table writes properly on other C=
PUs.
+ * up to date.
+ *
+ * In the general case, no lock is guaranteed to be held between entry a=
nd exit
+ * of the lazy mode. So the implementation must assume preemption may be=
 enabled
+ * and cpu migration is possible; it must take steps to be robust agains=
t this.
+ * (In practice, for user PTE updates, the appropriate page table lock(s=
) are
+ * held, but for kernel PTE updates, no lock is held). Nesting is not pe=
rmitted
+ * and the mode cannot be used in interrupt context.
  */
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 #define arch_enter_lazy_mmu_mode()	do {} while (0)
@@ -287,7 +291,6 @@ static inline void set_ptes(struct mm_struct *mm, uns=
igned long addr,
 {
 	page_table_check_ptes_set(mm, ptep, pte, nr);
=20
-	arch_enter_lazy_mmu_mode();
 	for (;;) {
 		set_pte(ptep, pte);
 		if (--nr =3D=3D 0)
@@ -295,7 +298,6 @@ static inline void set_ptes(struct mm_struct *mm, uns=
igned long addr,
 		ptep++;
 		pte =3D pte_next_pfn(pte);
 	}
-	arch_leave_lazy_mmu_mode();
 }
 #endif
 #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
--=20
2.43.0



