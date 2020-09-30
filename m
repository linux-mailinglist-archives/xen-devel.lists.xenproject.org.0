Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1227F0CD
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 19:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.856.2943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNgGw-0005WD-N9; Wed, 30 Sep 2020 17:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856.2943; Wed, 30 Sep 2020 17:52:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNgGw-0005VY-Ik; Wed, 30 Sep 2020 17:52:10 +0000
Received: by outflank-mailman (input) for mailman id 856;
 Wed, 30 Sep 2020 17:52:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m0D6=DH=casper.srs.infradead.org=batv+fa6e45c137c1199df5c4+6247+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kNgGu-0005QF-OW
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:52:08 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6611b02e-7acd-4bbd-82b9-86ba6f155f72;
 Wed, 30 Sep 2020 17:51:56 +0000 (UTC)
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNgGS-0001C3-Jg; Wed, 30 Sep 2020 17:51:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=m0D6=DH=casper.srs.infradead.org=batv+fa6e45c137c1199df5c4+6247+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kNgGu-0005QF-OW
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:52:08 +0000
X-Inumbo-ID: 6611b02e-7acd-4bbd-82b9-86ba6f155f72
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6611b02e-7acd-4bbd-82b9-86ba6f155f72;
	Wed, 30 Sep 2020 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/d6+Dk3KKsbjd+NK9IaRJO1MZ62p/5JmeyWovJ8r20c=; b=YkJ+uCPtqA1Td8zeKp//6WB4ex
	2L7PhMeNNVChodci0VbKBYP/+QMdhLPZmUoFLFcWhehk7/nZO4O/VTTSj/QJlXD0APsmA6FpQr4K0
	tySIUrS8BaaMaf2oLTkKi08nizfzKbfYWDmfJuahykiGnY6uF1SWzgQhXSGFIrEcoECNAmcOt43oz
	6M55bJ9RMrTV6WBCPR+ciE5DFex6s6zi/bRyqqcbzrY4leTjDRFayj4JdF7yAaOvbAQ7YEkqfeI/W
	PkxY3VTS6b0FSlKz4CAebXcFshlnG6UuA9qZWLczS1dJqPlXeEZkAYKr+VvP9KJpwM8OvPSsRsxpP
	lPs56omQ==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNgGS-0001C3-Jg; Wed, 30 Sep 2020 17:51:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Matthew Auld <matthew.auld@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Minchan Kim <minchan@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Nitin Gupta <ngupta@vflare.org>,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH 04/10] mm: allow a NULL fn callback in apply_to_page_range
Date: Wed, 30 Sep 2020 19:51:27 +0200
Message-Id: <20200930175133.1252382-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930175133.1252382-1-hch@lst.de>
References: <20200930175133.1252382-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Besides calling the callback on each page, apply_to_page_range also has
the effect of pre-faulting all PTEs for the range.  To support callers
that only need the pre-faulting, make the callback optional.

Based on a patch from Minchan Kim <minchan@kernel.org>.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/memory.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index fcfc4ca36eba80..dcf2bb69fbf847 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2420,13 +2420,15 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 
 	arch_enter_lazy_mmu_mode();
 
-	do {
-		if (create || !pte_none(*pte)) {
-			err = fn(pte++, addr, data);
-			if (err)
-				break;
-		}
-	} while (addr += PAGE_SIZE, addr != end);
+	if (fn) {
+		do {
+			if (create || !pte_none(*pte)) {
+				err = fn(pte++, addr, data);
+				if (err)
+					break;
+			}
+		} while (addr += PAGE_SIZE, addr != end);
+	}
 	*mask |= PGTBL_PTE_MODIFIED;
 
 	arch_leave_lazy_mmu_mode();
-- 
2.28.0


