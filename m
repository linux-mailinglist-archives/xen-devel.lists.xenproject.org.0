Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC876D3B8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 18:32:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575083.900837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qREls-0004n6-60; Wed, 02 Aug 2023 16:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575083.900837; Wed, 02 Aug 2023 16:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qREls-0004jW-2g; Wed, 02 Aug 2023 16:32:24 +0000
Received: by outflank-mailman (input) for mailman id 575083;
 Wed, 02 Aug 2023 16:32:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7gP=DT=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qRElr-0004jQ-C2
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 16:32:23 +0000
Received: from frasgout12.his.huawei.com (unknown [14.137.139.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2627c717-3152-11ee-b262-6b7b168915f2;
 Wed, 02 Aug 2023 18:32:20 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.229])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4RGHGc4KMvz9xFbJ
 for <xen-devel@lists.xenproject.org>; Thu,  3 Aug 2023 00:18:48 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.207.228])
 by APP1 (Coremail) with SMTP id LxC2BwCnWbn9hMpkgNcsAA--.36049S2;
 Wed, 02 Aug 2023 17:32:06 +0100 (CET)
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
X-Inumbo-ID: 2627c717-3152-11ee-b262-6b7b168915f2
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR X86),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	petr@tesarici.cz
Subject: [PATCH v1] xen: remove a confusing comment on auto-translated guest I/O
Date: Wed,  2 Aug 2023 18:31:51 +0200
Message-Id: <20230802163151.1486-1-petrtesarik@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwCnWbn9hMpkgNcsAA--.36049S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw1fCF1DKFy5Ary3AFyUGFg_yoWDKwcE9F
	4xZF48Ww45tr93X34UKr4avaySyan3trWF9Fn2y34YyFWxXFs7XFs2g3Z0kw4xXFWrCrZx
	XF9xXry7Jw40kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc7CjxVAKzI0EY4vE52x082I5MxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUxUUUUUUUU=
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

After removing the conditional return from xen_create_contiguous_region(),
the accompanying comment was left in place, but it now precedes an
unrelated conditional and confuses readers.

Fixes: 989513a735f5 ("xen: cleanup pvh leftovers from pv-only sources")
Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 arch/x86/xen/mmu_pv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index e0a975165de7..804a5441324c 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2310,12 +2310,6 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 	int            success;
 	unsigned long vstart = (unsigned long)phys_to_virt(pstart);
 
-	/*
-	 * Currently an auto-translated guest will not perform I/O, nor will
-	 * it require PAE page directories below 4GB. Therefore any calls to
-	 * this function are redundant and can be ignored.
-	 */
-
 	if (unlikely(order > MAX_CONTIG_ORDER))
 		return -ENOMEM;
 
-- 
2.25.1


