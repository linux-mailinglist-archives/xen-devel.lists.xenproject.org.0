Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA203735C4
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 09:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122825.231745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCC0-00066B-Ol; Wed, 05 May 2021 07:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122825.231745; Wed, 05 May 2021 07:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCC0-0005wm-FF; Wed, 05 May 2021 07:43:36 +0000
Received: by outflank-mailman (input) for mailman id 122825;
 Wed, 05 May 2021 07:43:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0XF=KA=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1leCBy-00044r-PU
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 07:43:34 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3f8ccee7-9bfa-46d6-9356-2e342b9ded43;
 Wed, 05 May 2021 07:43:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 377581063;
 Wed,  5 May 2021 00:43:24 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.0.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FBD83F718;
 Wed,  5 May 2021 00:43:22 -0700 (PDT)
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
X-Inumbo-ID: 3f8ccee7-9bfa-46d6-9356-2e342b9ded43
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 04/10] arm/gic: Remove member hcr of structure gic_v3
Date: Wed,  5 May 2021 09:43:02 +0200
Message-Id: <20210505074308.11016-5-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210505074308.11016-1-michal.orzel@arm.com>
References: <20210505074308.11016-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... as it is never used even in the patch introducing it.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/asm-arm/gic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/gic.h b/xen/include/asm-arm/gic.h
index ad0f7452d0..5069ab4aac 100644
--- a/xen/include/asm-arm/gic.h
+++ b/xen/include/asm-arm/gic.h
@@ -171,7 +171,7 @@
  * GICv3 registers that needs to be saved/restored
  */
 struct gic_v3 {
-    uint32_t hcr, vmcr, sre_el1;
+    uint32_t vmcr, sre_el1;
     uint32_t apr0[4];
     uint32_t apr1[4];
     uint64_t lr[16];
-- 
2.29.0


