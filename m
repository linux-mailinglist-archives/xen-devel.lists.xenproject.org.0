Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247ADA4E14D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 15:41:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901194.1309179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpTSP-0007BD-AR; Tue, 04 Mar 2025 14:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901194.1309179; Tue, 04 Mar 2025 14:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpTSP-00079J-6s; Tue, 04 Mar 2025 14:41:17 +0000
Received: by outflank-mailman (input) for mailman id 901194;
 Tue, 04 Mar 2025 14:41:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwvO=VX=cc.itu.edu.tr=root@srs-se1.protection.inumbo.net>)
 id 1tpTSO-0006DV-3q
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 14:41:16 +0000
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b216774e-f906-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 15:41:03 +0100 (CET)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id CF39740F1CDA
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 17:41:00 +0300 (+03)
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dcq4zSDzFx8Y
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 17:39:55 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id E401542725; Tue,  4 Mar 2025 17:39:42 +0300 (+03)
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id 27423420F2
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 17:16:47 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
 by fgw2.itu.edu.tr (Postfix) with SMTP id B025D2DCE1
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 17:16:46 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35F243AA628
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 5352921420A;
 Mon,  3 Mar 2025 14:16:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDD221324F;
 Mon,  3 Mar 2025 14:15:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ABF8175A;
 Mon,  3 Mar 2025 06:16:13 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB6783F66E;
 Mon,  3 Mar 2025 06:15:56 -0800 (PST)
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
X-Inumbo-ID: b216774e-f906-11ef-9ab4-95dc52dad729
X-Envelope-From: <root@cc.itu.edu.tr>
X-Envelope-From: <linux-kernel+bounces-541892-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741011361; cv=none; b=YPoG/m64t40sYN2GxiOskMi0H0SPrrJLJTavl3OQxZQA+Enatmz2p71B+ppL0TVnqp4cr2ubvBgmnQsGxg5pu6vTHLGcuyOzWP6mds0FSUS7xXDxT14vqhZ6KskR/2VVzQHclrpyvkOc5jKOqORjXg8yqCqxUu2xgPAiF48Znq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741011361; c=relaxed/simple;
	bh=n7QaXbzZBzjDb7zEaetrjA+0DEIV2YJ6OgKGAXYlBcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTOm/CzQ03c01ON6sQ1qOw0dnKswe3wWdsG/gzMo6mFpCDFJjPzBB5ERWZhllswJ8GrMp75yivZae9w/kCcUgz5znvaBenygEKsZ3Ca89yfTV5bMlFJGjTjuiWtAOmdFN/btpTTFYFBM2d7HGA8ZC7RckVgfF/f4NfUW2kRI14U=
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
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 2/5] fs/proc/task_mmu: Reduce scope of lazy mmu region
Date: Mon,  3 Mar 2025 14:15:36 +0000
Message-ID: <20250303141542.3371656-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303141542.3371656-1-ryan.roberts@arm.com>
References: <20250303141542.3371656-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6dcq4zSDzFx8Y
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741704016.4421@hSLoLZs3mP/uMWPdg8t8jw
X-ITU-MailScanner-SpamCheck: not spam

Update the way arch_[enter|leave]_lazy_mmu_mode() is called in
pagemap_scan_pmd_entry() to follow the normal pattern of holding the ptl
for user space mappings. As a result the scope is reduced to only the
pte table, but that's where most of the performance win is.

While I believe there wasn't technically a bug here, the original scope
made it easier to accidentally nest or, worse, accidentally call
something like kmap() which would expect an immediate mode pte
modification but it would end up deferred.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 fs/proc/task_mmu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index c17615e21a5d..b0f189815512 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2459,22 +2459,19 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, uns=
igned long start,
 	spinlock_t *ptl;
 	int ret;
=20
-	arch_enter_lazy_mmu_mode();
-
 	ret =3D pagemap_scan_thp_entry(pmd, start, end, walk);
-	if (ret !=3D -ENOENT) {
-		arch_leave_lazy_mmu_mode();
+	if (ret !=3D -ENOENT)
 		return ret;
-	}
=20
 	ret =3D 0;
 	start_pte =3D pte =3D pte_offset_map_lock(vma->vm_mm, pmd, start, &ptl)=
;
 	if (!pte) {
-		arch_leave_lazy_mmu_mode();
 		walk->action =3D ACTION_AGAIN;
 		return 0;
 	}
=20
+	arch_enter_lazy_mmu_mode();
+
 	if ((p->arg.flags & PM_SCAN_WP_MATCHING) && !p->vec_out) {
 		/* Fast path for performing exclusive WP */
 		for (addr =3D start; addr !=3D end; pte++, addr +=3D PAGE_SIZE) {
@@ -2543,8 +2540,8 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsig=
ned long start,
 	if (flush_end)
 		flush_tlb_range(vma, start, addr);
=20
-	pte_unmap_unlock(start_pte, ptl);
 	arch_leave_lazy_mmu_mode();
+	pte_unmap_unlock(start_pte, ptl);
=20
 	cond_resched();
 	return ret;
--=20
2.43.0



